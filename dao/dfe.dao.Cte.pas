unit dfe.dao.Cte;

interface

uses
  SysUtils,
  pcnNFe,
  Classes,
  ACBrDFeSSL,
  System.NetEncoding,
  ACBrUtil,
  ACBrNFe,
  pcnConversaoNFe,
  activex,
  pcteConversaoCTe,
  Resources.cteide,
  dfe.lib.util,
  FireDAC.Stan.Param,
  pcnConversao,
  DB,
  SvcMgr,
  Variants,
  dfe.module.databinding.schema.Cte,
  dfe.module.databinding.schema.cte_rodo,
  ACBrBase,
  ACBrDFe,
  ACBrCTe,
  dfe.dao.base,
  System.JSON,
  Rest.JSON,
  dfe.dto.DtoCteIde;

type

  TResolve = TBlobType;

  TMSSQLRetorno = record
    codigo: Integer;
    descricao: string;
    codigoInsert: Integer;
  end;

  TTipoImposto = (icms_ORIG, icms_VBCSTRet, icms_VICMSSTRet, icms_CST, icms_VBC,
    icms_VICMS, icms_PICMS, icms_VBCST, icms_VICMSST, icms_PMVAST, icms_PREDBC,
    icms_PREDBCST, icms_PICMSST, icms_PCREDSN, icms_VCREDICMSSN, icms_CSOSN,
    icms_MODBCST, icms_MODBC);

  TDaoCte = class(TDaoBase)

  private

    Procedure GravaRemetenteCte(octr: Integer; DANFE: TACBrCTe);

    Procedure GravaDestinatarioCte(octr: Integer; DANFE: TACBrCTe);

    Procedure GravaEmitenteCte(octr: Integer; DANFE: TACBrCTe);
    Procedure GravaExpedidorCte(octr: Integer; DANFE: TACBrCTe);

    Procedure GravaRecebedorCte(octr: Integer; DANFE: TACBrCTe);

    Procedure GravaComplementoCte(octr: Integer; DANFE: TACBrCTe);

    Procedure GravaCteInfNFe(octr: Integer; DANFE: TACBrCTe);
    Procedure GravaCteCobranca(octr: Integer; DANFE: TACBrCTe);

  strict private
  public
    function GravaCte(DANFE: TACBrCTe): Boolean;
    function ListarCte(Param: Tjsonobject): TDtoCteIdeCollection;
  end;

var
  TotalNotasProcessadas, TotalNotasRegistradas, TotalProdutosRegistrados: Int64;
function FormatValor(Value: string): Double;
function DateTimeFromIso8601(const Value: string): TDateTime;

const
  RETORNO_NULL = -1;
  RETORNO_OK = 200;
  RETORNO_ERRO = 5000;
  RETORNO_EXCEPTION = 7000;

implementation

uses
  IniFiles,
  Windows,
  Provider,
  XSBuiltIns,
  DBClient, FireDAC.Comp.Client;

function RemoveZerosEsquerda(ANumStr: String): String;
var
  I, L: Integer;
begin
  L := Length(ANumStr);
  I := 1;
  while (I < L) and (ANumStr[I] = '0') do
    Inc(I);

  Result := Copy(ANumStr, I, L);
end;

function ZerosEsquerda(ANumStr: String): Integer;
var
  I, L: Integer;
begin
  L := Length(ANumStr);
  I := 0;
  while (I < L) and (ANumStr[I] = '0') do
    Inc(I);

  Result := I;
end;

procedure RetornoInitialize(var retorno: TMSSQLRetorno);
begin
  retorno.codigo := RETORNO_NULL;
  retorno.descricao := 'NULL';
end;

{ ----------------------------------------------------------------------------- }
function DateTimeFromIso8601(const Value: string): TDateTime;
var
  ax: TXSDateTime;

begin
  ax := TXSDateTime.Create();
  ax.XSToNative(Value); // convert from WideString
  Result := ax.AsDateTime; // convert to TDateTime  finally
  ax.Free();
end;

{ ----------------------------------------------------------------------------- }
function FormataCNPJ(const CNPJ: string): string;
begin
  Result := Copy(CNPJ, 01, 08);
  Result := Result + '/' + Copy(CNPJ, 09, 04);
  Result := Result + '-' + Copy(CNPJ, 13, 02);
end;

{ ----------------------------------------------------------------------------- }
function SoNumeros(const Value: string): string;
var
  I: Integer;
begin
  Result := '';
  if Value = '' then
    Exit;

  for I := 0 to Length(Value) do
    if Value[I] in ['0' .. '9'] then
      Result := Result + Value[I];
end;

{ ----------------------------------------------------------------------------- }
function SoNumeros2(const Value: string): string;
var
  I: Integer;
begin
  Result := '';

  if Value = '' then
    Exit;

  for I := 0 to Length(Value) do
    if Value[I] in ['0' .. '9', ',', '.'] then
      Result := Result + Value[I];
end;

{ ----------------------------------------------------------------------------- }
function FormatValor(Value: string): Double;
var
  sep: char;
  svalue: string;
  formatSettings: TFormatSettings;

begin
  Value := SoNumeros2(Value);
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, formatSettings);
  sep := formatSettings.DecimalSeparator;
  if sep = '' then
    raise exception.Create
      ('SEPARADOR DECIMAL NÃO DEFINIDO OU NÃO VALIDO IMPOSIVEL OPERAR !!!!!');

  Result := 0;
  svalue := '0';
  svalue := Value;
  if svalue = '' then
    svalue := '0';
  if pos('.', svalue) > 0 then
  begin
    svalue := StringReplace(svalue, '.', sep, [rfReplaceAll]);
  end;
  try
    Result := strtofloat(svalue);
  except
    try
      svalue := StringReplace(svalue, '.', ',', [rfReplaceAll]);
      Result := strtofloat(svalue);
    except
      on e: exception do
        raise exception.Create('ERRO FORMATACAO' + Value + ' SEP :[ ' + sep +
          ' ] - ' + e.message);
    end;
  end;
end;

{ ----------------------------------------------------------------------------- }
function Preenchido(XMLNode: WideString): Boolean;
begin
  Result := Length(Trim(XMLNode)) > 0;
end;

{ ----------------------------------------------------------------------------- }

function TDaoCte.GravaCte(DANFE: TACBrCTe): Boolean;
var

  cdForn, XPed: Integer;
  rzForn, tpTransacao, strObservacao: string;
  vRetorno: TMSSQLRetorno;
  I: Integer;
  ochave: string;

  function GetTagValue(axml, atag: string): string;
  var
    apos, Fpos: Integer;
    substring: string;
  begin
    Result := '';
    apos := pos(atag, axml);
    if apos > -1 then
    begin
      substring := Copy(axml, apos + Length(atag), Length(axml));
      substring := Copy(substring, 0, pos('</', substring) - 1);
      Result := substring;

    end;
  end;

