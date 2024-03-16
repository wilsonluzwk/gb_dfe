unit dfe.services.impimirDfe;

interface

uses
  dfe.lib.constants,
{$IFDEF WINDOWS}
  Winapi.Windows,
  Winapi.Messages,
{$ENDIF MSWINDOWS}
  System.SysUtils,
  System.Variants,
  System.JSON,
  blcksock,
  TypInfo,

  Xml.xmldom,
  Xml.XMLDoc,
  Xml.XMLIntf,
  dfe.dao.empresa,
  dfe.model.empresa,

  System.classes,
  {ACBR}
  pcnConversao,
  pnfsConversao,

  System.NetEncoding,

  ACBrDFeReport,
  ACBrDFeDANFeReport,
  ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass,
  ACBrDANFCeFortesFr,
  db,
  ACBrEAD,
  ACBrDFe,

  pcnConversaoNFe,
  ACBrUtil,
  pcnNFeW,
  pcnNFeRTXT,
  pcnAuxiliar,
  ACBrDFeUtil,
  ACBrDFeSSL,
  dfe.dao.nfe,
  dfe.model.nfe,
  pnfsNFSe,
  ACBrMail,

  ACBrBase,
  ACBrNFe,

  ACBrNFSeDANFSeRLClass

    ;

type
  TServiceImprimirDFE = class
  private
    ocomp: TACBrNFe;
    danfeNFCE: TACBrNFeDANFCeFortes;
    danfeNFE: TACBrNFeDANFeRL;
    modelo: integer;
    empresa: Tempresa;
    procedure setTipoPdf();
  Public
    function imprimir(param: TJSONObject): string;
    function getXml(param: TJSONObject): string;
  end;

implementation

{ TServiceImprimirDFE }
procedure TServiceImprimirDFE.setTipoPdf();

var
  Ok: Boolean;
  lIndex: integer;
begin

  if modelo = 65 then
  begin

    ocomp.DANFE := danfeNFCE;

    danfeNFCE.NumCopias := empresa.danfe_qtdcopias;

    if empresa.danfe_exibefatura = 'S' then
      danfeNFE.ExibeCampoFatura := True
    else
      danfeNFE.ExibeCampoFatura := False;

  end
  else
  begin

    ocomp.DANFE := danfeNFE;

    danfeNFE.NumCopias := empresa.danfe_qtdcopias;

    if empresa.danfe_exibefatura = 'S' then

      danfeNFE.ExibeCampoFatura := True
    else
      danfeNFE.ExibeCampoFatura := False;

    case empresa.danfe_tipodanf of
      0:
        danfeNFE.TipoDANFE := tiSemGeracao;
      1:
        danfeNFE.TipoDANFE := tiRetrato;
      2:
        danfeNFE.TipoDANFE := tiPaisagem;
      3:
        danfeNFE.TipoDANFE := tiSimplificado;
      4:
        danfeNFE.TipoDANFE := tiMsgEletronica;
    end;

    case empresa.danfe_tipodanf of
      0:
        ocomp.DANFE.TipoDANFE := StrToTpImp(Ok, '0');
      1:
        ocomp.DANFE.TipoDANFE := StrToTpImp(Ok, '1');
      2:
        ocomp.DANFE.TipoDANFE := StrToTpImp(Ok, '2');
      3:
        ocomp.DANFE.TipoDANFE := StrToTpImp(Ok, '3');
      4:
        ocomp.DANFE.TipoDANFE := StrToTpImp(Ok, '5');
    end;

    if empresa.danfe_expandiLogo = 'C' then
      lIndex := 0

    else if (empresa.danfe_expandiLogo = 'E') or
      (empresa.danfe_expandiLogo = 'S') then
      lIndex := 1
    else
      lIndex := 2;

    case lIndex of
      0:
        begin
          if (empresa.danfe_tipodanf = 1) then
            danfeNFE.Fonte.TamanhoFonteEndereco := 6
          else
            danfeNFE.Fonte.TamanhoFonteEndereco := 6;
          // antes de jul/2021 = 8
          danfeNFE.LogoemCima := True;
          danfeNFE.ExpandeLogoMarca := False;
        end;
      1:
        begin
          danfeNFE.Fonte.TamanhoFonteEndereco := 6;
          // antes de jul/2021 = 8
          danfeNFE.LogoemCima := False;
          danfeNFE.ExpandeLogoMarca := True;
        end;
      2:
        begin
          danfeNFE.Fonte.TamanhoFonteEndereco := 6;
          // antes de jul/2021 = 8
          danfeNFE.LogoemCima := False;
          danfeNFE.ExpandeLogoMarca := False;
        end;
    end;

  end;

end;

function TServiceImprimirDFE.getXml(param: TJSONObject): string;

