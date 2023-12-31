unit U_Ex3;

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
    procedure StackUp(Item: TPessoa);
    function Unstack: TPessoa;
    function Count: Integer;
  end;

  TFormEx3 = class(TForm)
    listPilha: TListBox;
    lbFila: TListBox;
    btnGerar: TButton;
    procedure btnGerarClick(Sender: TObject);
  private
    procedure InverterPilhaParaFila(Pilha: TPilha);
  public
  end;

var
  FormEx3: TFormEx3;

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
    Pessoa := Unstack;
    Pessoa.Destroy;
  end;
end;

procedure TFormEx3.InverterPilhaParaFila(Pilha: TPilha);
var
  Queue: TQueue;
  Pessoa: TPessoa;
  PilhaCopia: TPilha;
begin
  Randomize;

  listPilha.Clear;
  PilhaCopia := TPilha.Create; // Cria uma c�pia da pilha
  // Preenche a c�pia da pilha e exibe os itens no ListBox da pilha
  while Pilha.Count > 0 do
  begin
    Pessoa := Pilha.Unstack;
    listPilha.Items.Add(Pessoa.nome);
    PilhaCopia.StackUp(Pessoa); // Armazena a c�pia na ordem correta
  end;
  try
    Queue := TQueue.Create;
    lbFila.Clear;
    try
      // Preenche a fila e exibe os itens no ListBox da fila
      while PilhaCopia.Count > 0 do
      begin
        Pessoa:=PilhaCopia.Unstack;
        Queue.Enqueue(Pessoa);
        lbFila.Items.Add(Pessoa.nome);
      end;
    finally
      Queue.Free;
    end;
  finally
    PilhaCopia.Free;
  end;
end;

procedure TFormEx3.btnGerarClick(Sender: TObject);
var
  Pilha: TPilha;
  Pessoa: TPessoa;
  i: Integer;
begin
  Pilha := TPilha.Create;
  try
    Randomize;
    for i := 1 to 5 do
    begin
      Pessoa := TPessoa.Create;
      Pessoa.nome := IntToStr(Random(100));
      Pilha.StackUp(Pessoa);
    end;

    InverterPilhaParaFila(Pilha);
  finally
    Pilha.Free;
  end;
end;

end.

