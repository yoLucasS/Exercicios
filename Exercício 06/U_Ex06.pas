unit U_Ex06;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnGerar: TButton;
    StdOut: TListBox;
    StdOut2: TListBox;
    btnVerificar: TButton;
    procedure btnGerarClick(Sender: TObject);
    procedure btnVerificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

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

  TPilha = class
  private
    function CreateCelula: TCelula;
    // Cria uma nova inst�ncia de TCelula e retorna como resultado
  public
    Head: TCelula;
    procedure CreateHead;
    procedure Clear; // Apaga todos os itens da pilha
    constructor Create;
    destructor Destroy; override;
    procedure StackUp(Item: TPessoa);
    function Unstack: TPessoa;
    function Count: Integer;
  end;

function TPilha.CreateCelula: TCelula;
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
  Self.Head := CreateCelula;
end;

procedure TPilha.StackUp(Item: TPessoa);
var
  Cel: TCelula;
begin
  Cel := CreateCelula;
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

procedure TForm1.btnGerarClick(Sender: TObject);
var
  p, p2: TPilha;
  Pessoa: TPessoa;
  i: Integer;
begin
  Randomize;
  p := TPilha.Create;
  p2 := TPilha.Create;
  for i := 1 to 2 do
  begin
    Pessoa := TPessoa.Create;
    Pessoa.Nome := IntToStr(Random(20));
    p.StackUp(Pessoa);
  end;
  StdOut.Items.Clear;
  for i := 1 to p.Count do
  begin
    Pessoa := p.Unstack;
    StdOut.Items.Add(Pessoa.Nome);
    Pessoa.Destroy;
  end;

  for i := 1 to 50 do
  begin
    Pessoa := TPessoa.Create;
    Pessoa.Nome := IntToStr(Random(20));
    p2.StackUp(Pessoa);
  end;
  StdOut2.Items.Clear;
  for i := 1 to p2.Count do
  begin
    Pessoa := p2.Unstack;
    StdOut2.Items.Add(Pessoa.Nome);
    Pessoa.Destroy;
  end;
  p.Destroy;
  p2.Destroy;
end;

procedure TForm1.btnVerificarClick(Sender: TObject);
var
  i, x: Integer;
  p: TPilha;
  Item: TPessoa;
  TodosPresentes: Boolean;
begin
  Item := TPessoa.Create;
  p := TPilha.Create;
  TodosPresentes := True;

  for i := 0 to StdOut.Count - 1 do
  begin
    Item.Nome := StdOut.Items.Strings[i];
    TodosPresentes := False;

    for x := 0 to StdOut2.Count - 1 do
    begin
      if Item.Nome = StdOut2.Items.Strings[x] then
      begin
        TodosPresentes := True;
        Break;
      end;
    end;

    if not TodosPresentes then
      Break;
  end;

  if TodosPresentes then
    ShowMessage('Todos os valores de StdOut est�o contidos em StdOut2.')
  else
    ShowMessage('Alguns valores de StdOut n�o est�o presentes em StdOut2.');

  Item.Free;
  p.Free;
end;

end.
