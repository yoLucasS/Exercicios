unit U_Ex05;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormEx05 = class(TForm)
    Pilha01: TListBox;
    Pilha02: TListBox;
    btnGerar: TButton;
    Pilha03: TListBox;
    btnJuntar: TButton;
    edt_QtdPilha: TEdit;
    procedure btnGerarClick(Sender: TObject);
    procedure btnJuntarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEx05: TFormEx05;

implementation

{$R *.dfm}

type
  TPessoa = class
    nome: string;
  end;

  TCelula = class
    Item: TPessoa;
    Prox: TCelula;
  end;

  TPilha = class
  private
    function CreateCel: TCelula;
  public
    Head: TCelula;
    procedure CreateHead;
    procedure Clear; // Apaga todos os itens da pilha
    constructor Create;
    destructor Destroy; override;
    procedure StackUp(Item: TPessoa);
    function Unstack: TPessoa;
    function Count: Integer;
    procedure OrdenarDecrescente; // Ordena a pilha em ordem decrescente
  end;

function TPilha.CreateCel: TCelula;
var
  Cel: TCelula;
begin
  Cel := TCelula.Create;
  Cel.Item := nil;
  Cel.Prox := nil;
  Result := Cel;
end;

function TPilha.Count: Integer;
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

constructor TPilha.Create;
begin
  inherited;
  CreateHead;
end;

destructor TPilha.Destroy;
begin
  Clear;
  Self.Head.Destroy;
  inherited;
end;

procedure TPilha.Clear;
var
  Pessoa: TPessoa;
begin
  while Self.Head.Prox <> nil do
  begin
    Pessoa := Unstack;
    Pessoa.Destroy;
  end;
end;

procedure TPilha.CreateHead;
begin
  Self.Head := CreateCel;
end;

procedure TPilha.StackUp(Item: TPessoa);
var
  Cel: TCelula;
begin
  Cel := CreateCel;
  Cel.Item := Item;
  Cel.Prox := Self.Head.Prox;
  Self.Head.Prox := Cel;
end;

function TPilha.Unstack: TPessoa;
var
  Cel: TCelula;
begin
  Cel := Self.Head.Prox;
  Self.Head.Prox := Cel.Prox;
  Result := Cel.Item;
  Cel.Destroy;
end;

procedure TPilha.OrdenarDecrescente;
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
      if StrToInt(Proximo.Item.nome) > StrToInt(Atual.Item.nome) then
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

procedure TFormEx05.btnGerarClick(Sender: TObject);
var
  i, qtdP: Integer;
  p: TPilha;
  resultP: real;
  Item: TPessoa;
begin
  Randomize;
  p := TPilha.Create;
  qtdP := StrToInt(edt_QtdPilha.Text);
  resultP := qtdP / 2;
  for i := 1 to qtdP do
  begin
    Item := TPessoa.Create;
    Item.nome := IntToStr(Random(1000));
    p.StackUp(Item);
  end;

  Pilha01.Clear;
  Pilha02.Clear;
  p.OrdenarDecrescente;
  for i := 1 to p.Count do
  begin
    Item := p.Unstack;

    if Pilha01.Items.Count > resultP -1 then
    begin
      Pilha02.Items.Add(Item.nome);
    end
    else
    begin
      Pilha01.Items.Add(Item.nome);
    end;

    Item.Destroy;
  end;

  p.Destroy;
end;

procedure TFormEx05.btnJuntarClick(Sender: TObject);
var
  i, x: Integer;
  Item, Item2: TPessoa;
begin
  Pilha03.Clear;
  Item := TPessoa.Create;
  Item2 := TPessoa.Create;
  try
    for i := 0 to Pilha01.Items.Count - 1 do
    begin
      Item.nome := Pilha01.Items.Strings[i];
      Pilha03.Items.Add(Item.nome);
    end;

    for x := 0 to Pilha02.Count - 1 do
    begin
      Item2.nome := Pilha02.Items.Strings[x];
      Pilha03.Items.Add(Item2.nome);
    end;
  finally
    Item.Free;
    Item2.Free;
  end;
end;

end.