begin

  ochave := SoNumeros(DANFE.Conhecimentos[0].Cte.InfCte.Id);
  var
  rcdctr := 0;
  TRY

    Result := false;

    Query.SQL.Clear;
    Query.SQL.add('SELECT *    ');
    Query.SQL.add('FROM INFORMATION_SCHEMA.TABLES  ');
    Query.SQL.add('WHERE TABLE_NAME  = ''cteIde'' ');
    Query.Open;
    I := Query.RecordCount;
    Query.Close;

    if I > 0 then
    begin
      Query.SQL.Clear;
      Query.SQL.add('SELECT  CHCTE    ');
      Query.SQL.add('   FROM cteIde ');
      Query.SQL.add('WHERE ');
      Query.SQL.add('CHCTE   = ' + QuotedStr(ochave));
      Query.Open;
      I := Query.RecordCount;
      if I > 0 then
        raise exception.Create('DANFE CTE JÁ IMPORTADO ->  ' +
          SoNumeros(DANFE.Conhecimentos[0].Cte.InfCte.Id));
      try
        if FdconNFE.InTransaction then
          FdconNFE.Rollback;
      except
      end;
      FdconNFE.StartTransaction;
      Query.SQL.Clear;
      with Query.SQL do
      begin
        add(' DECLARE @TEMP_DANFE TABLE (cteid integer);');
        add('INSERT INTO cteIde ( ');

        add('  CHCTE,                        ');
        add('  CUF,                          ');
        add('  CCT,                          ');
        add('  CFOP,                         ');
        add('  NATOP,                        ');
        add('  FORPAG,                       ');
        add('  MOD,                          ');
        add('  SERIE,                        ');
        add('  NCT,                          ');
        add('  EMIT_CNPJ,                    ');
        add('  REMET_CNPJ,                   ');
        add('  EXPED_CNPJ,                   ');
        add('  DT_EMIS,                      ');
        add('  TPCTE,                        ');
        add('  PROCEMI,                      ');
        add('  MODAL,                        ');
        add('  TPSERV,                       ');
        add('  CMUNINI,                      ');
        add('  XMUNINI,                      ');
        add('  UFINI,                        ');
        add('  CMUNFIM,                      ');
        add('  XMUNFIM,                      ');
        add('  UFFIM,                        ');
        add('  RETIRA,                       ');
        add('  TOMA,                         ');
        add('  NR_AUTORIZADOR,               ');
        add('  VTPREST,                      ');
        add('  VREC,                         ');
        add('  ICMS_CST,                     ');
        add('  VLR_ICMS,                     ');
        add('  PERC_ICMS,                    ');
        add('  VLR_BASE_ICMS,                ');
        add('  CARGA,                        ');
        add('  PROPRED,                      ');
        add('  SEG_RESPSEG,                  ');
        add('  SEG_XSEG,                     ');
        add('  SEG_NAPOL,                    ');
        add('  SEG_VCARGA,                   ');
        add('  TPMODAL,                      ');
        add('  RNTRC,                        ');
        add('  DPREV,                        ');
        add('  LOTA,                         ');
        add('  TP_AMB,                       ');
        add('  VER_APLIC,                    ');
        add('  DT_RECBTO,                    ');
        add('  NPROT,                        ');
        add('  DIG_VAL,                      ');
        add('  CSTAT,                        ');
        add('  XMOTIVO,                      ');
        add('  OBSERVACAO,                   ');
        add('  VERSAO,                       ');
        add('  XML                           ');
        add(') OUTPUT INSERTED.cteid  INTO @TEMP_DANFE');
        add('VALUES                          ');
        add('(                               ');
        add('  :CHCTE,                       ');
        add('  :CUF,                         ');
        add('  :CCT,                         ');
        add('  :CFOP,                        ');
        add('  :NATOP,                       ');
        add('  :FORPAG,                      ');
        add('  :MOD,                         ');
        add('  :SERIE,                       ');
        add('  :NCT,                         ');
        add('  :EMIT_CNPJ,                   ');
        add('  :REMET_CNPJ,                  ');
        add('  :EXPED_CNPJ,                  ');
        add('  :DT_EMIS,                     ');
        add('  :TPCTE,                       ');
        add('  :PROCEMI,                     ');
        add('  :MODAL,                       ');
        add('  :TPSERV,                      ');
        add('  :CMUNINI,                     ');
        add('  :XMUNINI,                     ');
        add('  :UFINI,                       ');
        add('  :CMUNFIM,                     ');
        add('  :XMUNFIM,                     ');
        add('  :UFFIM,                       ');
        add('  :RETIRA,                      ');
        add('  :TOMA,                        ');
        add('  :NR_AUTORIZADOR,              ');
        add('  :VTPREST,                     ');
        add('  :VREC,                        ');
        add('  :ICMS_CST,                    ');
        add('  :VLR_ICMS,                    ');
        add('  :PERC_ICMS,                   ');
        add('  :VLR_BASE_ICMS,               ');
        add('  :CARGA,                       ');
        add('  :PROPRED,                     ');
        add('  :SEG_RESPSEG,                 ');
        add('  :SEG_XSEG,                    ');
        add('  :SEG_NAPOL,                   ');
        add('  :SEG_VCARGA,                  ');
        add('  :TPMODAL,                     ');
        add('  :RNTRC,                       ');
        add('  :DPREV,                       ');
        add('  :LOTA,                        ');
        add('  :TP_AMB,                      ');
        add('  :VER_APLIC,                   ');
        add('  :DT_RECBTO,                   ');
        add('  :NPROT,                       ');
        add('  :DIG_VAL,                     ');
        add('  :CSTAT,                       ');
        add('  :XMOTIVO,                     ');
        add('  :OBSERVACAO,                  ');
        add('  :VERSAO,                      ');
        add('  :XML                          ');
        add(')  ;                            ');
        add(' SELECT  * FROM    @TEMP_DANFE  ');

      end;

      Query.Prepared := false;
      with Query do
      begin

        ParamByName('CHCTE').DataType := ftstring;
        ParamByName('CUF').DataType := ftstring;
        ParamByName('CCT').DataType := ftstring;
        ParamByName('CFOP').DataType := ftstring;
        ParamByName('NATOP').DataType := ftstring;
        ParamByName('FORPAG').DataType := ftInteger;
        ParamByName('MOD').DataType := ftInteger;
        ParamByName('SERIE').DataType := ftInteger;
        ParamByName('NCT').DataType := ftInteger;
        ParamByName('EMIT_CNPJ').DataType := ftstring;
        ParamByName('REMET_CNPJ').DataType := ftstring;
        ParamByName('EXPED_CNPJ').DataType := ftstring;
        ParamByName('DT_EMIS').DataType := ftdatetime;
        ParamByName('TPCTE').DataType := ftInteger;
        ParamByName('PROCEMI').DataType := ftInteger;
        ParamByName('MODAL').DataType := ftstring;
        ParamByName('TPSERV').DataType := ftInteger;
        ParamByName('CMUNINI').DataType := ftInteger;
        ParamByName('XMUNINI').DataType := ftstring;
        ParamByName('UFINI').DataType := ftstring;
        ParamByName('CMUNFIM').DataType := ftInteger;
        ParamByName('XMUNFIM').DataType := ftstring;
        ParamByName('UFFIM').DataType := ftstring;
        ParamByName('RETIRA').DataType := ftstring;
        ParamByName('TOMA').DataType := ftInteger;
        ParamByName('NR_AUTORIZADOR').DataType := ftstring;
        ParamByName('VTPREST').DataType := ftcurrency;
        ParamByName('VREC').DataType := ftFloat;
        ParamByName('ICMS_CST').DataType := ftstring;
        ParamByName('VLR_ICMS').DataType := ftcurrency;
        ParamByName('PERC_ICMS').DataType := ftcurrency;
        ParamByName('VLR_BASE_ICMS').DataType := ftcurrency;
        ParamByName('CARGA').DataType := ftstring;
        ParamByName('PROPRED').DataType := ftstring;
        ParamByName('SEG_RESPSEG').DataType := ftstring;
        ParamByName('SEG_XSEG').DataType := ftstring;
        ParamByName('SEG_NAPOL').DataType := ftstring;
        ParamByName('SEG_VCARGA').DataType := ftstring;
        ParamByName('TPMODAL').DataType := ftstring;
        ParamByName('RNTRC').DataType := ftstring;
        ParamByName('DPREV').DataType := ftdatetime;
        ParamByName('LOTA').DataType := ftInteger;
        ParamByName('TP_AMB').DataType := ftInteger;
        ParamByName('VER_APLIC').DataType := ftstring;
        ParamByName('DT_RECBTO').DataType := ftdatetime;
        ParamByName('NPROT').DataType := ftstring;
        ParamByName('DIG_VAL').DataType := ftstring;
        ParamByName('CSTAT').DataType := ftInteger;
        ParamByName('XMOTIVO').DataType := ftstring;
        ParamByName('OBSERVACAO').DataType := ftstring;
        ParamByName('VERSAO').DataType := ftstring;
        ParamByName('XML').DataType := ftMemo;

      end;

      with Query do
      begin

        Query.ParamByName('CHCTE').Value := ochave;

        ParamByName('CUF').Value := DANFE.Conhecimentos[0].Cte.Ide.CUF;
        ParamByName('CCT').Value := DANFE.Conhecimentos[0].Cte.Ide.CCT;
        ParamByName('CFOP').Value := DANFE.Conhecimentos[0].Cte.Ide.CFOP;
        ParamByName('NATOP').Value := DANFE.Conhecimentos[0].Cte.Ide.natOp;
        ParamByName('FORPAG').Value := DANFE.Conhecimentos[0].Cte.Ide.ForPag;
        ParamByName('MOD').Value := DANFE.Conhecimentos[0].Cte.Ide.modelo;
        ParamByName('SERIE').Value := DANFE.Conhecimentos[0].Cte.Ide.serie;
        ParamByName('NCT').Value := DANFE.Conhecimentos[0].Cte.Ide.NCT;
        ParamByName('EMIT_CNPJ').Value := DANFE.Conhecimentos[0].Cte.Emit.CNPJ;
        ParamByName('REMET_CNPJ').Value := DANFE.Conhecimentos[0]
          .Cte.Rem.CNPJCPF;
        if DANFE.Conhecimentos[0].Cte.Exped.CNPJCPF <> '' then
          ParamByName('EXPED_CNPJ').Value := DANFE.Conhecimentos[0]
            .Cte.Exped.CNPJCPF
        else
          ParamByName('EXPED_CNPJ').Value := '0';

        ParamByName('DT_EMIS').Value := DANFE.Conhecimentos[0]
          .Cte.procCTe.dhRecbto;

        ParamByName('TPCTE').Value := DANFE.Conhecimentos[0].Cte.Ide.TpCTe;
        ParamByName('PROCEMI').Value := DANFE.Conhecimentos[0].Cte.Ide.ProcEmi;
        ParamByName('MODAL').Value := DANFE.Conhecimentos[0].Cte.Ide.Modal;
        ParamByName('TPSERV').Value := DANFE.Conhecimentos[0].Cte.Ide.TpServ;
        ParamByName('CMUNINI').Value := DANFE.Conhecimentos[0].Cte.Ide.CMunIni;
        ParamByName('XMUNINI').Value := DANFE.Conhecimentos[0].Cte.Ide.XMunIni;
        ParamByName('UFINI').Value := DANFE.Conhecimentos[0].Cte.Ide.UFIni;
        ParamByName('CMUNFIM').Value := DANFE.Conhecimentos[0].Cte.Ide.CMunFim;
        ParamByName('XMUNFIM').Value := DANFE.Conhecimentos[0].Cte.Ide.XMunFim;
        ParamByName('UFFIM').Value := DANFE.Conhecimentos[0].Cte.Ide.UFFim;
        ParamByName('RETIRA').Value := DANFE.Conhecimentos[0].Cte.Ide.Retira;

        ParamByName('TOMA').Value :=
          ord(DANFE.Conhecimentos[0].Cte.Ide.Toma03.Toma);

        /// ---------------------IMPOSTOS--------------------------------------------
        ParamByName('NR_AUTORIZADOR').Value :=
          SoNumeros(DANFE.Conhecimentos[0].Cte.procCTe.chCTe);
        ParamByName('VTPREST').Value := DANFE.Conhecimentos[0]
          .Cte.VPrest.VTPrest;
        ParamByName('VREC').Value := DANFE.Conhecimentos[0].Cte.VPrest.VRec;

        if (DANFE.Conhecimentos[0].Cte.Imp.ICMS.ICMS00.VICMS) > 0 then
        begin
          ParamByName('ICMS_CST').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS00.CST;
          ParamByName('VLR_ICMS').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS00.VICMS;
          ParamByName('PERC_ICMS').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS00.PICMS;
          ParamByName('VLR_BASE_ICMS').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS00.VBC;
        end
        else if DANFE.Conhecimentos[0].Cte.Imp.ICMS.ICMS20.VICMS > 0 then
        begin
          ParamByName('ICMS_CST').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS20.CST;
          ParamByName('VLR_ICMS').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS20.VICMS;
          ParamByName('PERC_ICMS').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS20.PICMS;
          ParamByName('VLR_BASE_ICMS').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS20.VBC;
        end

        else if (DANFE.Conhecimentos[0].Cte.Imp.ICMS.ICMS60.CST) <> CstVazio
        then
        begin
          ParamByName('ICMS_CST').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS60.CST;
          ParamByName('VLR_ICMS').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS60.VICMSSTRet;
          ParamByName('PERC_ICMS').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS60.PICMSSTRet;;
          ParamByName('VLR_BASE_ICMS').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS60.VBCSTRet;
        end
        else if (DANFE.Conhecimentos[0].Cte.Imp.ICMS.ICMS90.CST) <> CstVazio
        then
        begin
          ParamByName('ICMS_CST').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS90.CST;
          ParamByName('VLR_ICMS').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS90.VICMS;
          ParamByName('PERC_ICMS').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS90.PICMS;
          ParamByName('VLR_BASE_ICMS').Value := DANFE.Conhecimentos[0]
            .Cte.Imp.ICMS.ICMS90.VBC;
        end;
        // ---------------------IMPOSTOS--------------------------------------------
        // INSERIR OS  DETALHES DA PORA DA CARGA EM
        // cteIde_INFO_QT
        ParamByName('CARGA').Value := DANFE.Conhecimentos[0]
          .Cte.InfCTeNorm.InfCarga.VCarga;
        ParamByName('PROPRED').Value := DANFE.Conhecimentos[0]
          .Cte.InfCTeNorm.InfCarga.ProPred;
        /// --------------------------------------------------------------------
        if DANFE.Conhecimentos[0].Cte.InfCTeNorm.Seg.Count > 0 then
        begin
          ParamByName('SEG_RESPSEG').Value := DANFE.Conhecimentos[0]
            .Cte.InfCTeNorm.Seg[0].RespSeg;
          ParamByName('SEG_XSEG').Value := DANFE.Conhecimentos[0]
            .Cte.InfCTeNorm.Seg[0].XSeg;
          ParamByName('SEG_NAPOL').Value := DANFE.Conhecimentos[0]
            .Cte.InfCTeNorm.Seg[0].NApol;
          ParamByName('SEG_VCARGA').Value := DANFE.Conhecimentos[0]
            .Cte.InfCTeNorm.Seg[0].VCarga;

        end;
        if DANFE.Conhecimentos[0].Cte.InfCTeNorm.rodo.RNTRC <> '' then
          ParamByName('TPMODAL').Value := 'RODO';

        if DANFE.Conhecimentos[0].Cte.InfCTeNorm.aereo.nOCA <> '' then
          ParamByName('TPMODAL').Value := 'AERO';

        if DANFE.Conhecimentos[0].Cte.InfCTeNorm.aquav.VPrest > 0 then
          ParamByName('TPMODAL').Value := 'AQUA';

        try

          ParamByName('RNTRC').Value := DANFE.Conhecimentos[0]
            .Cte.InfCTeNorm.rodo.RNTRC;
          ParamByName('DPREV').Value := DANFE.Conhecimentos[0]
            .Cte.InfCTeNorm.rodo.dPrev;
          if DANFE.Conhecimentos[0].Cte.InfCTeNorm.rodo.lota = ltSim then
            ParamByName('LOTA').Value := 'SIM';
        except

        end;

        ParamByName('TP_AMB').Value :=
          ord(DANFE.Conhecimentos[0].Cte.procCTe.TpAmb);
        ParamByName('VER_APLIC').Value := DANFE.Conhecimentos[0]
          .Cte.procCTe.VerAplic;

        ParamByName('DT_RECBTO').Value := DANFE.Conhecimentos[0]
          .Cte.procCTe.dhRecbto;

        ParamByName('NPROT').Value := DANFE.Conhecimentos[0].Cte.procCTe.nProt;
        ParamByName('DIG_VAL').Value := DANFE.Conhecimentos[0]
          .Cte.procCTe.DigVal;
        ParamByName('CSTAT').Value := DANFE.Conhecimentos[0].Cte.procCTe.cStat;
        ParamByName('XMOTIVO').Value := DANFE.Conhecimentos[0]
          .Cte.procCTe.xMotivo;
        ParamByName('OBSERVACAO').Value := DANFE.Conhecimentos[0]
          .Cte.procCTe.xMsg;
        ParamByName('VERSAO').Value := DANFE.Conhecimentos[0]
          .Cte.procCTe.Versao;
        ParamByName('XML').Value := DANFE.Conhecimentos[0].XML;
      end;
      try
        Query.Open;
        rcdctr := Query.Fields[0].AsInteger;
        Query.Close;
        GravaRemetenteCte(rcdctr, DANFE);
        GravaDestinatarioCte(rcdctr, DANFE);
        GravaEmitenteCte(rcdctr, DANFE);
        GravaExpedidorCte(rcdctr, DANFE);
        GravaRecebedorCte(rcdctr, DANFE);
        GravaComplementoCte(rcdctr, DANFE);
        GravaCteInfNFe(rcdctr, DANFE);
        GravaCteCobranca(rcdctr, DANFE);
        Result := True;
        FdconNFE.Commit;
        GravaLog('[CTE]Importado ' + ochave + ' - ' + ' Com sucesso',
          DANFE.Conhecimentos[0].Cte.dest.CNPJCPF);
      except
        on e: exception do
        begin
          FdconNFE.Rollback;
          GravaLog('[1310 ]CTE NÃO IMPORTADO ' + ochave + ' - ' +
            e.message, '');
        end;
      end;
    end
    else
    begin
      GravaLog('[1310 ]CTE ' + ochave +
        ' NÃO IMPORTANDO TABELA cteIde  NÃO CRIADA', '');
    end;
  Finally
  end;
