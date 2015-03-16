object fSelNameOSWinCC: TfSelNameOSWinCC
  Left = 200
  Top = 124
  Width = 366
  Height = 159
  Caption = #1042#1099#1073#1086#1088' '#1080#1084#1077#1085#1080' S7 '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103' '#1074' WinCC'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 328
    Height = 32
    Caption = 
      #1042#1099#1073#1077#1088#1080#1090#1077' '#1080#1084#1103' S7 '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103' '#1076#1083#1103' '#1087#1088#1080#1074#1103#1079#1082#1080' '#1080#1084#1105#1085' '#1087#1077#1088#1077#1084#1077#1085#1085#1099#1093' '#1072#1085#1072#1083#1086#1075#1086#1074 +
      #1099#1093' '#1079#1085#1072#1095#1077#1085#1080#1081' '#1074' WinCC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object cbbNameOSWinCC: TComboBox
    Left = 72
    Top = 48
    Width = 185
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'cbbNameOSWinCC'
    OnChange = cbbNameOSWinCCChange
  end
  object btn1: TBitBtn
    Left = 264
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
end
