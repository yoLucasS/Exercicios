program Project1;

uses
  Vcl.Forms,
  U_Ex07 in 'U_Ex07.pas' {FormEx07};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEx07, FormEx07);
  Application.Run;
end.
