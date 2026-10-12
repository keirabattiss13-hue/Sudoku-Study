unit Sudoku_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TfrmSudoku = class(TForm)
    btnBack: TButton;
    btnCreateNewGame: TButton;
    btnCheckGame: TButton;
    stgSudoku: TStringGrid;
    redHistory: TRichEdit;
    lblHistory: TLabel;
    btnTutorial: TButton;
    shpTutorial: TShape;
    lblTutorial: TLabel;
    pnlTutorial: TPanel;

    procedure btnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCreateNewGameClick(Sender: TObject);
    procedure btnCheckGameClick(Sender: TObject);
    procedure stgSudokuDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure stgSudokuClick(Sender: TObject);
    procedure btnTutorialClick(Sender: TObject);

  private
    // This array stores the complete, solved Sudoku board.
    Solution: array [1 .. 9, 1 .. 9] of Integer;

    // This array stores the Sudoku puzzle.
    // 0 means that the player must solve that cell.
    Puzzle: array [1 .. 9, 1 .. 9] of Integer;

    // This array stores the equation for each missing cell.
    Equation: array [1 .. 9, 1 .. 9] of String;

    procedure CreateSolution;
    procedure CreatePuzzle;
    procedure DisplayPuzzle;
    function GetEquation(Answer: Integer): String;
    function IsSafe(Row, Col, Num: Integer): Boolean;
  end;

var
  frmSudoku: TfrmSudoku;

implementation

{$R *.dfm}

uses
  LogIn_u, Title_u;


// ============================================================
// FORM CREATE
// ============================================================

procedure TfrmSudoku.FormCreate(Sender: TObject);
begin
  // Randomize creates a different random sequence each time
  // the program is started.
  Randomize;

  // Set up the Sudoku grid.
  stgSudoku.ColCount := 9;
  stgSudoku.RowCount := 9;

  // Remove the fixed header row and column.
  stgSudoku.FixedCols := 0;
  stgSudoku.FixedRows := 0;

  { // Make the cells large enough to display numbers and X.
    stgSudoku.DefaultColWidth := 45;
    stgSudoku.DefaultRowHeight := 45; }

  // Create a new Sudoku game.
  CreateSolution;
  CreatePuzzle;
  DisplayPuzzle;
end;


// ============================================================
// CREATE A COMPLETE SUDOKU SOLUTION
// ============================================================

procedure TfrmSudoku.CreateSolution;
var
  Row, Col, Temp: Integer;
  Num1, Num2: Integer;
  TempValue: Integer;
begin
  // ----------------------------------------------------------
  // Create the basic valid Sudoku pattern.
  // ----------------------------------------------------------

  for Row := 1 to 9 do
  begin
    for Col := 1 to 9 do
    begin
      Solution[Row, Col] := ((Row - 1) * 3 + (Row - 1) div 3 + Col - 1)
        mod 9 + 1;
    end;
  end;

  // ----------------------------------------------------------
  // Randomly swap the numbers 1 to 9.
  // This is safe because every number is changed everywhere
  // on the board at the same time.
  // ----------------------------------------------------------

  for Num1 := 1 to 9 do
  begin
    Num2 := Random(9) + 1;

    if Num1 <> Num2 then
    begin
      for Row := 1 to 9 do
      begin
        for Col := 1 to 9 do
        begin
          if Solution[Row, Col] = Num1 then
            Solution[Row, Col] := 0;

          if Solution[Row, Col] = Num2 then
            Solution[Row, Col] := 10;
        end;
      end;

      for Row := 1 to 9 do
      begin
        for Col := 1 to 9 do
        begin
          if Solution[Row, Col] = 0 then
            Solution[Row, Col] := Num2;

          if Solution[Row, Col] = 10 then
            Solution[Row, Col] := Num1;
        end;
      end;
    end;
  end;

  // ----------------------------------------------------------
  // Randomly swap rows within the same 3-row band.
  // This keeps the 3x3 boxes valid.
  // ----------------------------------------------------------

  for Temp := 1 to 3 do
  begin
    Num1 := Random(3) + 1;
    Num2 := Random(3) + 1;

    if Num1 <> Num2 then
    begin
      for Col := 1 to 9 do
      begin
        TempValue := Solution[Num1, Col];
        Solution[Num1, Col] := Solution[Num2, Col];
        Solution[Num2, Col] := TempValue;
      end;
    end;
  end;

  // ----------------------------------------------------------
  // Randomly swap columns within the same 3-column stack.
  // This also keeps the 3x3 boxes valid.
  // ----------------------------------------------------------

  for Temp := 1 to 3 do
  begin
    Num1 := Random(3) + 1;
    Num2 := Random(3) + 1;

    if Num1 <> Num2 then
    begin
      for Row := 1 to 9 do
      begin
        TempValue := Solution[Row, Num1];
        Solution[Row, Num1] := Solution[Row, Num2];
        Solution[Row, Num2] := TempValue;
      end;
    end;
  end;
