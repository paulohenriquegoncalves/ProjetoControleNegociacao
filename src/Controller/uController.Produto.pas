unit uController.Produto;

interface

uses uModel.Produto, FireDAC.Comp.Client;

type
  TControllerProduto = class
  private
    FModelProduto: TModelProduto;

  public
    property ModelProduto: TModelProduto read FModelProduto write FModelProduto;

    function persistir: Boolean;
    function selecionar: TFDQuery;

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

function TControllerProduto.persistir: Boolean;
begin
  Result := FModelProduto.persistir;
end;

function TControllerProduto.selecionar: TFDQuery;
begin
  Result := FModelProduto.selecionar;
end;

end.
