unit U_Ex2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections;

type
  PFila = ^TFila;

  TFila = class
  private
    Lista: TQueue<Integer>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Enqueue(Item: Integer);
    function Dequeue: Integer;
    function Count: Integer;
  end;

  PPilha = ^TPilha;

  TPilha = class
  private
    Lista: TList<Integer>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Push(Item: Integer);
    function Pop: Integer;
    function Count: Integer;
  end;

  TFormEx2 = class(TForm)
    btnGerar: TButton;
    listNum: TListBox;
    listPar: TListBox;
    Label1: TLabel;
    listImpar: TListBox;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnGerarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Fila: PFila;
    PilhaPar: PPilha;
    PilhaImpar: PPilha;
  public
    { Public declarations }
  end;

var
  FormEx2: TFormEx2;

implementation

{$R *.dfm}

constructor TFila.Create;
begin
  Lista := TQueue<Integer>.Create;
end;

destructor TFila.Destroy;
begin
  Lista.Free;
  inherited;
end;

procedure TFila.Enqueue(Item: Integer);
begin
  Lista.Enqueue(Item);
end;

function TFila.Dequeue: Integer;
begin
  Result := Lista.Dequeue;
end;

function TFila.Count: Integer;
begin
  Result := Lista.Count;
end;

constructor TPilha.Create;
begin
  Lista := TList<Integer>.Create;
end;

destructor TPilha.Destroy;
begin
  Lista.Free;
  inherited;
end;

procedure TPilha.Push(Item: Integer);
begin
  Lista.Insert(0, Item);
end;

function TPilha.Pop: Integer;
begin
  Result := Lista[0];
  Lista.Delete(0);
end;

function TPilha.Count: Integer;
begin
  Result := Lista.Count;
end;

procedure TFormEx2.btnGerarClick(Sender: TObject);
var
  int: Integer;
  i: Integer;
begin
  listNum.Clear;
  listPar.Clear;
  listImpar.Clear;

  Randomize;

  New(Fila);
  Fila^ := TFila.Create;

  New(PilhaPar);
  PilhaPar^ := TPilha.Create;

  New(PilhaImpar);
  PilhaImpar^ := TPilha.Create;

  try
    for i := 1 to 5 do
    begin
      int := 1 + Random(1000);
      Fila^.Enqueue(int);
      listNum.Items.Add(IntToStr(int));

      if (int mod 2) = 0 then
        PilhaPar^.Push(int)
      else
        PilhaImpar^.Push(int);
    end;

    while Fila^.Count > 0 do
    begin
      Fila^.Dequeue;
    end;

    while PilhaPar^.Count > 0 do
    begin
      listPar.Items.Add(IntToStr(PilhaPar^.Pop));
    end;

    while PilhaImpar^.Count > 0 do
    begin
      listImpar.Items.Add(IntToStr(PilhaImpar^.Pop));
    end;
  finally
    Fila^.Free;
    Dispose(Fila);
    PilhaPar^.Free;
    Dispose(PilhaPar);
    PilhaImpar^.Free;
    Dispose(PilhaImpar);
  end;
end;

procedure TFormEx2.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := false;
end;

end.
