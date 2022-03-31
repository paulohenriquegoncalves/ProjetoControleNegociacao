unit uController.Produtor;

interface

uses uModel.Produtor, uModel.LimiteCredito, FireDAC.Comp.Client;

type
  TControllerProdutor = class
  private
    FModelProdutor: TModelProdutor;
    FModelLimiteCredito: TModelLimiteCredito;

  public
    property ModelProdutor: TModelProdutor           read FModelProdutor      write FModelProdutor;
    property ModelLimiteCredito: TModelLimiteCredito read FModelLimiteCredito write FModelLimiteCredito;

    function PersistirProdutor: Boolean;
    function SelecionarProdutor: TFDQuery;

    function PersistirLimiteCredito: Boolean;
    function SelecionarLimiteCredito(piCodigoProdutor:Integer): TFDQuery;

    constructor Create;
    destructor Destroy; override;
  end;

implementation


constructor TControllerProdutor.Create;
begin
  FModelProdutor      := TModelProdutor.Create;
  FModelLimiteCredito := TModelLimiteCredito.Create;
  inherited Create;
end;

destructor TControllerProdutor.Destroy;
begin
  FModelProdutor.Free;
  FModelLimiteCredito.Free;
  inherited;
end;


function TControllerProdutor.PersistirProdutor: Boolean;
begin
  Result := FModelProdutor.Persistir;
end;

function TControllerProdutor.SelecionarProdutor: TFDQuery;
begin
  Result := FModelProdutor.Selecionar;
end;


function TControllerProdutor.PersistirLimiteCredito: Boolean;
begin
  Result := FModelLimiteCredito.Persistir;
end;

function TControllerProdutor.SelecionarLimiteCredito(piCodigoProdutor:Integer): TFDQuery;
begin
  Result := FModelLimiteCredito.Selecionar(piCodigoProdutor);
end;

end.