end;

{ ----------------------------------------------------------------------------- }
procedure TDaoCte.GravaRecebedorCte(octr: Integer; DANFE: TACBrCTe);
var
  Qry: TFDQuery;
begin
  // OK
  try
    Qry := TFDQuery.Create(nil);
    Qry.Connection := FdconNFE;
    Qry.SQL.Clear;
    with Qry do
    begin
      SQL.add('INSERT INTO cteRecebedor');
      SQL.add(' (          ');
      SQL.add('  CTEID,   ');
      SQL.add('  CNPJ_CPF, ');
      SQL.add('  IE,       ');
      SQL.add('  XNOME,    ');
      SQL.add('  XLGR,     ');
      SQL.add('  NRO,      ');
      SQL.add('  XBAIRRO,  ');
      SQL.add('  CMUN,     ');
      SQL.add('  XMUN,     ');
      SQL.add('  CEP,      ');
      SQL.add('  UF,       ');
      SQL.add('  FONE,     ');
      SQL.add('  CPAIS,    ');
      SQL.add('  XPAIS     ');
      SQL.add(' )          ');
      SQL.add('VALUES      ');
      SQL.add('   (        ');
      SQL.add('  :CTEID,  ');
      SQL.add('  :CNPJ_CPF,');
      SQL.add('  :IE,      ');
      SQL.add('  :XNOME,   ');
      SQL.add('  :XLGR,    ');
      SQL.add('  :NRO,     ');
      SQL.add('  :XBAIRRO, ');
      SQL.add('  :CMUN,    ');
      SQL.add('  :XMUN,    ');
      SQL.add('  :CEP,     ');
      SQL.add('  :UF,      ');
      SQL.add('  :FONE,    ');
      SQL.add('  :CPAIS,   ');
      SQL.add('  :XPAIS    ');
      SQL.add(' ) ');
      ParamByName('CTEID').DataType := ftInteger;
      ParamByName('CNPJ_CPF').DataType := ftstring;
      ParamByName('IE').DataType := ftstring;
      ParamByName('XNOME').DataType := ftstring;
      ParamByName('XLGR').DataType := ftstring;
      ParamByName('NRO').DataType := ftInteger;
      ParamByName('XBAIRRO').DataType := ftstring;
      ParamByName('CMUN').DataType := ftInteger;
      ParamByName('XMUN').DataType := ftstring;
      ParamByName('CEP').DataType := ftInteger;
      ParamByName('UF').DataType := ftstring;
      ParamByName('FONE').DataType := ftstring;
      ParamByName('CPAIS').DataType := ftInteger;
      ParamByName('XPAIS').DataType := ftstring;
      ParamByName('CTEID').AsInteger := octr;
      ParamByName('CNPJ_CPF').Asstring := DANFE.Conhecimentos[0]
        .Cte.receb.CNPJCPF;
      ParamByName('IE').Asstring := DANFE.Conhecimentos[0].Cte.receb.IE;
      ParamByName('XNOME').Asstring := DANFE.Conhecimentos[0].Cte.receb.xNome;
      ParamByName('XLGR').Asstring := DANFE.Conhecimentos[0]
        .Cte.receb.enderReceb.xLgr;
      ParamByName('NRO').Asstring := DANFE.Conhecimentos[0]
        .Cte.receb.enderReceb.nro;
      ParamByName('XBAIRRO').Asstring := DANFE.Conhecimentos[0]
        .Cte.receb.enderReceb.xBairro;
      ParamByName('CMUN').AsInteger := DANFE.Conhecimentos[0]
        .Cte.receb.enderReceb.cMun;
      ParamByName('XMUN').Asstring := DANFE.Conhecimentos[0]
        .Cte.receb.enderReceb.xMun;
      ParamByName('CEP').AsInteger := DANFE.Conhecimentos[0]
        .Cte.receb.enderReceb.CEP;
      ParamByName('UF').Asstring := DANFE.Conhecimentos[0]
        .Cte.receb.enderReceb.UF;
      ParamByName('CPAIS').AsInteger := DANFE.Conhecimentos[0]
        .Cte.receb.enderReceb.cPais;
      ParamByName('XPAIS').Asstring := DANFE.Conhecimentos[0]
        .Cte.receb.enderReceb.xPais;
      ParamByName('FONE').Asstring := DANFE.Conhecimentos[0].Cte.receb.fone;
      try
        Qry.ExecSQL;
      except
        on e: exception do
          raise exception.Create
            ('      ->[1457 ]ERRO AO IMPORTAR RECEBEDOR CTE ' + e.message);
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

