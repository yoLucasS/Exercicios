program Project1;

uses
  Vcl.Forms,
  U_Ex06 in 'U_Ex06.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
