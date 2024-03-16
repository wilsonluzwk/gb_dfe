unit dfe.dto.notaJson;

interface

uses
  WK.Json.dto, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TAdi = class;
  TArma = class;
  TCIDE = class;
  TCOFINS = class;
  TCOFINSST = class;
  TComb = class;
  TDeduc = class;
  TDetExport = class;
  TDI = class;
  TDup = class;
  TEncerrante = class;
  TEnderDest = class;
  TEnderEmit = class;
  TFat = class;
  TFordia = class;
  TICMS = class;
  TICMSCons = class;
  TICMSInter = class;
  TICMSTot = class;
  TICMSUFDest = class;
  TII = class;
  TImposto = class;
  TIPI = class;
  TISSQN = class;
  TISSQNtot = class;
  TItensAdi = class;
  TItensArma = class;
  TItensAutXML = class;
  TItensDeduc = class;
  TItensDet = class;
  TItensDetExport = class;
  TItensDI = class;
  TItensDup = class;
  TItensFordia = class;
  TItensLacres = class;
  TItensMed = class;
  TItensNFref = class;
  TItensNVE = class;
  TItensObsCont = class;
  TItensObsFisco = class;
  TItensOrigComb = class;
  TItensPag = class;
  TItensProcRef = class;
  TItensRastro = class;
  TItensReboque = class;
  TItensVol = class;
  TLacres = class;
  TMed = class;
  TNFref = class;
  TNVE = class;
  TObsCont = class;
  TObsFisco = class;
  TOrigComb = class;
  TPIS = class;
  TPISST = class;
  TProcRef = class;
  TProd = class;
  TRastro = class;
  TReboque = class;
  TRefECF = class;
  TRefNF = class;
  TRefNFP = class;
  TRetTransp = class;
  TRetTrib = class;
  TTransporta = class;
  TVeicProd = class;
  TVeicTransp = class;
  TVol = class;

  TInfRespTec = class
  private
    FCNPJ: string;
    FEmail: string;
    FFone: string;
    FHashCSRT: string;
    FIdCSRT: Integer;
    FXContato: string;
  published
    property CNPJ: string read FCNPJ write FCNPJ;
    property Email: string read FEmail write FEmail;
    property Fone: string read FFone write FFone;
    property HashCSRT: string read FHashCSRT write FHashCSRT;
    property IdCSRT: Integer read FIdCSRT write FIdCSRT;
    property XContato: string read FXContato write FXContato;
  end;

  TInfNFeSupl = class
  private
    FQrCode: string;
    FUrlChave: string;
  published
    property QrCode: string read FQrCode write FQrCode;
    property UrlChave: string read FUrlChave write FUrlChave;
  end;

  TItensAutXML = class
  private
    FCNPJCPF: string;
  published
    property CNPJCPF: string read FCNPJCPF write FCNPJCPF;
  end;

  TAutXML = class(TJsonDTO)
  private
    [JSONName('itensAutXML'), JSONMarshalled(False)]
    FItensAutXMLArray: TArray<TItensAutXML>;
    [GenericListReflect]
    FItensAutXML: TObjectList<TItensAutXML>;
    function GetItensAutXML: TObjectList<TItensAutXML>;
  protected
    function GetAsJson: string; override;
  published
    property ItensAutXML: TObjectList<TItensAutXML> read GetItensAutXML;
  public
    destructor Destroy; override;
  end;

  TItensDeduc = class
  private
    FVDed: Integer;
    FXDed: string;
  published
    property VDed: Integer read FVDed write FVDed;
    property XDed: string read FXDed write FXDed;
  end;

  TDeduc = class(TJsonDTO)
  private
    [JSONName('itensDeduc'), JSONMarshalled(False)]
    FItensDeducArray: TArray<TItensDeduc>;
    [GenericListReflect]
    FItensDeduc: TObjectList<TItensDeduc>;
    function GetItensDeduc: TObjectList<TItensDeduc>;
  protected
    function GetAsJson: string; override;
  published
    property ItensDeduc: TObjectList<TItensDeduc> read GetItensDeduc;
  public
    destructor Destroy; override;
  end;

  TItensFordia = class
  private
    FDia: Integer;
    FQtde: Integer;
  published
    property Dia: Integer read FDia write FDia;
    property Qtde: Integer read FQtde write FQtde;
  end;

  TFordia = class(TJsonDTO)
  private
    [JSONName('itensFordia'), JSONMarshalled(False)]
    FItensFordiaArray: TArray<TItensFordia>;
    [GenericListReflect]
    FItensFordia: TObjectList<TItensFordia>;
    function GetItensFordia: TObjectList<TItensFordia>;
  protected
    function GetAsJson: string; override;
  published
    property ItensFordia: TObjectList<TItensFordia> read GetItensFordia;
  public
    destructor Destroy; override;
  end;

  TCana = class
  private
    FDeduc: TDeduc;
    FFordia: TFordia;
    FQTotAnt: Integer;
    FQTotGer: Integer;
    FQTotMes: Integer;
    FRef: string;
    FSafra: string;
    FVFor: Integer;
    FVLiqFor: Integer;
    FVTotDed: Integer;
  published
    property Deduc: TDeduc read FDeduc;
    property Fordia: TFordia read FFordia;
    property QTotAnt: Integer read FQTotAnt write FQTotAnt;
    property QTotGer: Integer read FQTotGer write FQTotGer;
    property QTotMes: Integer read FQTotMes write FQTotMes;
    property Ref: string read FRef write FRef;
    property Safra: string read FSafra write FSafra;
    property VFor: Integer read FVFor write FVFor;
    property VLiqFor: Integer read FVLiqFor write FVLiqFor;
    property VTotDed: Integer read FVTotDed write FVTotDed;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TCompra = class
  private
    FXCont: string;
    FXNEmp: string;
    FXPed: string;
  published
    property XCont: string read FXCont write FXCont;
    property XNEmp: string read FXNEmp write FXNEmp;
    property XPed: string read FXPed write FXPed;
  end;

  TExporta = class
  private
    FUFSaidaPais: string;
    FUFembarq: string;
    FXLocDespacho: string;
    FXLocEmbarq: string;
    FXLocExporta: string;
  published
    property UFSaidaPais: string read FUFSaidaPais write FUFSaidaPais;
    property UFembarq: string read FUFembarq write FUFembarq;
    property XLocDespacho: string read FXLocDespacho write FXLocDespacho;
    property XLocEmbarq: string read FXLocEmbarq write FXLocEmbarq;
    property XLocExporta: string read FXLocExporta write FXLocExporta;
  end;

  TItensProcRef = class
  private
    FIndProc: string;
    FNProc: string;
    FTpAto: string;
  published
    property IndProc: string read FIndProc write FIndProc;
    property NProc: string read FNProc write FNProc;
    property TpAto: string read FTpAto write FTpAto;
  end;

  TProcRef = class(TJsonDTO)
  private
    [JSONName('itensProcRef'), JSONMarshalled(False)]
    FItensProcRefArray: TArray<TItensProcRef>;
    [GenericListReflect]
    FItensProcRef: TObjectList<TItensProcRef>;
    function GetItensProcRef: TObjectList<TItensProcRef>;
  protected
    function GetAsJson: string; override;
  published
    property ItensProcRef: TObjectList<TItensProcRef> read GetItensProcRef;
  public
    destructor Destroy; override;
  end;

  TItensObsFisco = class
  private
    FXCampo: string;
    FXTexto: string;
  published
    property XCampo: string read FXCampo write FXCampo;
    property XTexto: string read FXTexto write FXTexto;
  end;

  TObsFisco = class(TJsonDTO)
  private
    [JSONName('itensObsFisco'), JSONMarshalled(False)]
    FItensObsFiscoArray: TArray<TItensObsFisco>;
    [GenericListReflect]
    FItensObsFisco: TObjectList<TItensObsFisco>;
    FXCampo: string;
    FXTexto: string;
    function GetItensObsFisco: TObjectList<TItensObsFisco>;
  protected
    function GetAsJson: string; override;
  published
    property ItensObsFisco: TObjectList<TItensObsFisco> read GetItensObsFisco;
    property XCampo: string read FXCampo write FXCampo;
    property XTexto: string read FXTexto write FXTexto;
  public
    destructor Destroy; override;
  end;

  TItensObsCont = class
  private
    FXCampo: string;
    FXTexto: string;
  published
    property XCampo: string read FXCampo write FXCampo;
    property XTexto: string read FXTexto write FXTexto;
  end;

  TObsCont = class(TJsonDTO)
  private
    [JSONName('itensObsCont'), JSONMarshalled(False)]
    FItensObsContArray: TArray<TItensObsCont>;
    [GenericListReflect]
    FItensObsCont: TObjectList<TItensObsCont>;
    FXCampo: string;
    FXTexto: string;
    function GetItensObsCont: TObjectList<TItensObsCont>;
  protected
    function GetAsJson: string; override;
  published
    property ItensObsCont: TObjectList<TItensObsCont> read GetItensObsCont;
    property XCampo: string read FXCampo write FXCampo;
    property XTexto: string read FXTexto write FXTexto;
  public
    destructor Destroy; override;
  end;

  TInfAdic = class
  private
    FInfAdFisco: string;
    FInfCpl: string;
    FObsCont: TObsCont;
    FObsFisco: TObsFisco;
    FProcRef: TProcRef;
  published
    property InfAdFisco: string read FInfAdFisco write FInfAdFisco;
    property InfCpl: string read FInfCpl write FInfCpl;
    property ObsCont: TObsCont read FObsCont;
    property ObsFisco: TObsFisco read FObsFisco;
    property ProcRef: TProcRef read FProcRef;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TInfIntermed = class
  private
    FCNPJ: string;
    FIdCadIntTran: string;
  published
    property CNPJ: string read FCNPJ write FCNPJ;
    property IdCadIntTran: string read FIdCadIntTran write FIdCadIntTran;
  end;

  TItensPag = class
  private
    FCAut: string;
    FCNPJ: string;
    FIndPag: string;
    FTBand: string;
    FTPag: string;
    FTpIntegra: string;
    FVPag: Integer;
    FXPag: string;
  published
    property CAut: string read FCAut write FCAut;
    property CNPJ: string read FCNPJ write FCNPJ;
    property IndPag: string read FIndPag write FIndPag;
    property TBand: string read FTBand write FTBand;
    property TPag: string read FTPag write FTPag;
    property TpIntegra: string read FTpIntegra write FTpIntegra;
    property VPag: Integer read FVPag write FVPag;
    property XPag: string read FXPag write FXPag;
  end;

  TPag = class(TJsonDTO)
  private
    [JSONName('itensPag'), JSONMarshalled(False)]
    FItensPagArray: TArray<TItensPag>;
    [GenericListReflect]
    FItensPag: TObjectList<TItensPag>;
    FVTroco: Integer;
    function GetItensPag: TObjectList<TItensPag>;
  protected
    function GetAsJson: string; override;
  published
    property ItensPag: TObjectList<TItensPag> read GetItensPag;
    property VTroco: Integer read FVTroco write FVTroco;
  public
    destructor Destroy; override;
  end;

  TItensDup = class
  private
    [SuppressZero]
    FDVenc: TDateTime;
    FNDup: string;
    FVDup: Integer;
  published
    property DVenc: TDateTime read FDVenc write FDVenc;
    property NDup: string read FNDup write FNDup;
    property VDup: Integer read FVDup write FVDup;
  end;

  TDup = class(TJsonDTO)
  private
    [JSONName('itensDup'), JSONMarshalled(False)]
    FItensDupArray: TArray<TItensDup>;
    [GenericListReflect]
    FItensDup: TObjectList<TItensDup>;
    function GetItensDup: TObjectList<TItensDup>;
  protected
    function GetAsJson: string; override;
  published
    property ItensDup: TObjectList<TItensDup> read GetItensDup;
  public
    destructor Destroy; override;
  end;

  TFat = class
  private
    FNFat: string;
    FVDesc: Integer;
    FVLiq: Integer;
    FVOrig: Integer;
  published
    property NFat: string read FNFat write FNFat;
    property VDesc: Integer read FVDesc write FVDesc;
    property VLiq: Integer read FVLiq write FVLiq;
    property VOrig: Integer read FVOrig write FVOrig;
  end;

  TCobr = class
  private
    FDup: TDup;
    FFat: TFat;
  published
    property Dup: TDup read FDup;
    property Fat: TFat read FFat;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TItensReboque = class
  private
    FPlaca: string;
    FRNTC: string;
    FUF: string;
  published
    property Placa: string read FPlaca write FPlaca;
    property RNTC: string read FRNTC write FRNTC;
    property UF: string read FUF write FUF;
  end;

  TReboque = class(TJsonDTO)
  private
    [JSONName('itensReboque'), JSONMarshalled(False)]
    FItensReboqueArray: TArray<TItensReboque>;
    [GenericListReflect]
    FItensReboque: TObjectList<TItensReboque>;
    function GetItensReboque: TObjectList<TItensReboque>;
  protected
    function GetAsJson: string; override;
  published
    property ItensReboque: TObjectList<TItensReboque> read GetItensReboque;
  public
    destructor Destroy; override;
  end;

  TItensLacres = class
  private
    FNLacre: string;
  published
    property NLacre: string read FNLacre write FNLacre;
  end;

  TLacres = class(TJsonDTO)
  private
    [JSONName('itensLacres'), JSONMarshalled(False)]
    FItensLacresArray: TArray<TItensLacres>;
    [GenericListReflect]
    FItensLacres: TObjectList<TItensLacres>;
    function GetItensLacres: TObjectList<TItensLacres>;
  protected
    function GetAsJson: string; override;
  published
    property ItensLacres: TObjectList<TItensLacres> read GetItensLacres;
  public
    destructor Destroy; override;
  end;

  TItensVol = class
  private
    FEsp: string;
    FLacres: TLacres;
    FMarca: string;
    FNVol: string;
    FPesoB: Integer;
    FPesoL: Integer;
    FQVol: Integer;
  published
    property Esp: string read FEsp write FEsp;
    property Lacres: TLacres read FLacres;
    property Marca: string read FMarca write FMarca;
    property NVol: string read FNVol write FNVol;
    property PesoB: Integer read FPesoB write FPesoB;
    property PesoL: Integer read FPesoL write FPesoL;
    property QVol: Integer read FQVol write FQVol;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TVol = class(TJsonDTO)
  private
    [JSONName('itensVol'), JSONMarshalled(False)]
    FItensVolArray: TArray<TItensVol>;
    [GenericListReflect]
    FItensVol: TObjectList<TItensVol>;
    function GetItensVol: TObjectList<TItensVol>;
  protected
    function GetAsJson: string; override;
  published
    property ItensVol: TObjectList<TItensVol> read GetItensVol;
  public
    destructor Destroy; override;
  end;

  TVeicTransp = class
  private
    FPlaca: string;
    FRNTC: string;
    FUF: string;
  published
    property Placa: string read FPlaca write FPlaca;
    property RNTC: string read FRNTC write FRNTC;
    property UF: string read FUF write FUF;
  end;

  TRetTransp = class
  private
    FCFOP: string;
    FCMunFG: Integer;
    FPICMSRet: Integer;
    FVBCRet: Integer;
    FVICMSRet: Integer;
    FVServ: Integer;
  published
    property CFOP: string read FCFOP write FCFOP;
    property CMunFG: Integer read FCMunFG write FCMunFG;
    property PICMSRet: Integer read FPICMSRet write FPICMSRet;
    property VBCRet: Integer read FVBCRet write FVBCRet;
    property VICMSRet: Integer read FVICMSRet write FVICMSRet;
    property VServ: Integer read FVServ write FVServ;
  end;

  TTransporta = class
  private
    FCNPJCPF: string;
    FIE: string;
    FUF: string;
    FXEnder: string;
    FXMun: string;
    FXNome: string;
  published
    property CNPJCPF: string read FCNPJCPF write FCNPJCPF;
    property IE: string read FIE write FIE;
    property UF: string read FUF write FUF;
    property XEnder: string read FXEnder write FXEnder;
    property XMun: string read FXMun write FXMun;
    property XNome: string read FXNome write FXNome;
  end;

  TTransp = class
  private
    FBalsa: string;
    FModFrete: string;
    FReboque: TReboque;
    FRetTransp: TRetTransp;
    FTransporta: TTransporta;
    FVagao: string;
    FVeicTransp: TVeicTransp;
    FVol: TVol;
  published
    property Balsa: string read FBalsa write FBalsa;
    property ModFrete: string read FModFrete write FModFrete;
    property Reboque: TReboque read FReboque;
    property RetTransp: TRetTransp read FRetTransp;
    property Transporta: TTransporta read FTransporta;
    property Vagao: string read FVagao write FVagao;
    property VeicTransp: TVeicTransp read FVeicTransp;
    property Vol: TVol read FVol;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TRetTrib = class
  private
    FVBCIRRF: Integer;
    FVBCRetPrev: Integer;
    FVIRRF: Integer;
    FVRetCOFINS: Integer;
    FVRetCSLL: Integer;
    FVRetPIS: Integer;
    FVRetPrev: Integer;
  published
    property VBCIRRF: Integer read FVBCIRRF write FVBCIRRF;
    property VBCRetPrev: Integer read FVBCRetPrev write FVBCRetPrev;
    property VIRRF: Integer read FVIRRF write FVIRRF;
    property VRetCOFINS: Integer read FVRetCOFINS write FVRetCOFINS;
    property VRetCSLL: Integer read FVRetCSLL write FVRetCSLL;
    property VRetPIS: Integer read FVRetPIS write FVRetPIS;
    property VRetPrev: Integer read FVRetPrev write FVRetPrev;
  end;

  TISSQNtot = class
  private
    FCRegTrib: string;
    [SuppressZero]
    FDCompet: TDateTime;
    FVBC: Integer;
    FVCOFINS: Integer;
    FVDeducao: Integer;
    FVDescCond: Integer;
    FVDescIncond: Integer;
    FVISS: Integer;
    FVISSRet: Integer;
    FVOutro: Integer;
    FVPIS: Integer;
    FVServ: Integer;
  published
    property CRegTrib: string read FCRegTrib write FCRegTrib;
    property DCompet: TDateTime read FDCompet write FDCompet;
    property VBC: Integer read FVBC write FVBC;
    property VCOFINS: Integer read FVCOFINS write FVCOFINS;
    property VDeducao: Integer read FVDeducao write FVDeducao;
    property VDescCond: Integer read FVDescCond write FVDescCond;
    property VDescIncond: Integer read FVDescIncond write FVDescIncond;
    property VISS: Integer read FVISS write FVISS;
    property VISSRet: Integer read FVISSRet write FVISSRet;
    property VOutro: Integer read FVOutro write FVOutro;
    property VPIS: Integer read FVPIS write FVPIS;
    property VServ: Integer read FVServ write FVServ;
  end;

  TICMSTot = class
  private
    FQBCMono: Integer;
    FQBCMonoRet: Integer;
    FQBCMonoReten: Integer;
    FVBC: Integer;
    FVBCST: Integer;
    FVCOFINS: Integer;
    FVDesc: Integer;
    FVFCP: Integer;
    FVFCPST: Integer;
    FVFCPSTRet: Integer;
    FVFCPUFDest: Integer;
    FVFrete: Integer;
    FVICMS: Integer;
    FVICMSDeson: Integer;
    FVICMSMono: Integer;
    FVICMSMonoRet: Integer;
    FVICMSMonoReten: Integer;
    FVICMSUFDest: Integer;
    FVICMSUFRemet: Integer;
    FVII: Integer;
    FVIPI: Integer;
    FVIPIDevol: Integer;
    FVNF: Integer;
    FVOutro: Integer;
    FVPIS: Integer;
    FVProd: Integer;
    FVST: Integer;
    FVSeg: Integer;
    FVTotTrib: Integer;
  published
    property QBCMono: Integer read FQBCMono write FQBCMono;
    property QBCMonoRet: Integer read FQBCMonoRet write FQBCMonoRet;
    property QBCMonoReten: Integer read FQBCMonoReten write FQBCMonoReten;
    property VBC: Integer read FVBC write FVBC;
    property VBCST: Integer read FVBCST write FVBCST;
    property VCOFINS: Integer read FVCOFINS write FVCOFINS;
    property VDesc: Integer read FVDesc write FVDesc;
    property VFCP: Integer read FVFCP write FVFCP;
    property VFCPST: Integer read FVFCPST write FVFCPST;
    property VFCPSTRet: Integer read FVFCPSTRet write FVFCPSTRet;
    property VFCPUFDest: Integer read FVFCPUFDest write FVFCPUFDest;
    property VFrete: Integer read FVFrete write FVFrete;
    property VICMS: Integer read FVICMS write FVICMS;
    property VICMSDeson: Integer read FVICMSDeson write FVICMSDeson;
    property VICMSMono: Integer read FVICMSMono write FVICMSMono;
    property VICMSMonoRet: Integer read FVICMSMonoRet write FVICMSMonoRet;
    property VICMSMonoReten: Integer read FVICMSMonoReten write FVICMSMonoReten;
    property VICMSUFDest: Integer read FVICMSUFDest write FVICMSUFDest;
    property VICMSUFRemet: Integer read FVICMSUFRemet write FVICMSUFRemet;
    property VII: Integer read FVII write FVII;
    property VIPI: Integer read FVIPI write FVIPI;
    property VIPIDevol: Integer read FVIPIDevol write FVIPIDevol;
    property VNF: Integer read FVNF write FVNF;
    property VOutro: Integer read FVOutro write FVOutro;
    property VPIS: Integer read FVPIS write FVPIS;
    property VProd: Integer read FVProd write FVProd;
    property VST: Integer read FVST write FVST;
    property VSeg: Integer read FVSeg write FVSeg;
    property VTotTrib: Integer read FVTotTrib write FVTotTrib;
  end;

  TTotal = class
  private
    FICMSTot: TICMSTot;
    FISSQNtot: TISSQNtot;
    FRetTrib: TRetTrib;
  published
    property ICMSTot: TICMSTot read FICMSTot;
    property ISSQNtot: TISSQNtot read FISSQNtot;
    property RetTrib: TRetTrib read FRetTrib;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TICMSUFDest = class
  private
    FPFCPUFDest: Integer;
    FPICMSInter: Integer;
    FPICMSInterPart: Integer;
    FPICMSUFDest: Integer;
    FVBCFCPUFDest: Integer;
    FVBCUFDest: Integer;
    FVFCPUFDest: Integer;
    FVICMSUFDest: Integer;
    FVICMSUFRemet: Integer;
  published
    property PFCPUFDest: Integer read FPFCPUFDest write FPFCPUFDest;
    property PICMSInter: Integer read FPICMSInter write FPICMSInter;
    property PICMSInterPart: Integer read FPICMSInterPart write FPICMSInterPart;
    property PICMSUFDest: Integer read FPICMSUFDest write FPICMSUFDest;
    property VBCFCPUFDest: Integer read FVBCFCPUFDest write FVBCFCPUFDest;
    property VBCUFDest: Integer read FVBCUFDest write FVBCUFDest;
    property VFCPUFDest: Integer read FVFCPUFDest write FVFCPUFDest;
    property VICMSUFDest: Integer read FVICMSUFDest write FVICMSUFDest;
    property VICMSUFRemet: Integer read FVICMSUFRemet write FVICMSUFRemet;
  end;

  TISSQN = class
  private
    FCListServ: string;
    FCMun: Integer;
    FCMunFG: Integer;
    FCPais: Integer;
    FCServico: string;
    FCSitTrib: string;
    FIndISS: string;
    FIndISSRet: string;
    FIndIncentivo: string;
    FNProcesso: string;
    FVAliq: Integer;
    FVBC: Integer;
    FVDeducao: Integer;
    FVDescCond: Integer;
    FVDescIncond: Integer;
    FVISSQN: Integer;
    FVISSRet: Integer;
    FVOutro: Integer;
  published
    property CListServ: string read FCListServ write FCListServ;
    property CMun: Integer read FCMun write FCMun;
    property CMunFG: Integer read FCMunFG write FCMunFG;
    property CPais: Integer read FCPais write FCPais;
    property CServico: string read FCServico write FCServico;
    property CSitTrib: string read FCSitTrib write FCSitTrib;
    property IndISS: string read FIndISS write FIndISS;
    property IndISSRet: string read FIndISSRet write FIndISSRet;
    property IndIncentivo: string read FIndIncentivo write FIndIncentivo;
    property NProcesso: string read FNProcesso write FNProcesso;
    property VAliq: Integer read FVAliq write FVAliq;
    property VBC: Integer read FVBC write FVBC;
    property VDeducao: Integer read FVDeducao write FVDeducao;
    property VDescCond: Integer read FVDescCond write FVDescCond;
    property VDescIncond: Integer read FVDescIncond write FVDescIncond;
    property VISSQN: Integer read FVISSQN write FVISSQN;
    property VISSRet: Integer read FVISSRet write FVISSRet;
    property VOutro: Integer read FVOutro write FVOutro;
  end;

  TCOFINSST = class
  private
    FIndSomaCOFINSST: string;
    FPCOFINS: Integer;
    FQBCProd: Integer;
    FVAliqProd: Integer;
    FVBC: Integer;
    FVCOFINS: Integer;
  published
    property IndSomaCOFINSST: string read FIndSomaCOFINSST
      write FIndSomaCOFINSST;
    property PCOFINS: Integer read FPCOFINS write FPCOFINS;
    property QBCProd: Integer read FQBCProd write FQBCProd;
    property VAliqProd: Integer read FVAliqProd write FVAliqProd;
    property VBC: Integer read FVBC write FVBC;
    property VCOFINS: Integer read FVCOFINS write FVCOFINS;
  end;

  TCOFINS = class
  private
    FCST: string;
    FPCOFINS: Integer;
    FQBCProd: Integer;
    FVAliqProd: Integer;
    FVBC: Integer;
    FVBCProd: Integer;
    FVCOFINS: Integer;
  published
    property CST: string read FCST write FCST;
    property PCOFINS: Integer read FPCOFINS write FPCOFINS;
    property QBCProd: Integer read FQBCProd write FQBCProd;
    property VAliqProd: Integer read FVAliqProd write FVAliqProd;
    property VBC: Integer read FVBC write FVBC;
    property VBCProd: Integer read FVBCProd write FVBCProd;
    property VCOFINS: Integer read FVCOFINS write FVCOFINS;
  end;

  TPISST = class
  private
    FIndSomaPISST: string;
    FPPis: Integer;
    FQBCProd: Integer;
    FVAliqProd: Integer;
    FVBC: Integer;
    FVPIS: Integer;
  published
    property IndSomaPISST: string read FIndSomaPISST write FIndSomaPISST;
    property PPis: Integer read FPPis write FPPis;
    property QBCProd: Integer read FQBCProd write FQBCProd;
    property VAliqProd: Integer read FVAliqProd write FVAliqProd;
    property VBC: Integer read FVBC write FVBC;
    property VPIS: Integer read FVPIS write FVPIS;
  end;

  TPIS = class
  private
    FCST: string;
    FPPis: Integer;
    FQBCProd: Integer;
    FVAliqProd: Integer;
    FVBC: Integer;
    FVPIS: Integer;
  published
    property CST: string read FCST write FCST;
    property PPis: Integer read FPPis write FPPis;
    property QBCProd: Integer read FQBCProd write FQBCProd;
    property VAliqProd: Integer read FVAliqProd write FVAliqProd;
    property VBC: Integer read FVBC write FVBC;
    property VPIS: Integer read FVPIS write FVPIS;
  end;

  TII = class
  private
    FVBC: Integer;
    FVDespAdu: Integer;
    FVII: Integer;
    FVIOF: Integer;
  published
    property VBC: Integer read FVBC write FVBC;
    property VDespAdu: Integer read FVDespAdu write FVDespAdu;
    property VII: Integer read FVII write FVII;
    property VIOF: Integer read FVIOF write FVIOF;
  end;

  TIPI = class
  private
    FCEnq: string;
    FCNPJProd: string;
    FCST: string;
    FCSelo: string;
    FClEnq: string;
    FPIPI: Integer;
    FQSelo: Integer;
    FQUnId: Integer;
    FVBC: Integer;
    FVIPI: Integer;
    FVUnId: Integer;
  published
    property CEnq: string read FCEnq write FCEnq;
    property CNPJProd: string read FCNPJProd write FCNPJProd;
    property CST: string read FCST write FCST;
    property CSelo: string read FCSelo write FCSelo;
    property ClEnq: string read FClEnq write FClEnq;
    property PIPI: Integer read FPIPI write FPIPI;
    property QSelo: Integer read FQSelo write FQSelo;
    property QUnId: Integer read FQUnId write FQUnId;
    property VBC: Integer read FVBC write FVBC;
    property VIPI: Integer read FVIPI write FVIPI;
    property VUnId: Integer read FVUnId write FVUnId;
  end;

  TICMS = class
  private
    FAdRemICMS: Integer;
    FAdRemICMSRet: Integer;
    FAdRemICMSReten: Integer;
    FCSOSN: string;
    FCST: string;
    FModBC: string;
    FModBCST: string;
    FMotDesICMS: string;
    FMotDesICMSST: string;
    FMotRedAdRem: string;
    FOrig: string;
    FPBCOp: Integer;
    FPCredSN: Integer;
    FPDif: Integer;
    FPFCP: Integer;
    FPFCPDif: Integer;
    FPFCPST: Integer;
    FPFCPSTRet: Integer;
    FPICMS: Integer;
    FPICMSEfet: Integer;
    FPICMSST: Integer;
    FPMVAST: Integer;
    FPRedAdRem: Integer;
    FPRedBC: Integer;
    FPRedBCEfet: Integer;
    FPRedBCST: Integer;
    FPST: Integer;
    FQBCMono: Integer;
    FQBCMonoRet: Integer;
    FQBCMonoReten: Integer;
    FUFST: string;
    FVBC: Integer;
    FVBCEfet: Integer;
    FVBCFCP: Integer;
    FVBCFCPST: Integer;
    FVBCFCPSTRet: Integer;
    FVBCICMS: Integer;
    FVBCICMSST: Integer;
    FVBCST: Integer;
    FVBCSTDest: Integer;
    FVBCSTRet: Integer;
    FVCredICMSSN: Integer;
    FVFCP: Integer;
    FVFCPDif: Integer;
    FVFCPEfet: Integer;
    FVFCPST: Integer;
    FVFCPSTRet: Integer;
    FVICMS: Integer;
    FVICMSDeson: Integer;
    FVICMSDif: Integer;
    FVICMSEfet: Integer;
    FVICMSMono: Integer;
    FVICMSMonoDif: Integer;
    FVICMSMonoOp: Integer;
    FVICMSMonoRet: Integer;
    FVICMSMonoReten: Integer;
    FVICMSOp: Integer;
    FVICMSST: Integer;
    FVICMSSTDeson: Integer;
    FVICMSSTDest: Integer;
    FVICMSSTRet: Integer;
    FVICMSSubstituto: Integer;
  published
    property AdRemICMS: Integer read FAdRemICMS write FAdRemICMS;
    property AdRemICMSRet: Integer read FAdRemICMSRet write FAdRemICMSRet;
    property AdRemICMSReten: Integer read FAdRemICMSReten write FAdRemICMSReten;
    property CSOSN: string read FCSOSN write FCSOSN;
    property CST: string read FCST write FCST;
    property ModBC: string read FModBC write FModBC;
    property ModBCST: string read FModBCST write FModBCST;
    property MotDesICMS: string read FMotDesICMS write FMotDesICMS;
    property MotDesICMSST: string read FMotDesICMSST write FMotDesICMSST;
    property MotRedAdRem: string read FMotRedAdRem write FMotRedAdRem;
    property Orig: string read FOrig write FOrig;
    property PBCOp: Integer read FPBCOp write FPBCOp;
    property PCredSN: Integer read FPCredSN write FPCredSN;
    property PDif: Integer read FPDif write FPDif;
    property PFCP: Integer read FPFCP write FPFCP;
    property PFCPDif: Integer read FPFCPDif write FPFCPDif;
    property PFCPST: Integer read FPFCPST write FPFCPST;
    property PFCPSTRet: Integer read FPFCPSTRet write FPFCPSTRet;
    property PICMS: Integer read FPICMS write FPICMS;
    property PICMSEfet: Integer read FPICMSEfet write FPICMSEfet;
    property PICMSST: Integer read FPICMSST write FPICMSST;
    property PMVAST: Integer read FPMVAST write FPMVAST;
    property PRedAdRem: Integer read FPRedAdRem write FPRedAdRem;
    property PRedBC: Integer read FPRedBC write FPRedBC;
    property PRedBCEfet: Integer read FPRedBCEfet write FPRedBCEfet;
    property PRedBCST: Integer read FPRedBCST write FPRedBCST;
    property PST: Integer read FPST write FPST;
    property QBCMono: Integer read FQBCMono write FQBCMono;
    property QBCMonoRet: Integer read FQBCMonoRet write FQBCMonoRet;
    property QBCMonoReten: Integer read FQBCMonoReten write FQBCMonoReten;
    property UFST: string read FUFST write FUFST;
    property VBC: Integer read FVBC write FVBC;
    property VBCEfet: Integer read FVBCEfet write FVBCEfet;
    property VBCFCP: Integer read FVBCFCP write FVBCFCP;
    property VBCFCPST: Integer read FVBCFCPST write FVBCFCPST;
    property VBCFCPSTRet: Integer read FVBCFCPSTRet write FVBCFCPSTRet;
    property VBCICMS: Integer read FVBCICMS write FVBCICMS;
    property VBCICMSST: Integer read FVBCICMSST write FVBCICMSST;
    property VBCST: Integer read FVBCST write FVBCST;
    property VBCSTDest: Integer read FVBCSTDest write FVBCSTDest;
    property VBCSTRet: Integer read FVBCSTRet write FVBCSTRet;
    property VCredICMSSN: Integer read FVCredICMSSN write FVCredICMSSN;
    property VFCP: Integer read FVFCP write FVFCP;
    property VFCPDif: Integer read FVFCPDif write FVFCPDif;
    property VFCPEfet: Integer read FVFCPEfet write FVFCPEfet;
    property VFCPST: Integer read FVFCPST write FVFCPST;
    property VFCPSTRet: Integer read FVFCPSTRet write FVFCPSTRet;
    property VICMS: Integer read FVICMS write FVICMS;
    property VICMSDeson: Integer read FVICMSDeson write FVICMSDeson;
    property VICMSDif: Integer read FVICMSDif write FVICMSDif;
    property VICMSEfet: Integer read FVICMSEfet write FVICMSEfet;
    property VICMSMono: Integer read FVICMSMono write FVICMSMono;
    property VICMSMonoDif: Integer read FVICMSMonoDif write FVICMSMonoDif;
    property VICMSMonoOp: Integer read FVICMSMonoOp write FVICMSMonoOp;
    property VICMSMonoRet: Integer read FVICMSMonoRet write FVICMSMonoRet;
    property VICMSMonoReten: Integer read FVICMSMonoReten write FVICMSMonoReten;
    property VICMSOp: Integer read FVICMSOp write FVICMSOp;
    property VICMSST: Integer read FVICMSST write FVICMSST;
    property VICMSSTDeson: Integer read FVICMSSTDeson write FVICMSSTDeson;
    property VICMSSTDest: Integer read FVICMSSTDest write FVICMSSTDest;
    property VICMSSTRet: Integer read FVICMSSTRet write FVICMSSTRet;
    property VICMSSubstituto: Integer read FVICMSSubstituto
      write FVICMSSubstituto;
  end;

  TImposto = class
  private
    FCOFINS: TCOFINS;
    FCOFINSST: TCOFINSST;
    FICMS: TICMS;
    FICMSUFDest: TICMSUFDest;
    FII: TII;
    FIPI: TIPI;
    FISSQN: TISSQN;
    FPIS: TPIS;
    FPISST: TPISST;
    FVTotTrib: Integer;
  published
    property COFINS: TCOFINS read FCOFINS;
    property COFINSST: TCOFINSST read FCOFINSST;
    property ICMS: TICMS read FICMS;
    property ICMSUFDest: TICMSUFDest read FICMSUFDest;
    property II: TII read FII;
    property IPI: TIPI read FIPI;
    property ISSQN: TISSQN read FISSQN;
    property PIS: TPIS read FPIS;
    property PISST: TPISST read FPISST;
    property VTotTrib: Integer read FVTotTrib write FVTotTrib;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TItensNVE = class
  private
    FNve: string;
  published
    property Nve: string read FNve write FNve;
  end;

  TNVE = class(TJsonDTO)
  private
    [JSONName('itensNVE'), JSONMarshalled(False)]
    FItensNVEArray: TArray<TItensNVE>;
    [GenericListReflect]
    FItensNVE: TObjectList<TItensNVE>;
    function GetItensNVE: TObjectList<TItensNVE>;
  protected
    function GetAsJson: string; override;
  published
    property ItensNVE: TObjectList<TItensNVE> read GetItensNVE;
  public
    destructor Destroy; override;
  end;

  TItensOrigComb = class
  private
    FCUFOrig: Integer;
    FIndImport: string;
    FPOrig: Integer;
  published
    property CUFOrig: Integer read FCUFOrig write FCUFOrig;
    property IndImport: string read FIndImport write FIndImport;
    property POrig: Integer read FPOrig write FPOrig;
  end;

  TOrigComb = class(TJsonDTO)
  private
    [JSONName('itensOrigComb'), JSONMarshalled(False)]
    FItensOrigCombArray: TArray<TItensOrigComb>;
    [GenericListReflect]
    FItensOrigComb: TObjectList<TItensOrigComb>;
    function GetItensOrigComb: TObjectList<TItensOrigComb>;
  protected
    function GetAsJson: string; override;
  published
    property ItensOrigComb: TObjectList<TItensOrigComb> read GetItensOrigComb;
  public
    destructor Destroy; override;
  end;

  TEncerrante = class
  private
    FNBico: Integer;
    FNBomba: Integer;
    FNTanque: Integer;
    FVEncFin: Integer;
    FVEncIni: Integer;
  published
    property NBico: Integer read FNBico write FNBico;
    property NBomba: Integer read FNBomba write FNBomba;
    property NTanque: Integer read FNTanque write FNTanque;
    property VEncFin: Integer read FVEncFin write FVEncFin;
    property VEncIni: Integer read FVEncIni write FVEncIni;
  end;

  TICMSCons = class
  private
    FUFcons: string;
    FVBCICMSSTCons: Integer;
    FVICMSSTCons: Integer;
  published
    property UFcons: string read FUFcons write FUFcons;
    property VBCICMSSTCons: Integer read FVBCICMSSTCons write FVBCICMSSTCons;
    property VICMSSTCons: Integer read FVICMSSTCons write FVICMSSTCons;
  end;

  TICMSInter = class
  private
    FVBCICMSSTDest: Integer;
    FVICMSSTDest: Integer;
  published
    property VBCICMSSTDest: Integer read FVBCICMSSTDest write FVBCICMSSTDest;
    property VICMSSTDest: Integer read FVICMSSTDest write FVICMSSTDest;
  end;

  TCIDE = class
  private
    FQBCProd: Integer;
    FVAliqProd: Integer;
    FVCIDE: Integer;
  published
    property QBCProd: Integer read FQBCProd write FQBCProd;
    property VAliqProd: Integer read FVAliqProd write FVAliqProd;
    property VCIDE: Integer read FVCIDE write FVCIDE;
  end;

  TComb = class
  private
    FCIDE: TCIDE;
    FCODIF: string;
    FCProdANP: Integer;
    FDescANP: string;
    FEncerrante: TEncerrante;
    FICMS: TICMS;
    FICMSCons: TICMSCons;
    FICMSInter: TICMSInter;
    FOrigComb: TOrigComb;
    FPBio: Integer;
    FPGLP: Integer;
    FPGNi: Integer;
    FPGNn: Integer;
    FPMixGN: Integer;
    FQTemp: Integer;
    FUFcons: string;
    FVPart: Integer;
  published
    property CIDE: TCIDE read FCIDE;
    property CODIF: string read FCODIF write FCODIF;
    property CProdANP: Integer read FCProdANP write FCProdANP;
    property DescANP: string read FDescANP write FDescANP;
    property Encerrante: TEncerrante read FEncerrante;
    property ICMS: TICMS read FICMS;
    property ICMSCons: TICMSCons read FICMSCons;
    property ICMSInter: TICMSInter read FICMSInter;
    property OrigComb: TOrigComb read FOrigComb;
    property PBio: Integer read FPBio write FPBio;
    property PGLP: Integer read FPGLP write FPGLP;
    property PGNi: Integer read FPGNi write FPGNi;
    property PGNn: Integer read FPGNn write FPGNn;
    property PMixGN: Integer read FPMixGN write FPMixGN;
    property QTemp: Integer read FQTemp write FQTemp;
    property UFcons: string read FUFcons write FUFcons;
    property VPart: Integer read FVPart write FVPart;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TItensArma = class
  private
    FDescr: string;
    FNCano: string;
    FNSerie: string;
    FTpArma: string;
  published
    property Descr: string read FDescr write FDescr;
    property NCano: string read FNCano write FNCano;
    property NSerie: string read FNSerie write FNSerie;
    property TpArma: string read FTpArma write FTpArma;
  end;

  TArma = class(TJsonDTO)
  private
    [JSONName('itensArma'), JSONMarshalled(False)]
    FItensArmaArray: TArray<TItensArma>;
    [GenericListReflect]
    FItensArma: TObjectList<TItensArma>;
    function GetItensArma: TObjectList<TItensArma>;
  protected
    function GetAsJson: string; override;
  published
    property ItensArma: TObjectList<TItensArma> read GetItensArma;
  public
    destructor Destroy; override;
  end;

  TItensMed = class
  private
    FCProdANVISA: string;
    [SuppressZero]
    FDFab: TDateTime;
    [SuppressZero]
    FDVal: TDateTime;
    FNLote: string;
    FQLote: Integer;
    FVPMC: Integer;
    FXMotivoIsencao: string;
  published
    property CProdANVISA: string read FCProdANVISA write FCProdANVISA;
    property DFab: TDateTime read FDFab write FDFab;
    property DVal: TDateTime read FDVal write FDVal;
    property NLote: string read FNLote write FNLote;
    property QLote: Integer read FQLote write FQLote;
    property VPMC: Integer read FVPMC write FVPMC;
    property XMotivoIsencao: string read FXMotivoIsencao write FXMotivoIsencao;
  end;

  TMed = class(TJsonDTO)
  private
    [JSONName('itensMed'), JSONMarshalled(False)]
    FItensMedArray: TArray<TItensMed>;
    [GenericListReflect]
    FItensMed: TObjectList<TItensMed>;
    function GetItensMed: TObjectList<TItensMed>;
  protected
    function GetAsJson: string; override;
  published
    property ItensMed: TObjectList<TItensMed> read GetItensMed;
  public
    destructor Destroy; override;
  end;

  TVeicProd = class
  private
    FAnoFab: Integer;
    FAnoMod: Integer;
    FCCor: string;
    FCCorDENATRAN: string;
    FCMT: string;
    FCMod: string;
    FChassi: string;
    FCilin: string;
    FCondVeic: string;
    FDist: string;
    FEspVeic: Integer;
    FLota: Integer;
    FNMotor: string;
    FNSerie: string;
    FPesoB: string;
    FPesoL: string;
    FPot: string;
    FTpComb: string;
    FTpOP: string;
    FTpPint: string;
    FTpRest: Integer;
    FTpVeic: Integer;
    FVIN: string;
    FXCor: string;
  published
    property AnoFab: Integer read FAnoFab write FAnoFab;
    property AnoMod: Integer read FAnoMod write FAnoMod;
    property CCor: string read FCCor write FCCor;
    property CCorDENATRAN: string read FCCorDENATRAN write FCCorDENATRAN;
    property CMT: string read FCMT write FCMT;
    property CMod: string read FCMod write FCMod;
    property Chassi: string read FChassi write FChassi;
    property Cilin: string read FCilin write FCilin;
    property CondVeic: string read FCondVeic write FCondVeic;
    property Dist: string read FDist write FDist;
    property EspVeic: Integer read FEspVeic write FEspVeic;
    property Lota: Integer read FLota write FLota;
    property NMotor: string read FNMotor write FNMotor;
    property NSerie: string read FNSerie write FNSerie;
    property PesoB: string read FPesoB write FPesoB;
    property PesoL: string read FPesoL write FPesoL;
    property Pot: string read FPot write FPot;
    property TpComb: string read FTpComb write FTpComb;
    property TpOP: string read FTpOP write FTpOP;
    property TpPint: string read FTpPint write FTpPint;
    property TpRest: Integer read FTpRest write FTpRest;
    property TpVeic: Integer read FTpVeic write FTpVeic;
    property VIN: string read FVIN write FVIN;
    property XCor: string read FXCor write FXCor;
  end;

  TItensRastro = class
  private
    FCAgreg: string;
    [SuppressZero]
    FDFab: TDateTime;
    [SuppressZero]
    FDVal: TDateTime;
    FNLote: string;
    FQLote: Integer;
  published
    property CAgreg: string read FCAgreg write FCAgreg;
    property DFab: TDateTime read FDFab write FDFab;
    property DVal: TDateTime read FDVal write FDVal;
    property NLote: string read FNLote write FNLote;
    property QLote: Integer read FQLote write FQLote;
  end;

  TRastro = class(TJsonDTO)
  private
    [JSONName('itensRastro'), JSONMarshalled(False)]
    FItensRastroArray: TArray<TItensRastro>;
    [GenericListReflect]
    FItensRastro: TObjectList<TItensRastro>;
    function GetItensRastro: TObjectList<TItensRastro>;
  protected
    function GetAsJson: string; override;
  published
    property ItensRastro: TObjectList<TItensRastro> read GetItensRastro;
  public
    destructor Destroy; override;
  end;

  TItensDetExport = class
  private
    FChNFe: string;
    FNDraw: string;
    FNRE: string;
    FQExport: Integer;
  published
    property ChNFe: string read FChNFe write FChNFe;
    property NDraw: string read FNDraw write FNDraw;
    property NRE: string read FNRE write FNRE;
    property QExport: Integer read FQExport write FQExport;
  end;

  TDetExport = class(TJsonDTO)
  private
    [JSONName('itensDetExport'), JSONMarshalled(False)]
    FItensDetExportArray: TArray<TItensDetExport>;
    [GenericListReflect]
    FItensDetExport: TObjectList<TItensDetExport>;
    function GetItensDetExport: TObjectList<TItensDetExport>;
  protected
    function GetAsJson: string; override;
  published
    property ItensDetExport: TObjectList<TItensDetExport>
      read GetItensDetExport;
  public
    destructor Destroy; override;
  end;

  TItensAdi = class
  private
    FCFabricante: string;
    FNAdicao: Integer;
    FNDraw: string;
    FNSeqAdi: Integer;
    FVDescDI: Integer;
  published
    property CFabricante: string read FCFabricante write FCFabricante;
    property NAdicao: Integer read FNAdicao write FNAdicao;
    property NDraw: string read FNDraw write FNDraw;
    property NSeqAdi: Integer read FNSeqAdi write FNSeqAdi;
    property VDescDI: Integer read FVDescDI write FVDescDI;
  end;

  TAdi = class(TJsonDTO)
  private
    [JSONName('itensAdi'), JSONMarshalled(False)]
    FItensAdiArray: TArray<TItensAdi>;
    [GenericListReflect]
    FItensAdi: TObjectList<TItensAdi>;
    function GetItensAdi: TObjectList<TItensAdi>;
  protected
    function GetAsJson: string; override;
  published
    property ItensAdi: TObjectList<TItensAdi> read GetItensAdi;
  public
    destructor Destroy; override;
  end;

  TItensDI = class
  private
    FAdi: TAdi;
    FCExportador: string;
    FCNPJ: string;
    [SuppressZero]
    FDDesemb: TDateTime;
    [SuppressZero]
    FDDi: TDateTime;
    FNDi: string;
    FTpIntermedio: string;
    FTpViaTransp: string;
    FUFDesemb: string;
    FUFTerceiro: string;
    FVAFRMM: Integer;
    FXLocDesemb: string;
  published
    property Adi: TAdi read FAdi;
    property CExportador: string read FCExportador write FCExportador;
    property CNPJ: string read FCNPJ write FCNPJ;
    property DDesemb: TDateTime read FDDesemb write FDDesemb;
    property DDi: TDateTime read FDDi write FDDi;
    property NDi: string read FNDi write FNDi;
    property TpIntermedio: string read FTpIntermedio write FTpIntermedio;
    property TpViaTransp: string read FTpViaTransp write FTpViaTransp;
    property UFDesemb: string read FUFDesemb write FUFDesemb;
    property UFTerceiro: string read FUFTerceiro write FUFTerceiro;
    property VAFRMM: Integer read FVAFRMM write FVAFRMM;
    property XLocDesemb: string read FXLocDesemb write FXLocDesemb;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TDI = class(TJsonDTO)
  private
    [JSONName('itensDI'), JSONMarshalled(False)]
    FItensDIArray: TArray<TItensDI>;
    [GenericListReflect]
    FItensDI: TObjectList<TItensDI>;
    function GetItensDI: TObjectList<TItensDI>;
  protected
    function GetAsJson: string; override;
  published
    property ItensDI: TObjectList<TItensDI> read GetItensDI;
  public
    destructor Destroy; override;
  end;

  TProd = class
  private
    FArma: TArma;
    FCBarra: string;
    FCBarraTrib: string;
    FCBenef: string;
    FCEAN: string;
    FCEANTrib: string;
    FCEST: string;
    FCFOP: string;
    FCNPJFab: string;
    FCProd: string;
    FComb: TComb;
    FDI: TDI;
    FDetExport: TDetExport;
    FEXTIPI: string;
    FIndEscala: string;
    FIndTot: string;
    FMed: TMed;
    FNCM: string;
    FNFCI: string;
    FNItem: Integer;
    FNItemPed: string;
    FNRECOPI: string;
    FNve: TNVE;
    FQCom: Integer;
    FQTrib: Integer;
    FRastro: TRastro;
    FUCom: string;
    FUTrib: string;
    FVDesc: Integer;
    FVFrete: Integer;
    FVOutro: Integer;
    FVProd: Integer;
    FVSeg: Integer;
    FVUnCom: Integer;
    FVUnTrib: Integer;
    FVeicProd: TVeicProd;
    FXPed: string;
    FXProd: string;
  published
    property Arma: TArma read FArma;
    property CBarra: string read FCBarra write FCBarra;
    property CBarraTrib: string read FCBarraTrib write FCBarraTrib;
    property CBenef: string read FCBenef write FCBenef;
    property CEAN: string read FCEAN write FCEAN;
    property CEANTrib: string read FCEANTrib write FCEANTrib;
    property CEST: string read FCEST write FCEST;
    property CFOP: string read FCFOP write FCFOP;
    property CNPJFab: string read FCNPJFab write FCNPJFab;
    property CProd: string read FCProd write FCProd;
    property Comb: TComb read FComb;
    property DI: TDI read FDI;
    property DetExport: TDetExport read FDetExport;
    property EXTIPI: string read FEXTIPI write FEXTIPI;
    property IndEscala: string read FIndEscala write FIndEscala;
    property IndTot: string read FIndTot write FIndTot;
    property Med: TMed read FMed;
    property NCM: string read FNCM write FNCM;
    property NFCI: string read FNFCI write FNFCI;
    property NItem: Integer read FNItem write FNItem;
    property NItemPed: string read FNItemPed write FNItemPed;
    property NRECOPI: string read FNRECOPI write FNRECOPI;
    property Nve: TNVE read FNve;
    property QCom: Integer read FQCom write FQCom;
    property QTrib: Integer read FQTrib write FQTrib;
    property Rastro: TRastro read FRastro;
    property UCom: string read FUCom write FUCom;
    property UTrib: string read FUTrib write FUTrib;
    property VDesc: Integer read FVDesc write FVDesc;
    property VFrete: Integer read FVFrete write FVFrete;
    property VOutro: Integer read FVOutro write FVOutro;
    property VProd: Integer read FVProd write FVProd;
    property VSeg: Integer read FVSeg write FVSeg;
    property VUnCom: Integer read FVUnCom write FVUnCom;
    property VUnTrib: Integer read FVUnTrib write FVUnTrib;
    property VeicProd: TVeicProd read FVeicProd;
    property XPed: string read FXPed write FXPed;
    property XProd: string read FXProd write FXProd;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TItensDet = class
  private
    FImposto: TImposto;
    FInfAdProd: string;
    FObsCont: TObsCont;
    FObsFisco: TObsFisco;
    FPDevol: Integer;
    FProd: TProd;
    FVIPIDevol: Integer;
  published
    property Imposto: TImposto read FImposto;
    property InfAdProd: string read FInfAdProd write FInfAdProd;
    property ObsCont: TObsCont read FObsCont;
    property ObsFisco: TObsFisco read FObsFisco;
    property PDevol: Integer read FPDevol write FPDevol;
    property Prod: TProd read FProd;
    property VIPIDevol: Integer read FVIPIDevol write FVIPIDevol;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TDet = class(TJsonDTO)
  private
    [JSONName('itensDet'), JSONMarshalled(False)]
    FItensDetArray: TArray<TItensDet>;
    [GenericListReflect]
    FItensDet: TObjectList<TItensDet>;
    function GetItensDet: TObjectList<TItensDet>;
  protected
    function GetAsJson: string; override;
  published
    property ItensDet: TObjectList<TItensDet> read GetItensDet;
  public
    destructor Destroy; override;
  end;

  TEntrega = class
  private
    FCEP: Integer;
    FCMun: Integer;
    FCNPJCPF: string;
    FCPais: Integer;
    FEmail: string;
    FFone: string;
    FIE: string;
    FNro: string;
    FUF: string;
    FXBairro: string;
    FXCpl: string;
    FXLgr: string;
    FXMun: string;
    FXNome: string;
    FXPais: string;
  published
    property CEP: Integer read FCEP write FCEP;
    property CMun: Integer read FCMun write FCMun;
    property CNPJCPF: string read FCNPJCPF write FCNPJCPF;
    property CPais: Integer read FCPais write FCPais;
    property Email: string read FEmail write FEmail;
    property Fone: string read FFone write FFone;
    property IE: string read FIE write FIE;
    property Nro: string read FNro write FNro;
    property UF: string read FUF write FUF;
    property XBairro: string read FXBairro write FXBairro;
    property XCpl: string read FXCpl write FXCpl;
    property XLgr: string read FXLgr write FXLgr;
    property XMun: string read FXMun write FXMun;
    property XNome: string read FXNome write FXNome;
    property XPais: string read FXPais write FXPais;
  end;

  TRetirada = class
  private
    FCEP: Integer;
    FCMun: Integer;
    FCNPJCPF: string;
    FCPais: Integer;
    FEmail: string;
    FFone: string;
    FIE: string;
    FNro: string;
    FUF: string;
    FXBairro: string;
    FXCpl: string;
    FXLgr: string;
    FXMun: string;
    FXNome: string;
    FXPais: string;
  published
    property CEP: Integer read FCEP write FCEP;
    property CMun: Integer read FCMun write FCMun;
    property CNPJCPF: string read FCNPJCPF write FCNPJCPF;
    property CPais: Integer read FCPais write FCPais;
    property Email: string read FEmail write FEmail;
    property Fone: string read FFone write FFone;
    property IE: string read FIE write FIE;
    property Nro: string read FNro write FNro;
    property UF: string read FUF write FUF;
    property XBairro: string read FXBairro write FXBairro;
    property XCpl: string read FXCpl write FXCpl;
    property XLgr: string read FXLgr write FXLgr;
    property XMun: string read FXMun write FXMun;
    property XNome: string read FXNome write FXNome;
    property XPais: string read FXPais write FXPais;
  end;

  TEnderDest = class
  private
    FCEP: Integer;
    FCMun: Integer;
    FCPais: Integer;
    FFone: string;
    FNro: string;
    FUF: string;
    FXBairro: string;
    FXCpl: string;
    FXLgr: string;
    FXMun: string;
    FXPais: string;
  published
    property CEP: Integer read FCEP write FCEP;
    property CMun: Integer read FCMun write FCMun;
    property CPais: Integer read FCPais write FCPais;
    property Fone: string read FFone write FFone;
    property Nro: string read FNro write FNro;
    property UF: string read FUF write FUF;
    property XBairro: string read FXBairro write FXBairro;
    property XCpl: string read FXCpl write FXCpl;
    property XLgr: string read FXLgr write FXLgr;
    property XMun: string read FXMun write FXMun;
    property XPais: string read FXPais write FXPais;
  end;

  TDest = class
  private
    FCNPJCPF: string;
    FEmail: string;
    FEnderDest: TEnderDest;
    FIE: string;
    FIM: string;
    FISUF: string;
    FIdEstrangeiro: string;
    FIndIEDest: string;
    FXNome: string;
  published
    property CNPJCPF: string read FCNPJCPF write FCNPJCPF;
    property Email: string read FEmail write FEmail;
    property EnderDest: TEnderDest read FEnderDest;
    property IE: string read FIE write FIE;
    property IM: string read FIM write FIM;
    property ISUF: string read FISUF write FISUF;
    property IdEstrangeiro: string read FIdEstrangeiro write FIdEstrangeiro;
    property IndIEDest: string read FIndIEDest write FIndIEDest;
    property XNome: string read FXNome write FXNome;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TAvulsa = class
  private
    FCNPJ: string;
    [SuppressZero]
    FDEmi: TDateTime;
    [SuppressZero]
    FDPag: TDateTime;
    FFone: string;
    FMatr: string;
    FNDAR: string;
    FRepEmi: string;
    FUF: string;
    FVDAR: Integer;
    FXAgente: string;
    FXOrgao: string;
  published
    property CNPJ: string read FCNPJ write FCNPJ;
    property DEmi: TDateTime read FDEmi write FDEmi;
    property DPag: TDateTime read FDPag write FDPag;
    property Fone: string read FFone write FFone;
    property Matr: string read FMatr write FMatr;
    property NDAR: string read FNDAR write FNDAR;
    property RepEmi: string read FRepEmi write FRepEmi;
    property UF: string read FUF write FUF;
    property VDAR: Integer read FVDAR write FVDAR;
    property XAgente: string read FXAgente write FXAgente;
    property XOrgao: string read FXOrgao write FXOrgao;
  end;

  TEnderEmit = class
  private
    FCEP: Integer;
    FCMun: Integer;
    FCPais: Integer;
    FFone: string;
    FNro: string;
    FUF: string;
    FXBairro: string;
    FXCpl: string;
    FXLgr: string;
    FXMun: string;
    FXPais: string;
  published
    property CEP: Integer read FCEP write FCEP;
    property CMun: Integer read FCMun write FCMun;
    property CPais: Integer read FCPais write FCPais;
    property Fone: string read FFone write FFone;
    property Nro: string read FNro write FNro;
    property UF: string read FUF write FUF;
    property XBairro: string read FXBairro write FXBairro;
    property XCpl: string read FXCpl write FXCpl;
    property XLgr: string read FXLgr write FXLgr;
    property XMun: string read FXMun write FXMun;
    property XPais: string read FXPais write FXPais;
  end;

  TEmit = class
  private
    FCNAE: string;
    FCNPJCPF: string;
    FCRT: string;
    FEnderEmit: TEnderEmit;
    FIE: string;
    FIEST: string;
    FIM: string;
    FXFant: string;
    FXNome: string;
  published
    property CNAE: string read FCNAE write FCNAE;
    property CNPJCPF: string read FCNPJCPF write FCNPJCPF;
    property CRT: string read FCRT write FCRT;
    property EnderEmit: TEnderEmit read FEnderEmit;
    property IE: string read FIE write FIE;
    property IEST: string read FIEST write FIEST;
    property IM: string read FIM write FIM;
    property XFant: string read FXFant write FXFant;
    property XNome: string read FXNome write FXNome;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TRefNFP = class
  private
    FAAMM: string;
    FCNPJCPF: string;
    FCUF: Integer;
    FIE: string;
    FModelo: string;
    FNNF: Integer;
    FSerie: Integer;
  published
    property AAMM: string read FAAMM write FAAMM;
    property CNPJCPF: string read FCNPJCPF write FCNPJCPF;
    property CUF: Integer read FCUF write FCUF;
    property IE: string read FIE write FIE;
    property Modelo: string read FModelo write FModelo;
    property NNF: Integer read FNNF write FNNF;
    property Serie: Integer read FSerie write FSerie;
  end;

  TRefECF = class
  private
    FModelo: string;
    FNCOO: string;
    FNECF: string;
  published
    property Modelo: string read FModelo write FModelo;
    property NCOO: string read FNCOO write FNCOO;
    property NECF: string read FNECF write FNECF;
  end;

  TRefNF = class
  private
    FAAMM: string;
    FCNPJ: string;
    FCUF: Integer;
    FModelo: Integer;
    FNNF: Integer;
    FSerie: Integer;
  published
    property AAMM: string read FAAMM write FAAMM;
    property CNPJ: string read FCNPJ write FCNPJ;
    property CUF: Integer read FCUF write FCUF;
    property Modelo: Integer read FModelo write FModelo;
    property NNF: Integer read FNNF write FNNF;
    property Serie: Integer read FSerie write FSerie;
  end;

  TItensNFref = class
  private
    FRefCTe: string;
    FRefECF: TRefECF;
    FRefNF: TRefNF;
    FRefNFP: TRefNFP;
    FRefNFe: string;
    FRefNFeSig: string;
  published
    property RefCTe: string read FRefCTe write FRefCTe;
    property RefECF: TRefECF read FRefECF;
    property RefNF: TRefNF read FRefNF;
    property RefNFP: TRefNFP read FRefNFP;
    property RefNFe: string read FRefNFe write FRefNFe;
    property RefNFeSig: string read FRefNFeSig write FRefNFeSig;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TNFref = class(TJsonDTO)
  private
    [JSONName('itensNFref'), JSONMarshalled(False)]
    FItensNFrefArray: TArray<TItensNFref>;
    [GenericListReflect]
    FItensNFref: TObjectList<TItensNFref>;
    function GetItensNFref: TObjectList<TItensNFref>;
  protected
    function GetAsJson: string; override;
  published
    property ItensNFref: TObjectList<TItensNFref> read GetItensNFref;
  public
    destructor Destroy; override;
  end;

  TIde = class
  private
    FCDV: Integer;
    FCMunFG: Integer;
    FCNF: Integer;
    FCUF: Integer;
    [SuppressZero]
    FDEmi: TDateTime;
    [SuppressZero]
    FDSaiEnt: TDateTime;
    [SuppressZero]
    FDhCont: TDateTime;
    FFinNFe: string;
    [SuppressZero]
    FHSaiEnt: TDateTime;
    FIdDest: string;
    FIndFinal: string;
    FIndIntermed: string;
    FIndPag: string;
    FIndPres: string;
    FModelo: Integer;
    FNFref: TNFref;
    FNNF: Integer;
    FNatOp: string;
    FProcEmi: string;
    FSerie: Integer;
    FTpAmb: string;
    FTpEmis: string;
    FTpImp: string;
    FTpNF: string;
    FVerProc: string;
    FXJust: string;
  published
    property CDV: Integer read FCDV write FCDV;
    property CMunFG: Integer read FCMunFG write FCMunFG;
    property CNF: Integer read FCNF write FCNF;
    property CUF: Integer read FCUF write FCUF;
    property DEmi: TDateTime read FDEmi write FDEmi;
    property DSaiEnt: TDateTime read FDSaiEnt write FDSaiEnt;
    property DhCont: TDateTime read FDhCont write FDhCont;
    property FinNFe: string read FFinNFe write FFinNFe;
    property HSaiEnt: TDateTime read FHSaiEnt write FHSaiEnt;
    property IdDest: string read FIdDest write FIdDest;
    property IndFinal: string read FIndFinal write FIndFinal;
    property IndIntermed: string read FIndIntermed write FIndIntermed;
    property IndPag: string read FIndPag write FIndPag;
    property IndPres: string read FIndPres write FIndPres;
    property Modelo: Integer read FModelo write FModelo;
    property NFref: TNFref read FNFref;
    property NNF: Integer read FNNF write FNNF;
    property NatOp: string read FNatOp write FNatOp;
    property ProcEmi: string read FProcEmi write FProcEmi;
    property Serie: Integer read FSerie write FSerie;
    property TpAmb: string read FTpAmb write FTpAmb;
    property TpEmis: string read FTpEmis write FTpEmis;
    property TpImp: string read FTpImp write FTpImp;
    property TpNF: string read FTpNF write FTpNF;
    property VerProc: string read FVerProc write FVerProc;
    property XJust: string read FXJust write FXJust;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TInfNFe = class
  private
    FEmailDestinatario: string;
    FId: string;
    FVersao: Integer;
  published
    property EmailDestinatario: string read FEmailDestinatario
      write FEmailDestinatario;
    property Id: string read FId write FId;
    property Versao: Integer read FVersao write FVersao;
  end;

  TDtoNotaJson = class(TJsonDTO)
  private
    FAutXML: TAutXML;
    FAvulsa: TAvulsa;
    FCana: TCana;
    FCobr: TCobr;
    FCompra: TCompra;
    FDest: TDest;
    FDet: TDet;
    FEmit: TEmit;
    FEntrega: TEntrega;
    FExporta: TExporta;
    FIde: TIde;
    FInfAdic: TInfAdic;
    FInfIntermed: TInfIntermed;
    FInfNFe: TInfNFe;
    FInfNFeSupl: TInfNFeSupl;
    FInfRespTec: TInfRespTec;
    FPag: TPag;
    FRetirada: TRetirada;
    FTotal: TTotal;
    FTransp: TTransp;
  published
    property AutXML: TAutXML read FAutXML;
    property Avulsa: TAvulsa read FAvulsa;
    property Cana: TCana read FCana;
    property Cobr: TCobr read FCobr;
    property Compra: TCompra read FCompra;
    property Dest: TDest read FDest;
    property Det: TDet read FDet;
    property Emit: TEmit read FEmit;
    property Entrega: TEntrega read FEntrega;
    property Exporta: TExporta read FExporta;
    property Ide: TIde read FIde;
    property InfAdic: TInfAdic read FInfAdic;
    property InfIntermed: TInfIntermed read FInfIntermed;
    property InfNFe: TInfNFe read FInfNFe;
    property InfNFeSupl: TInfNFeSupl read FInfNFeSupl;
    property InfRespTec: TInfRespTec read FInfRespTec;
    property Pag: TPag read FPag;
    property Retirada: TRetirada read FRetirada;
    property Total: TTotal read FTotal;
    property Transp: TTransp read FTransp;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TAutXML }

