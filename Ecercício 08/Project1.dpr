program Project1;

uses
  Vcl.Forms,
  U_Ex08 in 'U_Ex08.pas' {FormEx08};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEx08, FormEx08);
  Application.Run;
end.
