unit uController.Distribuidor;

interface

uses uModel.Distribuidor, FireDAC.Comp.Client;

type
  TControllerDistribuidor = class
  private
    FModelDistribuidor: TModelDistribuidor;

  public
    property ModelDistribuidor: TModelDistribuidor read FModelDistribuidor write FModelDistribuidor;

    function Persistir: Boolean;
    function Selecionar: TFDQuery;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

constructor TControllerDistribuidor.Create;
begin
  FModelDistribuidor := TModelDistribuidor.Create;
  inherited Create;
end;

destructor TControllerDistribuidor.Destroy;
begin
  FModelDistribuidor.Free;
  inherited;
end;

function TControllerDistribuidor.persistir: Boolean;
begin
  Result := FModelDistribuidor.Persistir;
end;

function TControllerDistribuidor.selecionar: TFDQuery;
begin
  Result := FModelDistribuidor.Selecionar;
end;

end.
