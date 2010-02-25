unit UTestDMSimulaCredito;

interface

uses
  TestFramework, Classes, SysUtils, UDMSimulaCredito;

type
  // Test methods for class TDMSimulaCredito

  TestTDMSimulaCredito = class(TTestCase)
  strict private
    FDMSimulaCredito: TDMSimulaCredito;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure testDeveNegarCreditoAbaixoDe500ReaisEMaisQue5Parcelas;

    procedure testDeveAceitarCreditoAbaixoDe500ReaisEm5Parcelas;
  end;

implementation

uses UParcelasMaximasException, UModelo;

procedure TestTDMSimulaCredito.SetUp;
begin
  FDMSimulaCredito := TDMSimulaCredito.Create(nil);
end;

procedure TestTDMSimulaCredito.TearDown;
begin
  FDMSimulaCredito.Free;
  FDMSimulaCredito := nil;
end;


procedure TestTDMSimulaCredito.testDeveAceitarCreditoAbaixoDe500ReaisEm5Parcelas;
var retorno: String;
begin
  try
    retorno := FDMSimulaCredito.SimularCredito(499.00,4,
                          TFabricaProponentes.Cria('Estagiario'));
    CheckEquals('Crédito de R$499,00  em 4 parcelas liberado!',retorno,'Verifique a mensagem de retorno!');
  except on E: ParcelasMaximasException do
    Fail('Deve ser possível requisitar R$499 para retornar em 4 parcelas (<= 5 parcelas)');
  end;
end;

procedure TestTDMSimulaCredito.testDeveNegarCreditoAbaixoDe500ReaisEMaisQue5Parcelas;
var retorno: String;
begin
  try
    retorno := FDMSimulaCredito.SimularCredito(499.00,6, TFabricaProponentes.Cria('Estagiario'));
    Fail('Não deve permitir crédito menor que R$500 em mais que 5 parcelas');
  except on E: ParcelasMaximasException do
    // É esperada uma exceção! :-)
  end;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTDMSimulaCredito.Suite);
end.