Procedure TDaoCte.GravaRemetenteCte(octr: Integer; DANFE: TACBrCTe);
var
  Qry: TFDQuery;
begin
  // OK
  try
    Qry := TFDQuery.Create(nil);
    Qry.Connection := FdconNFE;

    with Qry do
    begin
      SQL.add('INSERT INTO cteRemetente');
      SQL.add(' (          ');
      SQL.add('  CTEID,   ');
      SQL.add('  CNPJ_CPF, ');
      SQL.add('  IE,       ');
      SQL.add('  XNOME,    ');
      SQL.add('  XLGR,     ');
      SQL.add('  NRO,      ');
      SQL.add('  XBAIRRO,  ');
      SQL.add('  CMUN,     ');
      SQL.add('  XMUN,     ');
      SQL.add('  CEP,      ');
      SQL.add('  UF,       ');
      SQL.add('  FONE,     ');
      SQL.add('  CPAIS,    ');
      SQL.add('  XPAIS     ');
      SQL.add(' )          ');
      SQL.add('VALUES      ');
      SQL.add('   (        ');
      SQL.add('  :CTEID,  ');
      SQL.add('  :CNPJ_CPF,    ');
      SQL.add('  :IE,      ');
      SQL.add('  :XNOME,   ');
      SQL.add('  :XLGR,    ');
      SQL.add('  :NRO,     ');
      SQL.add('  :XBAIRRO, ');
      SQL.add('  :CMUN,    ');
      SQL.add('  :XMUN,    ');
      SQL.add('  :CEP,     ');
      SQL.add('  :UF,      ');
      SQL.add('  :FONE,    ');
      SQL.add('  :CPAIS,   ');
      SQL.add('  :XPAIS    ');
      SQL.add(' ) ');
      ParamByName('CTEID').DataType := ftInteger;
      ParamByName('CNPJ_CPF').DataType := ftstring;
      ParamByName('IE').DataType := ftstring;
      ParamByName('XNOME').DataType := ftstring;
      ParamByName('XLGR').DataType := ftstring;
      ParamByName('NRO').DataType := ftInteger;
      ParamByName('XBAIRRO').DataType := ftstring;
      ParamByName('CMUN').DataType := ftInteger;
      ParamByName('XMUN').DataType := ftstring;
      ParamByName('CEP').DataType := ftInteger;
      ParamByName('UF').DataType := ftstring;
      ParamByName('FONE').DataType := ftstring;
      ParamByName('CPAIS').DataType := ftInteger;
      ParamByName('XPAIS').DataType := ftstring;
      ParamByName('CTEID').AsInteger := octr;
      ParamByName('CNPJ_CPF').Asstring := DANFE.Conhecimentos[0]
        .Cte.Rem.CNPJCPF;
      ParamByName('IE').Asstring := DANFE.Conhecimentos[0].Cte.Rem.IE;
      ParamByName('XNOME').Asstring := DANFE.Conhecimentos[0].Cte.Rem.xNome;
      ParamByName('XLGR').Asstring := DANFE.Conhecimentos[0]
        .Cte.Rem.enderReme.xLgr;
      ParamByName('NRO').Asstring := DANFE.Conhecimentos[0]
        .Cte.Rem.enderReme.nro;
      ParamByName('XBAIRRO').Asstring := DANFE.Conhecimentos[0]
        .Cte.Rem.enderReme.xBairro;
      ParamByName('CMUN').AsInteger := DANFE.Conhecimentos[0]
        .Cte.Rem.enderReme.cMun;
      ParamByName('XMUN').Asstring := DANFE.Conhecimentos[0]
        .Cte.Rem.enderReme.xMun;
      ParamByName('CEP').AsInteger := DANFE.Conhecimentos[0]
        .Cte.Rem.enderReme.CEP;
      ParamByName('UF').Asstring := DANFE.Conhecimentos[0].Cte.Rem.enderReme.UF;
      ParamByName('CPAIS').AsInteger := DANFE.Conhecimentos[0]
        .Cte.Rem.enderReme.cPais;
      ParamByName('XPAIS').Asstring := DANFE.Conhecimentos[0]
        .Cte.Rem.enderReme.xPais;
      ParamByName('FONE').Asstring := DANFE.Conhecimentos[0].Cte.Rem.fone;
      try
        Qry.ExecSQL;
      except
        on e: exception do
          raise exception.Create
            ('      ->[1457 ]ERRO AO IMPORTAR REMETENTE CTE ' + e.message);
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;

