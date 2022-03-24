unit uController.Produtor;

interface

uses uModel.Produtor, FireDAC.Comp.Client;

type
  TControllerProdutor = class
  private
    FModelProdutor: TModelProdutor;

  public
    property ModelProdutor: TModelProdutor read FModelProdutor write FModelProdutor;

    function persistir: Boolean;
    function selecionar: TFDQuery;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

constructor TControllerProdutor.Create;
begin
  FModelProdutor := TModelProdutor.Create;
  inherited Create;
end;

destructor TControllerProdutor.Destroy;
begin
  FModelProdutor.Free;
  inherited;
end;

function TControllerProdutor.persistir: Boolean;
begin
  Result := FModelProdutor.persistir;
end;

function TControllerProdutor.selecionar: TFDQuery;
begin
  Result := FModelProdutor.selecionar;
end;

end.
