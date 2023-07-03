program Project1;

uses
  Vcl.Forms,
  U_Ex09 in 'U_Ex09.pas' {FormEx09};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEx09, FormEx09);
  Application.Run;
end.
