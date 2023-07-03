program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FormPilha};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPilha, FormPilha);
  Application.Run;
end.
