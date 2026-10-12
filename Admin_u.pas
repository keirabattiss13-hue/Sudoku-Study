unit Admin_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Title_u,
  Vcl.ExtCtrls;

type
  TfrmAdmin = class(TForm)
    redOutput: TRichEdit;
    btnLogOut: TButton;
    btnClear: TButton;
    btnUser: TButton;
    pnlUser: TPanel;
    btnEditName: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnLogOutClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnEditNameClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure UpdateData;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmin: TfrmAdmin;
  arrName: Array of String;
  arrSurname: Array of String;
  arrUsername: Array of String;
  arrPassword: Array of String;

implementation

{$R *.dfm}

uses LogIn_u;

procedure TfrmAdmin.btnClearClick(Sender: TObject);
begin
  redOutput.Lines.Clear;
end;

procedure TfrmAdmin.btnCloseClick(Sender: TObject);
begin
  Self.Close;
  frmTitleScreen.Close;
end;

procedure TfrmAdmin.btnEditNameClick(Sender: TObject);
var
  sUsername, sName, sSurname, sPassword: String;
  i: Integer;
  bFound: Boolean;
begin

  // Input

  bFound := False;

  sUsername := InputBox('Change the name of a user',
    'Enter the username of the user you are trying to change', '');

  sName := InputBox('Change the name of a user',
    'Enter the new name of the user', '');

  // Processing

  for i := 1 to Length(arrUsername) do
  begin
    if sUsername = arrUsername[i] then
    begin
      arrName[i] := sName;
      bFound := True;

      sSurname := arrSurname[i];
      sPassword := arrPassword[i];
    end;
  end;

  // Output

  if bFound = True then
  begin
    Showmessage('Name change for ' + sUsername + ' is successful.');
    redOutput.Lines.Clear;
    redOutput.Lines.Add('Username:' + #13 + sUsername);
    redOutput.Lines.Add('Name:' + #13 + sName);
    redOutput.Lines.Add('Surname:' + #13 + sSurname);
    redOutput.Lines.Add('Password:' + #13 + sPassword);
  end;

end;

procedure TfrmAdmin.btnLogOutClick(Sender: TObject);
begin
  Self.Close;
  frmLogIn.Show;
end;

procedure TfrmAdmin.btnUserClick(Sender: TObject);
var
  sUsername, sName, sSurname, sPassword: String;
  tFile: TextFile;
  sLine: String;
  iPos: Integer;
begin

  redOutput.Lines.Clear;

  if FileExists('UserLogIn.txt') = False then
  begin
    Showmessage('File does not exist.');
    Exit;
  end;

  AssignFile(tFile, 'UserLogIn.txt');
  Reset(tFile);

  While NOT EOF(tFile) do
  begin
    ReadLn(tFile, sLine);

    // Username

    iPos := Pos('#', sLine);
    sUsername := Copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);

    // Name

    iPos := Pos('#', sLine);
    sName := Copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);

    // Surname

    iPos := Pos('#', sLine);
    sSurname := Copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);

    // Password

    sPassword := sLine;
    sLine := '';

    redOutput.Lines.Add('Username: ' + sUsername);
    redOutput.Lines.Add('Name: ' + sName);
    redOutput.Lines.Add('Surname: ' + sSurname);
    redOutput.Lines.Add('Password: ' + sPassword);
    redOutput.Lines.Add('------------------------');
  end;

  CloseFile(tFile);

end;

procedure TfrmAdmin.FormActivate(Sender: TObject);
begin
  UpdateData;
end;

procedure TfrmAdmin.UpdateData;
var
  sLine: String;
  iPos, iCount: Integer;
  tFile: TextFile;
  i: Integer;
begin

  // Input

  iCount := 0;

  if FileExists('UserLogIn.txt') = False then
  begin
    Showmessage('File does not exist');
    Exit;
  end;

  AssignFile(tFile, 'UserLogIn.txt');
  Reset(tFile);

  // Processing

  // Count number of records in tFile
  While NOT EOF(tFile) do
  begin
    ReadLn(tFile, sLine);
    inc(iCount);
  end;

  SetLength(arrUsername, iCount + 1);
  SetLength(arrName, iCount + 1);
  SetLength(arrSurname, iCount + 1);
  SetLength(arrPassword, iCount + 1);

  Reset(tFile);

  // Assign the file to the array
  While NOT EOF(tFile) do
  begin
    for i := 1 to iCount do
    begin
      ReadLn(tFile, sLine);

      iPos := Pos('#', sLine);
      arrUsername[i] := Copy(sLine, 1, iPos - 1);
      Delete(sLine, 1, iPos);

      iPos := Pos('#', sLine);
      arrName[i] := Copy(sLine, 1, iPos - 1);
      Delete(sLine, 1, iPos);

      iPos := Pos('#', sLine);
      arrSurname[i] := Copy(sLine, 1, iPos - 1);
      Delete(sLine, 1, iPos);

      arrPassword[i] := sLine;
      sLine := '';
    end;
  end;

  CloseFile(tFile);

end;

end.
