unit dfe.dao.importacao;

interface

Uses
  windows,
  sysutils,
  REST.JSON.Types,
  System.DateUtils,
  REST.JSON,
  System.JSON,
  dfe.dao.base,
  dfe.model.manifesto,
  dfe.model.empresa,
  dfe.dao.empresa,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MongoDBDef,
  FireDAC.Phys.MongoDB,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.MongoDBWrapper,
  System.JSON.Types,
  System.JSON.BSON,
  System.Generics.collections,
  System.JSON.Builders,
  System.Rtti,
  System.JSON.Readers,
  dfe.lib.util,
  System.Diagnostics,
  FireDAC.Stan.util,
  FireDAC.Stan.param,
  classes,
  ACBrNFe,
  pcnNFe;

type
  TDaoImportacao = class(TDaoBase)
  private
    lfield: string;
    FcodigoLoja: String;
    FCnpj: String;
    FObservacoes: String;
    procedure SetFilter(Qry: TFDQuery; param: TJSONObject);
    procedure SetChaveNota(pQry: TFDQuery);
    procedure SetParametrosChave(Nota: Tnfe; pQry: TFDQuery);

  public
    procedure ExcluirImportacao(Nota: Tnfe);
    procedure GravarArquivoXmlDB(Nota: Tnfe; Arquivo: string);
    procedure GravaCabecalhoNota(Nota: Tnfe);
    procedure GravarOrigemCombustiveis(Nota: Tnfe; IndiceItem, Indice: Integer);
    procedure ExcluirOrigemCombustivelItem(Nota: Tnfe;
      IndiceItem: Integer);
    procedure GravarItemNota(Nota: Tnfe; IndiceProduto: Integer);
    procedure GravarRastro(Nota: Tnfe; IndiceProduto, Indice: Integer);
    procedure GravarFaturas(Nota: Tnfe);
    property Cnpj: String Read FCnpj write FCnpj;
    property CodigoLoja: string read FcodigoLoja write FcodigoLoja;
    property Observacoes: string read FObservacoes write FObservacoes;
  end;

implementation

uses
  pcnConversaoNFe, pcnConversao, FireDAC.Stan.Intf;

{ ---------------------------------------------------------------------------- }

procedure TDaoImportacao.ExcluirImportacao(Nota: Tnfe);
begin
  try
    Query.Close;

    Query.ResourceOptions.CmdExecMode := amNonBlocking;
    Query.SQL.Clear;
    Query.SQL.Add(' Delete from NFeE_Mov        ');
    Query.SQL.Add('  where                      ');
    SetChaveNota(Query);
    SetParametrosChave(Nota, Query);
    Query.execSql;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(' Delete from NFeE_Ite   ');
    Query.SQL.Add('  where ');
    SetChaveNota(Query);
    SetParametrosChave(Nota, Query);
    Query.execSql;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(' Delete from NFeE_Fat   ');
    Query.SQL.Add('  where    ');
    SetChaveNota(Query);

    Query.SQL.Add(' Delete from NFeE_OrgCmb  ');
    Query.SQL.Add('  where    ');
    SetChaveNota(Query);
    SetParametrosChave(Nota, Query);
  except
    on e: exception do
    begin
    end;
  end;