end;


// ============================================================
// CREATE THE PUZZLE
// ============================================================

procedure TfrmSudoku.CreatePuzzle;
var
  Row, Col: Integer;
begin
  // Copy the complete solution into the puzzle.
  for Row := 1 to 9 do
  begin
    for Col := 1 to 9 do
    begin
      Puzzle[Row, Col] := Solution[Row, Col];

      // Clear any previous equation.
      Equation[Row, Col] := '';
    end;
  end;

  // Remove random numbers.
  for Row := 1 to 9 do
  begin
    for Col := 1 to 9 do
    begin
      // Approximately 55% of the cells become questions.
      if Random(100) < 55 then
      begin
        // 0 means the player has to solve this cell.
        Puzzle[Row, Col] := 0;

        // Find an equation whose answer is the missing number.
        Equation[Row, Col] := GetEquation(Solution[Row, Col]);
      end;
    end;
  end;
end;


// ============================================================
// GET AN EQUATION FROM THE TEXT FILE
// ============================================================

function TfrmSudoku.GetEquation(Answer: Integer): String;
var
  tFile: TextFile;
  sLine: String;
  sAnswer: String;
  sEquation: String;
  iPos: Integer;
  iFileAnswer: Integer;
begin
  // Start with an empty result.
  Result := '';

  // Check whether the equation file exists.
  if not FileExists('Equations.txt') then
  begin
    ShowMessage('Equations.txt does not exist!');
    Exit;
  end;

  // Open the text file.
  AssignFile(tFile, 'Equations.txt');
  Reset(tFile);

  // Read through the file.
  while not EOF(tFile) do
  begin
    ReadLn(tFile, sLine);

    // Find the | symbol.
    iPos := Pos('|', sLine);

    if iPos > 0 then
    begin
      // Get the answer from the beginning of the line.
      sAnswer := Copy(sLine, 1, iPos - 1);

      // Get the equation after the | symbol.
      sEquation := Copy(sLine, iPos + 1, Length(sLine));

      // Convert the answer to an integer.
      iFileAnswer := StrToIntDef(Trim(sAnswer), -1);

      // Check whether this equation has the correct answer.
      if iFileAnswer = Answer then
      begin
        Result := Trim(sEquation);
        Break;
      end;
    end;
  end;

  // Close the file.
  CloseFile(tFile);
end;


// ============================================================
// DISPLAY THE PUZZLE
// ============================================================

procedure TfrmSudoku.DisplayPuzzle;
var
  Row, Col: Integer;
begin
  for Row := 1 to 9 do
  begin
    for Col := 1 to 9 do
    begin
      // If the puzzle contains 0,
      // display X instead of the number.
      if Puzzle[Row, Col] = 0 then
      begin
        stgSudoku.Cells[Col - 1, Row - 1] := 'X';
        stgSudoku.Canvas.Brush.Color := clRed;
      end
      else
      begin
        // Display the original Sudoku number.
        stgSudoku.Cells[Col - 1, Row - 1] := IntToStr(Puzzle[Row, Col]);
        stgSudoku.Canvas.Brush.Color := clLime;
      end;
    end;
  end;

  // Redraw the grid.
  stgSudoku.Invalidate;
end;


// ============================================================
// CHECK IF A NUMBER CAN BE PLACED
// ============================================================

function TfrmSudoku.IsSafe(Row, Col, Num: Integer): Boolean;
var
  I: Integer;
  StartRow, StartCol: Integer;
