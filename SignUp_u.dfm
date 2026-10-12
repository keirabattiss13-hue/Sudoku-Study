object frmSignUp: TfrmSignUp
  Left = 0
  Top = 0
  Caption = 'SignUp'
  ClientHeight = 518
  ClientWidth = 943
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object lblSignUp: TLabel
    Left = 40
    Top = 24
    Width = 352
    Height = 78
    Caption = 'Sign Up page'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 80
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblLogIn: TLabel
    Left = 742
    Top = 204
    Width = 173
    Height = 120
    Alignment = taCenter
    Caption = 'Already have '#13#10'an account?'#13#10'Log In!'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = 40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object pnlSignUp: TPanel
    Left = 40
    Top = 123
    Width = 674
    Height = 378
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object ldlPassword: TLabel
      Left = 79
      Top = 185
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
      Left = 79
      Top = 81
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
      Left = 79
      Top = 133
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
      Left = 79
      Top = 26
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
      Left = 40
      Top = 26
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
      Left = 40
      Top = 81
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
      Left = 40
      Top = 133
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
      Left = 40
      Top = 185
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
    object lblConfirmStar: TLabel
      Left = 40
      Top = 238
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
    object lblConfirmPassword: TLabel
      Left = 79
      Top = 238
      Width = 166
      Height = 30
      Caption = 'Confirm Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtName: TEdit
      Left = 296
      Top = 78
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
      Left = 296
      Top = 182
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
      Left = 296
      Top = 130
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
      Left = 296
      Top = 23
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
    object btnSignUp: TButton
      Left = 296
      Top = 305
      Width = 193
      Height = 49
      Caption = 'SignUp'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnSignUpClick
    end
    object edtConfirmPassword: TEdit
      Left = 296
      Top = 238
      Width = 273
      Height = 38
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 5
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
  object btnLogIn: TButton
    Left = 732
    Top = 394
    Width = 193
    Height = 29
    Caption = 'LogIn'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 25
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnLogInClick
  end
end
