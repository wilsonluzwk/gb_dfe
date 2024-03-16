unit dfe.lib.acbr.config;

interface

uses
  syncobjs,
  blcksock,
  windows,
  sysutils,

  System.NetEncoding,
  Classes,
  ACBrNFe,
  db,
  ACBrEAD,
  pcnConversao,
  ACBrUtil,
  pcnNFeW,
  pcnNFeRTXT,
  pcnAuxiliar,
  ACBrDFeUtil,
  ACBrDFeSSL,
  XMLIntf,
  ACBrNFeWebServices,

  ACBrUtil.FilesIO,
  ACBrUtil.DateTime,
  ACBrUtil.Strings,
  ACBrUtil.XMLHTML,
  pcnNFe,

  pcnRetConsReciDFe,
  ACBrDFeConfiguracoes,

  ACBrDFeOpenSSL,

  dfe.model.empresa,
  dfe.lib.util,
  Inifiles,
  Datasnap.DBClient,
  XMLDoc, ACBrCTe;

type
  TAcbrConfig = class
  Public
    Class procedure setAcbrObj(var emissor: TACBrNFe; empresa: Tempresa);
    class procedure setAcbrObjCte(var emissor: TACBrCTe;
  empresa: Tempresa);
  end;

implementation

uses
  pcteConversaoCTe, pcnConversaoNFe;




class procedure TAcbrConfig.setAcbrObj(var emissor: TACBrNFe;
  empresa: Tempresa);
var

  ilatencia: Integer;
  stm: TstringStream;
  outfile: TFileStream;
  ofile: string;
  odir: string;
begin

  if not assigned(empresa) then
    raise Exception.Create('Empresa não informada');

  if empresa.certificadoPfx = '' then
    raise Exception.Create('Arquivo de certificados não informado');
  if empresa.senhaPfx = '' then
    raise Exception.Create('Senha do arquivo de certificado não informada');
  if empresa.uf = '' then
    raise Exception.Create('A uf da empresa não foi informada');
  // aqui
  emissor.Configuracoes.WebServices.uf := empresa.uf;
  emissor.Configuracoes.WebServices.ProxyHost := empresa.proxy_host;
  emissor.Configuracoes.WebServices.ProxyPort := empresa.proxy_porta;
  emissor.Configuracoes.WebServices.ProxyUser := empresa.proxy_user;
  emissor.Configuracoes.WebServices.ProxyPass := empresa.proxy_pass;

  emissor.Configuracoes.Geral.ModeloDF := moNFe;
  emissor.Configuracoes.Geral.VersaoDF := ve400;
  /// CONFIGURAR SSL
  emissor.Configuracoes.Geral.SSLLib := libOpenSSL;
  emissor.Configuracoes.Geral.SSLHttpLib := httpOpenSSL;
  emissor.SSL.SSLType := LT_all;
  /// *********************************************
  if empresa.Web_Ambiente = 'P' then
    emissor.Configuracoes.WebServices.ambiente := taProducao
  else
    emissor.Configuracoes.WebServices.ambiente := taHomologacao;

  emissor.Configuracoes.WebServices.IntervaloTentativas := 1000;
  emissor.Configuracoes.WebServices.AguardarConsultaRet := 1000;
  // AJUSTAR AQUI SE ESTIVER MUITO LENTO O RETORNO DA SEFAZ
  // DIMINUIR O TEMPO DE ESPERA
  ilatencia := 20 * 1000;
  emissor.Configuracoes.WebServices.Tentativas := 5;
  emissor.Configuracoes.WebServices.TimeOut := ilatencia;
  emissor.Configuracoes.Geral.IdentarXML := false;
  emissor.Configuracoes.Geral.RetirarAcentos := True;
  emissor.Configuracoes.Geral.RetirarEspacos := True;

  emissor.SSL.DescarregarCertificado;
  try
    odir := ExtractFilePath(GetModuleName(HInstance)) + 'certficados\';

    ForceDirectories(odir);
    if empresa.nomecertificadoPfx = '' then
      empresa.nomecertificadoPfx := empresa.cnpj + '.pfx';
    ofile := odir + empresa.nomecertificadoPfx;

    ForceDirectories(odir);
    if FileExists(ofile) then
      DeleteFile(ofile);
    stm := TstringStream.Create(empresa.certificadoPfx);
    outfile := TFileStream.Create(ofile, fmCreate);
    TNetEncoding.base64.Decode(stm, outfile);

    FreeAndNil(outfile);
    emissor.Configuracoes.Certificados.ArquivoPFX := ofile;
  except
    on e: Exception do
      raise Exception.Create('O certificado não pode ser decodificado ' +
        e.Message);

  end;
  emissor.Configuracoes.Certificados.Senha := empresa.senhaPfx;

  try
    emissor.SSL.CarregarCertificado;
  except
    on e: Exception do
      raise Exception.Create('O certificado não pode ser carregado ' +
        e.Message);

  end;

  if emissor.SSL.DadosCertificado.DataVenc < date then
    raise Exception.Create('O Cetificado esta vencido ' +
      datetostr(emissor.SSL.DadosCertificado.DataVenc));

  emissor.Configuracoes.Geral.Salvar := false;
  emissor.Configuracoes.Arquivos.SalvarEvento := false;
  emissor.Configuracoes.Arquivos.Salvar := false;
  emissor.Configuracoes.Arquivos.SepararPorDia := True;

  emissor.Configuracoes.Arquivos.PathSalvar :=
    ExtractFilePath(GetModuleName(HInstance)) + 'BackupXmls\';

  emissor.Configuracoes.Arquivos.PathSchemas :=
    ExtractFilePath(GetModuleName(HInstance)) + 'Schemas\';

  if not DirectoryExists(emissor.Configuracoes.Arquivos.PathSchemas) then
  begin
    raise Exception.Create('path de schemas para emissão de notas não definido '
      + emissor.Configuracoes.Arquivos.PathSchemas);
  end;

  emissor.Configuracoes.Geral.ValidarDigest := false;

