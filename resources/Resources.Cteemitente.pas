unit Resources.cteemitente;
interface
uses
  System.Classes,
  WK.Server.Attributes,
  System.Generics.Collections,
  WK.Server.ResourceBaseClass;
type

   [Resource('cteemitente')]
   [Table('cteemitente')]

   TCteemitente = class(TResourceBaseClass)
   private
      
   protected
      procedure ValidateBusiness(List: TObjectList<TObject>); override; 
   public
     [DBField('CTEID'  ,True, True,false, NotNull)]
     Cteid : Integer;
     [DBField('CNPJ'  ,True, True,True, null)]
     Cnpj : String;
     [DBField('IE'  ,True, True,True, null)]
     Ie : String;
     [DBField('XNOME'  ,True, True,True, null)]
     Xnome : String;
     [DBField('XLGR'  ,True, True,True, null)]
     Xlgr : String;
     [DBField('NRO'  ,True, True,True, null)]
     Nro : String;
     [DBField('XBAIRRO'  ,True, True,True, null)]
     Xbairro : String;
     [DBField('CMUN'  ,True, True,True, null)]
     Cmun : Integer;
     [DBField('XMUN'  ,True, True,True, null)]
     Xmun : String;
     [DBField('CEP'  ,True, True,True, null)]
     Cep : Integer;
     [DBField('UF'  ,True, True,True, null)]
     Uf : String;
     [DBField('FONE'  ,True, True,True, null)]
     Fone : String;
     
	  
   end;

implementation

{TCteemitente }
procedure TCteemitente.ValidateBusiness(List: TObjectList<TObject>);
begin
end;
initialization

RegisterClass(TCteemitente);

end.
