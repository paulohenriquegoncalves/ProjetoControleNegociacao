unit uClasseCliente;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  System.SysUtils,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, uController.Conexao;

type

  TModelCliente = Class
  private
    FNascimento: String;
    FCodigo: Integer;
    FCPF: String;
    FCEP: String;
    FLimite: Currency;
    FNome: String;

  public

    property Nome: String read FNome write FNome;
    property Codigo: Integer read FCodigo write FCodigo;
    property Nascimento: String read FNascimento write FNascimento;
    property Limite: Currency read FLimite write FLimite;
    property CPF: String read FCPF write FCPF;
    property CEP: String read FCEP write FCEP;

    function persistir: Boolean;

  published
  End;

implementation

{ TModelCliente }

function TModelCliente.persistir: Boolean;
var
  qrCliente: TFDQuery;
begin
  qrCliente := TControllerConexao.getInstance().daoConexao.CriarQuery;

  try
    try
      qrCliente.ExecSQL
        ('insert into clientes (cli_nome, cli_cpf, cli_cep, cli_nascimento, cli_limite)  values ( :cli_nome,:cli_cpf,:cli_cep,:cli_nascimento,:cli_limite)',
        [Nome, CPF, CEP, Nascimento, Limite]);
      Result := True;
    except
      Result := False;
    end;
  finally
    qrCliente.free;
  end;
end;

end.
