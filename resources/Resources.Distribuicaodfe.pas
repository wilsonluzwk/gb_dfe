unit Resources.distribuicaodfe;

interface

uses
  System.Classes,
  WK.Server.Attributes,
  System.Generics.Collections,
  WK.Server.ResourceBaseClass;

type

  [Resource('distribuicaodfe')]
  [Table('distribuicaodfe')]

  TDistribuicaodfe = class(TResourceBaseClass)
  private

  protected
    procedure ValidateBusiness(List: TObjectList<TObject>); override;
  public
    [DBField('ID', True, True, false, PrimaryKey)]
    [AutoInc('distribuicaodfe_id_seq')]
    Id: Integer;
    [DBField('NSU', True, True, True, null)]
    Nsu: String;
    [DBField('CHDFE', True, True, True, null)]
    Chdfe: String;
    [DBField('CNPJCPF', True, True, True, null)]
    Cnpjcpf: String;
    [DBField('XNOME', True, True, True, null)]
    Xnome: String;
    [DBField('IE', True, True, True, null)]
    Ie: String;
    [DBField('DHEMI', True, True, True, null)]
    Dhemi: TDateTime;
    [DBField('TPNF', True, True, True, null)]
    Tpnf: Integer;
    [DBField('VNF', True, True, True, null)]
    Vnf: double;
    [DBField('DIGVAL', True, True, True, null)]
    Digval: String;
    [DBField('DHRECBTO', True, True, True, null)]
    Dhrecbto: TDateTime;
    [DBField('CSTAT', True, True, True, null)]
    Cstat: Integer;
    [DBField('XMOTIVO', True, True, True, null)]
    Xmotivo: String;
    [DBField('CSITDFE', True, True, True, null)]
    Csitdfe: String;
    [DBField('DANFE', True, True, True, null)]
    Danfe: String;
    [DBField('nProt', True, True, True, null)]
    nProt: String;
    [DBField('tpEvento', True, True, True, null)]
    tpEvento: String;
    [DBField('tpEventoDesc', True, True, True, null)]
    tpEventoDesc: String;

  end;

implementation

{ TDistribuicaodfe }
procedure TDistribuicaodfe.ValidateBusiness(List: TObjectList<TObject>);
begin
end;

initialization

RegisterClass(TDistribuicaodfe);

end.
