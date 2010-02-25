unit UDMSimulaCredito;

interface

uses
  SysUtils, Classes, UModelo;

type
  TDMSimulaCredito = class(TDataModule)
  private
    { Private declarations }
  public
    function SimularCredito(AValor: Double; AParcelas: Integer; AProponente: TProponente): String;virtual;
  end;

var
  DMSimulaCredito: TDMSimulaCredito;

implementation

uses UParcelasMaximasException, UValorMaximoEstagiarioException;
{$R *.dfm}
{ TDataModule1 }

{ TDMSimulaCredito }

function TDMSimulaCredito.SimularCredito(AValor: Double; AParcelas: Integer; AProponente: TProponente)
  : String;
begin
  if (AValor < 500) and (AParcelas > 5) then
    raise ParcelasMaximasException.Create(
      'Se valor é menor que R$500, máximo de parcelas são 5')
  else
    result := Format('Crédito de R$%s  em %d parcelas liberado!',
      [FormatFloat('###,###,##0.00', AValor), AParcelas]);
end;

end.
