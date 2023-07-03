object FormEx08: TFormEx08
  Left = 0
  Top = 0
  Caption = 'FormEx08'
  ClientHeight = 198
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object Pilha: TListBox
    Left = 32
    Top = 72
    Width = 169
    Height = 97
    ItemHeight = 15
    TabOrder = 0
  end
  object btnInserir: TButton
    Left = 126
    Top = 24
    Width = 75
    Height = 25
    Caption = 'btnInserir'
    TabOrder = 1
    OnClick = btnInserirClick
  end
  object edtItem: TEdit
    Left = 32
    Top = 25
    Width = 81
    Height = 23
    NumbersOnly = True
    TabOrder = 2
  end
end
