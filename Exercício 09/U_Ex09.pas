unit U_Ex09;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormEx09 = class(TForm)
    btnGerar: TButton;
    lbFila1: TListBox;
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEx09: TFormEx09;

implementation

{$R *.dfm}

type
  TPessoa = class
    Nome: String;
  end;

  TCelula = class
    Item: TPessoa;
    Prox: TCelula;
  end;

  TFila = class
  private
    function CreateCelula: TCelula;
  public
    Head: TCelula;
    Tail: TCelula;
    procedure CreateHead;
    procedure Clear;
    constructor Create;
    destructor Destroy; override;
    procedure Enqueue(Item: TPessoa);
    function Dequeue: TPessoa;
    function Count: Integer;
    procedure OrdenarCrescente;
  end;

function TFila.CreateCelula: TCelula;
var
  Cel: TCelula;
begin
  Cel := TCelula.Create;
  Cel.Item := nil;
  Cel.Prox := nil;
  Result := Cel;
end;

constructor TFila.Create;
begin
  inherited;
  CreateHead;
end;

destructor TFila.Destroy;
begin
  Clear;
  Self.Head.Destroy;
  inherited;
end;

procedure TFila.Clear;
var
  Pessoa: TPessoa;
begin
  while Self.Head.Prox <> nil do
  begin
    Pessoa := Dequeue;
    Pessoa.Destroy;
  end;
end;

procedure TFila.CreateHead;
begin
  Self.Head := CreateCelula;
end;

procedure TFila.Enqueue(Item: TPessoa);
var
  Cel: TCelula;
begin
  Cel := CreateCelula;
  Cel.Item := Item;
  Cel.Prox := nil;
  if Self.Head.Prox = nil then
    Self.Head.Prox := Cel
  else
    Self.Tail.Prox := Cel;
  Self.Tail := Cel;
end;

procedure TFila.OrdenarCrescente;
var
  Atual, Proximo: TCelula;
  Temp: TPessoa;
begin
  Atual := Head.Prox;

  while Atual <> nil do
  begin
    Proximo := Atual.Prox;
    while Proximo <> nil do
    begin
      if StrToInt(Proximo.Item.Nome) < StrToInt(Atual.Item.Nome) then
      begin
        Temp := Atual.Item;
        Atual.Item := Proximo.Item;
        Proximo.Item := Temp;
      end;
      Proximo := Proximo.Prox;
    end;
    Atual := Atual.Prox;
  end;
end;

function TFila.Dequeue: TPessoa;
var
  Cel: TCelula;
begin
  Cel := Self.Head.Prox;
  if Cel = nil then
    Exit(nil);
  Self.Head.Prox := Cel.Prox;
  if Cel = Self.Tail then
    Self.Tail := nil;
  Result := Cel.Item;
  Cel.Destroy;
end;

function TFila.Count: Integer;
var
  i: Integer;
  Cel: TCelula;
begin
  Cel := Self.Head.Prox;
  i := 0;
  while Cel <> nil do
  begin
    i := i + 1;
    Cel := Cel.Prox;
  end;
  Result := i;
end;

procedure TFormEx09.btnGerarClick(Sender: TObject);
var
  f: TFila;
  Pessoa: TPessoa;
  i: Integer;
begin
  Randomize;
  f := TFila.Create;
  for i := 1 to 10 do
  begin
    Pessoa := TPessoa.Create;
    Pessoa.Nome := InputBox('Digite um n�mero', 'N�mero:', '');
    f.Enqueue(Pessoa);
  end;

  f.OrdenarCrescente;
  for i := 1 to f.Count do
  begin
    Pessoa := f.Dequeue;
    if Pessoa.Nome <> '' then
      lbFila1.Items.Add(Pessoa.Nome);
    Pessoa.Destroy;
  end;
end;

end.
