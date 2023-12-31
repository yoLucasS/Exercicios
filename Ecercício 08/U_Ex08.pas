unit U_Ex08;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
    //procedure OrdenarDecrescente; // Ordena a pilha em ordem decrescente
  end;

  TFormEx08 = class(TForm)
    Pilha: TListBox;
    btnInserir: TButton;
    edtItem: TEdit;
    procedure btnInserirClick(Sender: TObject);
  private
    PilhaDados: TPilha; // Declaração da pilha de dados
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FormEx08: TFormEx08;

implementation

{$R *.dfm}

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
  Cel, Anterior, Atual: TCelula;
begin
  Anterior := Head;
  Atual := Head.Prox;
  while (Atual <> nil) and (StrToInt(Atual.Item.nome) > StrToInt(Item.nome)) do
  begin
    Anterior := Atual;
    Atual := Atual.Prox;
  end;
  Cel := CreateCel;
  Cel.Item := Item;
  Cel.Prox := Atual;
  Anterior.Prox := Cel;
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

constructor TFormEx08.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  PilhaDados := TPilha.Create;
end;

destructor TFormEx08.Destroy;
begin
  PilhaDados.Destroy;
  inherited Destroy;
end;

procedure TFormEx08.btnInserirClick(Sender: TObject);
var
  Item: TPessoa;
  Cel: TCelula;
begin

  Item := TPessoa.Create;
  Item.nome := edtItem.Text;

  PilhaDados.StackUp(Item);

  Pilha.Clear;
  Cel := PilhaDados.Head.Prox;
  while (Cel <> nil) do
  begin

    Pilha.Items.Add(Cel.Item.nome);
    Cel := Cel.Prox;
  end;

end;

end.
