unit dfe.dto.DtoCteIde;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  System.classes;

type
  TDtoCteIde = class
  private
    FCteid: String;
    FChcte: String;
    FCuf: String;
    FCct: String;
    FCfop: String;
    FNatop: String;
    FForpag: Integer;
    FMod: Integer;
    FSerie: Integer;
    FNct: Integer;
    FEmitCnpj: String;
    FRemetCnpj: String;
    FExpedCnpj: String;
    FDtEmis: TDateTime;
    FTpcte: Integer;
    FProcemi: Integer;
    FModal: String;
    FTpserv: Integer;
    FCmunini: Integer;
    FXmunini: String;
    FUfini: String;
    FCmunfim: Integer;
    FXmunfim: String;
    FUffim: String;
    FRetira: String;
    FToma: Integer;
    FNrAutorizador: String;
    FVtprest: double;
    FVrec: double;
    FIcmsCst: String;
    FVlrIcms: double;
    FPercIcms: double;
    FVlrBaseIcms: double;
    FCarga: String;
    FPropred: String;
    FSegRespseg: String;
    FSegXseg: String;
    FSegNapol: String;
    FSegVcarga: String;
    FTpmodal: String;
    FRntrc: String;
    FDprev: TDateTime;
    FLota: Integer;
    FTpAmb: Integer;
    FVerAplic: String;
    FDtRecbto: TDateTime;
    FNprot: String;
    FDigVal: String;
    FCstat: Integer;
    FXmotivo: String;
    FObservacao: String;
    FVersao: String;
    FXml: String;
    FEmitente: String;
    FExpedidor: string;
    FRemetente: string;
  public
    property Cteid: String read FCteid write FCteid;
    property Chcte: String read FChcte write FChcte;
    property Cuf: String read FCuf write FCuf;
    property Cct: String read FCct write FCct;
    property Cfop: String read FCfop write FCfop;
    property Natop: String read FNatop write FNatop;
    property Forpag: Integer read FForpag write FForpag;
    property &Mod: Integer read FMod write FMod;
    property Serie: Integer read FSerie write FSerie;
    property Nct: Integer read FNct write FNct;
    property EmitCnpj: String read FEmitCnpj write FEmitCnpj;
    property RemetCnpj: String read FRemetCnpj write FRemetCnpj;
    property ExpedCnpj: String read FExpedCnpj write FExpedCnpj;
    property DtEmis: TDateTime read FDtEmis write FDtEmis;
    property Tpcte: Integer read FTpcte write FTpcte;
    property Procemi: Integer read FProcemi write FProcemi;
    property Modal: String read FModal write FModal;
    property Tpserv: Integer read FTpserv write FTpserv;
    property Cmunini: Integer read FCmunini write FCmunini;
    property Xmunini: String read FXmunini write FXmunini;
    property Ufini: String read FUfini write FUfini;
    property Cmunfim: Integer read FCmunfim write FCmunfim;
    property Xmunfim: String read FXmunfim write FXmunfim;
    property Uffim: String read FUffim write FUffim;
    property Retira: String read FRetira write FRetira;
    property Toma: Integer read FToma write FToma;
    property NrAutorizador: String read FNrAutorizador write FNrAutorizador;
    property Vtprest: double read FVtprest write FVtprest;
    property Vrec: double read FVrec write FVrec;
    property IcmsCst: String read FIcmsCst write FIcmsCst;
    property VlrIcms: double read FVlrIcms write FVlrIcms;
    property PercIcms: double read FPercIcms write FPercIcms;
    property VlrBaseIcms: double read FVlrBaseIcms write FVlrBaseIcms;
    property Carga: String read FCarga write FCarga;
    property Propred: String read FPropred write FPropred;
    property SegRespseg: String read FSegRespseg write FSegRespseg;
    property SegXseg: String read FSegXseg write FSegXseg;
    property SegNapol: String read FSegNapol write FSegNapol;
    property SegVcarga: String read FSegVcarga write FSegVcarga;
    property Tpmodal: String read FTpmodal write FTpmodal;
    property Rntrc: String read FRntrc write FRntrc;
    property Dprev: TDateTime read FDprev write FDprev;
    property Lota: Integer read FLota write FLota;
    property TpAmb: Integer read FTpAmb write FTpAmb;
    property VerAplic: String read FVerAplic write FVerAplic;
    property DtRecbto: TDateTime read FDtRecbto write FDtRecbto;
    property Nprot: String read FNprot write FNprot;
    property DigVal: String read FDigVal write FDigVal;
    property Cstat: Integer read FCstat write FCstat;
    property Xmotivo: String read FXmotivo write FXmotivo;
    property Observacao: String read FObservacao write FObservacao;
    property Versao: String read FVersao write FVersao;
    property Xml: String read FXml write FXml;
    property Emitente: string read FEmitente write FEmitente;
    property Expedidor: string read FExpedidor write FExpedidor;
    property Remetente: string read FRemetente write FRemetente;
  end;

type
  TDtoCteIdeCollection = TObjectList<TDtoCteIde>;

implementation

end.
