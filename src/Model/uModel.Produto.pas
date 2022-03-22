unit uModel.Produto;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  System.SysUtils,FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, uController.Conexao, System.Variants, System.TypInfo, System.Rtti, Vcl.Dialogs,
  uTypes;

type

  TModelProduto = Class
  private
    FCodigoProduto: Integer;
    FNomeProduto: String;
    FPrecoVendaProduto: Currency;
    FTipoOperacao: TOperacao;

  public

    property CodigoProduto: Integer      read FCodigoProduto     write FCodigoProduto;
    property NomeProduto: String         read FNomeProduto       write FNomeProduto;
    property PrecoVendaProduto: Currency read FPrecoVendaProduto write FPrecoVendaProduto;
    property TipoOperacao: TOperacao     read FTipoOperacao      write FTipoOperacao;

    function persistir: Boolean;
    function selecionar: TFDQuery;
    procedure ValidarAtributos;

  published
  End;

implementation

uses uDAO.Produto, uExcessoes;

{ TModelCliente }

function TModelProduto.persistir: Boolean;
var
  daoProduto: TDAOProduto;
begin

  result := false;

  daoProduto := TDAOProduto.Create;
  try
    case FTipoOperacao of
      tpInclusao:
      begin
        Self.ValidarAtributos;
        Result := daoProduto.incluir(self);
      end;
      tpExclusao:  Result := daoProduto.excluir(self);
      tpAlteracao:
      begin
        Self.ValidarAtributos;
        Result := daoProduto.alterar(self);
      end;
    end;
  finally
    FreeAndNil(daoProduto);
  end;
end;

function TModelProduto.selecionar: TFDQuery;
var
  daoProduto: TDAOProduto;
begin
  daoProduto := TDAOProduto.Create;
  try
    result := daoProduto.selecionarProduto;
  finally
    FreeAndNil(daoProduto);
  end;
end;

procedure TModelProduto.ValidarAtributos;
begin
  if FNomeProduto.IsEmpty then
    raise ENomeProdutoObrigatorio.Create('Obrigatório informar o nome do produto');
  if ((FPrecoVendaProduto <= 0) or (FPrecoVendaProduto > 999999)) then
    raise EPrecoRevendaInvalido.Create('Preço de revenda inválido. A faixa de valor é entre R$ 1 e R$ 999.999');
end;

end.
