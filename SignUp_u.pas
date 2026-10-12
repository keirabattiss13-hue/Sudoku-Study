unit SignUp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmSignUp = class(TForm)
    lblSignUp: TLabel;
    pnlSignUp: TPanel;
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
    btnSignUp: TButton;
    btnBack: TButton;
    edtConfirmPassword: TEdit;
    lblConfirmStar: TLabel;
    lblConfirmPassword: TLabel;
    btnLogIn: TButton;
    lblLogIn: TLabel;
    procedure btnBackClick(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLogInClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignUp: TfrmSignUp;
  arrUpper: array [1 .. 26] of Char = (
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  );

  arrLower: array [1 .. 26] of Char = (
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  );

  arrSymbol: array [1 .. 31] of Char = (
    '!',
    '"',
    '$',
    '%',
    '&',
    '''',
    '(',
    ')',
    '*',
    '+',
    ',',
    '-',
    '.',
    '/',
    ':',
    ';',
    '<',
    '=',
    '>',
    '?',
    '@',
    '[',
    '\',
    ']',
    '^',
    '_',
    '`',
    '{',
    '|',
    '}',
    '~'
  );

implementation

{$R *.dfm}

uses Title_u, LogIn_u;

procedure TfrmSignUp.btnBackClick(Sender: TObject);
begin

  lblUsernameStar.Visible := False;
  lblNameStar.Visible := False;
  lblSurnameStar.Visible := False;
  lblPasswordStar.Visible := False;
  lblConfirmStar.Visible := False;

  edtUser.Text := '';
  edtName.Text := '';
  edtSurname.Text := '';
  edtPassword.Text := '';
  edtConfirmPassword.Text := '';

  Self.Close;
  frmTitleScreen.Show;

end;

procedure TfrmSignUp.btnLogInClick(Sender: TObject);
begin
  lblUsernameStar.Visible := False;
  lblNameStar.Visible := False;
  lblSurnameStar.Visible := False;
  lblPasswordStar.Visible := False;
  lblConfirmStar.Visible := False;

  edtUser.Text := '';
  edtName.Text := '';
  edtSurname.Text := '';
  edtPassword.Text := '';
  edtConfirmPassword.Text := '';

  frmLogIn.Show;
  Self.Hide;
end;

procedure TfrmSignUp.btnSignUpClick(Sender: TObject);
var
  sUsername, sName, sSurname, sPassword, sConfirm: String;
  iPassword: Integer;
  tFile: TextFile;
  sLine: String;
  bLower, bUpper, bSymbol: Boolean;
  i, k: Integer;
begin

  // Get the information entered by the user
  sUsername := edtUser.Text;
  sName := edtName.Text;
  sSurname := edtSurname.Text;
  sPassword := edtPassword.Text;
  sConfirm := edtConfirmPassword.Text;

  // Set password requirements to False initially
  bLower := False;
  bUpper := False;
  bSymbol := False;

  // Hide all error stars
  lblUsernameStar.Visible := False;
  lblNameStar.Visible := False;
  lblSurnameStar.Visible := False;
  lblPasswordStar.Visible := False;
  lblConfirmStar.Visible := False;

  // -------------------------
  // Check for empty fields
  // -------------------------

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

  if sConfirm = '' then
  begin
    ShowMessage('Please confirm your Password');
    lblConfirmStar.Visible := True;
    Exit;
  end;

  // -------------------------
  // Check for # in username
  // -------------------------

  if Pos('#', sUsername) > 0 then
  begin
    ShowMessage('You may not have a hashtag (#) in your Username.');
    lblUsernameStar.Visible := True;
    Exit;
  end;

  // -------------------------
  // Check for # in name
  // -------------------------

  if Pos('#', sName) > 0 then
  begin
    ShowMessage('You may not have a hashtag (#) in your Name.');
    lblNameStar.Visible := True;
    Exit;
  end;

  // -------------------------
  // Check for # in surname
  // -------------------------

  if Pos('#', sSurname) > 0 then
  begin
    ShowMessage('You may not have a hashtag (#) in your Surname.');
    lblSurnameStar.Visible := True;
    Exit;
  end;

  // -------------------------
  // Check that passwords match
  // -------------------------

  if sPassword <> sConfirm then
  begin
    ShowMessage('Passwords do not match.');

    lblPasswordStar.Visible := True;
    lblConfirmStar.Visible := True;

    edtPassword.Text := '';
    edtConfirmPassword.Text := '';

    Exit;
  end;

  // -------------------------
  // Check password length
  // -------------------------

  iPassword := Length(sPassword);

  if iPassword > 20 then
  begin
    ShowMessage('Password may not be more than 20 characters.');

    lblPasswordStar.Visible := True;
    lblConfirmStar.Visible := True;

    Exit;
  end;

  // -------------------------
  // Check password characters
  // -------------------------

  for i := 1 to Length(sPassword) do
  begin

    // Check uppercase and lowercase letters
    for k := 1 to 26 do
    begin
      if sPassword[i] = arrUpper[k] then
        bUpper := True;

      if sPassword[i] = arrLower[k] then
        bLower := True;
    end;

    // Check symbols
    for k := 1 to 31 do
    begin
      if sPassword[i] = arrSymbol[k] then
        bSymbol := True;
    end;

    // # cannot be used because # separates records in the text file
    if sPassword[i] = '#' then
    begin
      ShowMessage('You may not have a hashtag (#) in your Password.');

      lblPasswordStar.Visible := True;
      lblConfirmStar.Visible := True;

      Exit;
    end;

  end;

  // -------------------------
  // Check password strength
  // -------------------------

  if bUpper = False then
  begin
    ShowMessage('Password must contain at least one uppercase letter.');

    lblPasswordStar.Visible := True;
    lblConfirmStar.Visible := True;

    Exit;
  end;

  if bLower = False then
  begin
    ShowMessage('Password must contain at least one lowercase letter.');

    lblPasswordStar.Visible := True;
    lblConfirmStar.Visible := True;

    Exit;
  end;

  if bSymbol = False then
  begin
    ShowMessage('Password must contain at least one symbol.');

    lblPasswordStar.Visible := True;
    lblConfirmStar.Visible := True;

    Exit;
  end;

  // -------------------------
  // Check that the file exists
  // -------------------------

  if not FileExists('UserLogIn.txt') then
  begin
    ShowMessage('UserLogIn.txt does not exist.');
    Exit;
  end;

  // -------------------------
  // Open the file
  // -------------------------

  AssignFile(tFile, 'UserLogIn.txt');
  Append(tFile);

  // Create the record
  // # is used to separate the information
  sLine := sUsername + '#' + sName + '#' +
           sSurname + '#' + sPassword;

  // Save the record
  WriteLn(tFile, sLine);

  // Close the file
  CloseFile(tFile);

  // -------------------------
  // Clear the form
  // -------------------------

  edtUser.Text := '';
  edtName.Text := '';
  edtSurname.Text := '';
  edtPassword.Text := '';
  edtConfirmPassword.Text := '';

  lblUsernameStar.Visible := False;
  lblNameStar.Visible := False;
  lblSurnameStar.Visible := False;
  lblPasswordStar.Visible := False;
  lblConfirmStar.Visible := False;

  // -------------------------
  // Go to Login form
  // -------------------------

  Self.Hide;
  frmLogIn.Show;

end;

procedure TfrmSignUp.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  lblUsernameStar.Visible := False;
  lblNameStar.Visible := False;
  lblSurnameStar.Visible := False;
  lblPasswordStar.Visible := False;
  lblConfirmStar.Visible := False;

  edtUser.Text := '';
  edtName.Text := '';
  edtSurname.Text := '';
  edtPassword.Text := '';
  edtConfirmPassword.Text := '';

  Self.Close;
  frmTitleScreen.Close;

end;

end.
