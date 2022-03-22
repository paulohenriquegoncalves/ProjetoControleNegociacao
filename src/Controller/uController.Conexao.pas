unit uController.Conexao;

interface

uses uDAO.Conexao, System.SysUtils;

Type
  // Singleton

  TControllerConexao = class
  private
    FConexao: TDAOConexao;
    constructor Create;
    destructor Destroy; override;

  public
    property daoConexao: TDAOConexao read FConexao write FConexao;
    class function getInstance: TControllerConexao;
  end;

implementation

var
  instanciaBD: TControllerConexao;

  { TControllerConexao }

constructor TControllerConexao.Create;
begin
  inherited Create;
  FConexao := TDAOConexao.Create;
end;

destructor TControllerConexao.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

class function TControllerConexao.getInstance: TControllerConexao;
begin
  if instanciaBD = Nil then
    instanciaBD := TControllerConexao.Create;

  result := instanciaBD;
end;

initialization

instanciaBD := Nil;

finalization

if instanciaBD <> Nil Then
  instanciaBD.Free;

end.
