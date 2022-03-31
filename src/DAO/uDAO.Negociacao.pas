unit uDAO.Negociacao;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  System.SysUtils, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, uController.Conexao, uModel.Negociacao;

type

  TDAONegociacao = Class
  private

  public

    function SelecionarNegociacao(ModelNegociacao: TModelNegociacao): TFDQuery;
    function Incluir(ModelNegociacao: TModelNegociacao): Boolean;
    function Excluir(ModelNegociacao: TModelNegociacao): Boolean;
    function Alterar(ModelNegociacao: TModelNegociacao): Boolean;

  published

  End;

implementation

uses
  Vcl.Dialogs, uMinhasFuncoes, uTypes;

{ TModelCliente }

function TDAONegociacao.Alterar(ModelNegociacao: TModelNegociacao): Boolean;
var
  qryNegociacao: TFDQuery;
begin
  try
    qryNegociacao := TControllerConexao.getInstance().daoConexao.CriarQuery;
    try

      qryNegociacao.ExecSQL
        ('UPDATE TBL_NEGOCIACAO SET STATUS = :STATUS WHERE IDNEGOCIACAO = :IDNEGOCIACAO',
        [ TStatusToString(ModelNegociacao.Status), ModelNegociacao.IDNegociacao]);

    finally
      FreeAndNil(qryNegociacao);
    end;
    result := True;
  except
    result := False;
  end;

end;

function TDAONegociacao.Excluir(ModelNegociacao: TModelNegociacao): Boolean;
var
  qryNegociacao: TFDQuery;
begin
  try
    qryNegociacao := TControllerConexao.getInstance().daoConexao.CriarQuery;
    try
      qryNegociacao.ExecSQL('DELETE FROM TBL_NEGOCIACAO_ITENS WHERE IDNEGOCIACAO = :IDNEGOCIACAO', [ModelNegociacao.IDNegociacao]);
      qryNegociacao.ExecSQL('DELETE FROM TBL_NEGOCIACAO WHERE IDNEGOCIACAO = :IDNEGOCIACAO', [ModelNegociacao.IDNegociacao]);
    finally
      FreeAndNil(qryNegociacao);
    end;
    result := True;
  except
    result := False;
  end;
end;

function TDAONegociacao.Incluir(ModelNegociacao: TModelNegociacao): Boolean;
var
  qryNegociacao: TFDQuery;
begin
  qryNegociacao := TControllerConexao.getInstance().daoConexao.CriarQuery;

  try
    try
      qryNegociacao.ExecSQL
        ('INSERT INTO TBL_NEGOCIACAO (IDNEGOCIACAO, CODPRODUTOR, CODDISTRIBUIDOR, STATUS, DATA_NEGOCIACAO) VALUES(GEN_ID(GEN_IDNEGOCIACAO, 1), :CODPRODUTOR, :CODDISTRIBUIDOR, ''PE'', CURRENT_DATE)',
        [ModelNegociacao.CodigoProdutor, ModelNegociacao.CodigoDistribuidor]);
      result := True;
    except
      result := False;
    end;
  finally
    qryNegociacao.Free;
  end;
end;

function TDAONegociacao.SelecionarNegociacao(ModelNegociacao: TModelNegociacao): TFDQuery;
var
  qryNegociacao: TFDQuery;
