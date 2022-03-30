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
    // Sample Methods
    // Simple single Test
    [Test]
    procedure Test1;
    // Test with TestCase Attribute to supply parameters.
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

procedure TMyTestObject.Test1;
begin
  try
    controllerProdutor.ModelProdutor.CodigoProdutor  := 1;
    controllerProdutor.ModelProdutor.NomeProdutor    := '';
    controllerProdutor.ModelProdutor.CPFCNPJ         := '123';
    controllerProdutor.ModelProdutor.ValidarAtributos;
  except
  on E: Exception do
  begin
    //Assert.AreEqual<ENomeObrigatorio>(E, ENomeObrigatorio,'Errou');
  end;

  end;


end;

procedure TMyTestObject.Test2(const AValue1 : Integer;const AValue2 : Integer);
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);

end.
