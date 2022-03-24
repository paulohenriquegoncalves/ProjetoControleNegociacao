unit uModel.Distribuidor;

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

  TModelDistribuidor = Class
  private
    FCodigoDistribuidor: Integer;
    FNomeDistribuidor: String;
    FCNPJ: String;
    FTipoOperacao: TOperacao;

  public

    property CodigoDistribuidor: Integer      read FCodigoDistribuidor     write FCodigoDistribuidor;
    property NomeDistribuidor: String         read FNomeDistribuidor       write FNomeDistribuidor;
    property CNPJ: String                     read FCNPJ                   write FCNPJ;
    property TipoOperacao: TOperacao          read FTipoOperacao      write FTipoOperacao;

    function persistir: Boolean;
    function selecionar: TFDQuery;
    procedure ValidarAtributos;

  published
  End;

implementation

uses uDAO.Distribuidor, uExcessoes, uMinhasFuncoes;

{ TModelCliente }

function TModelDistribuidor.persistir: Boolean;
var
  daoDistribuidor: TDAODistribuidor;
begin

  result := false;

  daoDistribuidor := TDAODistribuidor.Create;
  try
    case FTipoOperacao of
      tpInclusao:
      begin
        Self.ValidarAtributos;
        Result := daoDistribuidor.incluir(self);
      end;
      tpExclusao:  Result := daoDistribuidor.excluir(self);
      tpAlteracao:
      begin
        Self.ValidarAtributos;
        Result := daoDistribuidor.alterar(self);
      end;
    end;
  finally
    FreeAndNil(daoDistribuidor);
  end;
end;

function TModelDistribuidor.selecionar: TFDQuery;
var
  daoDistribuidor: TDAODistribuidor;
begin
  daoDistribuidor := TDAODistribuidor.Create;
  try
    result := daoDistribuidor.selecionarDistribuidor;
  finally
    FreeAndNil(daoDistribuidor);
  end;
end;

procedure TModelDistribuidor.ValidarAtributos;
begin
  if FNomeDistribuidor.IsEmpty then
    raise ENomeObrigatorio.Create('Obrigatório informar o nome do distribuidor')
  else if (FCNPJ.IsEmpty) then
    raise ECNPJCPFInvalido.Create('Obrigatório informar CPNJ')
  else if not CNPJValido(FCNPJ) then
    raise ECNPJCPFInvalido.Create('CPNJ informado é inválido!');
end;

end.
