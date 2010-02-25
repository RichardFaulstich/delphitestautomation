unit UFabricaDataModules;

interface

uses
  UModelo, UDMSimulaCredito;
type

  TFabricaDataModules = class
    class function Cria(ATipo: TProponente) : TDMSimulaCredito;
  end;


implementation

uses
  UDMSimulaCreditoEstagiario;

{ TFabricaDataModules }

class function TFabricaDataModules.Cria(ATipo: TProponente): TDMSimulaCredito;
begin
  if(ATipo is TEstagiario) then
    result := TDMSimulaCreditoEstagiario.Create(nil)
  else
    result := TDMSimulaCredito.Create(nil);
end;

end.
