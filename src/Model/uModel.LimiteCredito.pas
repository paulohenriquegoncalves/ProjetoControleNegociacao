unit uModel.LimiteCredito;

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

  TModelLimiteCredito = Class
  private
    FCodigoDistribuidor: Integer;
    FNomeDistribuidor:   String;
    FCNPJDistribuidor:   String;
    FCodigoProdutor:     Integer;
    FNomeProdutor:       String;
    FCPFCNPJProdutor:    String;
    FLimiteCredito:      Double;
    FTipoOperacao: TOperacao;
  public
    property CodigoDistribuidor: Integer     read FCodigoDistribuidor     write FCodigoDistribuidor;
    property NomeDistribuidor: String        read FNomeDistribuidor       write FNomeDistribuidor;
    property CNPJDistribuidor: String        read FCNPJDistribuidor       write FCNPJDistribuidor;

    property CodigoProdutor: Integer         read FCodigoProdutor         write FCodigoProdutor;
    property NomeProdutor: String            read FNomeProdutor           write FNomeProdutor;
    property CPFCNPJProdutor: String         read FCPFCNPJProdutor        write FCPFCNPJProdutor;

    property LimiteCredito: Double           read FLimiteCredito          write FLimiteCredito;

    property TipoOperacao: TOperacao         read FTipoOperacao           write FTipoOperacao;

    function persistir: Boolean;
    function selecionar(piCodigoProdutor:Integer): TFDQuery;
    procedure ValidarAtributos;

  published
  End;

implementation

uses uDAO.LimiteCredito, uExcessoes, uMinhasFuncoes;

{ TModelCliente }

function TModelLimiteCredito.persistir: Boolean;
var
  daoLimiteCredito: TDAOLimiteCredito;
begin

  result := false;

  daoLimiteCredito := TDAOLimiteCredito.Create;
  try
    case FTipoOperacao of
      tpInclusao:
      begin
        Self.ValidarAtributos;
        Result := daoLimiteCredito.IncluirLimiteCredito(self);
      end;
      tpExclusao:  Result := daoLimiteCredito.ExcluirLimiteCredito(self);
      tpAlteracao:
      begin
        Self.ValidarAtributos;
        Result := daoLimiteCredito.AlterarLimiteCredito(self);
      end;
    end;
  finally
    FreeAndNil(daoLimiteCredito);
  end;
end;

function TModelLimiteCredito.selecionar(piCodigoProdutor:Integer): TFDQuery;
var
  daoLimiteCredito: TDAOLimiteCredito;
begin
  daoLimiteCredito := TDAOLimiteCredito.Create;
  try
    result := daoLimiteCredito.SelecionarLimiteCredito(piCodigoProdutor);
  finally
    FreeAndNil(daoLimiteCredito);
  end;
end;

procedure TModelLimiteCredito.ValidarAtributos;
begin
 {
  if FNomeLimiteCredito.IsEmpty then
    raise ENomeObrigatorio.Create('Obrigatório informar o nome do LimiteCredito');

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
}
end;

end.