end;

function TDaoCte.ListarCte(Param: Tjsonobject): TDtoCteIdeCollection;
var
  Lresult: string;
  Lresource: TResourceCteide;
  I: Integer;
  LIdeCte: TDtoCteIde;
  LConsulta: string;
begin
  try
    Result := TDtoCteIdeCollection.Create;
    LConsulta := PrepareFilter('protocolo', 'dtEmis', Param);
    Lresource := TResourceCteide.Create();
    try
      Lresource.Get(Nil, 1, 50, '', '', LConsulta, '', '', Nil);
      for I := 0 to Lresource.JsonArrayList.Count - 1 do
      begin
        LIdeCte := Tjson.JsonToObject<TDtoCteIde>
          (Lresource.JsonArrayList[I].ToJSON);

        LIdeCte.XML := TNetEncoding.Base64.Encode(LIdeCte.XML);
        Result.add(LIdeCte);
      end;
    finally
      FreeAndNil(Lresource)
    end;
  except
    on e: exception do
    begin
      GravaLog(self.ClassName + '-' + e.message, '');
    end;
  end;

end;

{ ----------------------------------------------------------------------------- }
Procedure TDaoCte.GravaDestinatarioCte(octr: Integer; DANFE: TACBrCTe);
var
  Qry: TFDQuery;
