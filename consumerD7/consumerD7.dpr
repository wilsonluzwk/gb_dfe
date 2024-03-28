program consumerD7;

uses
  Forms,
  utesteMain in 'utesteMain.pas' {fmain},
  consumerApi in 'consumerApi.pas',
  uhttpClient in 'uhttpClient.pas',

  geradorXml in 'geradorXml.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfmain, fmain);
  Application.Run;
end.

