program GB_DFE_ServiceWin32;

uses
  Vcl.SvcMgr,
  {$IFDEF MSWINDOWS}
  MidasLib,
  {$ENDIF MSWINDOWS}
  windows,
  System.SysUtils,
  classes,
  dfe.servicewin32.srv in 'win32service\dfe.servicewin32.srv.pas' {SrvRpswin32: TService},
  dfe.httphandler.dashboard in 'httphandlers\dfe.httphandler.dashboard.pas',
  dfe.httpserver.base in 'httpserver\dfe.httpserver.base.pas',
  dfe.httpserver in 'httpserver\dfe.httpserver.pas',
  dfe.lib.util in 'lib\dfe.lib.util.pas',
  dfe.dao.nfe in 'dao\dfe.dao.nfe.pas',
  dfe.model.nfe in 'model\dfe.model.nfe.pas',
  dfe.dao.base in 'dao\dfe.dao.base.pas',
  dfe.httphandler.nfe in 'httphandlers\dfe.httphandler.nfe.pas',
  dfe.services.validar in 'services\dfe.services.validar.pas',
  dfe.model.config in 'model\dfe.model.config.pas',
  dfe.model.empresa in 'model\dfe.model.empresa.pas',
  nfe.controller.nfe in 'controller\nfe.controller.nfe.pas',
  dfe.lib.constants in 'lib\dfe.lib.constants.pas',
  dfe.model.cancelamento in 'model\dfe.model.cancelamento.pas',
  dfe.model.cancelamentoResponse in 'model\dfe.model.cancelamentoResponse.pas',
  dfe.model.cartaCorrecao in 'model\dfe.model.cartaCorrecao.pas',
  dfe.model.infonfe in 'model\dfe.model.infonfe.pas',
  dfe.model.inutilizacao in 'model\dfe.model.inutilizacao.pas',
  dfe.model.log in 'model\dfe.model.log.pas',
  dfe.model.validacaoResponse in 'model\dfe.model.validacaoResponse.pas',
  dfe.dao.cancelamento in 'dao\dfe.dao.cancelamento.pas',
  dfe.dao.cartaCorrecao in 'dao\dfe.dao.cartaCorrecao.pas',
  dfe.dao.infoNfe in 'dao\dfe.dao.infoNfe.pas',
  dfe.dao.inutilizacao in 'dao\dfe.dao.inutilizacao.pas',
  dfe.dao.log in 'dao\dfe.dao.log.pas',
  dfe.model.cancelamentoRequest in 'model\request\dfe.model.cancelamentoRequest.pas',
  dfe.model.cartaCorrecaoRequest in 'model\request\dfe.model.cartaCorrecaoRequest.pas',
  dfe.model.inutilizacaoRequest in 'model\request\dfe.model.inutilizacaoRequest.pas',
  dfe.model.validacaoRequest in 'model\request\dfe.model.validacaoRequest.pas',
  dfe.services.cancelar in 'services\dfe.services.cancelar.pas',
  dfe.services.cartaCorrecao in 'services\dfe.services.cartaCorrecao.pas',
  dfe.services.inutilizar in 'services\dfe.services.inutilizar.pas',
  dfe.lib.jsontoXml in 'lib\dfe.lib.jsontoXml.pas',
  dfe.lib.xmltoJson in 'lib\dfe.lib.xmltoJson.pas',
  dfe.lib.origin.return in 'lib\dfe.lib.origin.return.pas',
  dfe.lib.normalize in 'lib\dfe.lib.normalize.pas',
  dfe.dao.empresa in 'dao\dfe.dao.empresa.pas',
  dfe.lib.acbr.config in 'lib\dfe.lib.acbr.config.pas',
  dfe.httphandler.empresa in 'httphandlers\dfe.httphandler.empresa.pas',
  nfe.controller.empresa in 'controller\nfe.controller.empresa.pas',
  dfe.httphandler.cartaCorrecao in 'httphandlers\dfe.httphandler.cartaCorrecao.pas',
  dfe.httphandler.inutilizacoes in 'httphandlers\dfe.httphandler.inutilizacoes.pas',
  dfe.httphandler.cancelamentos in 'httphandlers\dfe.httphandler.cancelamentos.pas',
  dfe.services.websocket in 'services\dfe.services.websocket.pas',
  dfe.model.mensagens in 'model\dfe.model.mensagens.pas',
  WebSocketServer in 'lib\websocket\WebSocketServer.pas',
  dfe.model.ManifestoRequest in 'model\request\dfe.model.ManifestoRequest.pas',
  dfe.model.manifesto in 'model\dfe.model.manifesto.pas',
  dfe.schedule.MDE in 'schedule\dfe.schedule.MDE.pas',
  dfe.schedule.consultadestinadas in 'schedule\dfe.schedule.consultadestinadas.pas',
  dfe.services.importar_xml in 'services\dfe.services.importar_xml.pas',
  dfe.dao.manifesto in 'dao\dfe.dao.manifesto.pas',
  dfe.dao.dfeManifestos in 'dao\dfe.dao.dfeManifestos.pas',
  dfe.services.impimirDfe in 'services\dfe.services.impimirDfe.pas',
  dfe.services.manifestar in 'services\dfe.services.manifestar.pas',
  dfe.httphandler.manifestos in 'httphandlers\dfe.httphandler.manifestos.pas',
  dfe.services.email in 'services\dfe.services.email.pas',
  dfe.dao.usuarios in 'dao\dfe.dao.usuarios.pas',
  dfe.httphandler.auth in 'httphandlers\dfe.httphandler.auth.pas',
  dfe.dao.importacao in 'dao\dfe.dao.importacao.pas',
  dfe.schedule.manutencao in 'schedule\dfe.schedule.manutencao.pas',
  Resources.Cancelamento in 'resources\Resources.Cancelamento.pas',
  Resources.Cartacorrecao in 'resources\Resources.Cartacorrecao.pas',
  Resources.Distribuicaodfe in 'resources\Resources.Distribuicaodfe.pas',
  Resources.Empresa in 'resources\Resources.Empresa.pas',
  Resources.Inutilizacao in 'resources\Resources.Inutilizacao.pas',
  WK.BasicRepository in 'lib\WKServer\WK.BasicRepository.pas',
  WK.Json.DTO in 'lib\WKServer\WK.Json.DTO.pas',
  WK.Server.AngularModel in 'lib\WKServer\WK.Server.AngularModel.pas',
  WK.Server.Attributes in 'lib\WKServer\WK.Server.Attributes.pas',
  WK.Server.Authentication in 'lib\WKServer\WK.Server.Authentication.pas',
  WK.Server.Config in 'lib\WKServer\WK.Server.Config.pas',
  WK.Server.Connection in 'lib\WKServer\WK.Server.Connection.pas',
  WK.Server.Constants in 'lib\WKServer\WK.Server.Constants.pas',
  WK.Server.DAO in 'lib\WKServer\WK.Server.DAO.pas',
  WK.Server.Log in 'lib\WKServer\WK.Server.Log.pas',
  WK.Server.Message in 'lib\WKServer\WK.Server.Message.pas',
  WK.Server.MessageList in 'lib\WKServer\WK.Server.MessageList.pas',
  WK.Server.Records in 'lib\WKServer\WK.Server.Records.pas',
  WK.Server.ResourceBaseClass in 'lib\WKServer\WK.Server.ResourceBaseClass.pas',
  WK.Server.ServerConsole in 'lib\WKServer\WK.Server.ServerConsole.pas',
  WK.Server.Singleton.Codigo in 'lib\WKServer\WK.Server.Singleton.Codigo.pas',
  WK.Server.Swagger in 'lib\WKServer\WK.Server.Swagger.pas',
  WK.Server.TokenWK in 'lib\WKServer\WK.Server.TokenWK.pas',
  Wk.Util in 'lib\WKServer\Wk.Util.pas',
  WK.Utils.Criptografia in 'lib\WKServer\WK.Utils.Criptografia.pas',
  WK.Utils.JsonSearchToWhere in 'lib\WKServer\WK.Utils.JsonSearchToWhere.pas',
  Wk.Utils.SectionVariables in 'lib\WKServer\Wk.Utils.SectionVariables.pas',
  WK.Utils.Strings in 'lib\WKServer\WK.Utils.Strings.pas',
  Swager.Json.Body in 'lib\Swager\Swager.Json.Body.pas',
  Swager.Json.Definitions in 'lib\Swager\Swager.Json.Definitions.pas',
  Swager.Json.DTO in 'lib\Swager\Swager.Json.DTO.pas',
  Swager.Json.Paths in 'lib\Swager\Swager.Json.Paths.pas',
  Swager.ResourceBaseClass in 'lib\Swager\Swager.ResourceBaseClass.pas',
  dfe.services.cte in 'services\dfe.services.cte.pas',
  dfe.services.consultadestinadas in 'services\dfe.services.consultadestinadas.pas',
  dfe.services.ciencia_operacao in 'services\dfe.services.ciencia_operacao.pas',
  dfe.dao.Cte in 'dao\dfe.dao.Cte.pas',
  dfe.module.databinding.schema.cte in 'databinding\dfe.module.databinding.schema.cte.pas',
  dfe.module.databinding.schema.cte_rodo in 'databinding\dfe.module.databinding.schema.cte_rodo.pas',
  dfe.dto.cteConsuta in 'dto\dfe.dto.cteConsuta.pas',
  nfe.controller.auth in 'controller\nfe.controller.auth.pas',
  Resources.Cteide in 'resources\Resources.Cteide.pas',
  Resources.Cteservicocomplementar in 'resources\Resources.Cteservicocomplementar.pas',
  Resources.Cteremetente in 'resources\Resources.Cteremetente.pas',
  Resources.Cterecebedor in 'resources\Resources.Cterecebedor.pas',
  Resources.Cteexpedidor in 'resources\Resources.Cteexpedidor.pas',
  Resources.Cteemitente in 'resources\Resources.Cteemitente.pas',
  Resources.Ctedestinatario in 'resources\Resources.Ctedestinatario.pas',
  Resources.Cteconsulta in 'resources\Resources.Cteconsulta.pas',
  dfe.dto.DtoCteIde in 'dto\dfe.dto.DtoCteIde.pas',
  nfe.controller.cte in 'controller\nfe.controller.cte.pas',
  dfe.services.cteManifestar in 'services\dfe.services.cteManifestar.pas',
  dfe.httphandler.cte in 'httphandlers\dfe.httphandler.cte.pas';

{$R *.RES}

begin


  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;


  Application.CreateForm(TGB_DFE_SERVICE, GB_DFE_SERVICE);
  Application.Run;

end.