begin
  // DEST
  Qry := TFDQuery.Create(nil);
  Qry.Connection := FdconNFE;
  Qry.SQL.Clear;
  Try
    with Qry do
    begin
      SQL.add('INSERT INTO cteDestinatario');
      SQL.add(' (          ');
      SQL.add('  CTEID,   ');
      SQL.add('  CNPJ_CPF, ');
      SQL.add('  IE,       ');
      SQL.add('  XNOME,    ');
      SQL.add('  XLGR,     ');
      SQL.add('  NRO,      ');
      SQL.add('  XBAIRRO,  ');
      SQL.add('  CMUN,     ');
      SQL.add('  XMUN,     ');
      SQL.add('  CEP,      ');
      SQL.add('  UF,       ');
      SQL.add('  FONE,     ');
      SQL.add('  CPAIS,    ');
      SQL.add('  XPAIS     ');
      SQL.add(' )          ');
      SQL.add('VALUES      ');
      SQL.add('   (        ');
      SQL.add('  :CTEID,  ');
      SQL.add('  :CNPJ_CPF, ');
      SQL.add('  :IE,      ');
      SQL.add('  :XNOME,   ');
      SQL.add('  :XLGR,    ');
      SQL.add('  :NRO,     ');
      SQL.add('  :XBAIRRO, ');
      SQL.add('  :CMUN,    ');
      SQL.add('  :XMUN,    ');
      SQL.add('  :CEP,     ');
      SQL.add('  :UF,      ');
      SQL.add('  :FONE,    ');
      SQL.add('  :CPAIS,   ');
      SQL.add('  :XPAIS    ');
      SQL.add(' ) ');
      ParamByName('CTEID').DataType := ftInteger;
      ParamByName('CNPJ_CPF').DataType := ftstring;
      ParamByName('IE').DataType := ftstring;
      ParamByName('XNOME').DataType := ftstring;
      ParamByName('XLGR').DataType := ftstring;
      ParamByName('NRO').DataType := ftInteger;
      ParamByName('XBAIRRO').DataType := ftstring;
      ParamByName('CMUN').DataType := ftInteger;
      ParamByName('XMUN').DataType := ftstring;
      ParamByName('CEP').DataType := ftInteger;
      ParamByName('UF').DataType := ftstring;
      ParamByName('FONE').DataType := ftstring;
      ParamByName('CPAIS').DataType := ftInteger;
      ParamByName('XPAIS').DataType := ftstring;
      ParamByName('CTEID').AsInteger := octr;
      ParamByName('CNPJ_CPF').Asstring := DANFE.Conhecimentos[0]
        .Cte.Rem.CNPJCPF;
      ParamByName('IE').Asstring := DANFE.Conhecimentos[0].Cte.dest.IE;
      ParamByName('XNOME').Asstring := DANFE.Conhecimentos[0].Cte.dest.xNome;
      ParamByName('XLGR').Asstring := DANFE.Conhecimentos[0]
        .Cte.dest.enderDest.xLgr;
      ParamByName('NRO').Asstring := DANFE.Conhecimentos[0]
        .Cte.dest.enderDest.nro;
      ParamByName('XBAIRRO').Asstring := DANFE.Conhecimentos[0]
        .Cte.dest.enderDest.xBairro;
      ParamByName('CMUN').AsInteger := DANFE.Conhecimentos[0]
        .Cte.dest.enderDest.cMun;
      ParamByName('XMUN').Asstring := DANFE.Conhecimentos[0]
        .Cte.dest.enderDest.xMun;
      ParamByName('CEP').AsInteger := DANFE.Conhecimentos[0]
        .Cte.dest.enderDest.CEP;
      ParamByName('UF').Asstring := DANFE.Conhecimentos[0]
        .Cte.dest.enderDest.UF;
      ParamByName('CPAIS').AsInteger := DANFE.Conhecimentos[0]
        .Cte.dest.enderDest.cPais;
      ParamByName('XPAIS').Asstring := DANFE.Conhecimentos[0]
        .Cte.dest.enderDest.xPais;
      ParamByName('FONE').Asstring := DANFE.Conhecimentos[0].Cte.dest.fone;
      try
        Qry.ExecSQL;
      except
        on e: exception do
          raise exception.Create
            ('      ->[1457 ]ERRO AO IMPORTAR DESTINATARIO CTE ' + e.message);
      end;
    end;
  Finally
    FreeAndNil(Qry);
  End;
end;

{ ----------------------------------------------------------------------------- }
Procedure TDaoCte.GravaEmitenteCte(octr: Integer; DANFE: TACBrCTe);
var
  Qry: TFDQuery;

begin
  // OK
  Qry := TFDQuery.Create(nil);
  Qry.Connection := FdconNFE;
  Qry.SQL.Clear;
  Try
    with Qry do
    begin
      SQL.add('INSERT INTO cteEmitente');
      SQL.add(' (          ');
      SQL.add('  CTEID,   ');
      SQL.add('  CNPJ, ');
      SQL.add('  IE,       ');
      SQL.add('  XNOME,    ');
      SQL.add('  XLGR,     ');
      SQL.add('  NRO,      ');
      SQL.add('  XBAIRRO,  ');
      SQL.add('  CMUN,     ');
      SQL.add('  XMUN,     ');
      SQL.add('  CEP,      ');
      SQL.add('  UF       ');

      SQL.add(' )          ');
      SQL.add('VALUES      ');
      SQL.add('   (        ');
      SQL.add('  :CTEID,  ');
      SQL.add('  :CNPJ,    ');
      SQL.add('  :IE,      ');
      SQL.add('  :XNOME,   ');
      SQL.add('  :XLGR,    ');
      SQL.add('  :NRO,     ');
      SQL.add('  :XBAIRRO, ');
      SQL.add('  :CMUN,    ');
      SQL.add('  :XMUN,    ');
      SQL.add('  :CEP,     ');
      SQL.add('  :UF      ');

      SQL.add(' ) ');
      ParamByName('CTEID').DataType := ftInteger;
      ParamByName('CNPJ').DataType := ftstring;
      ParamByName('IE').DataType := ftstring;
      ParamByName('XNOME').DataType := ftstring;
      ParamByName('XLGR').DataType := ftstring;
      ParamByName('NRO').DataType := ftInteger;
      ParamByName('XBAIRRO').DataType := ftstring;
      ParamByName('CMUN').DataType := ftInteger;
      ParamByName('XMUN').DataType := ftstring;
      ParamByName('CEP').DataType := ftInteger;
      ParamByName('UF').DataType := ftstring;

      ParamByName('CTEID').AsInteger := octr;
      ParamByName('CNPJ').Asstring := DANFE.Conhecimentos[0].Cte.Emit.CNPJ;
      ParamByName('IE').Asstring := DANFE.Conhecimentos[0].Cte.Emit.IE;
      ParamByName('XNOME').Asstring := DANFE.Conhecimentos[0].Cte.Emit.xNome;
      ParamByName('XLGR').Asstring := DANFE.Conhecimentos[0]
        .Cte.Emit.enderEmit.xLgr;
      ParamByName('NRO').Asstring := DANFE.Conhecimentos[0]
        .Cte.Emit.enderEmit.nro;
      ParamByName('XBAIRRO').Asstring := DANFE.Conhecimentos[0]
        .Cte.Emit.enderEmit.xBairro;
      ParamByName('CMUN').AsInteger := DANFE.Conhecimentos[0]
        .Cte.Emit.enderEmit.cMun;
      ParamByName('XMUN').Asstring := DANFE.Conhecimentos[0]
        .Cte.Emit.enderEmit.xMun;
      ParamByName('CEP').AsInteger := DANFE.Conhecimentos[0]
        .Cte.Emit.enderEmit.CEP;
      ParamByName('UF').Asstring := DANFE.Conhecimentos[0]
        .Cte.Emit.enderEmit.UF;

      try

        Qry.ExecSQL;
      except
        on e: exception do
          raise exception.Create('      ->[1457 ]ERRO AO IMPORTAR EMITENTE CTE '
            + e.message);
      end;
    end;
  Finally
    FreeAndNil(Qry);
  End;
