program dfeconsumer;

uses
  Forms,
  dfe.consumer.tester in 'dfe.consumer.tester.pas' {fconsumer},
  dfe.lib.origin.return in '..\lib\dfe.lib.origin.return.pas',
  dfe.lib.jsontoXml in '..\lib\dfe.lib.jsontoXml.pas',
  dfe.lib.normalize in '..\lib\dfe.lib.normalize.pas',
  dfe.lib.xmltoJson in '..\lib\dfe.lib.xmltoJson.pas',
  dfe.lib.http.client in '..\lib\dfe.lib.http.client.pas',
  dfe.model.validacaoRequest in '..\model\request\dfe.model.validacaoRequest.pas',
  dfe.model.validacaoResponse in '..\model\dfe.model.validacaoResponse.pas',
  Vcl.Themes,
  Vcl.Styles,
  dfe.model.cancelamentoRequest in '..\model\request\dfe.model.cancelamentoRequest.pas',
  dfe.model.cancelamento in '..\model\dfe.model.cancelamento.pas',
  dfe.model.inutilizacao in '..\model\dfe.model.inutilizacao.pas',
  dfe.model.inutilizacaoRequest in '..\model\request\dfe.model.inutilizacaoRequest.pas',
  dfe.model.cartaCorrecaoRequest in '..\model\request\dfe.model.cartaCorrecaoRequest.pas',
  dfe.model.cartaCorrecao in '..\model\dfe.model.cartaCorrecao.pas',
  dfe.databinding.nfe_v400 in '..\databinding\dfe.databinding.nfe_v400.pas',
  dfe.lib.util in '..\lib\dfe.lib.util.pas',
  consumer.model.nfe in 'model\consumer.model.nfe.pas',
  WebSocketServer in '..\lib\websocket\WebSocketServer.pas',
  dfe.model.mensagens in '..\model\dfe.model.mensagens.pas',
  dfe.services.websocket in '..\services\dfe.services.websocket.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(Tfconsumer, fconsumer);
  Application.Run;
end.
