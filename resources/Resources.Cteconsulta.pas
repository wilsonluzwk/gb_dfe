unit Resources.cteconsulta;
interface
uses
  System.Classes,

   WK.Server.Attributes,
  System.Generics.Collections,
  WK.Server.ResourceBaseClass;
type

   [Resource('cteconsulta')]
   [Table('cteconsulta')]

   TResourceCteconsulta = class(TResourceBaseClass)
   private
      
   protected
      procedure ValidateBusiness(List: TObjectList<TObject>); override; 
   public
     [DBField('ID'  ,True, True,false, PrimaryKey)]
     Id : double;
     [DBField('CODIGO_LOJA'  ,True, True,True, NotNull)]
     CodigoLoja : Integer;
     [DBField('NSU'  ,True, True,True, null)]
     Nsu : String;
     [DBField('CHDFE'  ,True, True,True, null)]
     Chdfe : String;
     [DBField('CNPJCPF'  ,True, True,True, null)]
     Cnpjcpf : String;
     [DBField('XNOME'  ,True, True,True, null)]
     Xnome : String;
     [DBField('IE'  ,True, True,True, null)]
     Ie : String;
     [DBField('DHEMI'  ,True, True,True, null)]
     Dhemi : TDateTime;
     [DBField('TPNF'  ,True, True,True, null)]
     Tpnf : String;
     [DBField('VNF'  ,True, True,True, null)]
     Vnf : double;
     [DBField('DIGVAL'  ,True, True,True, null)]
     Digval : String;
     [DBField('DHRECBTO'  ,True, True,True, null)]
     Dhrecbto : TDateTime;
     [DBField('NPROT'  ,True, True,True, null)]
     Nprot : String;
     [DBField('CSITDFE'  ,True, True,True, null)]
     Csitdfe : String;
     [DBField('EVENTOCORGAO'  ,True, True,True, null)]
     Eventocorgao : Integer;
     [DBField('EVENTOCNPJCPF'  ,True, True,True, null)]
     Eventocnpjcpf : String;
     [DBField('EVENTOCHDFE'  ,True, True,True, null)]
     Eventochdfe : String;
     [DBField('EVENTODHEVENTO'  ,True, True,True, null)]
     Eventodhevento : TDateTime;
     [DBField('EVENTOTPEVENTO'  ,True, True,True, null)]
     Eventotpevento : String;
     [DBField('EVENTONSEQEVENTO'  ,True, True,True, null)]
     Eventonseqevento : Integer;
     [DBField('EVENTOXEVENTO'  ,True, True,True, null)]
     Eventoxevento : String;
     [DBField('EVENTODHRECBTO'  ,True, True,True, null)]
     Eventodhrecbto : TDateTime;
     [DBField('EVENTONPROT'  ,True, True,True, null)]
     Eventonprot : String;
     [DBField('XML'  ,True, True,True, null)]
     Xml : String;

	  
   end;

implementation

{TResourceCteconsulta }
procedure TResourceCteconsulta.ValidateBusiness(List: TObjectList<TObject>);
begin
end;
initialization

RegisterClass(TResourceCteconsulta);

end.
