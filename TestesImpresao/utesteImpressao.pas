unit utesteImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
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

  pnfsNFSe,
  ACBrMail,

  ACBrBase,
  ACBrNFe,

  ACBrNFSeDANFSeRLClass

    ;

type
  TForm3 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  var
  ocomp := TACBrNFe.create(Nil);
  var
  danfeNFE := TACBrNFeDANFeRL.create(Nil);
  var
  danfeNFCE := TACBrNFeDANFCeFortes.create(Nil);
  var
  ofile := 'C:\Users\wilson.luz\Desktop\RENILDO\NFe 3067.xml';
  var
  path := ExtractFilePath(GetModuleName(HInstance)) + 'web\template\docs';
  try
    ocomp.NotasFiscais.LoadFromFile(ofile);
    ocomp.DANFE := danfeNFE;
    danfeNFE.ImprimeValor := iuComercialETributavel;
    danfeNFE.MostraStatus := False;
    danfeNFE.MostraSetup := False;
    danfeNFE.MostraPreview := False;
    danfeNFE.PathPDF := path;
    danfeNFE.Sistema := 'teste';
    danfeNFE.Fonte.TamanhoFonteDemaisCampos:=6;
    danfeNFE.Site := 'www.teste.com.br';
    danfeNFE.CasasDecimais.qCom := 6;
    danfeNFE.CasasDecimais.vUnCom := 6;
    danfeNFE.CasasDecimais.Formato := tdetInteger;
    danfeNFCE.MostraStatus := False;
    danfeNFCE.MostraSetup := False;
    danfeNFCE.MostraPreview := False;
    danfeNFCE.PathPDF := path;
    ocomp.NotasFiscais[0].ImprimirPDF;
    ofile := ExtractFileName(danfeNFE.ArquivoPDF);
  finally
    FreeAndNil(ocomp);
    FreeAndNil(danfeNFE);
    FreeAndNil(danfeNFCE);

  end;

end;

end.
