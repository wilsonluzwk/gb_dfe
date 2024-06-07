unit dfe.lib.util;

interface

uses
{$IFDEF MSWINDOWS}
  windows,
  Controls,
  ShlObj,

{$ENDIF MSWINDOWS}
  sysutils,
  Math,
  StrUtils,
  dfe.services.websocket,
  XSBuiltIns,
  System.IOUtils,
  dfe.model.mensagens,
  RTTI,
  TypInfo,
  DB,
  DBClient,
  dfe.lib.constants,

  classes, System.JSON;

type
  Tutil = class
    class function From<T: class>(Source: T): T; static;
    class function parseDateTime(value: string): TDateTime;
    class function parseDate(value: string): TDate;
    class function GetJsonValue(value: string; pjson: tJsonObject): string;
  end;

function GetChaveValidada(value: string): string;
function soNumeros(const value: string): string;
function formatvalue(value: double): string;
function vLrXmltoFloat(value: string): double;

function pegarSaidaDOS(Comando, DiretorioTrabalho: string): string;
function RoundABNT(const AValue: double; const Digits: TRoundToRange;
  const Delta: double = 0.00001): double;

function makeJason(cds: TclienTdataset; aliasdata: string = ''): string;
procedure gravalog(mensagem, path: string);
Function MontaChaveAcessoNFe(codUF: integer; dtEmissao: TDateTime; cnpj: string;
  modelo, serie, numeroNF, codigoNumerico, tpEmi: integer): string;

function Valfloat(value: string): double;

function GetTagByName(value, xml: string): string;
function FormatDate(value: string): TDateTime;
function FormatMsg(value: string): string;
function ValInt(value: string): integer;
Function Valdate(value: string): TDateTime;
procedure GetFiles(const lista: TStringList; filtro: string;
  dirtrabalho: string);
procedure GetFilesRecursive(const lista: TStringList;
  filtro, diretorio: string);
function GetSpecialFolderPath(CSIDLFolder: integer): string;
procedure SendMessageServer(mensagem: string; tipo: string = '');
procedure DeleteInfoDashBoard;

implementation

procedure DeleteInfoDashBoard;
var
  sfile: string;
  timeDate: TDateTime;
begin
  sfile := ExtractFilePath(GetModuleName(HInstance)) + _ctFileInfoDashBoard;
  DeleteFile(sfile);
end;

{ -------------------------------------------------------------------------- }
function GetSpecialFolderPath(CSIDLFolder: integer): string;
var
  FilePath: array [0 .. MAX_PATH] of char;
begin
  SHGetFolderPath(0, CSIDLFolder, 0, 0, FilePath);
  Result := FilePath;
end;

{ -------------------------------------------------------------------------- }
function GetChaveValidada(value: string): string;
var
  hitText: string;
begin
  hitText := '';
  Result := '';
  if Pos('[', value) > 1 then
  begin
    hitText := copy(value, Pos('[', value) + 1, Length(value));
    hitText := copy(hitText, 0, Pos(']', hitText) - 1);
    hitText := soNumeros(hitText);
    if Length(hitText) = 44 then
      Result := hitText;
  end;
end;

{ -------------------------------------------------------------------------- }
procedure GetFilesRecursive(const lista: TStringList;
  filtro, diretorio: string);

var
  S: string;
begin

  for S in TDirectory.GetFiles(diretorio, filtro,
    TSearchOption.soAllDirectories) do
    lista.Add(S);

end;

{ -------------------------------------------------------------------------- }
procedure GetFiles(const lista: TStringList; filtro: string;
  dirtrabalho: string);
var
  FileName: string;
  SearchRec: TSearchRec;
begin

  lista.Clear;
  SetCurrentDir(dirtrabalho);
  if FindFirst(filtro, faAnyFile, SearchRec) = 0 then
    repeat
      FileName := dirtrabalho + SearchRec.Name;
      lista.Add(FileName);
    until FindNext(SearchRec) <> 0;
  FindClose(SearchRec);
end;

{ -------------------------------------------------------------------------- }
Function Valdate(value: string): TDateTime;
var
  idate: TDateTime;
  lst: TStringList;
  day: word;
  year: word;
  month: word;
  minut: word;
  second: word;
  hour: word;
  stime: string;
