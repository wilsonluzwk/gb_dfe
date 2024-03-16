program GBDFEconfigurador;

uses
  Vcl.Forms,
  main in 'main.pas' {Fmain},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glow');
  Application.CreateForm(TFmain, Fmain);
  Application.Run;
end.
