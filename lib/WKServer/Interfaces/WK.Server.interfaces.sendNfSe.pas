unit WK.Server.interfaces.sendNfSe;

interface

uses
  System.JSON, System.Rtti, WK.Server.Dto.NotaServico;

type

  iSendNfse = interface
    ['{92AF0645-D3E2-453D-82AF-089FCBBFCC75}']
    function Enviar(Token: string; Nota: TNotaServico;ambiente:Integer): TJSONObject;

  end;

implementation

end.