begin
  // Assume that the number is safe.
  Result := True;

  // ----------------------------------------------------------
  // Check the row.
  // ----------------------------------------------------------
  // commit 2

  for I := 1 to 9 do
  begin
    if Solution[Row, I] = Num then
    begin
      Result := False;
      Exit;
    end;
  end;

  // ----------------------------------------------------------
  // Check the column.
  // ----------------------------------------------------------

  for I := 1 to 9 do
  begin
    if Solution[I, Col] = Num then
    begin
      Result := False;
      Exit;
    end;
  end;

  // ----------------------------------------------------------
  // Find the 3x3 box.
  // ----------------------------------------------------------

  StartRow := ((Row - 1) div 3) * 3 + 1;
  StartCol := ((Col - 1) div 3) * 3 + 1;

  // Check the 3x3 box.
  for I := StartRow to StartRow + 2 do
  begin
    if Solution[I, StartCol] = Num then
    begin
      Result := False;
      Exit;
    end;
  end;
end;

// ============================================================
// GRID CLICK
// ============================================================

procedure TfrmSudoku.stgSudokuClick(Sender: TObject);
var
  iCol, iRow: Integer;
  UserAnswer: Integer;
  CorrectAnswer: Integer;
  UserInput: String;
begin
  // Get the selected column and row.
  //
  // TStringGrid uses 0 to 8.
  // Our arrays use 1 to 9.
  iCol := stgSudoku.Col + 1;
  iRow := stgSudoku.Row + 1;

  // Only do something if the cell contains an X.
  if Puzzle[iRow, iCol] = 0 then
  begin
    // Get the correct Sudoku number.
    CorrectAnswer := Solution[iRow, iCol];

    // Check that an equation exists.
    if Equation[iRow, iCol] = '' then
    begin
      ShowMessage('There is no equation assigned to this cell.');
      Exit;
    end;

    // Ask the user to solve the equation.
    UserInput := InputBox('Study Question', 'Solve: ' + Equation[iRow, iCol] +
      ' = ?', '');

    // Convert the user's answer to an integer.
    UserAnswer := StrToIntDef(UserInput, -1);

    // Check the answer.
    if UserAnswer = CorrectAnswer then
    begin
      // The answer is correct.

      // Store the correct number.
      Puzzle[iRow, iCol] := CorrectAnswer;

      // Replace the X with the number.
      stgSudoku.Cells[iCol - 1, iRow - 1] := IntToStr(CorrectAnswer);

      // Redraw the grid.
      stgSudoku.Invalidate;

      redHistory.Lines.Add('[' + IntToStr(iRow) + ',' + IntToStr(iCol) + '] ' +
        Equation[iRow, iCol] + ' = ' + UserInput + ': True');
    end
    else
    begin
      // The answer is incorrect.
      ShowMessage('Incorrect answer. Try again!');
      redHistory.Lines.Add('[' + IntToStr(iRow) + ',' + IntToStr(iCol) + '] ' +
        Equation[iRow, iCol] + ' = ' + UserInput + ': False');
    end;
  end;
end;


// ============================================================
// DRAW THE SUDOKU GRID
// ============================================================

procedure TfrmSudoku.stgSudokuDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
var
  S: String;
