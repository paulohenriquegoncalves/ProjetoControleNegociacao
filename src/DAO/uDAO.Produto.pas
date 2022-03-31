unit uDAO.Produto;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  System.SysUtils, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, uController.Conexao, uModel.Produto;

type

  TDAOProduto = Class
  private

  public

    function SelecionarProduto: TFDQuery;
    function Incluir(ModelProduto: TModelProduto): Boolean;
    function Excluir(ModelProduto: TModelProduto): Boolean;
    function Alterar(ModelProduto: TModelProduto): Boolean;

  published

  End;

implementation

uses
  Vcl.Dialogs;

{ TModelCliente }

function TDAOProduto.Alterar(ModelProduto: TModelProduto): Boolean;
var
  qryProduto: TFDQuery;
begin
  try
    qryProduto := TControllerConexao.getInstance().daoConexao.CriarQuery;
    try

      qryProduto.ExecSQL
        ('UPDATE TBL_PRODUTO SET NOMEPRODUTO = :NOMEPRODUTO,  PRECOVENDAPRODUTO = :PRECOVENDAPRODUTO  WHERE CODPRODUTO = :CODPRODUTO',
        [ModelProduto.NomeProduto, ModelProduto.PrecoVendaProduto, ModelProduto.CodigoProduto]);

    finally
      FreeAndNil(qryProduto);

    end;
    result := True;
  except
    result := False;
  end;

end;

function TDAOProduto.Excluir(ModelProduto: TModelProduto): Boolean;
var
  qryProduto: TFDQuery;
begin
  try
    qryProduto := TControllerConexao.getInstance().daoConexao.CriarQuery;
    try
      qryProduto.ExecSQL('DELETE FROM TBL_PRODUTO WHERE CODPRODUTO = :CODPRODUTO', [ModelProduto.CodigoProduto]);
    finally
      FreeAndNil(qryProduto);
    end;
    result := True;
  except
    result := False;
  end;
end;

function TDAOProduto.Incluir(ModelProduto: TModelProduto): Boolean;
var
  qryProduto: TFDQuery;
begin
  qryProduto := TControllerConexao.getInstance().daoConexao.CriarQuery;

  try
    try
      qryProduto.ExecSQL
        ('INSERT INTO TBL_PRODUTO (CODPRODUTO, NOMEPRODUTO, PRECOVENDAPRODUTO) VALUES(GEN_ID(GEN_CODPRODUTO, 1), :NOMEPRODUTO,:PRECOVENDAPRODUTO)',
        [ModelProduto.NomeProduto, ModelProduto.PrecoVendaProduto]);
      result := True;
    except
      result := False;
    end;
  finally
    qryProduto.Free;
  end;
end;

function TDAOProduto.SelecionarProduto: TFDQuery;
var
  qryProduto: TFDQuery;
begin
  qryProduto := TControllerConexao.getInstance().daoConexao.CriarQuery;
  qryProduto.Open('SELECT * FROM TBL_PRODUTO ORDER BY CODPRODUTO');
  result := qryProduto;
end;

end.
