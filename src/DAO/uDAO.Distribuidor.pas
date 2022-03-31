unit uDAO.Distribuidor;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  System.SysUtils, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, uController.Conexao, uModel.Distribuidor;

type

  TDAODistribuidor = Class
  private

  public

    function SelecionarDistribuidor: TFDQuery;
    function Incluir(ModelDistribuidor: TModelDistribuidor): Boolean;
    function Excluir(ModelDistribuidor: TModelDistribuidor): Boolean;
    function Alterar(ModelDistribuidor: TModelDistribuidor): Boolean;

  published

  End;

implementation

uses
  Vcl.Dialogs;

{ TModelCliente }

function TDAODistribuidor.Alterar(ModelDistribuidor: TModelDistribuidor): Boolean;
var
  qryDistribuidor: TFDQuery;
begin
  try
    qryDistribuidor := TControllerConexao.getInstance().daoConexao.CriarQuery;
    try

      qryDistribuidor.ExecSQL
        ('UPDATE TBL_DISTRIBUIDOR SET NOMEDISTRIBUIDOR = :NOMEDISTRIBUIDOR,  CNPJ = :CNPJ  WHERE CODDISTRIBUIDOR = :CODDISTRIBUIDOR',
        [ModelDistribuidor.NomeDistribuidor, ModelDistribuidor.CNPJ, ModelDistribuidor.CodigoDistribuidor]);

    finally
      FreeAndNil(qryDistribuidor);

    end;
    result := True;
  except
    result := False;
  end;

end;

function TDAODistribuidor.Excluir(ModelDistribuidor: TModelDistribuidor): Boolean;
var
  qryDistribuidor: TFDQuery;
begin
  try
    qryDistribuidor := TControllerConexao.getInstance().daoConexao.CriarQuery;
    try
      qryDistribuidor.ExecSQL('DELETE FROM TBL_DISTRIBUIDOR WHERE CODDISTRIBUIDOR = :CODDISTRIBUIDOR', [ModelDistribuidor.CodigoDistribuidor]);
    finally
      FreeAndNil(qryDistribuidor);
    end;
    result := True;
  except
    result := False;
  end;
end;

function TDAODistribuidor.Incluir(ModelDistribuidor: TModelDistribuidor): Boolean;
var
  qryDistribuidor: TFDQuery;
begin
  qryDistribuidor := TControllerConexao.getInstance().daoConexao.CriarQuery;

  try
    try
      qryDistribuidor.ExecSQL
        ('INSERT INTO TBL_DISTRIBUIDOR (CODDISTRIBUIDOR, NOMEDISTRIBUIDOR, CNPJ) VALUES(GEN_ID(GEN_CODDISTRIBUIDOR, 1), :NOMEDISTRIBUIDOR,:CNPJ)',
        [ModelDistribuidor.NomeDistribuidor, ModelDistribuidor.CNPJ]);
      result := True;
    except
      result := False;
    end;
  finally
    qryDistribuidor.Free;
  end;
end;

function TDAODistribuidor.SelecionarDistribuidor: TFDQuery;
var
  qryDistribuidor: TFDQuery;
begin
  qryDistribuidor := TControllerConexao.getInstance().daoConexao.CriarQuery;
  qryDistribuidor.Open('SELECT * FROM TBL_DISTRIBUIDOR ORDER BY CODDISTRIBUIDOR');
  result := qryDistribuidor;
end;

end.
