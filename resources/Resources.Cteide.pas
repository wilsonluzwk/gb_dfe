unit Resources.cteide;

interface

uses
  System.Classes,
  WK.Server.Attributes,
  System.Generics.Collections,
  WK.Server.ResourceBaseClass;

type

  [Resource('cteide')]
  [Table('cteide')]

  TResourceCteide = class(TResourceBaseClass)
  private

  protected
    procedure ValidateBusiness(List: TObjectList<TObject>); override;
  public
    [FkConstraints('CTEID', 'cteemitente', 'CTEID', LEFT)]
    [FkConstraints('CTEID', 'cteexpedidor', 'CTEID', LEFT)]
    [FkConstraints('CTEID', 'cteremetente', 'CTEID', LEFT)]

    [DBField(' CTEID ', True, True, false, PrimaryKey)]
    CTEID: String;
    [DBField('CHCTE', True, True, True, null)]
    Chcte: String;
    [DBField('CUF', True, True, True, null)]
    Cuf: String;
    [DBField('CCT', True, True, True, null)]
    Cct: String;
    [DBField('CFOP', True, True, True, null)]
    Cfop: String;
    [DBField('NATOP', True, True, True, null)]
    Natop: String;
    [DBField('FORPAG', True, True, True, null)]
    Forpag: Integer;
    [DBField('MOD', True, True, True, null)]
    &Mod: Integer;
    [DBField('SERIE', True, True, True, null)]
    Serie: Integer;
    [DBField('NCT', True, True, True, null)]
    Nct: Integer;
    [DBField('EMIT_CNPJ', True, True, True, null)]
    EmitCnpj: String;
    [DBField('REMET_CNPJ', True, True, True, null)]
    RemetCnpj: String;
    [DBField('EXPED_CNPJ', True, True, True, null)]
    ExpedCnpj: String;
    [DBField('DT_EMIS', True, True, True, null)]
    DtEmis: TDateTime;
    [DBField('TPCTE', True, True, True, null)]
    Tpcte: Integer;
    [DBField('PROCEMI', True, True, True, null)]
    Procemi: Integer;
    [DBField('MODAL', True, True, True, null)]
    Modal: String;
    [DBField('TPSERV', True, True, True, null)]
    Tpserv: Integer;
    [DBField('CMUNINI', True, True, True, null)]
    Cmunini: Integer;
    [DBField('XMUNINI', True, True, True, null)]
    Xmunini: String;
    [DBField('UFINI', True, True, True, null)]
    Ufini: String;
    [DBField('CMUNFIM', True, True, True, null)]
    Cmunfim: Integer;
    [DBField('XMUNFIM', True, True, True, null)]
    Xmunfim: String;
    [DBField('UFFIM', True, True, True, null)]
    Uffim: String;
    [DBField('RETIRA', True, True, True, null)]
    Retira: String;
    [DBField('TOMA', True, True, True, null)]
    Toma: Integer;
    [DBField('NR_AUTORIZADOR', True, True, True, null)]
    NrAutorizador: String;
    [DBField('VTPREST', True, True, True, null)]
    Vtprest: double;
    [DBField('VREC', True, True, True, null)]
    Vrec: double;
    [DBField('ICMS_CST', True, True, True, null)]
    IcmsCst: String;
    [DBField('VLR_ICMS', True, True, True, null)]
    VlrIcms: double;
    [DBField('PERC_ICMS', True, True, True, null)]
    PercIcms: double;
    [DBField('VLR_BASE_ICMS', True, True, True, null)]
    VlrBaseIcms: double;
    [DBField('CARGA', True, True, True, null)]
    Carga: String;
    [DBField('PROPRED', True, True, True, null)]
    Propred: String;
    [DBField('SEG_RESPSEG', True, True, True, null)]
    SegRespseg: String;
    [DBField('SEG_XSEG', True, True, True, null)]
    SegXseg: String;
    [DBField('SEG_NAPOL', True, True, True, null)]
    SegNapol: String;
    [DBField('SEG_VCARGA', True, True, True, null)]
    SegVcarga: String;
    [DBField('TPMODAL', True, True, True, null)]
    Tpmodal: String;
    [DBField('RNTRC', True, True, True, null)]
    Rntrc: String;
    [DBField('DPREV', True, True, True, null)]
    Dprev: TDateTime;
    [DBField('LOTA', True, True, True, null)]
    Lota: Integer;
    [DBField('TP_AMB', True, True, True, null)]
    TpAmb: Integer;
    [DBField('VER_APLIC', True, True, True, null)]
    VerAplic: String;
    [DBField('DT_RECBTO', True, True, True, null)]
    DtRecbto: TDateTime;
    [DBField('NPROT', True, True, True, null)]
    Nprot: String;
    [DBField('DIG_VAL', True, True, True, null)]
    DigVal: String;
    [DBField('CSTAT', True, True, True, null)]
    Cstat: Integer;
    [DBField('XMOTIVO', True, True, True, null)]
    Xmotivo: String;
    [DBField('OBSERVACAO', True, True, True, null)]
    Observacao: String;
    [DBField('VERSAO', True, True, True, null)]
    Versao: String;
    [DBField('XML', True, true, True, null)]
    Xml: String;
    [DBField('XNOME', True, True, false, null, false, 'cteemitente')]
    Emitente: String;
    [DBField('XNOME', True, True, false, null, false, 'cteexpedidor')]
    Expedidor: String;
    [DBField('XNOME', True, true, false, null, false, 'cteremetente')]
    Remetente: String;

  end;

implementation

{ TCteide }
procedure TResourceCteide.ValidateBusiness(List: TObjectList<TObject>);
begin
end;

initialization

RegisterClass(TResourceCteide);

end.