destructor TAutXML.Destroy;
begin
  GetItensAutXML.Free;
  inherited;
end;

function TAutXML.GetItensAutXML: TObjectList<TItensAutXML>;
begin
  Result := ObjectList<TItensAutXML>(FItensAutXML, FItensAutXMLArray);
end;

function TAutXML.GetAsJson: string;
begin
  RefreshArray<TItensAutXML>(FItensAutXML, FItensAutXMLArray);
  Result := inherited;
end;

{ TDeduc }

destructor TDeduc.Destroy;
begin
  GetItensDeduc.Free;
  inherited;
end;

function TDeduc.GetItensDeduc: TObjectList<TItensDeduc>;
begin
  Result := ObjectList<TItensDeduc>(FItensDeduc, FItensDeducArray);
end;

function TDeduc.GetAsJson: string;
begin
  RefreshArray<TItensDeduc>(FItensDeduc, FItensDeducArray);
  Result := inherited;
end;

{ TFordia }

destructor TFordia.Destroy;
begin
  GetItensFordia.Free;
  inherited;
end;

function TFordia.GetItensFordia: TObjectList<TItensFordia>;
begin
  Result := ObjectList<TItensFordia>(FItensFordia, FItensFordiaArray);
end;

function TFordia.GetAsJson: string;
begin
  RefreshArray<TItensFordia>(FItensFordia, FItensFordiaArray);
  Result := inherited;
