unit UDUnitServer;

interface

uses
  SysUtils, Classes, Forms, Controls, StdCtrls;

type
  TDUnitServer = class(TForm)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DUnitServer: TDUnitServer;

implementation

uses SockApp;

{$R *.dfm}

initialization
  TWebAppSockObjectFactory.Create('TDUnitServer')

end.

