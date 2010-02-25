program SimuladorCreditoWeb;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  UDUnitServer in 'UDUnitServer.pas' {DUnitServer},
  UDMWebBroker in 'UDMWebBroker.pas' {DMWebBroker: TWebModule},
  UDMSimulaCredito in 'UDMSimulaCredito.pas' {DMSimulaCredito: TDataModule},
  UValorMaximoEstagiarioException in 'UValorMaximoEstagiarioException.pas',
  UModelo in 'UModelo.pas',
  UDMSimulaCreditoEstagiario in 'UDMSimulaCreditoEstagiario.pas' {DMSimulaCreditoEstagiario: TDataModule},
  UFabricaDataModules in 'UFabricaDataModules.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDUnitServer, DUnitServer);
  Application.CreateForm(TDMWebBroker, DMWebBroker);
  Application.CreateForm(TDMSimulaCreditoEstagiario, DMSimulaCreditoEstagiario);
  Application.Run;
end.