begin
  // Get the text inside the cell
  S := stgSudoku.Cells[ACol, ARow];

  // ----------------------------------------------------------
  // Set the cell colour
  // ----------------------------------------------------------

  if S = 'X' then
    stgSudoku.Canvas.Brush.Color := RGB(255, 235, 235)
  else
    stgSudoku.Canvas.Brush.Color := RGB(235, 255, 235);

  // Fill the cell with the selected colour
  stgSudoku.Canvas.FillRect(Rect);

  // ----------------------------------------------------------
  // Draw the X or number in the centre
  // ----------------------------------------------------------

  DrawText(stgSudoku.Canvas.Handle, PChar(S), Length(S), Rect,
    DT_CENTER or DT_VCENTER or DT_SINGLELINE);

  // ----------------------------------------------------------
  // Draw normal grid lines
  // ----------------------------------------------------------

  stgSudoku.Canvas.Pen.Color := clBlack;
  stgSudoku.Canvas.Pen.Width := 1;

  // Make the right side of columns 3 and 6 thicker
  if (ACol = 2) or (ACol = 5) then
    stgSudoku.Canvas.Pen.Width := 3;

  stgSudoku.Canvas.MoveTo(Rect.Right, Rect.Top);
  stgSudoku.Canvas.LineTo(Rect.Right, Rect.Bottom);

  stgSudoku.Canvas.Pen.Width := 1;

  // Make the bottom of rows 3 and 6 thicker
  if (ARow = 2) or (ARow = 5) then
    stgSudoku.Canvas.Pen.Width := 3;

  stgSudoku.Canvas.MoveTo(Rect.Left, Rect.Bottom);
  stgSudoku.Canvas.LineTo(Rect.Right, Rect.Bottom);

  stgSudoku.Canvas.Pen.Width := 1;

  // Draw the top border
  stgSudoku.Canvas.MoveTo(Rect.Left, Rect.Top);
  stgSudoku.Canvas.LineTo(Rect.Right, Rect.Top);

  // Draw the left border
  stgSudoku.Canvas.MoveTo(Rect.Left, Rect.Top);
  stgSudoku.Canvas.LineTo(Rect.Left, Rect.Bottom);
end;

// ============================================================
// CHECK GAME BUTTON
// ============================================================

procedure TfrmSudoku.btnCheckGameClick(Sender: TObject);
var
  Row, Col: Integer;
  PlayerNumber: Integer;
begin
  // Check every cell.
  for Row := 1 to 9 do
  begin
    for Col := 1 to 9 do
    begin
      // X means that the user has not solved
      // the equation for this cell yet.
      if stgSudoku.Cells[Col - 1, Row - 1] = 'X' then
      begin
        ShowMessage('You still have equations to solve!');
        Exit;
      end;

      // Convert the cell contents into a number.
      PlayerNumber := StrToIntDef(stgSudoku.Cells[Col - 1, Row - 1], 0);

      // Compare the user's number with
      // the correct Sudoku solution.
      if PlayerNumber <> Solution[Row, Col] then
      begin
        ShowMessage('There is a mistake in the Sudoku!');
        Exit;
      end;
    end;
  end;

  // If the program reaches this point,
  // every number is correct.
  ShowMessage('Congratulations! You solved the Sudoku!');
end;


// ============================================================
// CREATE NEW GAME BUTTON
// ============================================================

procedure TfrmSudoku.btnCreateNewGameClick(Sender: TObject);
begin
  // Generate a new Sudoku solution.
  CreateSolution;

  // Remove random numbers and assign equations.
  CreatePuzzle;

  // Display the new puzzle.
  DisplayPuzzle;
end;

procedure TfrmSudoku.btnTutorialClick(Sender: TObject);
begin
  lblTutorial.Caption := 'X';

  // Make all commponents of the tutorial visible

  pnlTutorial.Visible := True;
  shpTutorial.Visible := True;
  lblTutorial.Visible := True;

  // Bring them forward

  pnlTutorial.BringToFront;
  shpTutorial.BringToFront;
  lblTutorial.BringToFront;

  // First dialoge where box is red

  shpTutorial.Brush.Color := RGB(255, 235, 235); // red
  MessageDlg('To play, select a red block containing an X', mtInformation,
    [mbOK], 0);

  // Second dialoge where box is green

  shpTutorial.Brush.Color := RGB(235, 255, 235); // green
  lblTutorial.Caption := '9';
  MessageDlg
    ('An equation will pop up. Input the correct answer to complete the puzzle.',
    mtInformation, [mbOK], 0);

  // Last message

  MessageDlg('Once you''re done, click the "Check" button.', mtInformation,
    [mbOK], 0);
  pnlTutorial.Visible := False;
  shpTutorial.Visible := False;
  lblTutorial.Visible := False;

end;

// ============================================================
// FORM CLOSE
// ============================================================

procedure TfrmSudoku.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Close the title screen when this form closes.
  frmTitleScreen.Close;
end;


// ============================================================
// BACK BUTTON
// ============================================================

procedure TfrmSudoku.btnBackClick(Sender: TObject);
begin
  // Hide the Sudoku form.
  Self.Hide;

  // Show the login form again.
  frmLogIn.Show;
end;

end.
