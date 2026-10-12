unit Title_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, LogIn_u, Vcl.ExtCtrls,
  SignUp_u, Sudoku_u;

type
  TfrmTitleScreen = class(TForm)
    lblSudoku: TLabel;
    lblLogIn: TLabel;
    lblSignUp: TLabel;
    pnlLogInSignUp: TPanel;
    btnLogIn: TButton;
    btnSignUp: TButton;
    procedure btnLogInClick(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTitleScreen: TfrmTitleScreen;

implementation

{$R *.dfm}

procedure TfrmTitleScreen.btnLogInClick(Sender: TObject);
begin

  Self.Hide;
  frmLogIn.Show;

end;

procedure TfrmTitleScreen.btnSignUpClick(Sender: TObject);
begin

  Self.Hide;
  frmSignUp.Show;

end;

end.
