unit dfe.services.cte;

interface

uses
  System.SysUtils,
  System.Classes,
  dateutils,
  dfe.lib.util,
  inifiles,
  ACBrBase,
  ACBrDFe,
  ACBrCTe,
  pcteConversaoCTe,
  ACBrUtil.Base,
  ACBrUtil.Strings,
  ACBrUtil.FilesIO,
  ACBrUtil.DateTime,
  ACBrUtil.XMLHTML,
  pcnAuxiliar,
  pcteCTe,
  dfe.dao.cte,
  pcnRetConsReciDFe,
  ACBrDFeConfiguracoes,
  ACBrDFeUtil,
  ACBrCTeConhecimentos,
  Resources.cteconsulta,
  dfe.dto.cteConsuta,
  ACBrCTeConfiguracoes,
  dfe.dao.empresa,
  pcnRetDistDFeInt,
  dfe.model.empresa;

type
  TThreadCte = Class
  private
    LdocZip: TdocZipCollectionItem;
    LEmpresa: Tempresa;

    procedure SetConsulta();
    procedure SetLogSchema();
    procedure GravarCteCompleto;
  public

    procedure ConsultarCte;
  published
    property empresa: Tempresa read LEmpresa write LEmpresa;

  end;

implementation

uses
  dfe.lib.acbr.config, pcnConversao, REST.Json;

{ TThreadCte }

procedure TThreadCte.ConsultarCte;
var
  FdaoEmpresa: TDaoEmpresa;

  I: Integer;
  FAcbrCte: TACBrCTe;
  AultNSU: string;
  LIndex: Integer;
  LDir: string;
begin
  FdaoEmpresa := TDaoEmpresa.Create;
  LDir := ExtractFilePath(GetModuleName(HInstance)) + 'CTE\';
  ForceDirectories(LDir);
  try
    FAcbrCte := TACBrCTe.Create(nil);
    if HoursBetween(now.NowUTC, LEmpresa.NSU_DATA_CONSULTA_CTE) < 1 then
    begin

      exit;
    end;

    try
      TAcbrConfig.setAcbrObjCte(FAcbrCte, LEmpresa);
      AultNSU := floattostr(LEmpresa.nsuCte_sequencia);

      FAcbrCte.DistribuicaoDFePorNSU(UFtoCUF(LEmpresa.uf),
        LEmpresa.cnpj, AultNSU);

      with FAcbrCte.WebServices.DistribuicaoDFe.retDistDFeInt do
      begin
        try
          FdaoEmpresa.SetNsuCte(maxNSU, LEmpresa.codigo_loja);
          if ((cStat = 137) or (cStat = 656) or (ultNSU = maxNSU)) then
          begin
            if cStat = 656 then
            begin
              GravaLog('[CTE] Atenção...: Consumo indevido.', LEmpresa.cnpj);

              if AultNSU <> ultNSU then
                GravaLog('            ultNSU utilizado nesta consulta [' +
                  AultNSU + '] é diferente ' + 'do ultNSU consultado na Sefaz ['
                  + ultNSU + '].', LEmpresa.cnpj);
            end

            else if cStat = 137 then
              GravaLog('[CTE] Atenção...: Não existem mais registros disponíveis.',
                LEmpresa.cnpj)

            else
              GravaLog('[CTE] Atenção...: Este é o último lote de registros disponíveis para distribuição.',
                LEmpresa.cnpj);

            GravaLog('[CTE] Atenção...: Aguarde 1 hora para a próxima consulta.',
              LEmpresa.cnpj);

          end;
          GravaLog('[CTE] Qtde Documentos Retornados: ' +
            inttostr(docZip.Count), LEmpresa.cnpj);
          GravaLog('[CTE] Status....: ' + inttostr(cStat), LEmpresa.cnpj);
          GravaLog('[CTE] Motivo....: ' + xMotivo, LEmpresa.cnpj);
          GravaLog('[CTE] Último NSU: ' + ultNSU, LEmpresa.cnpj);
          GravaLog('[CTE] Máximo NSU: ' + maxNSU, LEmpresa.cnpj);

          for LIndex := 0 to docZip.Count - 1 do
          begin

            LdocZip := docZip[LIndex];
            With TStringList.Create do
            begin
              text := LdocZip.XML;
              SaveToFile(LDir + '\' + LdocZip.NSU + '_' + inttostr(LIndex)
                + '.xml');
              free;
            end;
           //NÃO GRAVAR MAIS A CONSULTA
           // SetConsulta;
            SetLogSchema();
          end;

        except
          on e: exception do
            GravaLog('[CTE]126' + e.Message, LEmpresa.cnpj);

        end;
      end;
    finally
      FreeAndNil(FAcbrCte);
    end;

  finally
    FreeAndNil(FdaoEmpresa);
  end;