begin
  qryNegociacao := TControllerConexao.getInstance().daoConexao.CriarQuery;

  qryNegociacao.SQL.Add(' SELECT                                                                               ');
  qryNegociacao.SQL.Add('  TBL.IDNEGOCIACAO,                                                                   ');
  qryNegociacao.SQL.Add('  TBL.CODPRODUTOR, TBL.NOMEPRODUTOR,                                                  ');
  qryNegociacao.SQL.Add('  TBL.CODDISTRIBUIDOR, TBL.NOMEDISTRIBUIDOR,                                          ');
  qryNegociacao.SQL.Add('  TBL.STATUS, TBL.DATA_NEGOCIACAO,                                                    ');

  qryNegociacao.SQL.Add('  TBL.TOTAL_NEGOCIACAO, TBL.LIMITE_CREDITO_CADASTRADO, TBL.VENDAS_APROVADAS,          ');
  qryNegociacao.SQL.Add('  (TBL.LIMITE_CREDITO_CADASTRADO - TBL.VENDAS_APROVADAS) AS LIMITE_CREDITO_DISPONIVEL ');

  qryNegociacao.SQL.Add(' FROM (                                                                               ');

  qryNegociacao.SQL.Add(' SELECT                                                                        ');
  qryNegociacao.SQL.Add('  N.IDNEGOCIACAO,                                                              ');
  qryNegociacao.SQL.Add('  N.CODPRODUTOR, P.NOMEPRODUTOR,                                               ');
  qryNegociacao.SQL.Add('  N.CODDISTRIBUIDOR, D.NOMEDISTRIBUIDOR,                                       ');
  qryNegociacao.SQL.Add('  N.STATUS, N.DATA_NEGOCIACAO,                                                 ');

  qryNegociacao.SQL.Add('   (SELECT COALESCE(SUM(I.QUANTIDADE * PO.PRECOVENDAPRODUTO),0)                ');
  qryNegociacao.SQL.Add('    FROM TBL_NEGOCIACAO_ITENS I                                                ');
  qryNegociacao.SQL.Add('    INNER JOIN TBL_PRODUTO PO ON I.CODPRODUTO = PO.CODPRODUTO                  ');
  qryNegociacao.SQL.Add('    WHERE I.IDNEGOCIACAO = N.IDNEGOCIACAO) AS TOTAL_NEGOCIACAO,                ');

  qryNegociacao.SQL.Add(' 	(SELECT COALESCE(LIMITE_CREDITO,0)                                          ');
  qryNegociacao.SQL.Add(' 	 FROM TBL_LIMITE_CREDITO L                                                  ');
  qryNegociacao.SQL.Add('    WHERE L.CODPRODUTOR    = N.CODPRODUTOR                                     ');
  qryNegociacao.SQL.Add(' 	 AND   L.CODDISTRIBUIDOR = N.CODDISTRIBUIDOR) AS LIMITE_CREDITO_CADASTRADO, ');

  qryNegociacao.SQL.Add('	  (SELECT COALESCE(SUM(I.QUANTIDADE * PO.PRECOVENDAPRODUTO),0)                ');
  qryNegociacao.SQL.Add('	   FROM TBL_NEGOCIACAO_ITENS I                                                ');
  qryNegociacao.SQL.Add('	   INNER JOIN TBL_PRODUTO PO ON I.CODPRODUTO = PO.CODPRODUTO                  ');
  qryNegociacao.SQL.Add('	   WHERE EXISTS (SELECT 1 FROM TBL_NEGOCIACAO N2                              ');
  qryNegociacao.SQL.Add('	                 WHERE N2.CODPRODUTOR     = N.CODPRODUTOR                     ');
  qryNegociacao.SQL.Add('	                 AND   N2.CODDISTRIBUIDOR = N.CODDISTRIBUIDOR                 ');
  qryNegociacao.SQL.Add('                     AND   N2.IDNEGOCIACAO    = I.IDNEGOCIACAO                 ');
  qryNegociacao.SQL.Add('                     AND   N2.STATUS = ''AP'')) AS VENDAS_APROVADAS            ');

  qryNegociacao.SQL.Add(' FROM TBL_NEGOCIACAO N                                                         ');
  qryNegociacao.SQL.Add(' INNER JOIN TBL_PRODUTOR P     ON N.CODPRODUTOR     = P.CODPRODUTOR            ');
  qryNegociacao.SQL.Add(' INNER JOIN TBL_DISTRIBUIDOR D ON N.CODDISTRIBUIDOR = D.CODDISTRIBUIDOR        ');
  qryNegociacao.SQL.Add(' WHERE 1 = 1                                                                   ');

  if (ModelNegociacao.CodigoDistribuidor > 0) then
  begin
    qryNegociacao.SQL.Add(' AND N.CODDISTRIBUIDOR = :CODDISTRIBUIDOR');
    qryNegociacao.ParamByName('CODDISTRIBUIDOR').AsInteger :=  ModelNegociacao.CodigoDistribuidor;
  end;

  if (ModelNegociacao.CodigoProdutor > 0) then
  begin
    qryNegociacao.SQL.Add(' AND N.CODPRODUTOR = :CODPRODUTOR');
    qryNegociacao.ParamByName('CODPRODUTOR').AsInteger :=  ModelNegociacao.CodigoProdutor;
  end;


  if ModelNegociacao.Status <> tpTodos then
  begin
    qryNegociacao.SQL.Add(' AND N.STATUS = :STATUS');
    qryNegociacao.ParamByName('STATUS').AsString :=  TStatusToString( ModelNegociacao.Status);
  end;


  qryNegociacao.SQL.Add(' ) TBL ');
  //IMPLEMENTAR ORDENACAO



  qryNegociacao.SQL.SaveToFile('C:\Temp\CONSULTA_NEGOCIACAO.SQL');
  qryNegociacao.Open;

  result := qryNegociacao;
end;

end.