end;

{ TCana }

constructor TCana.Create;
begin
  inherited;
  FFordia := TFordia.Create;
  FDeduc := TDeduc.Create;
end;

destructor TCana.Destroy;
begin
  FFordia.Free;
  FDeduc.Free;
  inherited;
end;

{ TProcRef }

destructor TProcRef.Destroy;
begin
  GetItensProcRef.Free;
  inherited;
end;

function TProcRef.GetItensProcRef: TObjectList<TItensProcRef>;
begin
  Result := ObjectList<TItensProcRef>(FItensProcRef, FItensProcRefArray);
end;

function TProcRef.GetAsJson: string;
begin
  RefreshArray<TItensProcRef>(FItensProcRef, FItensProcRefArray);
  Result := inherited;
end;

{ TObsFisco }

destructor TObsFisco.Destroy;
begin
  GetItensObsFisco.Free;
  inherited;
end;

function TObsFisco.GetItensObsFisco: TObjectList<TItensObsFisco>;
begin
  Result := ObjectList<TItensObsFisco>(FItensObsFisco, FItensObsFiscoArray);
end;

function TObsFisco.GetAsJson: string;
begin
  RefreshArray<TItensObsFisco>(FItensObsFisco, FItensObsFiscoArray);
  Result := inherited;
end;

