unit uView.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmViewPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Negociao1: TMenuItem;
    Relatrios1: TMenuItem;
    Produtos1: TMenuItem;
    Distribuidores1: TMenuItem;
    Produtores1: TMenuItem;
    procedure Produtos1Click(Sender: TObject);
    procedure Distribuidores1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewPrincipal: TfrmViewPrincipal;

implementation

{$R *.dfm}

uses uView.PesquisaProduto, uView.PesquisaDistribuidor;

procedure TfrmViewPrincipal.Distribuidores1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmViewPesquisaDistribuidor, frmViewPesquisaDistribuidor);
   frmViewPesquisaDistribuidor.ShowModal;
end;

procedure TfrmViewPrincipal.Produtos1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmViewPesquisaProduto, frmViewPesquisaProduto);
   frmViewPesquisaProduto.ShowModal;
end;

end.
