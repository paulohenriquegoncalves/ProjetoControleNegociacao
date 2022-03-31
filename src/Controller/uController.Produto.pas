unit uController.Produto;

interface

uses uModel.Produto, FireDAC.Comp.Client;

type
  TControllerProduto = class
  private
    FModelProduto: TModelProduto;

  public
    property ModelProduto: TModelProduto read FModelProduto write FModelProduto;

    function Persistir: Boolean;
    function Selecionar: TFDQuery;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

constructor TControllerProduto.Create;
begin
  FModelProduto := TModelProduto.Create;
  inherited Create;
end;

destructor TControllerProduto.Destroy;
begin
  FModelProduto.Free;
  inherited;
end;

function TControllerProduto.Persistir: Boolean;
begin
  Result := FModelProduto.Persistir;
end;

function TControllerProduto.Selecionar: TFDQuery;
begin
  Result := FModelProduto.Selecionar;
end;

end.
