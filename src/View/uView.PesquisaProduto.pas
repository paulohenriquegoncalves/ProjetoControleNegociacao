unit uView.PesquisaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.PesquisaPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, uController.Conexao, uController.Produto, uTypes;

type
  TfrmViewPesquisaProduto = class(TfrmViewPesquisaPadrao)
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisarProdutos;
    procedure ExibirProduto;
  public
    { Public declarations }
     qryProduto: TFDQuery;
     controllerProduto: TControllerProduto;
  end;

var
  frmViewPesquisaProduto: TfrmViewPesquisaProduto;

implementation


{$R *.dfm}

uses uView.CadastroProduto;

{ TfrmViewPesquisaProduto }


procedure TfrmViewPesquisaProduto.btnExcluirClick(Sender: TObject);
begin
  inherited;

  controllerProduto.ModelProduto.TipoOperacao  := uTypes.tpExclusao;
  controllerProduto.ModelProduto.CodigoProduto := memTabela.FieldByName('CODPRODUTO').AsInteger;

  if controllerProduto.persistir then
  begin
    showmessage('Operação realizada com sucesso!');
    Self.PesquisarProdutos;
  end
  else
    showmessage('Não foi possível realizar a operação!');
end;

procedure TfrmViewPesquisaProduto.ExibirProduto;
begin
  Application.CreateForm(tfrmViewCadastroProduto, frmViewCadastroProduto);
  frmViewCadastroProduto.ShowModal;

  Self.PesquisarProdutos;
end;

procedure TfrmViewPesquisaProduto.btnIncluirClick(Sender: TObject);
begin
  inherited;
  Self.ExibirProduto;
end;

procedure TfrmViewPesquisaProduto.btnAlterarClick(Sender: TObject);
begin
  inherited;
  Self.ExibirProduto;
end;

procedure TfrmViewPesquisaProduto.FormCreate(Sender: TObject);
begin
  inherited;
  controllerProduto := TControllerProduto.Create;
  qryProduto        := TFDQuery.Create(frmViewPesquisaProduto);
end;

procedure TfrmViewPesquisaProduto.FormDestroy(Sender: TObject);
begin
  inherited;

  if Assigned(qryProduto) then
    FreeAndNil(qryProduto);

  if Assigned(controllerProduto) then
    FreeAndNil(controllerProduto);
end;

procedure TfrmViewPesquisaProduto.FormShow(Sender: TObject);
begin
  inherited;
  Self.PesquisarProdutos;
end;

procedure TfrmViewPesquisaProduto.PesquisarProdutos;
begin
  inherited;

  qryProduto := controllerProduto.selecionar;
  try
    qryProduto.FetchAll;
    memTabela.Close;
    memTabela.Data := qryProduto.Data;
  finally
    qryProduto.Close;
  end;

end;

end.
