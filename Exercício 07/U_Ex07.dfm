object FormEx07: TFormEx07
  Left = 0
  Top = 0
  Caption = 'FormEx07'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object btnGerar: TButton
    Left = 48
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 0
    OnClick = btnGerarClick
  end
  object lbFila1: TListBox
    Left = 48
    Top = 120
    Width = 121
    Height = 97
    ItemHeight = 15
    TabOrder = 1
  end
  object lbFila2: TListBox
    Left = 200
    Top = 120
    Width = 121
    Height = 97
    ItemHeight = 15
    TabOrder = 2
  end
  object btnJuntar: TButton
    Left = 48
    Top = 264
    Width = 89
    Height = 25
    Caption = 'Juntar em pilha'
    TabOrder = 3
  end
  object lbPilha: TListBox
    Left = 48
    Top = 312
    Width = 121
    Height = 97
    ImeName = 'Portuguese (Brazilian ABNT)'
    ItemHeight = 15
    TabOrder = 4
  end
end
