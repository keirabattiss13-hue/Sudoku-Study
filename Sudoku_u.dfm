object frmSudoku: TfrmSudoku
  Left = 0
  Top = 0
  Caption = 'Sudoku'
  ClientHeight = 469
  ClientWidth = 958
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object lblHistory: TLabel
    Left = 648
    Top = 28
    Width = 61
    Height = 25
    Caption = 'History:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 25
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnBack: TButton
    Left = 455
    Top = 119
    Width = 173
    Height = 41
    Caption = 'Back'
    TabOrder = 0
    OnClick = btnBackClick
  end
  object btnCreateNewGame: TButton
    Left = 455
    Top = 71
    Width = 173
    Height = 42
    Caption = 'New Game'
    TabOrder = 1
    OnClick = btnCreateNewGameClick
  end
  object btnCheckGame: TButton
    Left = 455
    Top = 24
    Width = 173
    Height = 41
    Caption = 'Check'
    TabOrder = 2
    OnClick = btnCheckGameClick
  end
  object stgSudoku: TStringGrid
    Left = 24
    Top = 24
    Width = 425
    Height = 425
    ColCount = 9
    DefaultColWidth = 45
    DefaultRowHeight = 45
    RowCount = 9
    TabOrder = 3
    OnClick = stgSudokuClick
    OnDrawCell = stgSudokuDrawCell
    RowHeights = (
      45
      45
      45
      45
      30
      45
      45
      45
      45)
  end
  object redHistory: TRichEdit
    Left = 634
    Top = 71
    Width = 296
    Height = 378
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object btnTutorial: TButton
    Left = 455
    Top = 166
    Width = 173
    Height = 41
    Caption = 'Tutorial'
    TabOrder = 5
    OnClick = btnTutorialClick
  end
  object pnlTutorial: TPanel
    Left = 16
    Top = 13
    Width = 65
    Height = 68
    TabOrder = 6
    Visible = False
    object lblTutorial: TLabel
      Left = 24
      Top = 15
      Width = 17
      Height = 40
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 40
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object shpTutorial: TShape
      Left = 0
      Top = 0
      Width = 65
      Height = 65
      Visible = False
    end
  end
end
