object Form4: TForm4
  Left = 543
  Top = 245
  BorderStyle = bsDialog
  Caption = 'Gestione linee'
  ClientHeight = 272
  ClientWidth = 603
  Color = 16645629
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 603
    Height = 209
    ActivePage = TabSheet1
    Align = alTop
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Gestione manuale delle linee'
      object SpeedButton1: TSpeedButton
        Tag = 1
        Left = 356
        Top = 52
        Width = 37
        Height = 37
        AllowAllUp = True
        GroupIndex = 8
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        Spacing = 0
        Transparent = False
        OnClick = SpeedButtonClick
      end
      object SpeedButton2: TSpeedButton
        Tag = 2
        Left = 316
        Top = 52
        Width = 37
        Height = 37
        AllowAllUp = True
        GroupIndex = 7
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        Spacing = 0
        Transparent = False
        OnClick = SpeedButtonClick
      end
      object SpeedButton3: TSpeedButton
        Tag = 4
        Left = 276
        Top = 52
        Width = 37
        Height = 37
        AllowAllUp = True
        GroupIndex = 6
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        Spacing = 0
        Transparent = False
        OnClick = SpeedButtonClick
      end
      object SpeedButton4: TSpeedButton
        Tag = 8
        Left = 236
        Top = 52
        Width = 37
        Height = 37
        AllowAllUp = True
        GroupIndex = 5
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        Spacing = 0
        Transparent = False
        OnClick = SpeedButtonClick
      end
      object SpeedButton5: TSpeedButton
        Tag = 16
        Left = 196
        Top = 52
        Width = 37
        Height = 37
        AllowAllUp = True
        GroupIndex = 4
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        Spacing = 0
        Transparent = False
        OnClick = SpeedButtonClick
      end
      object SpeedButton6: TSpeedButton
        Tag = 32
        Left = 156
        Top = 52
        Width = 37
        Height = 37
        AllowAllUp = True
        GroupIndex = 3
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        Spacing = 0
        Transparent = False
        OnClick = SpeedButtonClick
      end
      object SpeedButton7: TSpeedButton
        Tag = 64
        Left = 116
        Top = 52
        Width = 37
        Height = 37
        AllowAllUp = True
        GroupIndex = 2
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        Spacing = 0
        Transparent = False
        OnClick = SpeedButtonClick
      end
      object SpeedButton8: TSpeedButton
        Tag = 128
        Left = 76
        Top = 52
        Width = 37
        Height = 37
        AllowAllUp = True
        GroupIndex = 1
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 4
        ParentFont = False
        Spacing = 0
        Transparent = False
        OnClick = SpeedButtonClick
      end
      object Label1: TLabel
        Left = 107
        Top = 142
        Width = 54
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Color = 520702
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        Transparent = False
        Layout = tlCenter
      end
      object Label26: TLabel
        Left = 88
        Top = 101
        Width = 291
        Height = 13
        Caption = 
          '128        64         32          16          8           4     ' +
          '       2           1'
        Transparent = True
      end
      object Label16: TLabel
        Left = 90
        Top = 23
        Width = 290
        Height = 19
        Caption = '7      6      5      4      3      2      1      0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object JvXPButton7: TJvXPButton
        Left = 472
        Top = 56
        Width = 105
        Caption = 'Accendi tutti'
        TabOrder = 0
        OnClick = JvXPButton7Click
      end
      object JvXPButton8: TJvXPButton
        Left = 472
        Top = 88
        Width = 105
        Caption = 'Spegni tutti'
        TabOrder = 1
        OnClick = JvXPButton8Click
      end
      object JvXPCheckbox2: TJvXPCheckbox
        Left = 16
        Top = 144
        Width = 89
        Height = 17
        Caption = 'Lettura byte:'
        TabOrder = 2
        OnClick = JvXPCheckbox2Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Programmi'
      ImageIndex = 1
      ExplicitLeft = -4
      ExplicitTop = 19
      ExplicitWidth = 577
      ExplicitHeight = 162
      object Label11: TLabel
        Left = 288
        Top = 70
        Width = 56
        Height = 13
        Caption = 'Ripetizione:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 352
        Top = 70
        Width = 65
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Color = 520702
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ShowAccelChar = False
        Transparent = False
        Layout = tlCenter
      end
      object Label12: TLabel
        Left = 16
        Top = 6
        Width = 50
        Height = 13
        Caption = 'Programmi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 16
        Top = 20
        Width = 521
        Height = 22
        Ctl3D = False
        DropDownRows = 12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'programmaID'
        ListField = 'programma'
        ListSource = dm1.dsProgrammi
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object JvXPButton2: TJvXPButton
        Left = 16
        Top = 68
        Width = 105
        Caption = 'Avvia programma'
        TabOrder = 1
        OnClick = JvXPButton2Click
      end
      object JvXPButton3: TJvXPButton
        Left = 128
        Top = 68
        Width = 105
        Caption = 'Ferma programma'
        TabOrder = 2
        OnClick = JvXPButton3Click
      end
      object JvXPButton1: TJvXPButton
        Left = 544
        Top = 20
        Width = 25
        Hint = 'Gestione programmi'
        Caption = '...'
        TabOrder = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = JvXPButton1Click
      end
      object JvXPButton9: TJvXPButton
        Left = 16
        Top = 132
        Width = 145
        Hint = 'Accensione casuale LED'
        Caption = 'Avvia "albero natale"'
        TabOrder = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = JvXPButton9Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Lettura/scrittura EEPROM'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 577
      ExplicitHeight = 162
      object Label13: TLabel
        Left = 248
        Top = 32
        Width = 58
        Height = 13
        Caption = ' Max char:'
        Color = 520702
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label15: TLabel
        Left = 8
        Top = 32
        Width = 231
        Height = 13
        Caption = 'Legge e scrive nell'#39'EEPROM -Area utente.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object JvXPButton10: TJvXPButton
        Left = 8
        Top = 80
        Width = 105
        Caption = 'Leggi EEPROM'
        TabOrder = 0
        OnClick = JvXPButton10Click
      end
      object JvXPButton11: TJvXPButton
        Left = 464
        Top = 80
        Width = 105
        Caption = 'Scrivi EEPROM'
        TabOrder = 1
        OnClick = JvXPButton11Click
      end
      object Edit1: TEdit
        Left = 120
        Top = 80
        Width = 337
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object JvXPCheckbox1: TJvXPCheckbox
        Left = 8
        Top = 136
        Width = 265
        Height = 17
        Caption = 'Azzera area utente dell'#39' EEPROM prima di scrivere'
        TabOrder = 3
      end
    end
  end
  object JvXPButton4: TJvXPButton
    Left = 480
    Top = 224
    Width = 105
    Height = 33
    Caption = 'Esci'
    TabOrder = 1
    ModalResult = 1
  end
  object JvTimer1: TJvTimer
    Enabled = False
    OnTimer = JvTimer1Timer
    Left = 24
    Top = 216
  end
  object JvTimer2: TJvTimer
    Enabled = False
    Interval = 250
    OnTimer = JvTimer2Timer
    Left = 80
    Top = 216
  end
  object JvTimer3: TJvTimer
    Enabled = False
    Interval = 100
    OnTimer = JvTimer3Timer
    Left = 136
    Top = 216
  end
end
