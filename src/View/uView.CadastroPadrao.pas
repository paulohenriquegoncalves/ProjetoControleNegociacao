unit uView.CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uTypes;

type
  TfrmViewCadastroPadrao = class(TForm)
    pnlCadastro: TPanel;
    pnlBotores: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  frmViewCadastroPadrao: TfrmViewCadastroPadrao;

implementation

{$R *.dfm}


procedure TfrmViewCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmViewCadastroPadrao.btnSalvarClick(Sender: TObject);
begin
  Self.Close;
end;

end.