begin
  day := 0;
  year := 0;
  month := 0;
  minut := 0;
  second := 0;
  hour := 0;
  Result := 0;
  lst := TStringList.Create;
  try
    if TryStrToDateTime(value, idate) then
      Result := idate
    else
    begin
      if Pos('-', value) > 0 then
      begin

        lst.Delimiter := '-';
        lst.DelimitedText := value;
        year := StrToInt(lst[0]);
        month := StrToInt(copy(lst[1], 0, 2));
        day := StrToInt(copy(lst[2], 0, 2));
        Result := EncodeDate(year, month, day)
      end;

      if Pos(':', value) > 0 then
      begin

        lst.Delimiter := ' ';
        lst.DelimitedText := value;
        stime := lst[1];
        if stime <> '' then
        begin

          lst.Delimiter := ':';
          lst.DelimitedText := stime;
          if lst.Count > 1 then

            hour := StrToInt(lst[0]);
          if lst.Count > 2 then
            minut := StrToInt(lst[1]);
          if lst.Count > 3 then
            second := StrToInt(copy(lst[2], 0, 2));
          Result := Result + EncodeTime(hour, minut, second, 0);
        end;
      end;

    end;
  finally
    FreeAndNil(lst);
  end;
end;

{ ------------------------------------------------------------------------------- }
function ValInt(value: string): integer;
var
  i: integer;
begin
  Result := 0;
  if soNumeros(value) <> '' then
  begin
    if TryStrToInt(value, i) then
      Result := i;
  end;

end;

{ ------------------------------------------------------------------------------- }
function GetTagByName(value, xml: string): string;
var
  i, j: integer;
begin
  Result := '';
  i := Pos('<' + uppercase(value) + '>', uppercase(xml));
  if i > 0 then
  begin
    Result := copy(xml, i + Length(value) + 2, Length(xml));
    j := Pos('</' + uppercase(value) + '>', uppercase(Result));
    Result := copy(Result, 0, j - 1);
  end;
end;

{ ------------------------------------------------------------------------------- }
function soNumeros(const value: string): string;
var
  i: integer;
begin
  Result := '';

  if value = '' then
    exit;

  for i := 0 to Length(value) do
    if value[i] in ['0' .. '9'] then
      Result := Result + value[i];
end;

{ ------------------------------------------------------------------------------- }
function FormatDate(value: string): TDateTime;
var
  idate: TDateTime;
  lst: TStringList;
  day: word;
  year: word;
  month: word;
  minut: word;
  second: word;
  hour: word;
  stime: string;
begin
  day := 0;
  year := 0;
  month := 0;
  minut := 0;
  second := 0;
  hour := 0;
  Result := 0;
  lst := TStringList.Create;
  try
    if TryStrToDateTime(value, idate) then
      Result := idate
    else
    begin
      if Pos('-', value) > 0 then
      begin

        lst.Delimiter := '-';
        lst.DelimitedText := value;
        year := StrToInt(lst[0]);
        month := StrToInt(copy(lst[1], 0, 2));
        day := StrToInt(copy(lst[2], 0, 2));
        Result := EncodeDate(year, month, day)
      end;

      if Pos(':', value) > 0 then
      begin

        if Pos('T', uppercase(value)) > 0 then
          lst.Delimiter := 'T'
        else
          lst.Delimiter := ' ';
        lst.DelimitedText := value;
        stime := lst[1];
        if stime <> '' then
        begin

          lst.Delimiter := ':';
          lst.DelimitedText := stime;
          if lst.Count > 0 then

            hour := StrToInt(lst[0]);
          if lst.Count > 1 then
            minut := StrToInt(lst[1]);
          if lst.Count > 2 then
            second := StrToInt(copy(lst[2], 0, 2));
          Result := Result + EncodeTime(hour, minut, second, 0);
        end;
      end;

    end;
  finally
    FreeAndNil(lst);
  end;

end;

{ ------------------------------------------------------------------------------- }
function formatvalue(value: double): string;
begin
  Result := StringReplace(FloatToStr(value), ',', '.', [rfReplaceAll]);

end;

{ ------------------------------------------------------------------------------ }
function vLrXmltoFloat(value: string): double;
var
  S: string;
begin
  Result := 0;

  S := StringReplace(value, '.', ',', [rfReplaceAll]);
  if S <> '' then
    Result := strtofloat(S);
end;

