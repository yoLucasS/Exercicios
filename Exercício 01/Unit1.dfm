object FormPilha: TFormPilha
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Exerc'#237'cio 1'
  ClientHeight = 244
  ClientWidth = 231
  Color = clActiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  TextHeight = 13
  object lbedNome: TLabeledEdit
    Left = 14
    Top = 20
    Width = 112
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'Item'
    TabOrder = 0
    Text = ''
  end
  object btnInserir: TBitBtn
    Left = 142
    Top = 20
    Width = 75
    Height = 21
    Caption = 'Inserir'
    TabOrder = 1
    OnClick = btnInserirClick
  end
  object lstPilha: TListBox
    Left = 14
    Top = 47
    Width = 203
    Height = 64
    ItemHeight = 13
    TabOrder = 2
  end
  object listIndex: TListBox
    Left = 14
    Top = 158
    Width = 203
    Height = 64
    ItemHeight = 13
    TabOrder = 3
  end
  object btnList: TBitBtn
    Left = 142
    Top = 131
    Width = 75
    Height = 21
    Caption = 'Listar'
    TabOrder = 4
    OnClick = btnListClick
  end
  object lbIndex: TLabeledEdit
    Left = 14
    Top = 131
    Width = 75
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = 'Index'
    TabOrder = 5
    Text = ''
  end
end
