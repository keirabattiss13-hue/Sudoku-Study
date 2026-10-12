object frmAdmin: TfrmAdmin
  Left = 0
  Top = 0
  ActiveControl = btnClear
  Caption = 'Admin'
  ClientHeight = 514
  ClientWidth = 943
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object redOutput: TRichEdit
    Left = 414
    Top = 168
    Width = 511
    Height = 286
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssHorizontal
    TabOrder = 0
  end
  object btnLogOut: TButton
    Left = 593
    Top = 472
    Width = 163
    Height = 29
    Caption = 'LogOut'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 25
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnLogOutClick
  end
  object btnClear: TButton
    Left = 414
    Top = 472
    Width = 173
    Height = 29
    Caption = 'Clear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 25
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnClearClick
  end
  object pnlUser: TPanel
    Left = 424
    Top = 24
    Width = 511
    Height = 121
    TabOrder = 3
    object btnUser: TButton
      Left = 22
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Load Users'
      TabOrder = 0
      OnClick = btnUserClick
    end
    object btnEditName: TButton
      Left = 22
      Top = 49
      Width = 75
      Height = 25
      Caption = 'Edit Name'
      TabOrder = 1
      OnClick = btnEditNameClick
    end
  end
end
