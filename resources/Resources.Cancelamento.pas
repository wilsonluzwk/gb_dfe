unit Resources.cancelamento;
interface
uses
  System.Classes,
  WK.Server.Attributes,
  System.Generics.Collections,
  WK.Server.ResourceBaseClass;
type

   [Resource('ResourceCancelamento')]
   [Table('cancelamento')]

   TResourceCancelamento = class(TResourceBaseClass)
   private
      
   protected
      procedure ValidateBusiness(List: TObjectList<TObject>); override; 
   public
     [DBField('ID'  ,True, True,false, PrimaryKey)]
     [AutoInc('cancelamento_id_seq')]
     Id : Integer;
     [DBField('CNPJ'  ,True, True,True, null)]
     Cnpj : String;
     [DBField('CODIGO_LOJA'  ,True, True,True, null)]
     CodigoLoja : String;
     [DBField('NUMERO'  ,True, True,True, null)]
     Numero : Integer;
     [DBField('SERIE'  ,True, True,True, null)]
     Serie : Integer;
     [DBField('CHAVE'  ,True, True,True, null)]
     Chave : String;
     [DBField('AMBIENTE'  ,True, True,True, null)]
     Ambiente : Integer;
     [DBField('PROTOCOLONOTA'  ,True, True,True, null)]
     Protocolonota : String;
     [DBField('PROTOCOLOCANCELAMENTO'  ,True, True,True, null)]
     Protocolocancelamento : String;
     [DBField('DATA'  ,True, True,True, null)]
     Data : String;
     [DBField('JUSTIFICATIVA'  ,True, True,True, null)]
     Justificativa : String;
     [DBField('CSTAT'  ,True, True,True, null)]
     Cstat : Integer;
     [DBField('XMOTIVO'  ,True, True,True, null)]
     Xmotivo : String;
     [DBField('XMLRETORNO'  ,True, True,True, null)]
     Xmlretorno : String;
     [DBField('DANFE'  ,True, True,True, null)]
     Danfe : String;
     [DBField('DANFEBASE64'  ,True, True,True, null)]
     Danfebase64 : String;
     [DBField('EMAILDESTINATARIO'  ,True, True,True, null)]
     Emaildestinatario : String;
     
	  
   end;

implementation

{TResourceCancelamento }
procedure TResourceCancelamento.ValidateBusiness(List: TObjectList<TObject>);
begin
end;
initialization

RegisterClass(TResourceCancelamento);

end.
