unit uTesteProjetoControleNegociacao;

interface

uses
  DUnitX.TestFramework, uController.Produtor;

type
  [TestFixture]
  TMyTestObject = class
  private
    controllerProdutor: TControllerProdutor;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestProdutorNomeObrigatorio;

    [Test]
    procedure TestProdutorCPFInvalido;

    [Test]
    procedure TestProdutorCNPJInvalido;


    [Test]
    [TestCase('TestA','1,2')]
    [TestCase('TestB','3,4')]
    procedure Test2(const AValue1 : Integer;const AValue2 : Integer);

  end;

implementation

uses
  System.SysUtils, uExcessoes;


procedure TMyTestObject.Setup;
begin
  controllerProdutor := TControllerProdutor.Create;
end;

procedure TMyTestObject.TearDown;
begin
  if Assigned(controllerProdutor) then
    FreeAndNil(controllerProdutor);
end;

procedure TMyTestObject.TestProdutorNomeObrigatorio;
begin
  controllerProdutor.ModelProdutor.CodigoProdutor  := 1;
  controllerProdutor.ModelProdutor.NomeProdutor    := '';
  controllerProdutor.ModelProdutor.CPFCNPJ         := '';
  Assert.WillRaise(controllerProdutor.ModelProdutor.ValidarAtributos, ENomeObrigatorio, '');
end;

procedure TMyTestObject.TestProdutorCNPJInvalido;
begin
  controllerProdutor.ModelProdutor.CodigoProdutor  := 1;
  controllerProdutor.ModelProdutor.NomeProdutor    := 'Paulo Teste';
  controllerProdutor.ModelProdutor.CPFCNPJ         := '11111111111111';
  Assert.WillRaise(controllerProdutor.ModelProdutor.ValidarAtributos, ECNPJCPFInvalido, '');
end;

procedure TMyTestObject.TestProdutorCPFInvalido;
begin
  controllerProdutor.ModelProdutor.CodigoProdutor  := 1;
  controllerProdutor.ModelProdutor.NomeProdutor    := 'Paulo Teste';
  controllerProdutor.ModelProdutor.CPFCNPJ         := '22222222222';
  Assert.WillRaise(controllerProdutor.ModelProdutor.ValidarAtributos, ECNPJCPFInvalido, '');
end;



procedure TMyTestObject.Test2(const AValue1 : Integer;const AValue2 : Integer);
begin

end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);

end.
