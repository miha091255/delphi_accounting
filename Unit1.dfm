object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 399
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 281
    TabOrder = 0
    object Label1: TLabel
      Left = 45
      Top = 59
      Width = 33
      Height = 13
      Caption = #1057#1082#1072#1085#1099
    end
    object FIOEdit: TLabeledEdit
      Left = 10
      Top = 17
      Width = 485
      Height = 21
      EditLabel.Width = 23
      EditLabel.Height = 13
      EditLabel.Caption = #1060#1048#1054
      TabOrder = 0
      OnEnter = FIOEditEnter
      OnExit = FIOEditExit
    end
    object dtpTime: TDateTimePicker
      Left = 232
      Top = 59
      Width = 75
      Height = 21
      Date = 44384.756720902780000000
      Time = 44384.756720902780000000
      Enabled = False
      Kind = dtkTime
      TabOrder = 1
    end
    object CheckListBox1: TCheckListBox
      Left = 10
      Top = 78
      Width = 165
      Height = 118
      ItemHeight = 13
      TabOrder = 2
    end
    object PassportScan1: TCheckBox
      Left = 21
      Top = 93
      Width = 110
      Height = 17
      Caption = #1057#1082#1072#1085' '#1087#1072#1089#1087#1086#1088#1090'1'
      TabOrder = 3
    end
    object PassportScan2: TCheckBox
      Left = 21
      Top = 116
      Width = 110
      Height = 17
      Caption = #1057#1082#1072#1085' '#1087#1072#1089#1087#1086#1088#1090' 2'
      TabOrder = 4
    end
    object AttestatScan1: TCheckBox
      Left = 21
      Top = 139
      Width = 110
      Height = 17
      Caption = #1057#1082#1072#1085' '#1072#1090#1090#1077#1089#1090#1072#1090' 1'
      TabOrder = 5
    end
    object AttestatScan2: TCheckBox
      Left = 21
      Top = 162
      Width = 110
      Height = 17
      Caption = #1057#1082#1072#1085' '#1072#1090#1090#1077#1089#1090#1072#1090' 2'
      TabOrder = 6
    end
    object Registration: TCheckBox
      Left = 220
      Top = 93
      Width = 200
      Height = 17
      Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085
      TabOrder = 7
    end
    object Family: TCheckBox
      Left = 220
      Top = 131
      Width = 200
      Height = 17
      Caption = #1053#1077' '#1091#1082#1072#1079#1072#1085#1099' '#1088#1086#1076#1089#1090#1074#1077#1085#1085#1080#1082#1080
      TabOrder = 8
    end
    object Agreement: TCheckBox
      Left = 220
      Top = 162
      Width = 200
      Height = 17
      Caption = #1053#1077#1090' '#1089#1086#1075#1083#1072#1089#1080#1103' '#1086#1090' '#1088#1086#1076#1089#1090#1074#1077#1085#1085#1080#1082#1086#1074
      TabOrder = 9
    end
    object NoteEdit: TLabeledEdit
      Left = 10
      Top = 243
      Width = 485
      Height = 21
      EditLabel.Width = 42
      EditLabel.Height = 13
      EditLabel.Caption = #1047#1072#1084#1077#1090#1082#1072
      TabOrder = 10
    end
    object AddButton: TBitBtn
      Left = 196
      Top = 200
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 11
      OnClick = AddButtonClick
    end
    object dtpDate: TDateTimePicker
      Left = 329
      Top = 59
      Width = 107
      Height = 21
      Date = 44384.756720902780000000
      Time = 44384.756720902780000000
      Enabled = False
      TabOrder = 12
    end
    object BitBtn1: TBitBtn
      Left = 312
      Top = 200
      Width = 108
      Height = 25
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1074#1077#1090
      TabOrder = 13
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 278
    Width = 500
    Height = 189
    TabOrder = 1
    object Memo1: TMemo
      Left = 10
      Top = 10
      Width = 485
      Height = 103
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 501
    Top = 0
    Width = 284
    Height = 473
    TabOrder = 2
    object lCount: TLabel
      Left = 19
      Top = 230
      Width = 197
      Height = 13
    end
    object lRegCount: TLabel
      Left = 16
      Top = 268
      Width = 50
      Height = 13
      Caption = 'lRegCount'
    end
    object Memo2: TMemo
      Left = 5
      Top = 17
      Width = 268
      Height = 192
      TabOrder = 0
    end
    object leQuestAddress: TLabeledEdit
      Left = 5
      Top = 363
      Width = 268
      Height = 21
      EditLabel.Width = 91
      EditLabel.Height = 13
      EditLabel.Caption = #1050#1091#1076#1072' '#1086#1073#1088#1072#1097#1072#1090#1100#1089#1103
      TabOrder = 1
      OnEnter = leQuestAddressEnter
      OnExit = leQuestAddressExit
    end
  end
  object MainMenu1: TMainMenu
    Left = 456
    Top = 64
    object miFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object miConnect: TMenuItem
        Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1041#1044
        object DefaultConnect: TMenuItem
          Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          OnClick = DefaultConnectClick
        end
        object SelectConnect: TMenuItem
          Caption = #1042#1099#1073#1088#1072#1090#1100
          OnClick = SelectConnectClick
        end
      end
      object miDisconnect: TMenuItem
        Caption = #1054#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1041#1044
        OnClick = miDisconnectClick
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 456
    Top = 120
  end
  object OpenDialog1: TOpenDialog
    Filter = 'MS Access 2013|*.accdb'
    Left = 448
    Top = 176
  end
end