end;

procedure TThreadCte.GravarCteCompleto;
var
  Ldao: Tdaocte;
begin
  var
  ObjCte := TACBrCTe.Create(Nil);
  Ldao := Tdaocte.Create;
  try
    ObjCte.Conhecimentos.LoadFromString(LdocZip.XML);
    Ldao.gravaCte(ObjCte);
  finally
    FreeAndNil(ObjCte)
  end;
end;

procedure TThreadCte.SetConsulta;
begin
  var
    LNSU: string;
  var
  dto := TDtoCteConsulta.Create;
  var
  LResourceCteConsulta := TResourceCteconsulta.Create;
  try
    try
      dto.CodigoLoja := StrToInt(LEmpresa.codigo_loja);
      dto.NSU := LdocZip.NSU;
      dto.Chdfe := LdocZip.resDFe.Chdfe;
      dto.Cnpjcpf := LdocZip.resDFe.Cnpjcpf;
      dto.Xnome := LdocZip.resDFe.Xnome;
      dto.Ie := LdocZip.resDFe.Ie;
      dto.Dhemi := LdocZip.resDFe.Dhemi;
      dto.Tpnf := tpNFToStr(LdocZip.resDFe.Tpnf);
      dto.Vnf := LdocZip.resDFe.Vnf;
      dto.Digval := LdocZip.resDFe.Digval;
      dto.Dhrecbto := LdocZip.resDFe.Dhrecbto;
      dto.Nprot := LdocZip.resDFe.Nprot;
      dto.Csitdfe := SituacaoDFeToStr(LdocZip.resDFe.Csitdfe);
      dto.Eventocorgao := LdocZip.resEvento.cOrgao;
      dto.Eventocnpjcpf := LdocZip.resEvento.Cnpjcpf;
      dto.Eventochdfe := LdocZip.resEvento.Chdfe;
      dto.Eventodhevento := LdocZip.resEvento.dhEvento;
      dto.Eventoxevento := LdocZip.resEvento.xEvento;
      dto.Eventodhrecbto := LdocZip.resEvento.Dhrecbto;
      dto.Eventonprot := LdocZip.resEvento.Nprot;
      dto.XML := LdocZip.XML;
      LResourceCteConsulta.Get(nil, 1, 50, '', '', '{nsu:' + QuotedStr(dto.NSU)
        + '}', '', '', nil);
      LResourceCteConsulta.OutpuJson.TryGetValue<string>('nsu', LNSU);
      if LNSU = '' then

        LResourceCteConsulta.Post(nil, tjson.ObjectToJsonObject(dto));
    except
      on e: exception do
      begin
          GravaLog('CTE] E207 '+E.Message, LEmpresa.cnpj);
      end;

    end;
  finally
    FreeAndNil(dto);
    FreeAndNil(LResourceCteConsulta);
  end;
end;

procedure TThreadCte.SetLogSchema;
var
  I: Integer;
begin
  try
    case LdocZip.schema of
      schresCTe:
        GravaLog('CTE] ' + inttostr(I + 1) + ' NSU: ' + LdocZip.NSU +
          ' (Resumo DFe) Chave: ' + LdocZip.resDFe.Chdfe, LEmpresa.cnpj);

      schprocCTe:
        begin
          GravaLog('CTE] ' + inttostr(I + 1) + ' NSU: ' + LdocZip.NSU +
            ' (CTe Completa) Chave: ' + LdocZip.resDFe.Chdfe, LEmpresa.cnpj);
         ///AQUI PROCESSA A IMPORTACAO
          GravarCteCompleto;
        end;

      schprocCTeOS:
        GravaLog('CTE] ' + inttostr(I + 1) + ' NSU: ' + LdocZip.NSU +
          ' (CTeOS Completa) Chave: ' + LdocZip.resDFe.Chdfe, LEmpresa.cnpj);

      schprocGTVe:
        GravaLog('CTE] ' + inttostr(I + 1) + ' NSU: ' + LdocZip.NSU +
          ' (GTVe Completa) Chave: ' + LdocZip.resDFe.Chdfe, LEmpresa.cnpj);

      schresEvento:
        GravaLog('CTE] ' + inttostr(I + 1) + ' NSU: ' + LdocZip.NSU +
          ' (Resumo Evento) Chave: ' + LdocZip.resEvento.Chdfe, LEmpresa.cnpj);

      schprocEventoCTe:
        GravaLog('[CTE] ' + inttostr(I + 1) + ' NSU: ' + LdocZip.NSU +
          ' (Evento Completo) ID: ' + LdocZip.procEvento.Id, LEmpresa.cnpj);
    end;
  except
    on e: exception do
    Begin
      GravaLog('[CTE]225 -' + e.Message, LEmpresa.cnpj);
    End;

  end;

end;

end.
