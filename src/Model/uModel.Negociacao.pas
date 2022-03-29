unit uModel.Negociacao;

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

  TModelNegociacao = Class
  private
    FIDNegociacao: Integer;
    FCodigoDistribuidor: Integer;	
    FCodigoProdutor: Integer;
	 	FStatus: TStatus;
    FDataNegociacao: TDate;
    FTipoOperacao: TOperacao;

  public
    property IDNegociacao: Integer           read FIDNegociacao           write FIDNegociacao;
    property CodigoDistribuidor: Integer     read FCodigoDistribuidor     write FCodigoDistribuidor;
    property CodigoProdutor: Integer         read FCodigoProdutor         write FCodigoProdutor;
    property Status: TStatus                 read FStatus                 write FStatus;
    property DataNegociacao: TDate           read FDataNegociacao         write FDataNegociacao;
    property TipoOperacao: TOperacao         read FTipoOperacao           write FTipoOperacao;

    function Persistir: Boolean;
    function Selecionar: TFDQuery;
    procedure ValidarAtributos;

  published
  End;

implementation

uses uDAO.Negociacao, uExcessoes;

{ TModelCliente }

function TModelNegociacao.persistir: Boolean;
var
  daoNegociacao: TDAONegociacao;
begin

  result := false;

  daoNegociacao := TDAONegociacao.Create;
  try
    case FTipoOperacao of
      tpInclusao:
      begin
        Self.ValidarAtributos;
        Result := daoNegociacao.Incluir(self);
      end;
      tpExclusao:  Result := daoNegociacao.Excluir(self);
      tpAlteracao:
      begin
        Self.ValidarAtributos;
        Result := daoNegociacao.Alterar(self);
      end;
    end;
  finally
    FreeAndNil(daoNegociacao);
  end;
end;

function TModelNegociacao.selecionar: TFDQuery;
var
  daoNegociacao: TDAONegociacao;
begin
  daoNegociacao := TDAONegociacao.Create;
  try
    result := daoNegociacao.SelecionarNegociacao;
  finally
    FreeAndNil(daoNegociacao);
  end;
end;

procedure TModelNegociacao.ValidarAtributos;
begin
{
  if FNomeNegociacao.IsEmpty then
    raise ENomeObrigatorio.Create('Obrigatório informar o nome do Negociacao');
  if ((FPrecoVendaNegociacao <= 0) or (FPrecoVendaNegociacao > 999999)) then
    raise EPrecoRevendaInvalido.Create('Preço de revenda inválido. A faixa de valor é entre R$ 1 e R$ 999.999');
}
end;

end.
