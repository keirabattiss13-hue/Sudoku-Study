program Login_p;

uses
  Vcl.Forms,
  LogIn_u in 'LogIn_u.pas' {frmLogIn},
  Sudoku_u in 'Sudoku_u.pas' {frmSudoku},
  Title_u in 'Title_u.pas' {frmTitleScreen},
  SignUp_u in 'SignUp_u.pas' {frmSignUp},
  Admin_u in 'Admin_u.pas' {frmAdmin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTitleScreen, frmTitleScreen);
  Application.CreateForm(TfrmLogIn, frmLogIn);
  Application.CreateForm(TfrmSudoku, frmSudoku);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.Run;
end.
