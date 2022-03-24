unit uModel.Produtor;

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

  TModelProdutor = Class
  private
    FCodigoProdutor: Integer;
    FNomeProdutor: String;
    FCPFCNPJ: String;
    FTipoOperacao: TOperacao;

  public

    property CodigoProdutor: Integer      read FCodigoProdutor     write FCodigoProdutor;
    property NomeProdutor: String         read FNomeProdutor       write FNomeProdutor;
    property CPFCNPJ: String              read FCPFCNPJ            write FCPFCNPJ;
    property TipoOperacao: TOperacao      read FTipoOperacao       write FTipoOperacao;

    function persistir: Boolean;
    function selecionar: TFDQuery;
    procedure ValidarAtributos;

  published
  End;

implementation

uses uDAO.Produtor, uExcessoes, uMinhasFuncoes;

{ TModelCliente }

function TModelProdutor.persistir: Boolean;
var
  daoProdutor: TDAOProdutor;
begin

  result := false;

  daoProdutor := TDAOProdutor.Create;
  try
    case FTipoOperacao of
      tpInclusao:
      begin
        Self.ValidarAtributos;
        Result := daoProdutor.incluir(self);
      end;
      tpExclusao:  Result := daoProdutor.excluir(self);
      tpAlteracao:
      begin
        Self.ValidarAtributos;
        Result := daoProdutor.alterar(self);
      end;
    end;
  finally
    FreeAndNil(daoProdutor);
  end;
end;

function TModelProdutor.selecionar: TFDQuery;
var
  daoProdutor: TDAOProdutor;
begin
  daoProdutor := TDAOProdutor.Create;
  try
    result := daoProdutor.selecionarProdutor;
  finally
    FreeAndNil(daoProdutor);
  end;
end;

procedure TModelProdutor.ValidarAtributos;
begin
  if FNomeProdutor.IsEmpty then
    raise ENomeObrigatorio.Create('Obrigatório informar o nome do Produtor');

  if (FCPFCNPJ.IsEmpty) then
    raise ECNPJCPFInvalido.Create('Obrigatório informar CPF ou CPNJ');

  if not ((FCPFCNPJ.Length = 11) or (FCPFCNPJ.Length = 14)) then
    raise ECNPJCPFInvalido.Create('CPF ou CPNJ informado é inválido! Deve conter 11 ou 14 digitos.');

  if (FCPFCNPJ.Length = 11) then
  begin
    if not CPFValido(FCPFCNPJ) then
      raise ECNPJCPFInvalido.Create('CPF informado é inválido!')
  end;

  if (FCPFCNPJ.Length = 14) then
  begin
    if not CNPJValido(FCPFCNPJ) then
      raise ECNPJCPFInvalido.Create('CNPJ informado é inválido!')
  end;

end;

end.