{ TObsCont }

destructor TObsCont.Destroy;
begin
  GetItensObsCont.Free;
  inherited;
end;

function TObsCont.GetItensObsCont: TObjectList<TItensObsCont>;
begin
  Result := ObjectList<TItensObsCont>(FItensObsCont, FItensObsContArray);
end;

function TObsCont.GetAsJson: string;
begin
  RefreshArray<TItensObsCont>(FItensObsCont, FItensObsContArray);
  Result := inherited;
end;

{ TInfAdic }

constructor TInfAdic.Create;
begin
  inherited;
  FObsCont := TObsCont.Create;
  FObsFisco := TObsFisco.Create;
  FProcRef := TProcRef.Create;
end;

destructor TInfAdic.Destroy;
begin
  FObsCont.Free;
  FObsFisco.Free;
  FProcRef.Free;
  inherited;
end;

{ TPag }

destructor TPag.Destroy;
begin
  GetItensPag.Free;
  inherited;
end;

function TPag.GetItensPag: TObjectList<TItensPag>;
begin
  Result := ObjectList<TItensPag>(FItensPag, FItensPagArray);
end;

function TPag.GetAsJson: string;
begin
  RefreshArray<TItensPag>(FItensPag, FItensPagArray);
  Result := inherited;
end;

{ TDup }

