object Form3: TForm3
  Left = 445
  Top = 352
  BorderStyle = bsToolWindow
  Caption = 'Imposta bit'
  ClientHeight = 126
  ClientWidth = 283
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 208
    Top = 40
    Width = 65
    Height = 23
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 16
    Width = 181
    Height = 48
    BevelKind = bkSoft
    ColCount = 8
    Ctl3D = False
    DefaultColWidth = 21
    DefaultRowHeight = 21
    DoubleBuffered = True
    DrawingStyle = gdsGradient
    FixedColor = clSilver
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
    OnMouseUp = StringGrid1MouseUp
  end
  object JvXPButton1: TJvXPButton
    Left = 120
    Top = 96
    Caption = 'Ok'
    TabOrder = 1
    ModalResult = 1
  end
  object JvXPButton2: TJvXPButton
    Left = 200
    Top = 96
    Caption = 'Annulla'
    TabOrder = 2
    ModalResult = 2
  end
end
