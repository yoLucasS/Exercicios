object FormEx05: TFormEx05
  Left = 0
  Top = 0
  Caption = 'FormEx05'
  ClientHeight = 312
  ClientWidth = 348
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object Pilha01: TListBox
    Left = 24
    Top = 56
    Width = 121
    Height = 97
    ItemHeight = 15
    TabOrder = 0
  end
  object Pilha02: TListBox
    Left = 200
    Top = 56
    Width = 121
    Height = 97
    ItemHeight = 15
    TabOrder = 1
  end
  object btnGerar: TButton
    Left = 128
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btnGerar'
    TabOrder = 2
    OnClick = btnGerarClick
  end
  object Pilha03: TListBox
    Left = 112
    Top = 190
    Width = 121
    Height = 97
    ImeName = 'Pilha03'
    ItemHeight = 15
    TabOrder = 3
  end
  object btnJuntar: TButton
    Left = 24
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Juntar'
    TabOrder = 4
    OnClick = btnJuntarClick
  end
  object edt_QtdPilha: TEdit
    Left = 24
    Top = 8
    Width = 75
    Height = 23
    NumbersOnly = True
    TabOrder = 5
  end
end
