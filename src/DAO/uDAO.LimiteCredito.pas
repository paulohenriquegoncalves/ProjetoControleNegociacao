unit uDAO.LimiteCredito;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  System.SysUtils, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, uController.Conexao, uModel.LimiteCredito;

type

  TDAOLimiteCredito = Class
  private

  public
    function SelecionarLimiteCredito(piCodigoProdutor:Integer): TFDQuery;
    function IncluirLimiteCredito(ModelLimiteCredito: TModelLimiteCredito): Boolean;
    function ExcluirLimiteCredito(ModelLimiteCredito: TModelLimiteCredito): Boolean;
    function AlterarLimiteCredito(ModelLimiteCredito: TModelLimiteCredito): Boolean;

  published

  End;

implementation

uses
  Vcl.Dialogs;

{ TModelCliente }

function TDAOLimiteCredito.AlterarLimiteCredito(ModelLimiteCredito: TModelLimiteCredito): Boolean;
var
  qryLimiteCredito: TFDQuery;
begin
  try
    qryLimiteCredito := TControllerConexao.getInstance().daoConexao.CriarQuery;
    try

      qryLimiteCredito.ExecSQL
        ('UPDATE TBL_LIMITE_CREDITO SET LIMITE_CREDITO = :LIMITE_CREDITO WHERE CODPRODUTOR = :CODPRODUTOR AND CODDISTRIBUIDOR = :CODDISTRIBUIDOR',
        [ModelLimiteCredito.LimiteCredito, ModelLimiteCredito.CodigoProdutor, ModelLimiteCredito.CodigoDistribuidor]);

    finally
      FreeAndNil(qryLimiteCredito);
    end;
    result := True;
  except
    result := False;
  end;

end;

function TDAOLimiteCredito.ExcluirLimiteCredito(ModelLimiteCredito: TModelLimiteCredito): Boolean;
var
  qryLimiteCredito: TFDQuery;
begin
  try
    qryLimiteCredito := TControllerConexao.getInstance().daoConexao.CriarQuery;
    try
      qryLimiteCredito.ExecSQL('DELETE FROM LIMITE_CREDITO WHERE CODPRODUTOR = :CODPRODUTOR AND CODDISTRIBUIDOR = :CODDISTRIBUIDOR', [ModelLimiteCredito.CodigoProdutor, ModelLimiteCredito.CodigoDistribuidor]);
    finally
      FreeAndNil(qryLimiteCredito);
    end;
    result := True;
  except
    result := False;
  end;
end;

function TDAOLimiteCredito.IncluirLimiteCredito(ModelLimiteCredito: TModelLimiteCredito): Boolean;
var
  qryLimiteCredito: TFDQuery;
begin
  qryLimiteCredito := TControllerConexao.getInstance().daoConexao.CriarQuery;

  try
    try
      qryLimiteCredito.ExecSQL
        ('INSERT INTO LIMITE_CREDITO(CODPRODUTOR, CODDISTRIBUIDOR, LIMITE_CREDITO) VALUES(:CODPRODUTOR, :CODDISTRIBUIDOR,:LIMITE_CREDITO)',
        [ModelLimiteCredito.CodigoProdutor, ModelLimiteCredito.CodigoDistribuidor, ModelLimiteCredito.LimiteCredito]);
      result := True;
    except
      result := False;
    end;
  finally
    qryLimiteCredito.Free;
  end;
end;

function TDAOLimiteCredito.SelecionarLimiteCredito(piCodigoProdutor:Integer): TFDQuery;
var
  qryLimiteCredito: TFDQuery;
begin
  qryLimiteCredito := TControllerConexao.getInstance().daoConexao.CriarQuery;
  qryLimiteCredito.SQL.Add(' SELECT L.CODPRODUTOR, P.NOMEPRODUTOR, L.CODDISTRIBUIDOR, D.NOMEDISTRIBUIDOR, L.LIMITE_CREDITO');
  qryLimiteCredito.SQL.Add(' FROM TBL_LIMITE_CREDITO L ');
  qryLimiteCredito.SQL.Add(' INNER JOIN TBL_PRODUTOR P     ON L.CODPRODUTOR     = P.CODPRODUTOR ');
  qryLimiteCredito.SQL.Add(' INNER JOIN TBL_DISTRIBUIDOR D ON L.CODDISTRIBUIDOR = D.CODDISTRIBUIDOR ');
  qryLimiteCredito.SQL.Add(' WHERE L.CODPRODUTOR = :CODPRODUTOR ');
  qryLimiteCredito.SQL.Add(' ORDER BY D.NOMEDISTRIBUIDOR ');
  qryLimiteCredito.ParamByName('CODPRODUTOR').AsInteger := piCodigoProdutor;
  qryLimiteCredito.Open;

  Result := qryLimiteCredito;
end;

end.
