object FormEx3: TFormEx3
  Left = 0
  Top = 0
  Caption = 'FormEx3'
  ClientHeight = 192
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object listPilha: TListBox
    Left = 24
    Top = 64
    Width = 121
    Height = 97
    ItemHeight = 15
    TabOrder = 0
  end
  object lbFila: TListBox
    Left = 192
    Top = 64
    Width = 121
    Height = 97
    ImeName = 'lbFila'
    ItemHeight = 15
    TabOrder = 1
  end
  object btnGerar: TButton
    Left = 129
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 2
    OnClick = btnGerarClick
  end
end
