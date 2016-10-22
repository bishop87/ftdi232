object Form2: TForm2
  Left = 486
  Top = 167
  BorderStyle = bsDialog
  Caption = 'Gestione programmi'
  ClientHeight = 529
  ClientWidth = 545
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMinimized
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 63
    Height = 13
    Caption = 'Programmi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 160
    Width = 64
    Height = 13
    Caption = 'Flusso byte'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object JvDBUltimGrid1: TJvDBUltimGrid
    Left = 24
    Top = 24
    Width = 497
    Height = 120
    Ctl3D = False
    DataSource = dm1.dsProgrammi
    DrawingStyle = gdsGradient
    FixedColor = 15396839
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBUltimGrid2DrawColumnCell
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'programma'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ripetizione'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ritardo_ms'
        Visible = True
      end>
  end
  object JvDBUltimGrid2: TJvDBUltimGrid
    Left = 24
    Top = 176
    Width = 497
    Height = 329
    Ctl3D = False
    DataSource = dm1.dsFlussi
    DrawingStyle = gdsGradient
    FixedColor = 15396839
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = JvDBUltimGrid2DrawColumnCell
    OnEditButtonClick = JvDBUltimGrid2EditButtonClick
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    ReadOnlyCellColor = clWhite
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'valore_byte'
        Width = 225
        Visible = True
      end>
    Delphi2010OptionsMigrated = True
  end
end
