unit uView.PesquisaProdutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.PesquisaPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, uController.Conexao, uController.Produtor, uTypes;

type
  TfrmViewPesquisaProdutor = class(TfrmViewPesquisaPadrao)
    btnLimiteCredito: TButton;
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisarProdutores;
    procedure ExibirProdutor;
  public
    { Public declarations }
     qryProdutor: TFDQuery;
     controllerProdutor: TControllerProdutor;
  end;

var
  frmViewPesquisaProdutor: TfrmViewPesquisaProdutor;
implementation


{$R *.dfm}

uses uView.CadastroProdutor;

{ TfrmViewPesquisaProdutor }


procedure TfrmViewPesquisaProdutor.btnExcluirClick(Sender: TObject);
begin
  inherited;

  controllerProdutor.ModelProdutor.TipoOperacao  := uTypes.tpExclusao;
  controllerProdutor.ModelProdutor.CodigoProdutor := memTabela.FieldByName('CODProdutor').AsInteger;

  if controllerProdutor.persistir then
  begin
    showmessage('Operação realizada com sucesso!');
    Self.PesquisarProdutores;
  end
  else
    showmessage('Não foi possível realizar a operação!');
end;

procedure TfrmViewPesquisaProdutor.ExibirProdutor;
begin
  Application.CreateForm(tfrmViewCadastroProdutor, frmViewCadastroProdutor);
  frmViewCadastroProdutor.ShowModal;

  Self.PesquisarProdutores;
end;

procedure TfrmViewPesquisaProdutor.btnIncluirClick(Sender: TObject);
begin
  inherited;
  Self.ExibirProdutor;
end;

procedure TfrmViewPesquisaProdutor.btnAlterarClick(Sender: TObject);
begin
  inherited;
  Self.ExibirProdutor;
end;

procedure TfrmViewPesquisaProdutor.FormCreate(Sender: TObject);
begin
  inherited;
  controllerProdutor := TControllerProdutor.Create;
  qryProdutor        := TFDQuery.Create(frmViewPesquisaProdutor);
end;

procedure TfrmViewPesquisaProdutor.FormDestroy(Sender: TObject);
begin
  inherited;

  if Assigned(qryProdutor) then
    FreeAndNil(qryProdutor);

  if Assigned(controllerProdutor) then
    FreeAndNil(controllerProdutor);
end;

procedure TfrmViewPesquisaProdutor.FormShow(Sender: TObject);
begin
  inherited;
  Self.PesquisarProdutores;
end;

procedure TfrmViewPesquisaProdutor.PesquisarProdutores;
begin
  inherited;

  qryProdutor := controllerProdutor.selecionar;
  try
    qryProdutor.FetchAll;
    memTabela.Close;
    memTabela.Data := qryProdutor.Data;
  finally
    qryProdutor.Close;
  end;

end;

end.