end;

  { ---------------------------------------------------------------------------- }
  procedure TDaoImportacao.GravaCabecalhoNota(Nota: Tnfe);
  begin
    try
      Query.ResourceOptions.CmdExecMode := amNonBlocking;
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add(' Select          ');
      Query.SQL.Add('   CodEmp        ');
      Query.SQL.Add('from NFeE_Mov    ');
      Query.SQL.Add('  where');
      SetChaveNota(Query);
      SetParametrosChave(Nota, Query);
      Query.Open;
      if Query.IsEmpty then
      begin
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('SET DATEFORMAT dmy        ');
        Query.SQL.Add('Insert into NFeE_Mov (    ');
        Query.SQL.Add('      CodEmp      ');
        Query.SQL.Add('   ,  CnpjEmt   ');
        Query.SQL.Add('   ,  InsEstEmt ');
        Query.SQL.Add('   ,  CodNot    ');
        Query.SQL.Add('   ,  Modelo    ');
        Query.SQL.Add('   ,  Serie     ');
        Query.SQL.Add('   ,  DatNot    ');
        Query.SQL.Add('   ,  BasIcm    ');
        Query.SQL.Add('   ,  ValIcm    ');
        Query.SQL.Add('   ,  BasSbt    ');
        Query.SQL.Add('   ,  ValSbt    ');
        Query.SQL.Add('   ,  ValPro    ');
        Query.SQL.Add('   ,  ValFre    ');
        Query.SQL.Add('   ,  TipFre    ');
        Query.SQL.Add('   ,  ValSeg    ');
        Query.SQL.Add('   ,  ValDes    ');
        Query.SQL.Add('   ,  ValOut    ');
        Query.SQL.Add('   ,  ValIpi    ');
        Query.SQL.Add('   ,  ValPis    ');
        Query.SQL.Add('   ,  ValCfs    ');
        Query.SQL.Add('   ,  ValNot    ');
        Query.SQL.Add('   ,  NtrOpr    ');
        Query.SQL.Add('   ,  ForPag    ');
        Query.SQL.Add('   ,  ChvNFe    ');
        Query.SQL.Add('   ,  ObsMov    ');
        Query.SQL.Add('   ,  CnpjTrp   ');
        Query.SQL.Add('   ,  InsEstTrp ');
        Query.SQL.Add('   ,  NomeTrp   ');
        Query.SQL.Add('   ,  EnderecoTrp ');
        Query.SQL.Add('   ,  CidadeTrp   ');
        Query.SQL.Add('   ,  UFTrp 		   ');
        Query.SQL.Add('   ,  PlacaVei 	 ');
        Query.SQL.Add('   ,  UFVei 		   ');
        Query.SQL.Add('   ,  CnpjDst     ');
        Query.SQL.Add('   ,  InsEstDst   ');
        Query.SQL.Add('   ,  InsEstSbtEmt ');
        Query.SQL.Add('   ,  NomEmt 	    ');
        Query.SQL.Add('   ,  NomFanEmt    ');
        Query.SQL.Add('   ,  EnderecoEmt  ');
        Query.SQL.Add('   ,  SetorEmt 	  ');
        Query.SQL.Add('   ,  CidadeEmt    ');
        Query.SQL.Add('   ,  UFEmt 	      ');
        Query.SQL.Add('   ,  IBGEEmt      ');
        Query.SQL.Add('   ,  CepEmt       ');
        Query.SQL.Add('   ,  FoneEmt 	    ');

        Query.SQL.Add('   ,  Status       ');
        Query.SQL.Add('   ,  ValDsn       ');
        Query.SQL.Add('   ,qBCMonoRet     ');
        Query.SQL.Add('   ,vICMSMonoRet   ');
        Query.SQL.Add('   )               ');
        Query.SQL.Add('  Values    (      ');
        Query.SQL.Add('   :CodEmp         ');
        Query.SQL.Add('   , :CnpjEmt      ');
        Query.SQL.Add('   , :InsEstEmt    ');
        Query.SQL.Add('   , :CodNot       ');
        Query.SQL.Add('   , :Modelo       ');
        Query.SQL.Add('   , :Serie        ');

        Query.SQL.Add('   , :DatNot    ');
        Query.SQL.Add('   , :BasIcm    ');
        Query.SQL.Add('   , :ValIcm    ');
        Query.SQL.Add('   , :BasSbt    ');
        Query.SQL.Add('   , :ValSbt    ');
        Query.SQL.Add('   , :ValPro    ');
        Query.SQL.Add('   , :ValFre    ');
        Query.SQL.Add('   , :TipFre    ');
        Query.SQL.Add('   , :ValSeg    ');
        Query.SQL.Add('   , :ValDes    ');
        Query.SQL.Add('   , :ValOut    ');

        Query.SQL.Add('   , :ValIpi    ');
        Query.SQL.Add('   , :ValPis    ');
        Query.SQL.Add('   , :ValCfs    ');
        Query.SQL.Add('   , :ValNot    ');
        Query.SQL.Add('   , :NtrOpr    ');
        Query.SQL.Add('   , :ForPag    ');
        Query.SQL.Add('   , :ChvNFe    ');
        Query.SQL.Add('   , :ObsMov    ');
        Query.SQL.Add('   , :CnpjTrp   ');
        Query.SQL.Add('   , :InsEstTrp ');
        Query.SQL.Add('   , :NomeTrp   ');
        Query.SQL.Add('   , :EnderecoTrp     ');

        Query.SQL.Add('   , :CidadeTrp   ');
        Query.SQL.Add('   , :UFTrp 		   ');
        Query.SQL.Add('   , :PlacaVei 	 ');
        Query.SQL.Add('   , :UFVei 		   ');
        Query.SQL.Add('   , :CnpjDst     ');
        Query.SQL.Add('   , :InsEstDst   ');
        Query.SQL.Add('   , :InsEstSbtEmt');
        Query.SQL.Add('   , :NomEmt 	    ');
        Query.SQL.Add('   , :NomFanEmt    ');
        Query.SQL.Add('   , :EnderecoEmt  ');
        Query.SQL.Add('   , :SetorEmt 	  ');
        Query.SQL.Add('   , :CidadeEmt    ');
        Query.SQL.Add('   , :UFEmt 	      ');
        Query.SQL.Add('   , :IBGEEmt      ');
        Query.SQL.Add('   , :CepEmt       ');
        Query.SQL.Add('   , :FoneEmt 	    ');
        Query.SQL.Add('   , :Status       ');
        Query.SQL.Add('   , :ValDsn       ');
        Query.SQL.Add('   , :qBCMonoRet   ');
        Query.SQL.Add('   , :vICMSMonoRet ');

        Query.SQL.Add('    )   ');
        Query.ParamByName('CodEmp').Value := StrToInt(CodigoLoja);
        Query.ParamByName('CnpjEmt').Value := copy(Nota.Emit.CNPJCPF, 1, 18);
        Query.ParamByName('InsEstEmt').Value := copy(Nota.Emit.IE, 1, 25);
        Query.ParamByName('CodNot').Value := Nota.Ide.nNF;
        Query.ParamByName('Modelo').Value :=
          copy(inttostr(Nota.Ide.modelo), 1, 2);
        Query.ParamByName('Serie').Value :=
          copy(inttostr(Nota.Ide.serie), 1, 3);

        Query.ParamByName('DatNot').Value :=
          StrToDateTime(FormatDateTime('dd/mm/yyyy hh:nn:ss', Nota.Ide.dEmi));
        Query.ParamByName('BasIcm').AsFloat := Nota.Total.ICMSTot.vBC;
        Query.ParamByName('ValIcm').AsFloat := Nota.Total.ICMSTot.vICMS;
        Query.ParamByName('BasSbt').AsFloat := Nota.Total.ICMSTot.vBCST;
        Query.ParamByName('ValSbt').AsFloat := Nota.Total.ICMSTot.vST;
        Query.ParamByName('ValPro').AsFloat := Nota.Total.ICMSTot.vProd;
        Query.ParamByName('ValFre').AsFloat := Nota.Total.ICMSTot.vFrete;
        Query.ParamByName('TipFre').Value :=
          copy(modFreteToStr(Nota.Transp.modFrete), 1, 1);
        Query.ParamByName('ValSeg').AsFloat := Nota.Total.ICMSTot.vSeg;
        Query.ParamByName('ValDes').AsFloat := Nota.Total.ICMSTot.vDesc;
        Query.ParamByName('ValOut').AsFloat := Nota.Total.ICMSTot.vOutro;
        // Query.ParamByName('BasIpi'    ).Value   :=  0;
        Query.ParamByName('ValIpi').AsFloat := Nota.Total.ICMSTot.vIPI;
        Query.ParamByName('ValPis').AsFloat := Nota.Total.ICMSTot.vPIS;
        Query.ParamByName('ValCfs').AsFloat := Nota.Total.ICMSTot.vCOFINS;
        Query.ParamByName('ValNot').AsFloat := Nota.Total.ICMSTot.vNF;
        Query.ParamByName('NtrOpr').Value := copy(Nota.Ide.natOp, 1, 75);
        Query.ParamByName('ForPag').Value :=
          copy(IndpagToStr(Nota.Ide.indPag), 1, 1);
        Query.ParamByName('ChvNFe').Value := copy(Nota.procNFe.chNFe, 1, 44);
        Query.ParamByName('ObsMov').Value := copy(Observacoes, 1, 250);
        Query.ParamByName('CnpjTrp').Value :=
          copy(Nota.Transp.Transporta.CNPJCPF, 1, 18);
        Query.ParamByName('InsEstTrp').Value :=
          copy(Nota.Transp.Transporta.IE, 1, 25);
        Query.ParamByName('NomeTrp').Value :=
          copy(Nota.Transp.Transporta.xNome, 1, 75);
        Query.ParamByName('EnderecoTrp').Value :=
          copy(Nota.Transp.Transporta.xEnder, 1, 75);
        Query.ParamByName('CidadeTrp').Value :=
          copy(Nota.Transp.Transporta.xMun, 1, 50);
        Query.ParamByName('UFTrp').Value :=
          copy(Nota.Transp.Transporta.UF, 1, 2);

        Query.ParamByName('PlacaVei').Value :=
          copy(Nota.Transp.veicTransp.placa, 1, 8);
        Query.ParamByName('UFVei').Value :=
          copy(Nota.Transp.veicTransp.UF, 1, 2);
        Query.ParamByName('CnpjDst').Value := copy(Nota.Dest.CNPJCPF, 1, 18);
        Query.ParamByName('InsEstDst').Value := copy(Nota.Dest.IE, 1, 25);
        Query.ParamByName('InsEstSbtEmt').Value := copy(Nota.Emit.IEST, 1, 18);
        Query.ParamByName('NomEmt').Value := copy(Nota.Emit.xNome, 1, 75);
        Query.ParamByName('NomFanEmt').Value := copy(Nota.Emit.xFant, 1, 50);
        Query.ParamByName('EnderecoEmt').Value :=
          copy(Nota.Emit.EnderEmit.xLgr + ',' + Nota.Emit.EnderEmit.nro + ' - '
          + Nota.Emit.EnderEmit.xCpl, 1, 75);
        Query.ParamByName('SetorEmt').Value :=
          copy(Nota.Emit.EnderEmit.xBairro, 1, 50);
        Query.ParamByName('CidadeEmt').Value :=
          copy(Nota.Emit.EnderEmit.xMun, 1, 50);
        Query.ParamByName('UFEmt').Value := copy(Nota.Emit.EnderEmit.UF, 1, 2);
        Query.ParamByName('IBGEEmt').Value := copy(Nota.Emit.CNAE, 1, 8);
        Query.ParamByName('CepEmt').Value :=
          copy(inttostr(Nota.Emit.EnderEmit.CEP), 1, 9);
        Query.ParamByName('FoneEmt').Value :=
          copy(Nota.Emit.EnderEmit.fone, 1, 25);
        Query.ParamByName('Status').Value := Nota.procNFe.cStat;
        Query.ParamByName('ValDsn').AsFloat := Nota.Total.ICMSTot.vICMSDeson;
        Query.ParamByName('qBCMonoRet').DataType := ftFloat;
        Query.ParamByName('vICMSMonoRet').DataType := ftFloat;
        Query.ParamByName('qBCMonoRet').AsFloat :=
          Nota.Total.ICMSTot.qBCMonoRet;
        Query.ParamByName('vICMSMonoRet').AsFloat :=
          Nota.Total.ICMSTot.vICMSMonoRet;
        Query.execSql;

      end
      else
        gravalog('[DAO  IMPORTACAO] Nota ja importada ' +
          Nota.procNFe.chNFe, FCnpj);
    except
      on e: exception do
      begin
        ExcluirImportacao(Nota);
        raise exception.create('[DAOImportacaoXML]305 loja ' + CodigoLoja +
          ' ERRO: NFeE_Mov não criada !' + chr(13) + e.Message);
      end;

    end;
  end;

  { ------------------------------------------------------------------------------- }
  procedure TDaoImportacao.GravarArquivoXmlDB(Nota: Tnfe; Arquivo: string);
  var
    Astream: TStringStream;
  begin
    try

      Query.SQL.Clear;
      Query.SQL.Add('SELECT CodEmp FROM NFeE_XML');
      Query.SQL.Add('WHERE');
      Query.SQL.Add('   CodEmp          = :CodEmp        ');

      Query.SQL.Add('   and CnpjEmt     = :CnpjEmt       ');
      Query.SQL.Add('   and InsEstEmt   = :InsEstEmt     ');
      Query.SQL.Add('   and CodNot      = :CodNot        ');
      Query.SQL.Add('   and Modelo      = :Modelo        ');
      Query.SQL.Add('   and Serie       = :Serie         ');
      Query.ParamByName('CodEmp').Value := StrToInt(CodigoLoja);

      Query.ParamByName('CnpjEmt').Value := Nota.Emit.CNPJCPF;
      Query.ParamByName('InsEstEmt').Value := Nota.Emit.IE;
      Query.ParamByName('CodNot').Value := Nota.Ide.nNF;
      Query.ParamByName('Modelo').Value := inttostr(Nota.Ide.modelo);
      Query.ParamByName('Serie').Value := inttostr(Nota.Ide.serie);

      Query.Open();
      if Query.IsEmpty then
      begin
        Query.SQL.Clear;
        Query.SQL.Add('INSERT INTO NFeE_XML');
        Query.SQL.Add('(');
        Query.SQL.Add('  CodEmp ,');
        Query.SQL.Add('  CnpjEmt,');
        Query.SQL.Add('  InsEstEmt,');
        Query.SQL.Add('  CodNot,');
        Query.SQL.Add('  Modelo,');
        Query.SQL.Add('  Serie,');
        Query.SQL.Add('  danfe_xml');
        Query.SQL.Add(')');
        Query.SQL.Add('VALUES');
        Query.SQL.Add('(');
        Query.SQL.Add('  :CodEmp,');
        Query.SQL.Add('  :CnpjEmt,');
        Query.SQL.Add('  :InsEstEmt,');
        Query.SQL.Add('  :CodNot,');
        Query.SQL.Add('  :Modelo,');
        Query.SQL.Add('  :Serie,');
        Query.SQL.Add('  :danfe_xml');
        Query.SQL.Add(')');
        SetParametrosChave(Nota, Query);
        Astream := TStringStream.create('');
        try
          Astream.LoadFromFile(Arquivo);
          Query.Params.ParamByName('danfe_xml').LoadFromStream(Astream, ftBlob);

        finally
          Astream.Free;
        end;
        Query.execSql;
      end;
    except
      on e: exception do
      begin
        gravalog('[DAO IMPORTACAO]E379 ' + e.Message, FCnpj);
      end;

    end;
  end;

  { ------------------------------------------------------------------------------ }
  procedure TDaoImportacao.GravarFaturas(Nota: Tnfe);
  var
    I: Integer;
  begin
    try
      for I := 0 to Nota.Cobr.Dup.Count - 1 do
      begin
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add(' Select       ');
        Query.SQL.Add('  CodEmp      ');
        Query.SQL.Add(' from NFeE_Fat  ');
        Query.SQL.Add('  where ');
        SetChaveNota(Query);
        Query.SQL.Add('    and CodFat    = :CodFat    ');
        SetParametrosChave(Nota, Query);
        Query.ParamByName('CodFat').Value := Nota.Cobr.Dup.Items[I].nDup;
        Query.Open;
        if Query.IsEmpty then
        begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('SET DATEFORMAT dmy   ');
          Query.SQL.Add('Insert into NFeE_Fat (   ');
          Query.SQL.Add('    CodEmp   ');
          Query.SQL.Add('   ,  CnpjEmt    ');
          Query.SQL.Add('   ,  InsEstEmt    ');
          Query.SQL.Add('   ,  CodNot   ');
          Query.SQL.Add('   ,  Modelo   ');
          Query.SQL.Add('   ,  Serie    ');
          Query.SQL.Add('   ,  CodFat   ');
          Query.SQL.Add('   ,  DatFat   ');
          Query.SQL.Add('   ,  ValFat   ');
          Query.SQL.Add('   )   ');
          Query.SQL.Add('  Values    (    ');
          Query.SQL.Add('   :CodEmp   ');
          Query.SQL.Add('   , :CnpjEmt    ');
          Query.SQL.Add('   , :InsEstEmt    ');
          Query.SQL.Add('   , :CodNot   ');
          Query.SQL.Add('   , :Modelo   ');
          Query.SQL.Add('   , :Serie    ');
          Query.SQL.Add('   , :CodFat   ');
          Query.SQL.Add('   , :DatFat   ');
          Query.SQL.Add('   , :ValFat   ');
          Query.SQL.Add('    )    ');

          Query.ParamByName('CodEmp').Value := StrToInt(CodigoLoja);
          Query.ParamByName('CnpjEmt').Value := copy(Nota.Emit.CNPJCPF, 1, 18);
          Query.ParamByName('InsEstEmt').Value := copy(Nota.Emit.IE, 1, 25);
          Query.ParamByName('CodNot').Value := Nota.Ide.nNF;
          Query.ParamByName('Modelo').Value :=
            copy(inttostr(Nota.Ide.modelo), 1, 2);
          Query.ParamByName('Serie').Value :=
            copy(inttostr(Nota.Ide.serie), 1, 3);
          Query.ParamByName('CodFat').Value :=
            copy(Nota.Cobr.Dup.Items[I].nDup, 1, 15);
          Query.ParamByName('DatFat').Value :=
            StrToDateTime(FormatDateTime('dd/mm/yyyy hh:nn:ss',
            Nota.Cobr.Dup.Items[I].dVenc));
          Query.ParamByName('ValFat').AsFloat := Nota.Cobr.Dup.Items[I].vDup;
          Query.execSql;
        end;
      end;
    except
      on e: exception do
      begin
        ExcluirImportacao(Nota);
        raise exception.create('ImportacaoXML] Loja ' + CodigoLoja +
          '  ERRO: NFeE_Fat não criada !' + chr(13) + e.Message);

      end;
    end;
  end;

  { ----------------------------------------------------------------------------- }
  procedure TDaoImportacao.GravarItemNota(Nota: Tnfe; IndiceProduto: Integer);
  var
    vCST: string;
    vCSOSN: string;
  begin
    try
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add(' SET DATEFORMAT dmy   ');
      Query.SQL.Add(' Select               ');
      Query.SQL.Add('    CodEmp            ');
      Query.SQL.Add(' from NFeE_Ite        ');
      Query.SQL.Add('  where               ');
      SetChaveNota(Query);
      Query.SQL.Add('   and CodPro    = :CodPro');
      Query.SQL.Add('   and SeqIte    = :SeqIte ');
      SetParametrosChave(Nota, Query);
      Query.ParamByName('CodPro').Value :=
        copy(Nota.Det.Items[IndiceProduto].Prod.cProd, 1, 60);
      Query.ParamByName('SeqIte').AsInteger := Nota.Det.Items[IndiceProduto]
        .Prod.nItem;
      Query.Open;
      if Query.IsEmpty then
      begin
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('SET DATEFORMAT dmy   ');
        Query.SQL.Add('Insert into NFeE_Ite (   ');
        Query.SQL.Add('    CodEmp   ');
        Query.SQL.Add('   ,  CnpjEmt    ');
        Query.SQL.Add('   ,  InsEstEmt    ');
        Query.SQL.Add('   ,  CodNot   ');
        Query.SQL.Add('   ,  Modelo   ');
        Query.SQL.Add('   ,  Serie    ');
        Query.SQL.Add('   ,  CodPro   ');
        Query.SQL.Add('   ,  SeqIte   ');
        Query.SQL.Add('   ,  NomPro   ');
        Query.SQL.Add('   ,  CodNCM   ');

        Query.SQL.Add('   ,  SitTri   ');
        Query.SQL.Add('   ,  CodCfo   ');
        Query.SQL.Add('   ,  Unidade   ');
        Query.SQL.Add('   ,  cEAN      ');
        if dfeDaoBase.valfied('NFeE_Ite', 'cBarra',
          TFDConnection(Query.Connection)) then
        begin
          Query.SQL.Add('   ,  cBarra    ');
          Query.SQL.Add('   ,  cBarraTrib  ');
        end;
        Query.SQL.Add('   ,  QtdPro   ');
        Query.SQL.Add('   ,  ValPro   ');
        Query.SQL.Add('   ,  ValDes   ');
        Query.SQL.Add('   ,  ValTot   ');
        Query.SQL.Add('   ,  BasIcm   ');
        Query.SQL.Add('   ,  AlqIcm   ');
        Query.SQL.Add('   ,  ValIcm   ');
        Query.SQL.Add('   ,  BasIpi   ');
        Query.SQL.Add('   ,  AlqIpi   ');
        Query.SQL.Add('   ,  ValIpi   ');
        Query.SQL.Add('   ,  BasSbt   ');
        Query.SQL.Add('   ,  ValSbt   ');
        Query.SQL.Add('   ,  ValSeg   ');
        Query.SQL.Add('   ,  ValFre   ');
        Query.SQL.Add('   ,  ValOut   ');
        Query.SQL.Add('   ,  ValPis   ');
        Query.SQL.Add('   ,  ValCfs   ');
        Query.SQL.Add('   ,  ValDsn   ');
        Query.SQL.Add('   ,  MotDsn   ');
        Query.SQL.Add('   ,  UFcons   ');
        Query.SQL.Add('   ,  pBio     ');
        Query.SQL.Add('   , qBCMonoRet');
        Query.SQL.Add('   , adRemICMSRet');
        Query.SQL.Add('   , vICMSMonoRet');

        Query.SQL.Add('   )   ');
        Query.SQL.Add('  Values    (    ');
        Query.SQL.Add('   :CodEmp   ');
        Query.SQL.Add('   , :CnpjEmt    ');
        Query.SQL.Add('   , :InsEstEmt    ');
        Query.SQL.Add('   , :CodNot   ');
        Query.SQL.Add('   , :Modelo   ');
        Query.SQL.Add('   , :Serie    ');
        Query.SQL.Add('   , :CodPro   ');
        Query.SQL.Add('   , :SeqIte   ');
        Query.SQL.Add('   , :NomPro   ');
        Query.SQL.Add('   , :CodNCM   ');

        Query.SQL.Add('   , :SitTri   ');
        Query.SQL.Add('   , :CodCfo   ');
        Query.SQL.Add('   , :Unidade    ');
        Query.SQL.Add('   , :cEAN   ');
        if dfeDaoBase.valfied('NFeE_Ite', 'cBarra',
          TFDConnection(Query.Connection)) then
        begin
          Query.SQL.Add('   , :cBarra   ');
          Query.SQL.Add('   , :cBarraTrib     ');
        end;
        Query.SQL.Add('   , :QtdPro   ');
        Query.SQL.Add('   , :ValPro   ');
        Query.SQL.Add('   , :ValDes   ');
        Query.SQL.Add('   , :ValTot   ');
        Query.SQL.Add('   , :BasIcm   ');
        Query.SQL.Add('   , :AlqIcm   ');
        Query.SQL.Add('   , :ValIcm   ');
        Query.SQL.Add('   , :BasIpi   ');
        Query.SQL.Add('   , :AlqIpi   ');
        Query.SQL.Add('   , :ValIpi   ');
        Query.SQL.Add('   , :BasSbt   ');
        Query.SQL.Add('   , :ValSbt   ');
        Query.SQL.Add('   , :ValSeg   ');
        Query.SQL.Add('   , :ValFre   ');
        Query.SQL.Add('   , :ValOut   ');
        Query.SQL.Add('   , :ValPis   ');
        Query.SQL.Add('   , :ValCfs   ');
        Query.SQL.Add('   , :ValDsn   ');
        Query.SQL.Add('   , :MotDsn   ');
        Query.SQL.Add('   , :UFcons   ');
        Query.SQL.Add('   , :pBio     ');

        Query.SQL.Add('   , :qBCMonoRet');
        Query.SQL.Add('   , :adRemICMSRet');
        Query.SQL.Add('   , :vICMSMonoRet');

        Query.SQL.Add('    )    ');
        Query.ParamByName('CodEmp').Value := StrToInt(CodigoLoja);
        Query.ParamByName('CnpjEmt').Value := copy(Nota.Emit.CNPJCPF, 1, 18);
        Query.ParamByName('InsEstEmt').Value := copy(Nota.Emit.IE, 1, 25);
        Query.ParamByName('CodNot').Value := Nota.Ide.nNF;
        Query.ParamByName('Modelo').Value :=
          copy(inttostr(Nota.Ide.modelo), 1, 2);
        Query.ParamByName('Serie').Value :=
          copy(inttostr(Nota.Ide.serie), 1, 3);
        Query.ParamByName('CodPro').Value :=
          copy(Nota.Det.Items[IndiceProduto].Prod.cProd, 1, 60);
        Query.ParamByName('SeqIte').Value := Nota.Det.Items[IndiceProduto]
          .Prod.nItem;
        Query.ParamByName('NomPro').Value :=
          copy(Nota.Det.Items[IndiceProduto].Prod.xProd, 1, 100);
        Query.ParamByName('CodNCM').Value :=
          copy(Nota.Det.Items[IndiceProduto].Prod.NCM, 1, 8);

        Query.ParamByName('ValDsn').AsFloat := 0;
        Query.ParamByName('MotDsn').AsString := '';

        if (length(CSOSNICMSToStr(Nota.Det.Items[IndiceProduto]
          .Imposto.ICMS.CSOSN)) = 3) then
        begin

          vCSOSN := OrigToStr(Nota.Det.Items[IndiceProduto].Imposto.ICMS.orig) +
            copy(CSOSNICMSToStr(Nota.Det.Items[IndiceProduto]
            .Imposto.ICMS.CSOSN), 1, 3);
          Query.ParamByName('SitTri').Value := copy(vCSOSN, 1, 4)

        end

        else

        begin

          vCST := OrigToStr(Nota.Det.Items[IndiceProduto].Imposto.ICMS.orig) +
            CSTICMSToStr(Nota.Det.Items[IndiceProduto].Imposto.ICMS.CST);
          Query.ParamByName('SitTri').Value := copy(vCST, 1, 3);

        end;

        Query.ParamByName('CodCfo').Value :=
          copy(Nota.Det.Items[IndiceProduto].Prod.CFOP, 1, 4);
        Query.ParamByName('Unidade').Value :=
          copy(Nota.Det.Items[IndiceProduto].Prod.uCom, 1, 6);
        Query.ParamByName('cEAN').Value :=
          copy(Nota.Det.Items[IndiceProduto].Prod.cEAN, 1, 13);
        if dfeDaoBase.valfied('NFeE_Ite', 'cBarra',
          TFDConnection(Query.Connection)) then
        begin
          Query.ParamByName('cBarra').Value := Nota.Det.Items[IndiceProduto]
            .Prod.cBarra;
          Query.ParamByName('cBarraTrib').Value := Nota.Det.Items[IndiceProduto]
            .Prod.cBarraTrib;
        end;
        Query.ParamByName('QtdPro').AsFloat := Nota.Det.Items[IndiceProduto]
          .Prod.qCom;
        Query.ParamByName('ValPro').AsFloat := Nota.Det.Items[IndiceProduto]
          .Prod.vUnCom;
        Query.ParamByName('ValDes').AsFloat := Nota.Det.Items[IndiceProduto]
          .Prod.vDesc;
        Query.ParamByName('ValTot').AsFloat := Nota.Det.Items[IndiceProduto]
          .Prod.vProd;
        Query.ParamByName('BasIcm').AsFloat := Nota.Det.Items[IndiceProduto]
          .Imposto.ICMS.vBC;
        Query.ParamByName('AlqIcm').AsFloat := Nota.Det.Items[IndiceProduto]
          .Imposto.ICMS.pICMS;
        Query.ParamByName('ValIcm').AsFloat := Nota.Det.Items[IndiceProduto]
          .Imposto.ICMS.vICMS;
        Query.ParamByName('BasIpi').AsFloat := Nota.Det.Items[IndiceProduto]
          .Imposto.IPI.vBC;
        Query.ParamByName('AlqIpi').AsFloat := Nota.Det.Items[IndiceProduto]
          .Imposto.IPI.pIPI;
        Query.ParamByName('ValIpi').AsFloat := Nota.Det.Items[IndiceProduto]
          .Imposto.IPI.vIPI;
        Query.ParamByName('BasSbt').AsFloat := Nota.Det.Items[IndiceProduto]
          .Imposto.ICMS.vBCST;
        Query.ParamByName('ValSbt').AsFloat := Nota.Det.Items[IndiceProduto]
          .Imposto.ICMS.vICMSST;
        Query.ParamByName('ValSeg').AsFloat := Nota.Det.Items[IndiceProduto]
          .Prod.vSeg;
        Query.ParamByName('ValFre').AsFloat := Nota.Det.Items[IndiceProduto]
          .Prod.vFrete;
        Query.ParamByName('ValOut').AsFloat := Nota.Det.Items[IndiceProduto]
          .Prod.vOutro;
        Query.ParamByName('ValPis').AsFloat := Nota.Det.Items[IndiceProduto]
          .Imposto.PIS.vPIS;
        Query.ParamByName('ValCfs').AsFloat := Nota.Det.Items[IndiceProduto]
          .Imposto.COFINS.vCOFINS;
        Query.ParamByName('ValDsn').AsFloat := Nota.Det.Items[IndiceProduto]
          .Imposto.ICMS.vICMSDeson;
        Query.ParamByName('UFcons').DataType := ftString;
        Query.ParamByName('pBio').DataType := ftFloat;

        Query.ParamByName('UFcons').AsString := '';
        Query.ParamByName('pBio').AsFloat := 0;

        Query.ParamByName('UFcons').AsString := Nota.Det.Items[IndiceProduto]
          .Prod.comb.UFcons;
        Query.ParamByName('pBio').AsFloat := Nota.Det.Items[IndiceProduto]
          .Prod.comb.pBio;

        Query.ParamByName('qBCMonoRet').DataType := ftFloat;
        Query.ParamByName('adRemICMSRet').DataType := ftFloat;
        Query.ParamByName('vICMSMonoRet').DataType := ftFloat;
        Query.ParamByName('qBCMonoRet').AsFloat := Nota.Det.Items[IndiceProduto]
          .Imposto.ICMS.qBCMonoRet;
        Query.ParamByName('adRemICMSRet').AsFloat :=
          Nota.Det.Items[IndiceProduto].Imposto.ICMS.adRemICMSRet;
        Query.ParamByName('vICMSMonoRet').AsFloat :=
          Nota.Det.Items[IndiceProduto].Imposto.ICMS.vICMSMonoRet;

        Query.execSql;

      end;
    except
      on e: exception do
      begin
        raise exception.create('[IMPORTACAO NFE]Itens da nota 987' + e.Message);
      end;
    end;

  end;

  procedure TDaoImportacao.ExcluirOrigemCombustivelItem(Nota: Tnfe;
    IndiceItem: Integer);
  begin
   try
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(' delete          ');
    Query.SQL.Add(' from            ');
    Query.SQL.Add('  NFeE_OrgCmb    ');
    Query.SQL.Add(' where    ');
    SetChaveNota(Query);
    Query.SQL.Add('   and CodPro  =:CodPro  ');
    Query.SQL.Add('   and SeqIte  =:SeqIte  ');
    SetParametrosChave(Nota, Query);
    Query.ParamByName('CodPro').AsString := Nota.Det.Items[IndiceItem]
      .Prod.cProd;
    Query.ParamByName('SeqIte').AsInteger := Nota.Det.Items[IndiceItem]
      .Prod.nItem;
    Query.execSql;
   except
      on e: exception do
      begin
        raise exception.create('[IMPORTACAO NFE] 747 Exclusao de origem comb ' + e.Message);
      end;
    end;

  end;

  procedure TDaoImportacao.GravarOrigemCombustiveis(Nota: Tnfe;
    IndiceItem, Indice: Integer);
  begin

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('Insert into NFeE_OrgCmb (');
    Query.SQL.Add('    CodEmp     ');
    Query.SQL.Add('   ,CnpjEmt   ');
    Query.SQL.Add('   ,InsEstEmt ');
    Query.SQL.Add('   ,CodNot    ');
    Query.SQL.Add('   ,Modelo    ');
    Query.SQL.Add('   ,serie     ');
    Query.SQL.Add('   ,CodPro    ');
    Query.SQL.Add('   ,SeqIte    ');
    Query.SQL.Add('   ,indImport ');
    Query.SQL.Add('   ,cUFOrig   ');
    Query.SQL.Add('   ,pOrig     ');

    Query.SQL.Add(')values(');
    Query.SQL.Add('   :CodEmp     ');
    Query.SQL.Add('   ,:CnpjEmt   ');
    Query.SQL.Add('   ,:InsEstEmt ');
    Query.SQL.Add('   ,:CodNot    ');
    Query.SQL.Add('   ,:Modelo    ');
    Query.SQL.Add('   ,:serie     ');
    Query.SQL.Add('   ,:CodPro    ');
    Query.SQL.Add('   ,:SeqIte    ');
    Query.SQL.Add('   ,:indImport ');
    Query.SQL.Add('   ,:cUFOrig   ');
    Query.SQL.Add('   ,:pOrig     ');
    Query.SQL.Add(')');

    Query.Params.ParamByName('CodEmp').AsString := CodigoLoja;
    Query.Params.ParamByName('CnpjEmt').AsString := Nota.Emit.CNPJCPF;
    Query.Params.ParamByName('InsEstEmt').AsString := Nota.Emit.IE;
    Query.Params.ParamByName('CodNot').AsInteger := Nota.Ide.nNF;
    Query.Params.ParamByName('Modelo').AsInteger := Nota.Ide.modelo;
    Query.Params.ParamByName('serie').AsInteger := Nota.Ide.serie;
    Query.Params.ParamByName('CodPro').AsString := Nota.Det.Items[IndiceItem]
      .Prod.cProd;
    Query.Params.ParamByName('SeqIte').AsInteger := Nota.Det.Items[IndiceItem]
      .Prod.nItem;
    if Nota.Det.Items[IndiceItem].Prod.comb.origComb[Indice].indImport = iiNacional
    then
      Query.Params.ParamByName('indImport').AsInteger := 0
    else
      Query.Params.ParamByName('indImport').AsInteger := 1;
    Query.Params.ParamByName('cUFOrig').AsInteger := Nota.Det.Items[IndiceItem]
      .Prod.comb.origComb[Indice].cUFOrig;
    Query.Params.ParamByName('pOrig').AsFloat := Nota.Det.Items[IndiceItem]
      .Prod.comb.origComb[Indice].pOrig;
    try
      Query.execSql;
    except
      on e: exception do
      begin
        ExcluirImportacao(Nota);
        raise exception.create('[ImportacaoXML] loja ' + CodigoLoja +
          ' ERRO: NFeE_OrgCmb não criada !' + chr(13) + e.Message);

      end;
    end;

  end;

  { ----------------------------------------------------------------------------- }
  procedure TDaoImportacao.GravarRastro(Nota: Tnfe;
    IndiceProduto, Indice: Integer);
  begin
    try
      Query.Close;
      Query.SQL.Clear;

      Query.SQL.Add(' Select   ');
      Query.SQL.Add(' .CodEmp    as  Lot_CodEmp   ');

      Query.SQL.Add(' from NFeE_Lot   ');

      Query.SQL.Add(' where  ');
      SetChaveNota(Query);

      Query.SQL.Add('   and CodPro    = :CodPro   ');
      Query.SQL.Add('   and SeqIte    = :SeqIte   ');
      Query.SQL.Add('   and CodLot    = :CodLot   ');
      SetParametrosChave(Nota, Query);
      Query.ParamByName('CodPro').Value :=
        copy(Nota.Det.Items[IndiceProduto].Prod.cProd, 1, 60);
      Query.ParamByName('SeqIte').AsInteger := Nota.Det.Items[IndiceProduto]
        .Prod.nItem;
      Query.ParamByName('CodLot').AsString :=
        copy(Nota.Det.Items[IndiceProduto].Prod.rastro[Indice].nLote, 1, 20);
      Query.Open;

      if Query.IsEmpty then
      begin
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('SET DATEFORMAT dmy   ');
        Query.SQL.Add('Insert into NFeE_Lot (   ');
        Query.SQL.Add('    CodEmp   ');
        Query.SQL.Add('   ,  CnpjEmt    ');
        Query.SQL.Add('   ,  InsEstEmt    ');
        Query.SQL.Add('   ,  CodNot   ');
        Query.SQL.Add('   ,  Modelo   ');
        Query.SQL.Add('   ,  Serie    ');
        Query.SQL.Add('   ,  CodPro   ');
        Query.SQL.Add('   ,  SeqIte   ');
        Query.SQL.Add('   ,  CodLot   ');
        Query.SQL.Add('   ,  QtdPro   ');
        Query.SQL.Add('   ,  DatFab   ');
        Query.SQL.Add('   ,  DatVld   ');
        Query.SQL.Add('   ,  cAgreg   ');
        Query.SQL.Add('   )   ');
        Query.SQL.Add('  Values    (    ');
        Query.SQL.Add('   :CodEmp   ');
        Query.SQL.Add('   , :CnpjEmt    ');
        Query.SQL.Add('   , :InsEstEmt    ');
        Query.SQL.Add('   , :CodNot   ');
        Query.SQL.Add('   , :Modelo   ');
        Query.SQL.Add('   , :Serie    ');
        Query.SQL.Add('   , :CodPro   ');
        Query.SQL.Add('   , :SeqIte   ');
        Query.SQL.Add('   , :CodLot   ');
        Query.SQL.Add('   , :QtdPro   ');
        Query.SQL.Add('   , :DatFab   ');
        Query.SQL.Add('   , :DatVld   ');
        Query.SQL.Add('   , :cAgreg   ');
        Query.SQL.Add('    )    ');
        Query.ParamByName('CodEmp').Value := StrToInt(CodigoLoja);
        Query.ParamByName('CnpjEmt').Value := copy(Nota.Emit.CNPJCPF, 1, 18);
        Query.ParamByName('InsEstEmt').Value := copy(Nota.Emit.IE, 1, 25);
        Query.ParamByName('CodNot').Value := Nota.Ide.nNF;
        Query.ParamByName('Modelo').Value :=
          copy(inttostr(Nota.Ide.modelo), 1, 2);
        Query.ParamByName('Serie').Value :=
          copy(inttostr(Nota.Ide.serie), 1, 3);
        Query.ParamByName('CodPro').Value :=
          copy(Nota.Det.Items[IndiceProduto].Prod.cProd, 1, 60);
        Query.ParamByName('SeqIte').Value := Nota.Det.Items[IndiceProduto]
          .Prod.nItem;
        Query.ParamByName('CodLot').Value :=
          copy(Nota.Det.Items[IndiceProduto].Prod.rastro[Indice].nLote, 1, 20);
        Query.ParamByName('QtdPro').Value := Nota.Det.Items[IndiceProduto]
          .Prod.rastro[Indice].qLote;
        Query.ParamByName('DatFab').Value :=
          StrToDateTime(FormatDateTime('dd/mm/yyyy',
          Nota.Det.Items[IndiceProduto].Prod.rastro[Indice].dFab));
        Query.ParamByName('DatVld').Value :=
          StrToDateTime(FormatDateTime('dd/mm/yyyy',
          Nota.Det.Items[IndiceProduto].Prod.rastro[Indice].dVal));
        Query.ParamByName('cAgreg').Value :=
          copy(Nota.Det.Items[IndiceProduto].Prod.rastro[Indice].cAgreg, 1, 20);

        Query.execSql;
      end;

    except
      on e: exception do
      begin
        ExcluirImportacao(Nota);
        raise exception.create('[DAO ImportacaoXML]766 loja ' + CodigoLoja +
          ' ERRO: NFeE_Lot não criada !' + chr(13) + e.Message);
      end;
    end;

  end;

  { ----------------------------------------------------------------------------- }
  procedure TDaoImportacao.SetChaveNota(pQry: TFDQuery);
  begin

    pQry.SQL.Add('   CodEmp          = :CodEmp        ');
    pQry.SQL.Add('   and CnpjEmt     = :CnpjEmt       ');
    pQry.SQL.Add('   and InsEstEmt   = :InsEstEmt     ');
    pQry.SQL.Add('   and CodNot      = :CodNot        ');
    pQry.SQL.Add('   and Modelo      = :Modelo        ');
    pQry.SQL.Add('   and Serie       = :Serie         ');
  end;

  { ----------------------------------------------------------------------------- }
  procedure TDaoImportacao.SetParametrosChave(Nota: Tnfe; pQry: TFDQuery);
  begin
    pQry.ParamByName('CodEmp').Value := StrToInt(CodigoLoja);

    pQry.ParamByName('CnpjEmt').Value := Nota.Emit.CNPJCPF;
    pQry.ParamByName('InsEstEmt').Value := Nota.Emit.IE;
    pQry.ParamByName('CodNot').Value := Nota.Ide.nNF;
    pQry.ParamByName('Modelo').Value := inttostr(Nota.Ide.modelo);
    pQry.ParamByName('Serie').Value := inttostr(Nota.Ide.serie);

  end;

  { ---------------------------------------------------------------------------- }
  procedure TDaoImportacao.SetFilter(Qry: TFDQuery; param: TJSONObject);
  begin

  end;

end.