{ ------------------------------------------------------------------------------ }
function Valinteger(value: string): integer;
var
  S: string;
begin
  Result := 0;

end;

{ ------------------------------------------------------------------------------ }
function pegarSaidaDOS(Comando, DiretorioTrabalho: string): string;
{$IFDEF MSWINDOWS}
var
  saSegunranca: TSecurityAttributes;
  siInformacoesInicializacao: TStartupInfo;
  piInformacaoDoProcesso: TProcessInformation;
  hLeitura, hEscrita: THandle;
  bOk, bHandle: Boolean;
  Buffer: array [0 .. 255] of AnsiChar;
  BytesLidos: Cardinal;
  diretorio: string;
begin
  Result := '';
  with saSegunranca do
  begin
    nLength := SizeOf(saSegunranca);
    bInheritHandle := true;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(hLeitura, hEscrita, @saSegunranca, 0);
  try
    with siInformacoesInicializacao do
    begin
      FillChar(siInformacoesInicializacao,
        SizeOf(siInformacoesInicializacao), 0);
      cb := SizeOf(siInformacoesInicializacao);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE);
      hStdOutput := hEscrita;
      hStdError := hEscrita;
    end;
    diretorio := DiretorioTrabalho;
    bHandle := CreateProcess(nil, PChar('cmd.exe /c ' + Comando), nil, nil,
      true, 0, nil, PChar(diretorio), siInformacoesInicializacao,
      piInformacaoDoProcesso);
    CloseHandle(hEscrita);
    if bHandle then
    begin
      try
        repeat
          bOk := ReadFile(hLeitura, Buffer, 255, BytesLidos, nil);
          if BytesLidos > 0 then
          begin
            Buffer[BytesLidos] := #0;
            Result := Result + Buffer;
          end;
        until not bOk or (BytesLidos = 0);
        WaitForSingleObject(piInformacaoDoProcesso.hProcess, INFINITE);
      finally
        CloseHandle(piInformacaoDoProcesso.hThread);
        CloseHandle(piInformacaoDoProcesso.hProcess);
      end;
    end;
  finally
    CloseHandle(hLeitura);
  end;
{$ENDIF }
end;

{ ------------------------------------------------------------------------------- }
function SimpleRoundToEX(const AValue: Extended;
  const ADigit: TRoundToRange = -2): Extended;
var
  LFactor: Extended;
begin
  LFactor := IntPower(10.0, ADigit);
  if AValue < 0 then
    Result := Int((AValue / LFactor) - 0.5) * LFactor
  else
    Result := Int((AValue / LFactor) + 0.5) * LFactor;
end;

function RoundABNT(const AValue: double; const Digits: TRoundToRange;
  const Delta: double = 0.00001): double;
var
  Pow, FracValue, PowValue: Extended;
  RestPart: double;
  IntCalc, FracCalc, LastNumber, IntValue: Int64;
  Negativo: Boolean;
Begin
  Negativo := (AValue < 0);

  Pow := IntPower(10, abs(Digits));
  PowValue := abs(AValue) / 10;
  IntValue := trunc(PowValue);
  FracValue := frac(PowValue);

  PowValue := SimpleRoundToEX(FracValue * 10 * Pow, -9);

  IntCalc := trunc(PowValue);
  FracCalc := trunc(frac(PowValue) * 100);

  if (FracCalc > 50) then
    Inc(IntCalc)

  else if (FracCalc = 50) then
  begin
    LastNumber := round(frac(IntCalc / 10) * 10);

    if odd(LastNumber) then
      Inc(IntCalc)
    else
    begin
      RestPart := frac(PowValue * 10);

      if RestPart > Delta then
        Inc(IntCalc);
    end;
  end;

  Result := ((IntValue * 10) + (IntCalc / Pow));
  if Negativo then
    Result := -Result;
end;

{ ----------------------------------------------------------------------------- }

function EscapeString(const AValue: string): string;
begin
end;

{ ---------------------------------------------------------------------- }
function FormatMsg(value: string): string;
begin
  Result := EscapeString(value);

end;

{ ---------------------------------------------------------------------- }
function Valfloat(value: string): double;
var
  vfloat: double;
  svalue: string;
  fs: TFormatSettings;
