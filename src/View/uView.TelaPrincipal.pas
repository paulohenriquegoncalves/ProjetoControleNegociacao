unit uView.TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uController.Conexao,FireDAC.DApt;


type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uView.Cliente;

procedure TForm1.Button1Click(Sender: TObject);
begin

  frmViewCliente.ShowModal;


 { TControllerConexao.getInstance().daoConexao.getConexao.Connected := True;

  if TControllerConexao.getInstance().daoConexao.getConexao.Connected = True then
     ShowMessage('Banco de dados conectado...');
     }
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 TControllerConexao.getInstance().daoConexao.getConexao.Connected := True;
end;

end.