destructor TDup.Destroy;
begin
  GetItensDup.Free;
  inherited;
end;

function TDup.GetItensDup: TObjectList<TItensDup>;
begin
  Result := ObjectList<TItensDup>(FItensDup, FItensDupArray);
end;

function TDup.GetAsJson: string;
begin
  RefreshArray<TItensDup>(FItensDup, FItensDupArray);
  Result := inherited;
end;

{ TCobr }

constructor TCobr.Create;
begin
  inherited;
  FFat := TFat.Create;
  FDup := TDup.Create;
end;

destructor TCobr.Destroy;
begin
  FFat.Free;
  FDup.Free;
  inherited;
end;

{ TReboque }

destructor TReboque.Destroy;
begin
  GetItensReboque.Free;
  inherited;
end;

function TReboque.GetItensReboque: TObjectList<TItensReboque>;
begin
  Result := ObjectList<TItensReboque>(FItensReboque, FItensReboqueArray);
end;

function TReboque.GetAsJson: string;
begin
  RefreshArray<TItensReboque>(FItensReboque, FItensReboqueArray);
  Result := inherited;
end;

{ TLacres }

destructor TLacres.Destroy;
begin
  GetItensLacres.Free;
  inherited;
end;

function TLacres.GetItensLacres: TObjectList<TItensLacres>;
begin
  Result := ObjectList<TItensLacres>(FItensLacres, FItensLacresArray);