end;


class procedure TAcbrConfig.setAcbrObjCte(var emissor: TACBrCTe;
  empresa: Tempresa);
var

  ilatencia: Integer;
  stm: TstringStream;
  outfile: TFileStream;
  ofile: string;
  odir: string;
begin

  if not assigned(empresa) then
    raise Exception.Create('Empresa não informada');

  if empresa.certificadoPfx = '' then
    raise Exception.Create('Arquivo de certificados não informado');
  if empresa.senhaPfx = '' then
    raise Exception.Create('Senha do arquivo de certificado não informada');
  if empresa.uf = '' then
    raise Exception.Create('A uf da empresa não foi informada');
  // aqui
  emissor.Configuracoes.WebServices.uf := empresa.uf;
  emissor.Configuracoes.WebServices.ProxyHost := empresa.proxy_host;
  emissor.Configuracoes.WebServices.ProxyPort := empresa.proxy_porta;
  emissor.Configuracoes.WebServices.ProxyUser := empresa.proxy_user;
  emissor.Configuracoes.WebServices.ProxyPass := empresa.proxy_pass;
   emissor.Configuracoes.Geral.ModeloDF := moCTe;
  emissor.Configuracoes.Geral.VersaoDF :=  pcteConversaoCTe.ve400;


  /// CONFIGURAR SSL
  emissor.Configuracoes.Geral.SSLLib := libOpenSSL;
  emissor.Configuracoes.Geral.SSLHttpLib := httpOpenSSL;
  emissor.SSL.SSLType := LT_all;
  /// *********************************************
  if empresa.Web_Ambiente = 'P' then
    emissor.Configuracoes.WebServices.ambiente := taProducao
  else
    emissor.Configuracoes.WebServices.ambiente := taHomologacao;

  emissor.Configuracoes.WebServices.IntervaloTentativas := 1000;
  emissor.Configuracoes.WebServices.AguardarConsultaRet := 1000;
  // AJUSTAR AQUI SE ESTIVER MUITO LENTO O RETORNO DA SEFAZ
  // DIMINUIR O TEMPO DE ESPERA
  ilatencia := 20 * 1000;
  emissor.Configuracoes.WebServices.Tentativas := 5;
  emissor.Configuracoes.WebServices.TimeOut := ilatencia;
  emissor.Configuracoes.Geral.IdentarXML := false;
  emissor.Configuracoes.Geral.RetirarAcentos := True;
  emissor.Configuracoes.Geral.RetirarEspacos := True;

  emissor.SSL.DescarregarCertificado;
  try
    odir := ExtractFilePath(GetModuleName(HInstance)) + 'certficados\';

    ForceDirectories(odir);
    if empresa.nomecertificadoPfx = '' then
      empresa.nomecertificadoPfx := empresa.cnpj + '.pfx';
    ofile := odir + empresa.nomecertificadoPfx;

    ForceDirectories(odir);
    if FileExists(ofile) then
      DeleteFile(ofile);
    stm := TstringStream.Create(empresa.certificadoPfx);
    outfile := TFileStream.Create(ofile, fmCreate);
    TNetEncoding.base64.Decode(stm, outfile);

    FreeAndNil(outfile);
    emissor.Configuracoes.Certificados.ArquivoPFX := ofile;
  except
    on e: Exception do
      raise Exception.Create('O certificado não pode ser decodificado ' +
        e.Message);

  end;
  emissor.Configuracoes.Certificados.Senha := empresa.senhaPfx;

  try
    emissor.SSL.CarregarCertificado;
  except
    on e: Exception do
      raise Exception.Create('O certificado não pode ser carregado ' +
        e.Message);

  end;

  if emissor.SSL.DadosCertificado.DataVenc < date then
    raise Exception.Create('O Cetificado esta vencido ' +
      datetostr(emissor.SSL.DadosCertificado.DataVenc));

  emissor.Configuracoes.Geral.Salvar := false;

  emissor.Configuracoes.Arquivos.Salvar := false;
  emissor.Configuracoes.Arquivos.SepararPorDia := True;

  emissor.Configuracoes.Arquivos.PathSalvar :=
    ExtractFilePath(GetModuleName(HInstance)) + 'BackupXmls\';

  emissor.Configuracoes.Arquivos.PathSchemas :=
    ExtractFilePath(GetModuleName(HInstance)) + 'Schemas\cte';

  if not DirectoryExists(emissor.Configuracoes.Arquivos.PathSchemas) then
  begin
    raise Exception.Create('path de schemas para emissão de notas não definido '
      + emissor.Configuracoes.Arquivos.PathSchemas);
  end;

  emissor.Configuracoes.Geral.ValidarDigest := false;

end;

end.
