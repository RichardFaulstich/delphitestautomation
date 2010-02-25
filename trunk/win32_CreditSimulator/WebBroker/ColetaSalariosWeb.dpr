program ColetaSalariosWeb;

{$APPTYPE GUI}

uses
  Forms,
  SockApp,
  UDUnitServer in 'UDUnitServer.pas' {DUnitServer},
  UDMWebBroker in 'UDMWebBroker.pas' {WebModule2: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDUnitServer, DUnitServer);
  Application.CreateForm(TWebModule2, WebModule2);
  Application.Run;
end.

