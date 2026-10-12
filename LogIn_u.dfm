object frmLogIn: TfrmLogIn
  Left = 0
  Top = 0
  Caption = 'LogIn'
  ClientHeight = 518
  ClientWidth = 943
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnClose = FormClose
  TextHeight = 15
  object lblLogIn: TLabel
    Left = 40
    Top = 24
    Width = 306
    Height = 78
    Caption = 'Log In Page'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 80
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 742
    Top = 207
    Width = 152
    Height = 120
    Alignment = taCenter
    Caption = 'Don'#39't have '#13#10'an account?'#13#10'Sign up!'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = 40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object pnlLogIn: TPanel
    Left = 40
    Top = 123
    Width = 674
    Height = 378
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object ldlPassword: TLabel
      Left = 143
      Top = 230
      Width = 86
      Height = 30
      Caption = 'Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblName: TLabel
      Left = 143
      Top = 110
      Width = 56
      Height = 30
      Caption = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblSurname: TLabel
      Left = 143
      Top = 170
      Width = 82
      Height = 30
      Caption = 'Surname'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblUsername: TLabel
      Left = 143
      Top = 50
      Width = 93
      Height = 30
      Caption = 'Username'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblUsernameStar: TLabel
      Left = 128
      Top = 50
      Width = 9
      Height = 30
      Caption = '*'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCrimson
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object lblNameStar: TLabel
      Left = 128
      Top = 110
      Width = 9
      Height = 30
      Caption = '*'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCrimson
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object lblSurnameStar: TLabel
      Left = 128
      Top = 169
      Width = 9
      Height = 30
      Caption = '*'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCrimson
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object lblPasswordStar: TLabel
      Left = 128
      Top = 230
      Width = 9
      Height = 30
      Caption = '*'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCrimson
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object edtName: TEdit
      Left = 264
      Top = 107
      Width = 273
      Height = 38
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtPassword: TEdit
      Left = 264
      Top = 227
      Width = 273
      Height = 38
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
    end
    object edtSurname: TEdit
      Left = 264
      Top = 166
      Width = 273
      Height = 38
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtUser: TEdit
      Left = 264
      Top = 47
      Width = 273
      Height = 38
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object btnLogIn: TButton
      Left = 296
      Top = 305
      Width = 193
      Height = 49
      Caption = 'LogIn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnLogInClick
    end
  end
  object btnBack: TButton
    Left = 732
    Top = 461
    Width = 193
    Height = 29
    Caption = 'Back'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 25
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnBackClick
  end
  object btnSignUp: TButton
    Left = 732
    Top = 386
    Width = 193
    Height = 29
    Caption = 'SignUp'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 25
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnSignUpClick
  end
end