end;

{ ----------------------------------------------------------------------------- }
Procedure TDaoCte.GravaExpedidorCte(octr: Integer; DANFE: TACBrCTe);
var
  Qry: TFDQuery;
begin
  // OK
  Qry := TFDQuery.Create(nil);
  Qry.Connection := FdconNFE;
  Query.SQL.Clear;
  Try
    with Qry do
    begin
      SQL.add('INSERT INTO cteExpedidor');
      SQL.add(' (          ');
      SQL.add('  CTEID ,   ');
      SQL.add('  CNPJ_CPF, ');
      SQL.add('  IE,       ');
      SQL.add('  XNOME,    ');
      SQL.add('  XLGR,     ');
      SQL.add('  NRO,      ');
      SQL.add('  XBAIRRO,  ');
      SQL.add('  CMUN,     ');
      SQL.add('  XMUN,     ');
      SQL.add('  CEP,      ');
      SQL.add('  UF,       ');
      SQL.add('  FONE,     ');
      SQL.add('  CPAIS,    ');
      SQL.add('  XPAIS     ');
      SQL.add(' )          ');
      SQL.add('VALUES      ');
      SQL.add('   (        ');
      SQL.add('  :CTEID,  ');
      SQL.add('  :CNPJ_CPF, ');
      SQL.add('  :IE,      ');
      SQL.add('  :XNOME,   ');
      SQL.add('  :XLGR,    ');
      SQL.add('  :NRO,     ');
      SQL.add('  :XBAIRRO, ');
      SQL.add('  :CMUN,    ');
      SQL.add('  :XMUN,    ');
      SQL.add('  :CEP,     ');
      SQL.add('  :UF,      ');
      SQL.add('  :FONE,    ');
      SQL.add('  :CPAIS,   ');
      SQL.add('  :XPAIS    ');
      SQL.add(' ) ');
      ParamByName('CTEID').DataType := ftInteger;
      ParamByName('CNPJ_CPF').DataType := ftstring;
      ParamByName('IE').DataType := ftstring;
      ParamByName('XNOME').DataType := ftstring;
      ParamByName('XLGR').DataType := ftstring;
      ParamByName('NRO').DataType := ftInteger;
      ParamByName('XBAIRRO').DataType := ftstring;
      ParamByName('CMUN').DataType := ftInteger;
      ParamByName('XMUN').DataType := ftstring;
      ParamByName('CEP').DataType := ftInteger;
      ParamByName('UF').DataType := ftstring;
      ParamByName('FONE').DataType := ftstring;
      ParamByName('CPAIS').DataType := ftInteger;
      ParamByName('XPAIS').DataType := ftstring;
      ParamByName('CTEID').AsInteger := octr;
      ParamByName('CNPJ_CPF').Asstring := DANFE.Conhecimentos[0]
        .Cte.Rem.CNPJCPF;
      ParamByName('IE').Asstring := DANFE.Conhecimentos[0].Cte.Exped.IE;
      ParamByName('XNOME').Asstring := DANFE.Conhecimentos[0].Cte.Exped.xNome;
      ParamByName('XLGR').Asstring := DANFE.Conhecimentos[0]
        .Cte.Exped.EnderExped.xLgr;
      ParamByName('NRO').Asstring := DANFE.Conhecimentos[0]
        .Cte.Exped.EnderExped.nro;
      ParamByName('XBAIRRO').Asstring := DANFE.Conhecimentos[0]
        .Cte.Exped.EnderExped.xBairro;
      ParamByName('CMUN').AsInteger := DANFE.Conhecimentos[0]
        .Cte.Exped.EnderExped.cMun;
      ParamByName('XMUN').Asstring := DANFE.Conhecimentos[0]
        .Cte.Exped.EnderExped.xMun;
      ParamByName('CEP').AsInteger := DANFE.Conhecimentos[0]
        .Cte.Exped.EnderExped.CEP;
      ParamByName('UF').Asstring := DANFE.Conhecimentos[0]
        .Cte.Exped.EnderExped.UF;
      ParamByName('CPAIS').AsInteger := DANFE.Conhecimentos[0]
        .Cte.Exped.EnderExped.cPais;
      ParamByName('XPAIS').Asstring := DANFE.Conhecimentos[0]
        .Cte.Exped.EnderExped.xPais;
      ParamByName('FONE').Asstring := DANFE.Conhecimentos[0].Cte.Exped.fone;
      try
        Qry.ExecSQL;
      except
        on e: exception do
          raise exception.Create
            ('      ->[1457 ]ERRO AO IMPORTAR EXPEDIDOR CTE ' + e.message);
      end;
    end;
  Finally
    FreeAndNil(Qry);
  End;
end;

{ ----------------------------------------------------------------------------- }
Procedure TDaoCte.GravaComplementoCte(octr: Integer; DANFE: TACBrCTe);
var
  Qry: TFDQuery;
  I: Integer;
