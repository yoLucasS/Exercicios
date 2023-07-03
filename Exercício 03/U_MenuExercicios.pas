unit U_MenuExercicios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Unit1, U_Ex2, U_Ex3, Main;

type
  TFormMenuExercicios = class(TForm)
    pnl_Ex1: TPanel;
    pnl_Ex2: TPanel;
    pnl_Ex3: TPanel;
    procedure pnl_Ex1Click(Sender: TObject);
    procedure pnl_Ex2Click(Sender: TObject);
    procedure pnl_Ex3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenuExercicios: TFormMenuExercicios;

implementation

{$R *.dfm}

procedure TFormMenuExercicios.pnl_Ex1Click(Sender: TObject);
begin
  FormPilha.ShowModal;
end;

procedure TFormMenuExercicios.pnl_Ex2Click(Sender: TObject);
begin
  FormEx2.ShowModal;
end;

procedure TFormMenuExercicios.pnl_Ex3Click(Sender: TObject);
begin
  FormEx3.ShowModal;
end;

end.
