object Form1: TForm1
  Left = 242
  Top = 135
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TStringGrid with ComboBox, CheckBox, Edit and Button'
  ClientHeight = 394
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 223
    Height = 16
    Caption = 'Cliquer sur une ligne de la colonne C0'
  end
  object Label2: TLabel
    Left = 8
    Top = 28
    Width = 351
    Height = 16
    Caption = 'La ComboBox, la CheckBox, l'#39'Edit et le Button apparaissent'
  end
  object Label3: TLabel
    Left = 8
    Top = 49
    Width = 447
    Height = 16
    Caption = 
      'Dans la ComboBox apparait la liste de la dizaine choisie ( Ex : ' +
      '2 ---> 20 a 29)'
  end
  object Label4: TLabel
    Left = 8
    Top = 70
    Width = 450
    Height = 16
    Caption = 
      'Cocher la CheckBox fait apparaitre les nombre de 1 a 99 dans la ' +
      'ComboBox'
  end
  object Label5: TLabel
    Left = 8
    Top = 92
    Width = 360
    Height = 16
    Caption = 'Le bouton Ok permet de mettre a jour la ligne de la StringGrid'
  end
  object Label6: TLabel
    Left = 8
    Top = 114
    Width = 492
    Height = 16
    Caption = 
      'ATTENTION ce systeme ne gere pas le scrolling de la StringGrid (' +
      'a vos clavier......)'
  end
  object SG1: TStringGrid
    Left = 8
    Top = 144
    Width = 489
    Height = 241
    ColCount = 6
    DefaultRowHeight = 21
    FixedColor = clAqua
    FixedCols = 0
    RowCount = 10
    TabOrder = 0
    OnSelectCell = SG1SelectCell
  end
end