begin
  try
    Qry := TFDQuery.Create(nil);
    Qry.Connection := FdconNFE;
    Query.SQL.Clear;
    with Qry do
    begin
      SQL.add('INSERT INTO  cteServicoComplementar');
      SQL.add(' (            ');
      SQL.add('  CTEID,     ');
      SQL.add('  XNOME,      ');
      SQL.add('  VCOMP       ');

      SQL.add(' )            ');
      SQL.add('VALUES        ');
      SQL.add('   (          ');
      SQL.add('    :CTEID,   ');
      SQL.add('    :XNOME,    ');
      SQL.add('    :VCOMP     ');
      SQL.add(' ) ');
      ParamByName('CTEID').DataType := ftInteger;
      ParamByName('XNOME').DataType := ftstring;
      ParamByName('VCOMP').DataType := ftcurrency;

    end;
    try
      for I := 0 to DANFE.Conhecimentos[0].Cte.VPrest.Comp.Count - 1 do
      begin
        Qry.ParamByName('CTEID').AsInteger := octr;
        Qry.ParamByName('XNOME').Asstring := DANFE.Conhecimentos[0]
          .Cte.VPrest.Comp[I].xNome;
        Qry.ParamByName('XNOME').AsCurrency := DANFE.Conhecimentos[0]
          .Cte.VPrest.Comp[I].vComp;
        Qry.ExecSQL;
      end;
    except
      on e: exception do
        raise exception.Create
          ('      ->[1457 ]ERRO AO IMPORTAR COMPLEMENTOS DO CTE ' + e.message);
    end;
  finally
    FreeAndNil(Qry);
  end;

end;

{ ----------------------------------------------------------------------------- }
Procedure TDaoCte.GravaCteInfNFe(octr: Integer; DANFE: TACBrCTe);
var
  Qry: TFDQuery;
  I: Integer;
begin
  try
    Qry := TFDQuery.Create(nil);
    Qry.Connection := FdconNFE;
    Query.SQL.Clear;
    with Qry do
    begin
      SQL.add('INSERT INTO  cteInfNFe');
      SQL.add(' (            ');
      SQL.add('  CTEID,      ');
      SQL.add('  CHAVE,      ');
      SQL.add('  PIN,        ');
      SQL.add('  DPREV       ');

      SQL.add(' )            ');
      SQL.add('VALUES        ');
      SQL.add('   (          ');
      SQL.add('    :CTEID,   ');
      SQL.add('    :CHAVE,   ');
      SQL.add('    :PIN,     ');
      SQL.add('    :DPREV    ');

      SQL.add(' ) ');
      ParamByName('CTEID').DataType := ftInteger;
      ParamByName('CHAVE').DataType := ftstring;
      ParamByName('PIN').DataType := ftstring;
      ParamByName('DPREV').DataType := ftdatetime;

    end;
    try
      for I := 0 to DANFE.Conhecimentos[0].Cte.InfCTeNorm.infDoc.infNFe.
        Count - 1 do
      begin
        Qry.ParamByName('CTEID').AsInteger := octr;
        Qry.ParamByName('CHAVE').Asstring := DANFE.Conhecimentos[0]
          .Cte.InfCTeNorm.infDoc.infNFe[I].chave;
        Qry.ParamByName('PIN').Asstring := DANFE.Conhecimentos[0]
          .Cte.InfCTeNorm.infDoc.infNFe[I].PIN;

        Qry.ParamByName('DPREV').AsDateTime := DANFE.Conhecimentos[0]
          .Cte.InfCTeNorm.infDoc.infNFe[I].dPrev;

        Qry.ExecSQL;
      end;
    except
      on e: exception do
        raise exception.Create
          ('      ->[1457 ]ERRO AO IMPORTAR IFORMACOES DE NFE DO CTE ' +
          e.message);
    end;
  finally
    FreeAndNil(Qry);
  end;

end;

{ ----------------------------------------------------------------------------- }
Procedure TDaoCte.GravaCteCobranca(octr: Integer; DANFE: TACBrCTe);
var
  Qry: TFDQuery;
  I: Integer;
begin
  try
    Qry := TFDQuery.Create(nil);
    Qry.Connection := FdconNFE;
    Query.SQL.Clear;
    with Qry do
    begin
      SQL.add('INSERT INTO  cteFura');
      SQL.add(' (            ');
      SQL.add('  CTEID,      ');
      SQL.add('  nFat ,      ');
      SQL.add('  vOrig,      ');
      SQL.add('  vDesc,      ');
      SQL.add('  vLiq,       ');

      SQL.add(' )            ');
      SQL.add('VALUES        ');
      SQL.add('   (          ');
      SQL.add('    :CTEID,   ');
      SQL.add('    :nFat,   ');
      SQL.add('    :vOrig,  ');
      SQL.add('    :vDesc,  ');
      SQL.add('    :vLiq,  ');

      SQL.add(' ) ');
      ParamByName('CTEID').DataType := ftInteger;
      ParamByName('nFat').DataType := ftstring;
      ParamByName('vOrig').DataType := ftFloat;
      ParamByName('vDesc').DataType := ftFloat;
      ParamByName('vLiq').DataType := ftFloat;

      ParamByName('CTEID').AsInteger := octr;
      ParamByName('nFat').Asstring := DANFE.Conhecimentos[0]
        .Cte.InfCTeNorm.cobr.fat.nFat;
      ParamByName('vOrig').AsFloat := DANFE.Conhecimentos[0]
        .Cte.InfCTeNorm.cobr.fat.vOrig;
      ParamByName('vDesc').AsFloat := DANFE.Conhecimentos[0]
        .Cte.InfCTeNorm.cobr.fat.vDesc;
      ParamByName('vLiq').AsFloat := DANFE.Conhecimentos[0]
        .Cte.InfCTeNorm.cobr.fat.vLiq;

      Qry.ExecSQL;
      Qry.SQL.Clear;

      SQL.add('INSERT INTO  cteDublicata');
      SQL.add(' (            ');
      SQL.add('  CTEID,      ');
      SQL.add('  nDup ,      ');
      SQL.add('  dVenc,      ');
      SQL.add('  vDup        ');
      SQL.add(' )            ');
      SQL.add('VALUES        ');
      SQL.add('   (          ');
      SQL.add('    :CTEID,   ');
      SQL.add('    :nDup,    ');
      SQL.add('    :dVenc,   ');
      SQL.add('    :vDup     ');
      SQL.add(' ) ');
      ParamByName('CTEID').DataType := ftInteger;
      ParamByName('nDup').DataType := ftstring;
      ParamByName('dVenc').DataType := ftdatetime;
      ParamByName('vDup').DataType := ftFloat;

    end;
    try
      for I := 0 to DANFE.Conhecimentos[0].Cte.InfCTeNorm.cobr.dup.Count - 1 do
      begin
        Qry.ParamByName('CTEID').AsInteger := octr;
        Qry.ParamByName('nDup').Asstring := DANFE.Conhecimentos[0]
          .Cte.InfCTeNorm.cobr.dup[I].nDup;
        Qry.ParamByName('dVenc').AsDateTime := DANFE.Conhecimentos[0]
          .Cte.InfCTeNorm.cobr.dup[I].dVenc;

        Qry.ParamByName('vDup').AsFloat := DANFE.Conhecimentos[0]
          .Cte.InfCTeNorm.cobr.dup[I].vDup;

        Qry.ExecSQL;
      end;
    except
      on e: exception do
        raise exception.Create
          ('      ->[1457 ]ERRO AO IMPORTAR duplicatas/faturas DO CTE ' +
          e.message);
    end;
  finally
    FreeAndNil(Qry);
  end;

end;

end.
