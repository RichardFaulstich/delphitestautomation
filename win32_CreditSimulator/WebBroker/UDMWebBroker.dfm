object DMWebBroker: TDMWebBroker
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'WebActionItem1'
      PathInfo = '/home'
      Producer = ppHome
    end
    item
      Name = 'WebActionItem2'
      PathInfo = '/simula'
      OnAction = WebModule2WebActionItem2Action
    end>
  Height = 219
  Width = 312
  object ppHome: TPageProducer
    HTMLDoc.Strings = (
      '<h2>Bem vindo ao Simulador de Cr'#233'dito Web</h2>'
      ''
      ''
      
        '<form action='#39'/SimuladorCreditoWeb.TDUnitServer/simula'#39' method='#39 +
        'post'#39'>'
      ''
      'Valor: <input type='#39'text'#39' name='#39'valor'#39'><br>'
      'Renda Mensal: <input type='#39'text'#39' name='#39'rendaMensal'#39'><br>'
      'Parcelas: <input type='#39'text'#39' name='#39'parcelas'#39'><br>'
      'Tipo: <select name='#39'tipoProponente'#39'>'
      '         <option value='#39'Estagiario'#39'>Estagi'#225'rio</option>'
      '         <option value='#39'Funcionario'#39'>Funcion'#225'rio</option>'
      '      </select>'
      ''
      '      <input type='#39'submit'#39' name='#39'Simular'#39' value='#39'Simular'#39'>'
      ''
      ''
      '</form>'
      ''
      ''
      '<#Mensagem#>'
      ''
      ''
      '<hr>'
      'Powered by: Rad Studio 2010 by Embarcadero &copy; 2010')
    OnHTMLTag = ppHomeHTMLTag
    Left = 56
    Top = 64
  end
end
