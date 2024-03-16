unit Resources.cteservicocomplementar;
interface
uses
  System.Classes,
  WK.Server.Attributes,
  System.Generics.Collections,
  WK.Server.ResourceBaseClass;
type

   [Resource('cteservicocomplementar')]
   [Table('cteservicocomplementar')]

   TCteservicocomplementar = class(TResourceBaseClass)
   private
      
   protected
      procedure ValidateBusiness(List: TObjectList<TObject>); override; 
   public
     [DBField('CTEID'  ,True, True,false, NotNull)]
     Cteid : Integer;
     [DBField('XNOME'  ,True, True,True, null)]
     Xnome : String;
     [DBField('VCOMP'  ,True, True,True, null)]
     Vcomp : double;
     
	  
   end;

implementation

{TCteservicocomplementar }
procedure TCteservicocomplementar.ValidateBusiness(List: TObjectList<TObject>);
begin
end;
initialization

RegisterClass(TCteservicocomplementar);

end.
