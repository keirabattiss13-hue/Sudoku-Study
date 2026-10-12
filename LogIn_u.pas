unit LogIn_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Sudoku_u, SignUp_u;

type
  TfrmLogIn = class(TForm)
    lblLogIn: TLabel;
    pnlLogIn: TPanel;
    ldlPassword: TLabel;
    lblName: TLabel;
    lblSurname: TLabel;
    lblUsername: TLabel;
    lblUsernameStar: TLabel;
    lblNameStar: TLabel;
    lblSurnameStar: TLabel;
    lblPasswordStar: TLabel;
    edtName: TEdit;
    edtPassword: TEdit;
    edtSurname: TEdit;
    edtUser: TEdit;
    btnLogIn: TButton;
    btnBack: TButton;
    btnSignUp: TButton;
    Label1: TLabel;
    procedure btnLogInClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogIn: TfrmLogIn;

  Login: Boolean;

implementation

{$R *.dfm}

uses Title_u, Admin_u;

procedure TfrmLogIn.btnBackClick(Sender: TObject);
begin

  lblUsernameStar.Visible := False;
  lblNameStar.Visible := False;
  lblSurnameStar.Visible := False;
  lblPasswordStar.Visible := False;

  edtUser.Text := '';
  edtName.Text := '';
  edtSurname.Text := '';
  edtPassword.Text := '';

  Self.Hide;
  frmTitleScreen.Show;

end;

procedure TfrmLogIn.btnLogInClick(Sender: TObject);
var
  // Input
  sUsername, sName, sSurname, sPassword: String;

  // Text file
  sTUsername, sTName, sTSurname, sTPassword, sLine: String;
  iPos: Integer;
  tFile: TextFile;

  // Login
  bLogIn: Boolean;
begin

  // Hide all error stars at the start of a new login attempt
  lblUsernameStar.Visible := False;
  lblNameStar.Visible := False;
  lblSurnameStar.Visible := False;
  lblPasswordStar.Visible := False;

  // Get input from the Edit boxes
  sUsername := edtUser.Text;
  sName := edtName.Text;
  sSurname := edtSurname.Text;
  sPassword := edtPassword.Text;

  // Check that all fields have been entered
  if sUsername = '' then
  begin
    ShowMessage('Please enter Username');
    lblUsernameStar.Visible := True;
    Exit;
  end;

  if sName = '' then
  begin
    ShowMessage('Please enter Name');
    lblNameStar.Visible := True;
    Exit;
  end;

  if sSurname = '' then
  begin
    ShowMessage('Please enter Surname');
    lblSurnameStar.Visible := True;
    Exit;
  end;

  if sPassword = '' then
  begin
    ShowMessage('Please enter Password');
    lblPasswordStar.Visible := True;
    Exit;
  end;

  // Check for Admin login
  if (sUsername = 'Admin') and (sName = 'Admin') and (sSurname = 'Admin') and
    (sPassword = 'Admin') then
  begin
    edtUser.Text := '';
    edtName.Text := '';
    edtSurname.Text := '';
    edtPassword.Text := '';

    Self.Hide;
    frmAdmin.Show;
    Exit;
  end;

  // Assume login is unsuccessful
  bLogIn := False;

  // Check if the user file exists
  if NOT FileExists('UserLogIn.txt') then
  begin
    ShowMessage('File does not exist');
    Exit;
  end;

  // Open the user file
  AssignFile(tFile, 'UserLogIn.txt');
  Reset(tFile);

  // Read through the file
  while NOT EOF(tFile) do
  begin

    // Read one complete user record
    ReadLn(tFile, sLine);

    // Username
    iPos := Pos('#', sLine);
    sTUsername := Copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);

    // Name
    iPos := Pos('#', sLine);
    sTName := Copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);

    // Surname
    iPos := Pos('#', sLine);
    sTSurname := Copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);

    // Password
    sTPassword := sLine;

    // Compare entered information with the information in the file
    if (sUsername = sTUsername) and (sName = sTName) and (sSurname = sTSurname)
      and (sPassword = sTPassword) then
    begin
      bLogIn := True;
      Break;
    end;

  end;

  // Close the file
  CloseFile(tFile);

  // Check whether login was successful
  if bLogIn then
  begin

    // Clear the Edit boxes
    edtUser.Text := '';
    edtName.Text := '';
    edtSurname.Text := '';
    edtPassword.Text := '';

    // Open the Sudoku game
    Self.Hide;
    frmSudoku.Show;

  end
  else
  begin

    // Login failed
    ShowMessage('Login failed');

    // Only clear the password
    edtPassword.Text := '';
  end;

end;

procedure TfrmLogIn.btnSignUpClick(Sender: TObject);
begin

  lblUsernameStar.Visible := False;
  lblNameStar.Visible := False;
  lblSurnameStar.Visible := False;
  lblPasswordStar.Visible := False;

  edtUser.Text := '';
  edtName.Text := '';
  edtSurname.Text := '';
  edtPassword.Text := '';

  Self.Hide;
  frmSignUp.Show;

end;

procedure TfrmLogIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  edtUser.Text := '';
  edtName.Text := '';
  edtSurname.Text := '';
  edtPassword.Text := '';

  frmTitleScreen.Close;
end;

end.
