program MenuExercicios;

uses
  Vcl.Forms,
  U_MenuExercicios in 'U_MenuExercicios.pas' {FormMenuExercicios},
  Unit1 in '..\..\..\..\..\Downloads\Exercicios\Exercício 01\Unit1.pas' {FormPilha},
  U_Ex2 in '..\..\..\..\..\Downloads\Exercicios\Exercício 02\U_Ex2.pas' {FormEx2},
  U_Ex3 in 'U_Ex3.pas' {FormEx3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenuExercicios, FormMenuExercicios);
  Application.CreateForm(TFormPilha, FormPilha);
  Application.CreateForm(TFormEx2, FormEx2);
  Application.CreateForm(TFormEx3, FormEx3);
  Application.Run;
end.
