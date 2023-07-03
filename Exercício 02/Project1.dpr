program Project1;

uses
  Vcl.Forms,
  U_Ex2 in 'U_Ex2.pas' {FormEx2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEx2, FormEx2);
  Application.Run;
end.
