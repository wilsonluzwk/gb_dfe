unit Wk.Utils.SectionVariables;

interface

uses
  classes;

type
  TSectionVariables = record
    CnpjEmpresa: string;
    CodigoErp:Integer;
    TenantId:String;
    Usuario: String;
    Username: String;
    Nome: String;
    Enabled: Boolean;
    Admin: Boolean;
    IpClient: string;

  end;

threadvar FTSectionVariables: TSectionVariables;

implementation

end.
