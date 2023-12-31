unit U_Ex04;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TPessoa = class
    nome: string;
  end;

  TCelula = class
    Item: TPessoa;
    Prox: TCelula;
  end;

  TQueue = class
  private
    FHead: TCelula;
    FTail: TCelula;
    function CreateCelulaQ: TCelula;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Enqueue(Item: TPessoa);
    function Dequeue: TPessoa;
    function Peek: TPessoa; // Novo m�todo para acessar o elemento da cabe�a da fila
    function Count: Integer;
    procedure Clear;
  end;

  TPilha = class
  private
    function CreateCelula: TCelula;
  public
    Head: TCelula;
    procedure CreateHead;
    procedure Clear;
    constructor Create;
    destructor Destroy; override;
    procedure Push(Item: TPessoa);
    function Pop: TPessoa;
    function Count: Integer;
  end;

  TFormEx04 = class(TForm)
    lbFila: TListBox;
    lbPilha: TListBox;
    btnGerar: TButton;
    procedure btnGerarClick(Sender: TObject);
  private
    procedure InverterFilaParaPilha(Fila: TQueue);
  public
  end;

var
  FormEx04: TFormEx04;

implementation

{$R *.dfm}

constructor TQueue.Create;
begin
  FHead := nil;
  FTail := nil;
end;

function TQueue.CreateCelulaQ: TCelula;
var
  Cel: TCelula;
begin
  Cel := TCelula.Create;
  Cel.Item := nil;
  Cel.Prox := nil;
  Result := Cel;
end;

destructor TQueue.Destroy;
begin
  Clear;
  inherited;
end;

procedure TQueue.Enqueue(Item: TPessoa);
var
  Cel: TCelula;
begin
  Cel := CreateCelulaQ;
  Cel.Item := Item;
  if FTail = nil then
  begin
    FHead := Cel;
    FTail := Cel;
  end
  else
  begin
    FTail.Prox := Cel;
    FTail := Cel;
  end;
end;

function TQueue.Dequeue: TPessoa;
var
  Cel: TCelula;
begin
  if FHead <> nil then
  begin
    Cel := FHead;
    FHead := FHead.Prox;
    if FHead = nil then
      FTail := nil;
    Result := Cel.Item;
    Cel.Free;
  end
  else
    Result := nil;
end;

function TQueue.Peek: TPessoa;
begin
  if FHead <> nil then
    Result := FHead.Item
  else
    Result := nil;
end;

function TQueue.Count: Integer;
var
  Cel: TCelula;
begin
  Cel := FHead;
  Result := 0;
  while Cel <> nil do
  begin
    Inc(Result);
    Cel := Cel.Prox;
  end;
end;

procedure TQueue.Clear;
var
  Cel: TCelula;
begin
  while FHead <> nil do
  begin
    Cel := FHead;
    FHead := FHead.Prox;
    Cel.Free;
  end;
  FTail := nil;
end;

constructor TPilha.Create;
begin
  inherited;
  CreateHead;
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

procedure TPilha.CreateHead;
begin
  Self.Head := CreateCelula;
end;

destructor TPilha.Destroy;
begin
  Clear;
  Self.Head.Destroy;
  inherited;
end;

procedure TPilha.Push(Item: TPessoa);
var
  Cel: TCelula;
begin
  Cel := CreateCelula;
  Cel.Item := Item;
  Cel.Prox := Self.Head.Prox;
  Self.Head.Prox := Cel;
end;

function TPilha.Pop: TPessoa;
var
  Cel: TCelula;
begin
  Cel := Self.Head.Prox;
  Self.Head.Prox := Cel.Prox;
  Result := Cel.Item;
  Cel.Destroy;
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
    Inc(i);
    Cel := Cel.Prox;
  end;
  Result := i;
end;

procedure TPilha.Clear;
var
  Pessoa: TPessoa;
begin
  while Self.Head.Prox <> nil do
  begin
    Pessoa := Pop;
    Pessoa.Destroy;
  end;
end;

procedure TFormEx04.InverterFilaParaPilha(Fila: TQueue);
var
  Pilha: TPilha;
  Pessoa: TPessoa;
begin
  Pilha := TPilha.Create;
  try
    lbPilha.Clear;

    while Fila.Count > 0 do
    begin
      Pessoa := Fila.Dequeue;
      lbFila.Items.Add(Pessoa.nome);
      Pilha.Push(Pessoa);
    end;

    while Pilha.Count > 0 do
    begin
      Pessoa := Pilha.Pop;
      lbPilha.Items.Add(Pessoa.nome);
    end;
  finally
    Pilha.Free;
  end;
end;

procedure TFormEx04.btnGerarClick(Sender: TObject);
var
  Fila: TQueue;
  Pessoa: TPessoa;
  i: Integer;
begin
  Fila := TQueue.Create;
  lbFila.Items.Clear;
  try
    Randomize;
    for i := 1 to 5 do
    begin
      Pessoa := TPessoa.Create;
      Pessoa.nome := IntToStr(Random(100));
      Fila.Enqueue(Pessoa);
    end;

    InverterFilaParaPilha(Fila);
  finally
    Fila.Free;
  end;
end;

end.

