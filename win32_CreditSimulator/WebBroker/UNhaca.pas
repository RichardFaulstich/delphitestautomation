unit UNhaca;

interface

type

  TProponente = class
  private
    FRendaMensal: double;
    procedure SetRendaMensal(const Value: double);
  published
    property RendaMensal: double read FRendaMensal write SetRendaMensal;
  end;

  TEstagiario = class(TProponente)

  end;

  TFuncionario = class(TProponente)

  end;

  TFabricaProponentes = class
    class function Cria(ATipo: String): TProponente;
  end;


implementation


{ Proponente }

procedure TProponente.SetRendaMensal(const Value: double);
begin
  FRendaMensal := Value;
end;

{ FabricaProponentes }

class function TFabricaProponentes.Cria(ATipo: String): TProponente;
begin
  if (ATipo = 'Estagiario') then
    result := TEstagiario.Create
  else
    if (ATipo = 'Funcionario') then
    result := TFuncionario.Create
  else
    result := nil;
end;


end.