end;

function TLacres.GetAsJson: string;
begin
  RefreshArray<TItensLacres>(FItensLacres, FItensLacresArray);
  Result := inherited;
end;

{ TItensVol }

constructor TItensVol.Create;
begin
  inherited;
  FLacres := TLacres.Create;
end;

destructor TItensVol.Destroy;
begin
  FLacres.Free;
  inherited;
end;

{ TVol }

destructor TVol.Destroy;
begin
  GetItensVol.Free;
  inherited;
end;

function TVol.GetItensVol: TObjectList<TItensVol>;
begin
  Result := ObjectList<TItensVol>(FItensVol, FItensVolArray);
end;

function TVol.GetAsJson: string;
begin
  RefreshArray<TItensVol>(FItensVol, FItensVolArray);
  Result := inherited;
end;

{ TTransp }

constructor TTransp.Create;
begin
  inherited;
  FTransporta := TTransporta.Create;
  FRetTransp := TRetTransp.Create;
  FVeicTransp := TVeicTransp.Create;
  FVol := TVol.Create;
  FReboque := TReboque.Create;
end;

destructor TTransp.Destroy;
begin
  FTransporta.Free;
  FRetTransp.Free;
  FVeicTransp.Free;
  FVol.Free;
  FReboque.Free;
  inherited;
