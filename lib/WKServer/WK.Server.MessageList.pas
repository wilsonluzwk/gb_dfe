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
    Mensagem: 'Registro Excluído'; Content: nil);

  IAutorizado: TMessageType = (StatusCode: 200; Sucesso: True;
    Mensagem: 'Usuário autenticado com sucesso.'; Content: nil);

   INotaValidada: TMessageType = (StatusCode: 200; Sucesso: True;
    Mensagem: 'Nota validada.'; Content: nil);

  IEmailEnviado: TMessageType = (StatusCode: 200; Sucesso: True;
    Mensagem: 'Email enviado com sucesso.'; Content: nil);

  IServidorConnectado: TMessageType = (StatusCode: 200; Sucesso: True;
    Mensagem: 'Servidor connectado com sucesso'; Content: nil);

  EDadosNaoSalvos: TMessageType = (StatusCode: 400; Sucesso: False;
    Mensagem: 'Não foi possível salvar os dados!'; Content: nil);

  EDadosNaoExcluidos: TMessageType = (StatusCode: 400; Sucesso: False;
    Mensagem: 'Não foi possível excluir os dados!'; Content: nil);

  ERegistroNaoEncontrado: TMessageType = (StatusCode: 400; Sucesso: False;
    Mensagem: 'Nenhum registro encontrado'; Content: nil);

  ECampoNotNullNaoPreenchido: TMessageType = (StatusCode: 400; Sucesso: False;
    Mensagem: 'Campo não preenchido !'; Content: nil);

  ENaoAutorizado: TMessageType = (StatusCode: 401; Sucesso: False;
    Mensagem: 'Usuário não logado !';
    Content: nil);

  EAcessoNegado: TMessageType = (StatusCode: 403; Sucesso: False;
    Mensagem: 'Acesso negado. Usuário sem autorização.'; Content: nil);

  EErroParametros: TMessageType = (StatusCode: 400; Sucesso: False;
    Mensagem: 'Ausencia de parametros na requisição'; Content: nil);

  EErroApiPlugNotas: TMessageType = (StatusCode: 400; Sucesso: False;
    Mensagem: 'Erro na comunicação com a api de notas'; Content: nil);

  EErroGeral: TMessageType = (StatusCode: 500; Sucesso: False;
    Mensagem: 'Erro geral'; Content: nil);

    ENotaNaoValidada: TMessageType = (StatusCode: 500; Sucesso: False;
    Mensagem: 'Nota não validada'; Content: nil);

implementation

end.
