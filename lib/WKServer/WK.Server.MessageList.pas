unit WK.Server.MessageList;

interface

uses
  WK.Server.Message;

const
  IRegistroInserido: TMessageType = (StatusCode: 201; Sucesso: True;
    Mensagem: 'Registro Inserido'; Content: nil);

  IRegistroAlterado: TMessageType = (StatusCode: 200; Sucesso: True;
    Mensagem: 'Registro Alterado'; Content: nil);

  IRegistroExcluido: TMessageType = (StatusCode: 200; Sucesso: True;
    Mensagem: 'Registro Exclu�do'; Content: nil);

  IAutorizado: TMessageType = (StatusCode: 200; Sucesso: True;
    Mensagem: 'Usu�rio autenticado com sucesso.'; Content: nil);

   INotaValidada: TMessageType = (StatusCode: 200; Sucesso: True;
    Mensagem: 'Nota validada.'; Content: nil);

  IEmailEnviado: TMessageType = (StatusCode: 200; Sucesso: True;
    Mensagem: 'Email enviado com sucesso.'; Content: nil);

  IServidorConnectado: TMessageType = (StatusCode: 200; Sucesso: True;
    Mensagem: 'Servidor connectado com sucesso'; Content: nil);

  EDadosNaoSalvos: TMessageType = (StatusCode: 400; Sucesso: False;
    Mensagem: 'N�o foi poss�vel salvar os dados!'; Content: nil);

  EDadosNaoExcluidos: TMessageType = (StatusCode: 400; Sucesso: False;
    Mensagem: 'N�o foi poss�vel excluir os dados!'; Content: nil);

  ERegistroNaoEncontrado: TMessageType = (StatusCode: 400; Sucesso: False;
    Mensagem: 'Nenhum registro encontrado'; Content: nil);

  ECampoNotNullNaoPreenchido: TMessageType = (StatusCode: 400; Sucesso: False;
    Mensagem: 'Campo n�o preenchido !'; Content: nil);

  ENaoAutorizado: TMessageType = (StatusCode: 401; Sucesso: False;
    Mensagem: 'Usu�rio n�o logado !';
    Content: nil);

  EAcessoNegado: TMessageType = (StatusCode: 403; Sucesso: False;
    Mensagem: 'Acesso negado. Usu�rio sem autoriza��o.'; Content: nil);

  EErroParametros: TMessageType = (StatusCode: 400; Sucesso: False;
    Mensagem: 'Ausencia de parametros na requisi��o'; Content: nil);

  EErroApiPlugNotas: TMessageType = (StatusCode: 400; Sucesso: False;
    Mensagem: 'Erro na comunica��o com a api de notas'; Content: nil);

  EErroGeral: TMessageType = (StatusCode: 500; Sucesso: False;
    Mensagem: 'Erro geral'; Content: nil);

    ENotaNaoValidada: TMessageType = (StatusCode: 500; Sucesso: False;
    Mensagem: 'Nota n�o validada'; Content: nil);

implementation

end.
