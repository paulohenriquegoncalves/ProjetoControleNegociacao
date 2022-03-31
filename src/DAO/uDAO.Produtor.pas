unit uDAO.Produtor;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  System.SysUtils, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, uController.Conexao, uModel.Produtor;

type
  TDAOProdutor = Class
  private
  public
    function SelecionarProdutor: TFDQuery;
    function Incluir(ModelProdutor: TModelProdutor): Boolean;
    function Excluir(ModelProdutor: TModelProdutor): Boolean;
    function Alterar(ModelProdutor: TModelProdutor): Boolean;
  published

  End;

implementation

uses
  Vcl.Dialogs;

function TDAOProdutor.Alterar(ModelProdutor: TModelProdutor): Boolean;
var
  qryProdutor: TFDQuery;
begin
  try
    qryProdutor := TControllerConexao.getInstance().daoConexao.CriarQuery;
    try

      qryProdutor.ExecSQL
        ('UPDATE TBL_PRODUTOR SET NOMEPRODUTOR = :NOMEPRODUTOR,  CPF_CNPJ = :CPF_CNPJ  WHERE CODPRODUTOR = :CODPRODUTOR',
        [ModelProdutor.NomeProdutor, ModelProdutor.CPFCNPJ, ModelProdutor.CodigoProdutor]);

    finally
      FreeAndNil(qryProdutor);

    end;
    Result := True;
  except
    Result := False;
  end;

end;

function TDAOProdutor.Excluir(ModelProdutor: TModelProdutor): Boolean;
var
  qryProdutor: TFDQuery;
begin
  try
    qryProdutor := TControllerConexao.getInstance().daoConexao.CriarQuery;
    try
      qryProdutor.ExecSQL('DELETE FROM TBL_PRODUTOR WHERE CODPRODUTOR = :CODPRODUTOR', [ModelProdutor.CodigoProdutor]);
    finally
      FreeAndNil(qryProdutor);
    end;
    result := True;
  except
    result := False;
  end;
end;

function TDAOProdutor.incluir(ModelProdutor: TModelProdutor): Boolean;
var
  qryProdutor: TFDQuery;
begin
  qryProdutor := TControllerConexao.getInstance().daoConexao.CriarQuery;

  try
    try
      qryProdutor.ExecSQL
        ('INSERT INTO TBL_PRODUTOR (CODPRODUTOR, NOMEPRODUTOR, CPF_CNPJ) VALUES(GEN_ID(GEN_CODPRODUTOR, 1), :NOMEPRODUTOR, :CPF_CNPJ)',
        [ModelProdutor.NomeProdutor, ModelProdutor.CPFCNPJ]);
      result := True;
    except
      result := False;
    end;
  finally
    qryProdutor.Free;
  end;
end;

function TDAOProdutor.selecionarProdutor: TFDQuery;
var
  qryProdutor: TFDQuery;
begin
  qryProdutor := TControllerConexao.getInstance().daoConexao.CriarQuery;
  qryProdutor.Open('SELECT * FROM TBL_PRODUTOR ORDER BY CODPRODUTOR');
  result := qryProdutor;
end;

end.
