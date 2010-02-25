unit UDMWebBroker;

interface

uses
  SysUtils, Classes, HTTPApp, HTTPProd;

type
  TDMWebBroker = class(TWebModule)
    ppHome: TPageProducer;
    procedure ppHomeHTMLTag(Sender: TObject; Tag: TTag; const TagString: string;
      TagParams: TStrings; var ReplaceText: string);
    procedure WebModule2WebActionItem2Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    FMensagem: String;
    procedure SetMensagem(const Value: String);
  public
    property Mensagem: String read FMensagem write SetMensagem;
  end;

var
  DMWebBroker: TDMWebBroker;

implementation

uses WebReq, UDMSimulaCredito, UModelo, UFabricaDataModules;

{$R *.dfm}

procedure TDMWebBroker.ppHomeHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
begin
  if(TagString = 'Mensagem') then
    ReplaceText := Mensagem;
end;

procedure TDMWebBroker.SetMensagem(const Value: String);
begin
  FMensagem := Value;
end;

procedure TDMWebBroker.WebModule2WebActionItem2Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var ADMSimulaCredito: TDMSimulaCredito;
    AProponente : TProponente;
begin

    AProponente := TFabricaProponentes.Cria(Request.QueryFields.Values['tipoProponente']);
    AProponente.RendaMensal := StrToFloat(Request.QueryFields.Values['rendaMensal']);

    ADMSimulaCredito := TFabricaDataModules.Cria(AProponente);


  try try


    Mensagem := ADMSimulaCredito.SimularCredito(
              StrToFloat(Request.QueryFields.Values['valor']),
              StrToInt(Request.QueryFields.Values['parcelas']),
              AProponente);
  except on E: Exception do
    Mensagem := E.Message;
  end;
  finally
    ADMSimulaCredito.Free;
  end;
  Response.Content := ppHome.Content;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := TDMWebBroker;

end.

