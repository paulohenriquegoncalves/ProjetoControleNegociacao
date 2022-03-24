unit uDAO.Conexao;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  System.SysUtils,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB;

type

  TDAOConexao = class
  private
    FConexao: TFDConnection;
    FDriverFDB: TFDPhysFBDriverLink;
  public

    function getConexao: TFDConnection;
    function CriarQuery: TFDQuery;
    constructor Create;
    destructor Destroy; override;

  end;

implementation

{ TDAOConexao }

constructor TDAOConexao.Create;
begin
  inherited Create;

  FConexao := TFDConnection.Create(nil);
  FDriverFDB := TFDPhysFBDriverLink.Create(Nil);

  FDriverFDB.DriverID := 'FB';

  FDriverFDB.VendorLib := 'fbclient.dll';
  FConexao.Params.DriverID := 'FB';
  FConexao.Params.Database := 'localhost/3050:C:\ProjetosPaulo\ProjetoControleNegociacao\data\PROJETODELPHI.FDB';
  FConexao.Params.UserName := 'SYSDBA';
  FConexao.Params.Password := 'masterkey';
  FConexao.Connected := true;

end;

function TDAOConexao.CriarQuery: TFDQuery;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := FConexao;
  Result := Query;
end;

destructor TDAOConexao.Destroy;
begin
  FreeAndNil(FConexao);
  FreeAndNil(FDriverFDB);
  inherited;
end;

function TDAOConexao.getConexao: TFDConnection;
begin
  Result := FConexao;
end;

end.

