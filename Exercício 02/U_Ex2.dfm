object FormEx2: TFormEx2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Exerc'#237'cio 02'
  ClientHeight = 189
  ClientWidth = 429
  Color = clActiveCaption
  CustomTitleBar.SystemColors = False
  CustomTitleBar.SystemButtons = False
  CustomTitleBar.BackgroundColor = clAqua
  CustomTitleBar.ForegroundColor = 65793
  CustomTitleBar.InactiveBackgroundColor = clHighlight
  CustomTitleBar.InactiveForegroundColor = 10066329
  CustomTitleBar.ButtonForegroundColor = 65793
  CustomTitleBar.ButtonBackgroundColor = clBlack
  CustomTitleBar.ButtonHoverForegroundColor = 65793
  CustomTitleBar.ButtonHoverBackgroundColor = clMaroon
  CustomTitleBar.ButtonPressedForegroundColor = 65793
  CustomTitleBar.ButtonPressedBackgroundColor = clMoneyGreen
  CustomTitleBar.ButtonInactiveForegroundColor = clYellow
  CustomTitleBar.ButtonInactiveBackgroundColor = clFuchsia
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 150
    Top = 53
    Width = 72
    Height = 13
    Caption = 'N'#250'meros pares'
  end
  object Label2: TLabel
    Left = 293
    Top = 53
    Width = 82
    Height = 13
    Caption = 'N'#250'meros impares'
  end
  object Label3: TLabel
    Left = 16
    Top = 53
    Width = 88
    Height = 13
    Caption = 'Todos os N'#250'meros'
  end
  object btnGerar: TButton
    Left = 167
    Top = 8
    Width = 97
    Height = 25
    Caption = 'Gerar N'#250'meros'
    TabOrder = 0
    OnClick = btnGerarClick
  end
  object listNum: TListBox
    Left = 16
    Top = 72
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 1
  end
  object listPar: TListBox
    Left = 155
    Top = 72
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 2
  end
  object listImpar: TListBox
    Left = 293
    Top = 72
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 3
  end
end
