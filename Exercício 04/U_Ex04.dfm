object FormEx04: TFormEx04
  Left = 0
  Top = 0
  Caption = 'FormEx04'
  ClientHeight = 247
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object lbFila: TListBox
    Left = 23
    Top = 104
    Width = 121
    Height = 97
    ItemHeight = 15
    TabOrder = 0
  end
  object lbPilha: TListBox
    Left = 224
    Top = 104
    Width = 121
    Height = 97
    ItemHeight = 15
    TabOrder = 1
  end
  object btnGerar: TButton
    Left = 147
    Top = 40
    Width = 75
    Height = 25
    Caption = 'btnGerar'
    TabOrder = 2
    OnClick = btnGerarClick
  end
end
