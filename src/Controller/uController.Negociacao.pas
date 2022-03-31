unit uController.Negociacao;

interface

uses uModel.Negociacao, FireDAC.Comp.Client;

type
  TControllerNegociacao = class
  private
    FModelNegociacao: TModelNegociacao;

  public
    property ModelNegociacao: TModelNegociacao           read FModelNegociacao      write FModelNegociacao;

    function PersistirNegociacao: Boolean;
    function SelecionarNegociacao: TFDQuery;

    constructor Create;
    destructor Destroy; override;
  end;

implementation


constructor TControllerNegociacao.Create;
begin
  FModelNegociacao      := TModelNegociacao.Create;
  inherited Create;
end;

destructor TControllerNegociacao.Destroy;
begin
  FModelNegociacao.Free;
  inherited;
end;


function TControllerNegociacao.PersistirNegociacao: Boolean;
begin
  Result := FModelNegociacao.persistir;
end;

function TControllerNegociacao.SelecionarNegociacao: TFDQuery;
begin
  Result := FModelNegociacao.Selecionar;
end;

end.
