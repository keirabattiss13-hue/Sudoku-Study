object frmTitleScreen: TfrmTitleScreen
  Left = 0
  Top = 0
  Caption = 'Sudoku'
  ClientHeight = 550
  ClientWidth = 923
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblSudoku: TLabel
    Left = 128
    Top = 80
    Width = 690
    Height = 100
    Caption = 'Sudoku Study Game!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 100
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object pnlLogInSignUp: TPanel
    Left = 184
    Top = 232
    Width = 545
    Height = 249
    TabOrder = 0
    object lblLogIn: TLabel
      Left = 56
      Top = 39
      Width = 165
      Height = 90
      Alignment = taCenter
      Caption = 'Have an account?'#13#10'LogIn and start '#13#10'playing!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblSignUp: TLabel
      Left = 339
      Top = 39
      Width = 158
      Height = 90
      Alignment = taCenter
      Caption = 'Don'#39't Have one?'#13#10'SignUp now and'#13#10'start your journy!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnLogIn: TButton
      Left = 56
      Top = 168
      Width = 165
      Height = 49
      Caption = 'LogIn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnLogInClick
    end
    object btnSignUp: TButton
      Left = 339
      Top = 168
      Width = 158
      Height = 49
      Caption = 'SignUp'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSignUpClick
    end
  end
end