end;

{ TTotal }

constructor TTotal.Create;
begin
  inherited;
  FICMSTot := TICMSTot.Create;
  FISSQNtot := TISSQNtot.Create;
  FRetTrib := TRetTrib.Create;
end;

destructor TTotal.Destroy;
begin
  FICMSTot.Free;
  FISSQNtot.Free;
  FRetTrib.Free;
  inherited;
end;

{ TImposto }

constructor TImposto.Create;
begin
  inherited;
  FICMS := TICMS.Create;
  FIPI := TIPI.Create;
  FII := TII.Create;
  FPIS := TPIS.Create;
  FPISST := TPISST.Create;
  FCOFINS := TCOFINS.Create;
  FCOFINSST := TCOFINSST.Create;
  FISSQN := TISSQN.Create;
  FICMSUFDest := TICMSUFDest.Create;
end;

destructor TImposto.Destroy;
begin
  FICMS.Free;
  FIPI.Free;
  FII.Free;
  FPIS.Free;
  FPISST.Free;
  FCOFINS.Free;
  FCOFINSST.Free;
  FISSQN.Free;
  FICMSUFDest.Free;
  inherited;
end;

{ TNVE }

destructor TNVE.Destroy;
begin
  GetItensNVE.Free;
  inherited;
end;

function TNVE.GetItensNVE: TObjectList<TItensNVE>;
begin
  Result := ObjectList<TItensNVE>(FItensNVE, FItensNVEArray);
