unit UDMSimulaCreditoEstagiario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMSimulaCredito, UModelo;

type
  TDMSimulaCreditoEstagiario = class(TDMSimulaCredito)
  private
    { Private declarations }
  public
    function SimularCredito(AValor: Double; AParcelas: Integer;
      AProponente: TProponente): string; override;
    { Public declarations }

  end;

var
  DMSimulaCreditoEstagiario: TDMSimulaCreditoEstagiario;

implementation

uses
  UValorMaximoEstagiarioException;

{$R *.dfm}

{ TDMSimulaCreditoEstagiario }

function TDMSimulaCreditoEstagiario.SimularCredito(AValor: Double;
  AParcelas: Integer; AProponente: TProponente): string;
begin
  inherited;

  if ( AValor > (AProponente.RendaMensal * 0.6)) then
    raise ValorMaximoEstagiarioException.Create(
      'Cr�dito Negado. Estagi�rios somente podem solicitar valores at� 60% do sal�rio. ')
  else
    result := Format('Cr�dito de R$%s  em %d parcelas liberado!',
      [FormatFloat('###,###,##0.00', AValor), AParcelas]);
end;

end.
