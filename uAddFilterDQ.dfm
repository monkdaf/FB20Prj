object fAddFilterDQ: TfAddFilterDQ
  Left = 493
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1092#1080#1083#1100#1090#1088#1072
  ClientHeight = 168
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl7: TLabel
    Left = 8
    Top = 4
    Width = 203
    Height = 13
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1080#1078#1077#1089#1083#1077#1076#1091#1102#1097#1080#1077' '#1086#1073#1098#1077#1082#1090#1099':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object chkMsgAV: TCheckBox
    Left = 8
    Top = 66
    Width = 217
    Height = 17
    Caption = #1057' '#1088#1072#1089#1096#1080#1088#1077#1085#1085#1099#1084#1080' '#1089#1086#1086#1073#1097#1077#1085#1080#1103#1084#1080
    TabOrder = 0
    WordWrap = True
    OnClick = chkMsgAVClick
  end
  object chkNeedMsg: TCheckBox
    Left = 8
    Top = 46
    Width = 257
    Height = 17
    Caption = #1057' '#1089#1086#1086#1073#1097#1077#1085#1080#1103#1084#1080' '#1076#1083#1103' WinCC'
    TabOrder = 1
    WordWrap = True
    OnClick = chkNeedMsgClick
  end
  object chkpriNameDB: TCheckBox
    Left = 8
    Top = 86
    Width = 209
    Height = 17
    Caption = #1053#1080#1078#1077#1091#1082#1072#1079#1072#1085#1085#1091#1102' '#1087#1086#1076#1089#1080#1089#1090#1077#1084#1091
    TabOrder = 2
    OnClick = chkpriNameDBClick
  end
  object cbbSelDBName: TComboBox
    Left = 64
    Top = 106
    Width = 90
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    OnChange = cbbSelDBNameChange
  end
  object chkDevice: TCheckBox
    Left = 8
    Top = 26
    Width = 257
    Height = 17
    Caption = #1057' '#1092#1091#1085#1082#1094#1080#1077#1081' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
    TabOrder = 4
    WordWrap = True
    OnClick = chkDeviceClick
  end
  object bApply: TBitBtn
    Left = 8
    Top = 136
    Width = 113
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 5
    OnClick = bApplyClick
    Kind = bkOK
  end
  object bApplyAndFind: TBitBtn
    Left = 128
    Top = 136
    Width = 145
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080' '#1085#1072#1081#1090#1080
    TabOrder = 6
    OnClick = bApplyAndFindClick
    Kind = bkAll
  end
end
