program INFOTest;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  ViaCEP in 'ViaCEP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Auric');
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
