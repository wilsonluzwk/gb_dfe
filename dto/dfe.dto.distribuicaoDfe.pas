unit dfe.dto.distribuicaoDfe;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  System.classes;

Type
  TDtoDistribuicaoDfe = class
  private

    Fnsu: string;
    FchDFe: string;
    FCNPJCPF: string;
    FxNome: string;
    FIE: string;
    FdhEmi: TDateTime;
    FtpNF: integer;
    FvNF: Double;
    FdhRecbto: TDateTime;
    Fcstat: integer;
    FdigVal: string;
    Fxmotivo: string;
    FcSitDFe: string;
    Fdanfe: string;
    FtpEvento: string;
    FtpEventoDesc: string;
    FnProt: String;
    Fid:Integer;
  public

  published
    property id: integer read Fid write Fid;
    property nsu: string read Fnsu write Fnsu;
    property chDFe: string read FchDFe write FchDFe;
    property CNPJCPF: string read FCNPJCPF write FCNPJCPF;
    property xNome: string read FxNome write FxNome;
    property IE: string read FIE write FIE;
    property dhEmi: TDateTime read FdhEmi write FdhEmi;
    property tpNF: integer read FtpNF write FtpNF;
    property vNF: Double read FvNF write FvNF;
    property dhRecbto: TDateTime read FdhRecbto write FdhRecbto;
    property cstat: integer read Fcstat write Fcstat;
    property digVal: string read FdigVal write FdigVal;
    property xmotivo: string read Fxmotivo write Fxmotivo;
    property cSitDFe: string read FcSitDFe write FcSitDFe;
    property danfe: string read Fdanfe write Fdanfe;
    property tpEvento: string read FtpEvento write FtpEvento;
    property nProt: string read FnProt write FnProt;
    property tpEventoDesc: string read FtpEventoDesc write FtpEventoDesc;

  end;

type

  TDtoDistribuicaoDfes = TObjectList<TDtoDistribuicaoDfe>;

implementation

end.