end;

function TNVE.GetAsJson: string;
begin
  RefreshArray<TItensNVE>(FItensNVE, FItensNVEArray);
  Result := inherited;
end;

{ TOrigComb }

destructor TOrigComb.Destroy;
begin
  GetItensOrigComb.Free;
  inherited;
end;

function TOrigComb.GetItensOrigComb: TObjectList<TItensOrigComb>;
begin
  Result := ObjectList<TItensOrigComb>(FItensOrigComb, FItensOrigCombArray);
end;

function TOrigComb.GetAsJson: string;
begin
  RefreshArray<TItensOrigComb>(FItensOrigComb, FItensOrigCombArray);
  Result := inherited;
end;

{ TComb }

constructor TComb.Create;
begin
  inherited;
  FCIDE := TCIDE.Create;
  FICMS := TICMS.Create;
  FICMSInter := TICMSInter.Create;
  FICMSCons := TICMSCons.Create;
  FEncerrante := TEncerrante.Create;
  FOrigComb := TOrigComb.Create;
end;

destructor TComb.Destroy;
begin
  FCIDE.Free;
  FICMS.Free;
  FICMSInter.Free;
  FICMSCons.Free;
  FEncerrante.Free;
  FOrigComb.Free;
  inherited;
end;

{ TArma }

destructor TArma.Destroy;
begin
  GetItensArma.Free;
  inherited;
end;

function TArma.GetItensArma: TObjectList<TItensArma>;
begin
  Result := ObjectList<TItensArma>(FItensArma, FItensArmaArray);
end;

function TArma.GetAsJson: string;
begin
  RefreshArray<TItensArma>(FItensArma, FItensArmaArray);
  Result := inherited;
end;

{ TMed }

destructor TMed.Destroy;
begin
  GetItensMed.Free;
  inherited;
end;

function TMed.GetItensMed: TObjectList<TItensMed>;
begin
  Result := ObjectList<TItensMed>(FItensMed, FItensMedArray);
end;

function TMed.GetAsJson: string;
begin
  RefreshArray<TItensMed>(FItensMed, FItensMedArray);
  Result := inherited;
end;

{ TRastro }

destructor TRastro.Destroy;
begin
  GetItensRastro.Free;
  inherited;
end;

function TRastro.GetItensRastro: TObjectList<TItensRastro>;
begin
  Result := ObjectList<TItensRastro>(FItensRastro, FItensRastroArray);
end;

function TRastro.GetAsJson: string;
begin
  RefreshArray<TItensRastro>(FItensRastro, FItensRastroArray);
  Result := inherited;
end;

{ TDetExport }

destructor TDetExport.Destroy;
begin
  GetItensDetExport.Free;
  inherited;
end;

function TDetExport.GetItensDetExport: TObjectList<TItensDetExport>;
begin
  Result := ObjectList<TItensDetExport>(FItensDetExport, FItensDetExportArray);
end;

function TDetExport.GetAsJson: string;
begin
  RefreshArray<TItensDetExport>(FItensDetExport, FItensDetExportArray);
  Result := inherited;
end;

{ TAdi }

destructor TAdi.Destroy;
begin
  GetItensAdi.Free;
  inherited;
end;

function TAdi.GetItensAdi: TObjectList<TItensAdi>;
begin
  Result := ObjectList<TItensAdi>(FItensAdi, FItensAdiArray);
end;

function TAdi.GetAsJson: string;
begin
  RefreshArray<TItensAdi>(FItensAdi, FItensAdiArray);
  Result := inherited;
end;

{ TItensDI }

constructor TItensDI.Create;
begin
  inherited;
  FAdi := TAdi.Create;
end;

destructor TItensDI.Destroy;
begin
  FAdi.Free;
  inherited;
end;

{ TDI }

destructor TDI.Destroy;
begin
  GetItensDI.Free;
  inherited;
end;

function TDI.GetItensDI: TObjectList<TItensDI>;
begin
  Result := ObjectList<TItensDI>(FItensDI, FItensDIArray);
end;

function TDI.GetAsJson: string;
begin
  RefreshArray<TItensDI>(FItensDI, FItensDIArray);
  Result := inherited;
end;

{ TProd }

constructor TProd.Create;
begin
  inherited;
  FDI := TDI.Create;
  FDetExport := TDetExport.Create;
  FRastro := TRastro.Create;
  FVeicProd := TVeicProd.Create;
  FMed := TMed.Create;
  FArma := TArma.Create;
  FComb := TComb.Create;
  FNve := TNVE.Create;
end;

destructor TProd.Destroy;
begin
  FDI.Free;
  FDetExport.Free;
  FRastro.Free;
  FVeicProd.Free;
  FMed.Free;
  FArma.Free;
  FComb.Free;
  FNve.Free;
  inherited;
end;

{ TItensDet }

constructor TItensDet.Create;
begin
  inherited;
  FProd := TProd.Create;
  FImposto := TImposto.Create;
  FObsCont := TObsCont.Create;
  FObsFisco := TObsFisco.Create;
end;

destructor TItensDet.Destroy;
begin
  FProd.Free;
  FImposto.Free;
  FObsCont.Free;
  FObsFisco.Free;
  inherited;
end;

{ TDet }

destructor TDet.Destroy;
begin
  GetItensDet.Free;
  inherited;
end;

function TDet.GetItensDet: TObjectList<TItensDet>;
begin
  Result := ObjectList<TItensDet>(FItensDet, FItensDetArray);
end;

function TDet.GetAsJson: string;
begin
  RefreshArray<TItensDet>(FItensDet, FItensDetArray);
  Result := inherited;
end;

{ TDest }

constructor TDest.Create;
begin
  inherited;
  FEnderDest := TEnderDest.Create;
end;

destructor TDest.Destroy;
begin
  FEnderDest.Free;
  inherited;
end;

{ TEmit }

constructor TEmit.Create;
begin
  inherited;
  FEnderEmit := TEnderEmit.Create;
end;

destructor TEmit.Destroy;
begin
  FEnderEmit.Free;
  inherited;
end;

{ TItensNFref }

constructor TItensNFref.Create;
begin
  inherited;
  FRefNF := TRefNF.Create;
  FRefECF := TRefECF.Create;
  FRefNFP := TRefNFP.Create;
end;

destructor TItensNFref.Destroy;
begin
  FRefNF.Free;
  FRefECF.Free;
  FRefNFP.Free;
  inherited;
end;

{ TNFref }

destructor TNFref.Destroy;
begin
  GetItensNFref.Free;
  inherited;
end;

function TNFref.GetItensNFref: TObjectList<TItensNFref>;
begin
  Result := ObjectList<TItensNFref>(FItensNFref, FItensNFrefArray);
end;

function TNFref.GetAsJson: string;
begin
  RefreshArray<TItensNFref>(FItensNFref, FItensNFrefArray);
  Result := inherited;
end;

{ TIde }

constructor TIde.Create;
begin
  inherited;
  FNFref := TNFref.Create;
end;

destructor TIde.Destroy;
begin
  FNFref.Free;
  inherited;
end;

{ TDtoNotaJson }

constructor TDtoNotaJson.Create;
begin
  inherited;
  FInfNFe := TInfNFe.Create;
  FIde := TIde.Create;
  FEmit := TEmit.Create;
  FAvulsa := TAvulsa.Create;
  FDest := TDest.Create;
  FRetirada := TRetirada.Create;
  FEntrega := TEntrega.Create;
  FDet := TDet.Create;
  FTotal := TTotal.Create;
  FTransp := TTransp.Create;
  FCobr := TCobr.Create;
  FPag := TPag.Create;
  FInfIntermed := TInfIntermed.Create;
  FInfAdic := TInfAdic.Create;
  FExporta := TExporta.Create;
  FCompra := TCompra.Create;
  FCana := TCana.Create;
  FAutXML := TAutXML.Create;
  FInfNFeSupl := TInfNFeSupl.Create;
  FInfRespTec := TInfRespTec.Create;
end;

destructor TDtoNotaJson.Destroy;
begin
  FInfNFe.Free;
  FIde.Free;
  FEmit.Free;
  FAvulsa.Free;
  FDest.Free;
  FRetirada.Free;
  FEntrega.Free;
  FDet.Free;
  FTotal.Free;
  FTransp.Free;
  FCobr.Free;
  FPag.Free;
  FInfIntermed.Free;
  FInfAdic.Free;
  FExporta.Free;
  FCompra.Free;
  FCana.Free;
  FAutXML.Free;
  FInfNFeSupl.Free;
  FInfRespTec.Free;
  inherited;
end;

end.
