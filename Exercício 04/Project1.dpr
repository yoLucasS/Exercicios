program Project1;

uses
  Vcl.Forms,
  U_Ex04 in 'U_Ex04.pas' {FormEx04};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEx04, FormEx04);
  Application.Run;
end.
