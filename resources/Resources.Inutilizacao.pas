unit Resources.inutilizacao;
interface
uses
  System.Classes,
  WK.Server.Attributes,
  System.Generics.Collections,
  WK.Server.ResourceBaseClass;
type

   [Resource('inutilizacao')]
   [Table('inutilizacao')]

   TResourceInutilizacao = class(TResourceBaseClass)
   private
      
   protected
      procedure ValidateBusiness(List: TObjectList<TObject>); override; 
   public
     [DBField('ID'  ,True, True,false, PrimaryKey)]
     [AutoInc('inutilizacao_id_seq')]
     Id : Integer;
     [DBField('CNPJ'  ,True, True,True, null)]
     Cnpj : String;
     [DBField('NUMEROINICIAL'  ,True, True,True, null)]
     Numeroinicial : Integer;
     [DBField('NUMEROFINAL'  ,True, True,True, null)]
     Numerofinal : Integer;
     [DBField('SERIE'  ,True, True,True, null)]
     Serie : Integer;
     [DBField('MODELO'  ,True, True,True, null)]
     Modelo : String;
     [DBField('ANO'  ,True, True,True, null)]
     Ano : Integer;
     [DBField('JUSTIFICATIVA'  ,True, True,True, null)]
     Justificativa : String;
     [DBField('PROTOCOLO'  ,True, True,True, null)]
     Protocolo : String;
     [DBField('XMOTIVO'  ,True, True,True, null)]
     Xmotivo : String;
     [DBField('CSTAT'  ,True, True,True, null)]
     Cstat : Integer;
     [DBField('XMLEVENTO'  ,True, True,True, null)]
     Xmlevento : String;
     [DBField('DANFE'  ,True, True,True, null)]
     Danfe : String;
     [DBField('DANFEBASE64'  ,True, True,True, null)]
     Danfebase64 : String;
     [DBField('DHRECBTO'  ,True, True,True, null)]
     Dhrecbto : TDateTime;
     [DBField('TPAMB'  ,True, True,True, null)]
     Tpamb : String;
     [DBField('UF'  ,True, True,True, null)]
     Uf : String;
     [DBField('VERAPLIC'  ,True, True,True, null)]
     Veraplic : String;
     
	  
   end;

implementation

{TResourceInutilizacao }
procedure TResourceInutilizacao.ValidateBusiness(List: TObjectList<TObject>);
begin
end;
initialization

RegisterClass(TResourceInutilizacao);

end.
