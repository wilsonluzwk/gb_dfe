unit WK.Server.Singleton.Codigo;

interface

uses
  WK.Server.Records,
  System.SysUtils,
  System.DateUtils,
  System.Generics.Collections;

type
  TServerSingletonCodigo = class
  private
    class var FInstance:TServerSingletonCodigo;
    var FListCodigo: TList<TSingletonCodigo>;
  public
    constructor Create;
    destructor Destroy; override;
    class function GetInstance:TServerSingletonCodigo;
    procedure AddCodigo(const ACodigo,AEmail:string);
    function ValidateCodigo(const ACodigo,AEmail:string):boolean;
  end;

implementation

{ TServerSingletonCodigo }

procedure TServerSingletonCodigo.AddCodigo(const ACodigo,AEmail:string);
begin
  var LSingle:TSingletonCodigo;
  LSingle.Codigo := ACodigo;
  LSingle.Email := AEmail;  
  LSingle.TempoExpiracao := Now + StrToTime('00:10:00');
  FListCodigo.Add(LSingle);
end;

constructor TServerSingletonCodigo.Create;
begin
  FListCodigo := TList<TSingletonCodigo>.Create;
end;

destructor TServerSingletonCodigo.Destroy;
begin
  FListCodigo.Free;
  inherited;
end;

class function TServerSingletonCodigo.GetInstance: TServerSingletonCodigo;
begin
  if not Assigned(FInstance) then
    FInstance := TServerSingletonCodigo.Create;
  Result := FInstance;     
end;

function TServerSingletonCodigo.ValidateCodigo(const ACodigo,AEmail:string): boolean;
begin
  Result := False;
  for var LItem in FListCodigo do
  begin
    if LItem.Codigo.Equals(ACodigo) and ( LowerCase(LItem.Email) = LowerCase(AEmail) )then
    begin
      var LNow := Date + Time;
      if LItem.TempoExpiracao > LNow then
      begin
        FListCodigo.Remove(LItem);
        Result := True;
      end;
    end;
  end;
end;
initialization 
finalization
  if Assigned(TServerSingletonCodigo.FInstance)then
    TServerSingletonCodigo.FInstance.Free;
end.