begin
  Result := 0;
  svalue := value;
  if not TryStrToFloat(value, vfloat) then
  begin
    try
      FillChar(fs, SizeOf(fs), 0);
      fs.ThousandSeparator := ',';
      fs.DecimalSeparator := '.';
      Result := strtofloat(value, fs);

    except
      value := StringReplace(value, '.', ',', [rfReplaceAll]);
      if TryStrToFloat(value, vfloat) then
        Result := RoundTo(vfloat, -2)
      else
        raise exception.Create('Valor ' + value +
          ' Nao pode ser covertido para float');
    end;
  end
  else
    Result := vfloat;
end;

{ ---------------------------------------------------------------------- }
function valString(value: string): string;
begin
  Result := value;
  Result := StringReplace(Result, #13#10, ' ', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '''', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '''', [rfReplaceAll]);
  Result := EscapeString(Result);
  Result := '"' + Result + '"';
end;

{ ---------------------------------------------------------------------- }
function makeJason(cds: TclienTdataset; aliasdata: string = ''): string;
var
  Data: string;
  line: string;
  bmrk: TBookmark;
  i: integer;
begin
  try
    Result := '';
    cds.First;
    while not cds.Eof do
    begin

      line := '';
      for i := 0 to cds.FieldCount - 1 do
      begin
        if cds.Fields[i].Visible then
        begin
          if line <> '' then
            line := line + ',' + #13#10;
          line := line + '"' + cds.Fields[i].FullName + '":';
          if cds.Fields[i].DataType in [ftFloat, ftCurrency, ftInteger, ftBCD]
          then
          begin
            if cds.Fields[i].AsString <> '' then

              line := line + StringReplace(cds.Fields[i].AsString, ',', '.',
                [rfReplaceAll])
            else

              line := line + '""';
          end
          else if cds.Fields[i].DataType in [ftDate, ftDateTime, ftTimeStamp]
          then
          begin

            begin
              with TXSDateTime.Create() do
                try

                  AsUTCDateTime := cds.Fields[i].AsDateTime;
                  line := line + valString(copy(NativeToXS, 0, 19));
                finally
                  Free;
                end;

            end;
          end
          else
          begin
            line := line + valString(cds.Fields[i].AsString);
          end;
        end;
      end;
      if Data <> '' then
        Data := Data + ',';
      Data := Data + '{' + line + '}' + #13#10;
      cds.next
    end;
    if aliasdata = '' then
      aliasdata := 'data';
    Data := '{ "' + aliasdata + '": [' + #13#10 + Data + #13#10 + ']}';
    if DebugHook <> 0 then
    begin
      with TStringList.Create do
      begin
        Text := Data;
        savetofile(ExtractFilePath(GetModuleName(HInstance)) + 'Consulta.json');
        Free;
      end;
    end;
    Result := Data;
  except
    on e: exception do
      raise exception.Create('Error na geração do arquivo json ' + e.Message);
  end;
end;

{ ------------------------------------------------------------------------------- }
procedure gravalog(mensagem, path: string);
var
  strSaida: string;
  HWND: Cardinal;

  procedure registrarLogEmArquivo;

  var
    p: string;
    F: TextFile;
  begin
    try
      try
        p := ExtractFilePath(ParamStr(0)) + 'log\' + path + '\';
        ForceDirectories(p);
        p := p + FormatDateTime('yyyymmdd', now) + '_' +
          ChangeFileExt(ExtractFileName(ParamStr(0)), '') + '.log';
        AssignFile(F, p);
        if not FileExists(p) then
          Rewrite(F)
        else
          Append(F);
        Writeln(F, strSaida);
      except
      end;
    finally
      Closefile(F);
    end;
  end;

begin
  Try
    HWND := 0;
    if path = '' then
      path := 'Global';
    strSaida := FormatDateTime('hh:nn:ss.zzz', now) + ' V0206 - ' + mensagem;
    if IsConsole then
      Writeln(strSaida);
    registrarLogEmArquivo;

  except
  end;
end;

{ ------------------------------------------------------------------------------ }
function Modulo11(Numero: String): String;
var
  i, k: integer;
  Soma: integer;
  Digito: integer;

begin
  Result := '';
  Try
    Soma := 0;
    k := 2;
    for i := Length(Numero) downto 1 do
    begin
      Soma := Soma + (StrToInt(Numero[i]) * k);
      Inc(k);
      if k > 9 then
        k := 2;
    end;
    Digito := 11 - Soma mod 11;
    if Digito >= 10 then
      Digito := 0;
    Result := Result + Chr(Digito + Ord('0'));
  except
    Result := 'X';
  end;
end;

Function LimpaCNPJ(cnpj: string): string;
begin
  Result := StringReplace(StringReplace(StringReplace(cnpj, '.', '',
    [rfReplaceAll]), '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll]);
end;

{ ------------------------------------------------------------------------------ }
Function Alltrim(Text: string): string;
begin
  while Pos(' ', Text) > 0 do
    Delete(Text, Pos(' ', Text), 1);
  Result := Text;
End;

{ ------------------------------------------------------------------------------ }
Function StrZero(Num: Real; Zeros, Deci: integer): string;
var
  tam, z: integer;
  res, zer: string;
begin
  str(Num: Zeros: Deci, res);
  res := Alltrim(res);
  tam := Length(res);
  zer := '';
  for z := 1 to (Zeros - tam) do
    zer := zer + '0';
  Result := zer + res
end;

{ ------------------------------------------------------------------------------ }
function PadLeft(const AString: String; const nLen: integer;
  const Caracter: char): String;
var
  tam: integer;
begin
  tam := Length(AString);
  if tam < nLen then
    Result := StringOfChar(Caracter, (nLen - tam)) + AString
  else
    Result := LeftStr(AString, nLen);
end;

{ ------------------------------------------------------------------------------ }
function add_Zero(const Texto: String; const Tamanho: integer): String;
begin
  Result := PadLeft(Trim(Texto), Tamanho, '0');
end;

Function MontaChaveAcessoNFe(codUF: integer; dtEmissao: TDateTime; cnpj: string;
  modelo, serie, numeroNF, codigoNumerico, tpEmi: integer): string;
var
  vUF, vDataEmissao, vSerie, vNumero, vCodigo, vModelo, vCNPJ, vtpEmi: String;
begin

  vUF := add_Zero(inttostr(codUF), 2);
  vDataEmissao := FormatDateTime('YYMM', dtEmissao);
  vCNPJ := PadLeft(soNumeros(cnpj), 14, '0');
  vModelo := add_Zero(inttostr(modelo), 2);
  vSerie := add_Zero(inttostr(serie), 3);
  vNumero := add_Zero(inttostr(numeroNF), 9);
  vtpEmi := add_Zero(inttostr(tpEmi), 1);
  vCodigo := add_Zero(inttostr(codigoNumerico), 8);

  Result := vUF + vDataEmissao + vCNPJ + vModelo + vSerie + vNumero + vtpEmi
    + vCodigo;
  Result := Result + Modulo11(Result);

end;

{ ------------------------------------------------------------------------------ }
procedure SendMessageServer(mensagem: string; tipo: string = '');
var
  msg: TmensagemServer;
begin
  if assigned(FGbDFEWebSocket) then
  begin
    try
      msg := TmensagemServer.Create;
      if tipo <> '' then
        msg.msgtype := tipo;
      msg.msgcontent := mensagem;
      FGbDFEWebSocket.enviarMensagem(msg);
    except
    end;
  end;

end;

class function Tutil.From<T>(Source: T): T;
var
  Context: TRttiContext;
  IsComponent, LookOutForNameProp: Boolean;
  RttiType: TRttiType;
  Method: TRttiMethod;
  MinVisibility: TMemberVisibility;
  Params: TArray<TRttiParameter>;
  Prop: TRttiProperty;
  SourceAsPointer, ResultAsPointer: Pointer;
begin
  RttiType := Context.GetType(Source.ClassType);
  // find a suitable constructor, though treat components specially
  IsComponent := (Source is TComponent);
  for Method in RttiType.GetMethods do
    if Method.IsConstructor then
    begin
      Params := Method.GetParameters;
      if Params = nil then
        Break;
      if (Length(Params) = 1) and IsComponent and
        (Params[0].ParamType is TRttiInstanceType) and
        SameText(Method.Name, 'Create') then
        Break;
    end;
  if Params = nil then
    Result := Method.Invoke(Source.ClassType, []).AsType<T>
  else
    Result := Method.Invoke(Source.ClassType, [TComponent(Source).Owner])
      .AsType<T>;
  try

    if Source is TControl then
      TControl(Result).Parent := TControl(Source).Parent;
    // loop through the props, copying values across for ones that are read/write
    Move(Source, SourceAsPointer, SizeOf(Pointer));
    Move(Result, ResultAsPointer, SizeOf(Pointer));
    LookOutForNameProp := IsComponent and (TComponent(Source).Owner <> nil);
    if IsComponent then
      MinVisibility := mvPublished
      // an alternative is to build an exception list
    else
      MinVisibility := mvPublic;
    for Prop in RttiType.GetProperties do
      if (Prop.Visibility >= MinVisibility) and Prop.IsReadable and Prop.IsWritable
      then
        if LookOutForNameProp and (Prop.Name = 'Name') and
          (Prop.PropertyType is TRttiStringType) then
          LookOutForNameProp := False
        else
          Prop.SetValue(ResultAsPointer, Prop.GetValue(SourceAsPointer));
  except
    Result.Free;
    raise;
  end;
end;

class function Tutil.parseDate(value: string): TDate;
var
  idate: TDateTime;
  lst: TStringList;
  day: word;
  year: word;
  month: word;
begin
  Result := 0;
  day := 0;
  year := 0;
  month := 0;
  Result := 0;
  lst := TStringList.Create;
  try
    if TryStrToDate(value, idate) then
      Result := idate
    else
    begin
      if Pos('-', value) > 0 then
      begin
        lst.Delimiter := '-';
        lst.DelimitedText := value;
        year := StrToInt(lst[0]);
        month := StrToInt(copy(lst[1], 0, 2));
        day := StrToInt(copy(lst[2], 0, 2));
        Result := EncodeDate(year, month, day)
      end;
    end;
  finally
    FreeAndNil(lst);
  end;
end;

class function Tutil.GetJsonValue(value: string; pjson: tJsonObject): string;
var
  Lresult: string;
  Ljson: tJsonObject;
begin
  Result := '';
  try
    Ljson := tJsonObject.ParseJSONValue(uppercase(pjson.ToString))
      as tJsonObject;
    if Ljson.TryGetValue(UpperCase( value), Lresult) then
      Result := Lresult;
  finally
    FreeAndNil(Ljson);
  end;
end;

class function Tutil.parseDateTime(value: string): TDateTime;
var
  idate: TDateTime;
  lst: TStringList;
  day: word;
  year: word;
  month: word;
  minut: word;
  second: word;
  hour: word;
  stime: string;
begin
  Result := 0;
  day := 0;
  year := 0;
  month := 0;
  minut := 0;
  second := 0;
  hour := 0;
  Result := 0;
  value := uppercase(value);
  lst := TStringList.Create;
  try
    if TryStrToDateTime(value, idate) then
      Result := idate
    else
    begin
      if Pos('-', value) > 0 then
      begin

        lst.Delimiter := '-';
        lst.DelimitedText := value;
        year := StrToInt(lst[0]);
        month := StrToInt(copy(lst[1], 0, 2));
        day := StrToInt(copy(lst[2], 0, 2));
        Result := EncodeDate(year, month, day)
      end;

      if Pos(':', value) > 0 then
      begin

        lst.Delimiter := ' ';
        lst.DelimitedText := value;
        if lst.Count > 1 then
        begin
          stime := lst[1];
          if stime <> '' then
          begin

            lst.Delimiter := ':';
            lst.DelimitedText := stime;
            if lst.Count > 1 then

              hour := StrToInt(lst[0]);
            if lst.Count > 2 then
              minut := StrToInt(lst[1]);
            if lst.Count > 3 then
              second := StrToInt(copy(lst[2], 0, 2));
            Result := Result + EncodeTime(hour, minut, second, 0);
          end;
        end
        else
        begin
          lst.Delimiter := ' ';
          lst.DelimitedText := value;
          if lst.Count > 1 then
          begin
            stime := lst[1];
            if stime <> '' then
            begin

              lst.Delimiter := 'T';
              lst.DelimitedText := stime;
              if lst.Count > 1 then

                hour := StrToInt(lst[0]);
              if lst.Count > 2 then
                minut := StrToInt(lst[1]);
              if lst.Count > 3 then
                second := StrToInt(copy(lst[2], 0, 2));
              Result := Result + EncodeTime(hour, minut, second, 0);
            end;
          end;
        end;
      end;

    end;
  finally
    FreeAndNil(lst);
  end;
end;

end.
