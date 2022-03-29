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
    NegociaoProdutorDistribuidor1: TMenuItem;
    procedure Produtos1Click(Sender: TObject);
    procedure Distribuidores1Click(Sender: TObject);
    procedure Produtores1Click(Sender: TObject);
    procedure NegociaoProdutorDistribuidor1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewPrincipal: TfrmViewPrincipal;

implementation

{$R *.dfm}

uses uView.PesquisaProduto, uView.PesquisaDistribuidor, uView.PesquisaProdutor,
  uView.PesquisaNegociacao;

procedure TfrmViewPrincipal.Distribuidores1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmViewPesquisaDistribuidor, frmViewPesquisaDistribuidor);
  frmViewPesquisaDistribuidor.ShowModal;
end;

procedure TfrmViewPrincipal.NegociaoProdutorDistribuidor1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmViewPesquisaNegociacao, frmViewPesquisaNegociacao);
  frmViewPesquisaNegociacao.ShowModal;
end;

procedure TfrmViewPrincipal.Produtores1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmViewPesquisaProdutor, frmViewPesquisaProdutor);
  frmViewPesquisaProdutor.ShowModal;
end;

procedure TfrmViewPrincipal.Produtos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmViewPesquisaProduto, frmViewPesquisaProduto);
  frmViewPesquisaProduto.ShowModal;
end;

end.