var
  ofile: string;
  path: string;
  danfeBase64: string;
  nota: Tnota;
  strfile: TFileStream;
  Writer: TStreamWriter;
  dao: TDaoNfe;
  daoEmpresa: TDaoEmpresa;

begin
  path := ExtractFilePath(GetModuleName(HInstance)) + 'web\template\docs';
  ForceDirectories(path);

  try
    dao := TDaoNfe.create;

    nota := dao.getNota(param);
    ofile := path + '\' + nota.chave + '.xml';
    if nota.cnpj = '' then
      raise Exception.create('Nota fiscal não localizada ');

    if nota.Xml <> '' then
    begin
      danfeBase64 := nota.Xml;
      try
        Writer := TStreamWriter.create(ofile, False, TEncoding.UTF8);
        Writer.Write(danfeBase64);
      finally
        Writer.Close;
        Writer.Free();

      end;

    end

  finally
    // FreeAndNil(strfile);
  end;

  result := ExtractFileName(ofile);

end;

function TServiceImprimirDFE.imprimir(param: TJSONObject): string;

var
  ofile: string;
  path: string;
  danfeBase64: string;
  nota: Tnota;
  strfile: TFileStream;
  Writer: TStreamWriter;

  dao: TDaoNfe;
  daoEmpresa: TDaoEmpresa;
  function isDifUnidades: Boolean;
  var
    index: integer;
  begin
    result := False;
    for index := 0 to pred(ocomp.NotasFiscais[0].nfe.Det.Count) do
    begin
      if ocomp.NotasFiscais[0].nfe.Det[index].Prod.uCom <> ocomp.NotasFiscais[0]
        .nfe.Det[index].Prod.uTrib then
      begin
        result := True;
        break;
      end;
    end;
  end;

begin
  path := ExtractFilePath(GetModuleName(HInstance)) + 'web\template\docs';
  ForceDirectories(path);

  try
    dao := TDaoNfe.create;

    nota := dao.getNota(param);
    ofile := path + '\' + nota.chave + '.xml';

    if nota.cnpj = '' then
      raise Exception.create('Nota fiscal não localizada ');
    if nota.DANFE <> '' then
    begin
      danfeBase64 := TNetEncoding.Base64.Decode(nota.DANFE);
      strfile.WriteBuffer(Pointer(danfeBase64)^, Length(danfeBase64));
    end
    else
    begin
      if nota.Xml <> '' then
      begin
        danfeBase64 := nota.Xml;
        try
          Writer := TStreamWriter.create(ofile, False, TEncoding.UTF8);
          Writer.Write(danfeBase64);
        finally
          Writer.Close;
          Writer.Free();
        end;
        ocomp := TACBrNFe.create(Nil);
        danfeNFE := TACBrNFeDANFeRL.create(Nil);
        danfeNFCE := TACBrNFeDANFCeFortes.create(Nil);
        daoEmpresa := TDaoEmpresa.create;
        empresa := daoEmpresa.getEmpresaCnpj(nota.cnpj);
        modelo := strtoint(nota.modelo);
        try
         
          ocomp.NotasFiscais.LoadFromFile(ofile);
          ocomp.DANFE := danfeNFE;
          if isDifUnidades then
            danfeNFE.ImprimeValor := iuComercialETributavel;
          danfeNFE.MostraStatus := False;
          danfeNFE.MostraSetup := False;
          danfeNFE.MostraPreview := False;
          danfeNFE.Logo := empresa.danfe_logomarca;
          danfeNFE.PathPDF := path;
          danfeNFE.Sistema := _ctEmpressaDanfe;
          danfeNFE.Site := _ctSiteDanfe;
          danfeNFE.CasasDecimais.qCom := 6;
          danfeNFE.CasasDecimais.vUnCom := 6;
          danfeNFE.CasasDecimais.Formato := tdetInteger;
          danfeNFCE.MostraStatus := False;
          danfeNFCE.MostraSetup := False;
          danfeNFCE.MostraPreview := False;
          danfeNFCE.Logo := empresa.danfe_logomarca;
          danfeNFCE.PathPDF := path;
          danfeNFCE.Sistema := _ctEmpressaDanfe;
          danfeNFCE.Site := _ctSiteDanfe;
          setTipoPdf;
          ocomp.NotasFiscais[0].ImprimirPDF;
          if modelo = 65 then
            ofile := ExtractFileName(danfeNFCE.ArquivoPDF)
          else

            ofile := ExtractFileName(danfeNFE.ArquivoPDF);

        finally
          FreeAndNil(ocomp);
          FreeAndNil(danfeNFE);
          FreeAndNil(danfeNFCE);
          FreeAndNil(empresa);
          FreeAndNil(daoEmpresa);
        end;
      end
    end;
  finally
    // FreeAndNil(strfile);
  end;

  result := ofile;

end;

end.
