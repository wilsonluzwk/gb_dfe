unit Resources.cteexpedidor;
interface
uses
  System.Classes,
  WK.Server.Attributes,
  System.Generics.Collections,
  WK.Server.ResourceBaseClass;
type

   [Resource('cteexpedidor')]
   [Table('cteexpedidor')]

   TCteexpedidor = class(TResourceBaseClass)
   private
      
   protected
      procedure ValidateBusiness(List: TObjectList<TObject>); override; 
   public
     [DBField('CTEID'  ,True, True,false, NotNull)]
     Cteid : Integer;
     [DBField('CNPJ_CPF'  ,True, True,True, null)]
     CnpjCpf : String;
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
     [DBField('CPAIS'  ,True, True,True, null)]
     Cpais : Integer;
     [DBField('XPAIS'  ,True, True,True, null)]
     Xpais : String;
     
	  
   end;

implementation

{TCteexpedidor }
procedure TCteexpedidor.ValidateBusiness(List: TObjectList<TObject>);
begin
end;
initialization

RegisterClass(TCteexpedidor);

end.
