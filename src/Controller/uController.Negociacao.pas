unit uController.Negociacao;

interface

uses uModel.Negociacao, FireDAC.Comp.Client;

type
  TControllerNegociacao = class
  private
    FModelNegociacao: TModelNegociacao;
//    FModelLimiteCredito: TModelLimiteCredito;

  public
    property ModelNegociacao: TModelNegociacao           read FModelNegociacao      write FModelNegociacao;
  //  property ModelLimiteCredito: TModelLimiteCredito     read FModelLimiteCredito   write FModelLimiteCredito;

    function PersistirNegociacao: Boolean;
    function SelecionarNegociacao: TFDQuery;

    function PersistirLimiteCredito: Boolean;
    function SelecionarLimiteCredito(piCodigoNegociacao:Integer): TFDQuery;

    constructor Create;
    destructor Destroy; override;
  end;

implementation


constructor TControllerNegociacao.Create;
begin
  FModelNegociacao      := TModelNegociacao.Create;
  //FModelLimiteCredito   := TModelLimiteCredito.Create;
  inherited Create; 
end;

destructor TControllerNegociacao.Destroy;
begin
  FModelNegociacao.Free;
 // FModelLimiteCredito.Free;
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


function TControllerNegociacao.PersistirLimiteCredito: Boolean;
begin
//  Result := FModelLimiteCredito.persistir;
end;

function TControllerNegociacao.SelecionarLimiteCredito(piCodigoNegociacao:Integer): TFDQuery;
begin
//  Result := FModelLimiteCredito.Selecionar(piCodigoNegociacao);
end;

end.
