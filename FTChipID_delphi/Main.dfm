object Form1: TForm1
  Left = 454
  Top = 237
  Caption = 'ChipID'
  ClientHeight = 284
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 256
    Width = 52
    Height = 13
    Caption = 'Dll version:'
  end
  object lblDllVersion: TLabel
    Left = 89
    Top = 256
    Width = 135
    Height = 13
    Caption = '                                             '
  end
  object lstvDevices: TListView
    Left = 32
    Top = 16
    Width = 457
    Height = 185
    Columns = <>
    TabOrder = 0
  end
  object btnFindDevices: TButton
    Left = 32
    Top = 216
    Width = 105
    Height = 25
    Caption = 'Find 232R Devices'
    TabOrder = 1
    OnClick = btnFindDevicesClick
  end
end
