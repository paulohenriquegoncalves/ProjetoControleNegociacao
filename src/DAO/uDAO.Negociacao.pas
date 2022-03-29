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

    function SelecionarNegociacao: TFDQuery;
    function Incluir(ModelNegociacao: TModelNegociacao): Boolean;
    function Excluir(ModelNegociacao: TModelNegociacao): Boolean;
    function Alterar(ModelNegociacao: TModelNegociacao): Boolean;

  published

  End;

implementation

uses
  Vcl.Dialogs, uMinhasFuncoes;

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

function TDAONegociacao.SelecionarNegociacao: TFDQuery;
var
  qryNegociacao: TFDQuery;
begin
  qryNegociacao := TControllerConexao.getInstance().daoConexao.CriarQuery;
  qryNegociacao.Open('SELECT * FROM TBL_Negociacao ORDER BY CODNegociacao');
  result := qryNegociacao;
end;

end.
