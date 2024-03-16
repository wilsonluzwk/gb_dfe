unit dfe.dao.log;

interface

Uses
  windows,
  sysutils,
  REST.JSON.Types,
  REST.JSON,
  system.JSON,
  dfe.dao.base,
  dfe.model.log,
  system.JSON.Types,
  system.JSON.BSON,
  system.JSON.Builders,
  system.Rtti,
  system.JSON.Readers,
  system.Diagnostics,
  FireDAC.Stan.Util,
  classes;

type
  TDaoLog = class(TDaoBase)
  private

  public
    procedure gravarLog(plog:Tlog);

    function listLog(param: TJSONObject): TLogs ;

  end;

implementation

{ TDaoLog }
{----------------------------------------------------------------------------}

{----------------------------------------------------------------------------}
procedure TDaoLog.gravarLog(plog: Tlog)  ;
Begin
end;


{----------------------------------------------------------------------------}
function TDaoLog.listLog(param: TJSONObject): Tlogs;

begin


end;
{----------------------------------------------------------------------------}
end.
