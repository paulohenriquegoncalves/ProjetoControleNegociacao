unit uView.PesquisaLimiteCredito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.PesquisaPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, uController.Conexao, uController.Produtor, uTypes;

type
  TfrmViewPesquisaLimiteCredito = class(TfrmViewPesquisaPadrao)
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisarLimiteCreditos;
    procedure ExibirLimiteCredito;
  public
    { Public declarations }
     qryLimiteCredito: TFDQuery;
  end;

var
  frmViewPesquisaLimiteCredito: TfrmViewPesquisaLimiteCredito;

implementation


{$R *.dfm}

uses uView.CadastroLimiteCredito, uView.PesquisaProdutor;

{ TfrmViewPesquisaLimiteCredito }


procedure TfrmViewPesquisaLimiteCredito.btnAlterarClick(Sender: TObject);
begin
  inherited;
  Self.ExibirLimiteCredito;
end;

procedure TfrmViewPesquisaLimiteCredito.btnExcluirClick(Sender: TObject);
begin
  inherited;
  frmViewPesquisaProdutor.controllerProdutor.ModelLimiteCredito.TipoOperacao       := uTypes.tpExclusao;
  frmViewPesquisaProdutor.controllerProdutor.ModelLimiteCredito.CodigoProdutor     := frmViewPesquisaLimiteCredito.memTabela.FieldByName('CODPRODUTOR').AsInteger;
  frmViewPesquisaProdutor.controllerProdutor.ModelLimiteCredito.CodigoDistribuidor := frmViewPesquisaLimiteCredito.memTabela.FieldByName('CODDISTRIBUIDOR').AsInteger;

  if frmViewPesquisaProdutor.controllerProdutor.PersistirLimiteCredito then
  begin
    showmessage('Operação realizada com sucesso!');
    Self.PesquisarLimiteCreditos;
  end
  else
    showmessage('Não foi possível realizar a operação!');
end;

procedure TfrmViewPesquisaLimiteCredito.ExibirLimiteCredito;
begin
  Application.CreateForm(tfrmViewCadastroLimiteCredito, frmViewCadastroLimiteCredito);
  frmViewCadastroLimiteCredito.ShowModal;

  Self.PesquisarLimiteCreditos;
end;

procedure TfrmViewPesquisaLimiteCredito.btnIncluirClick(Sender: TObject);
begin
  inherited;
  Self.ExibirLimiteCredito;
end;

procedure TfrmViewPesquisaLimiteCredito.FormCreate(Sender: TObject);
begin
  inherited;
  qryLimiteCredito   := TFDQuery.Create(frmViewPesquisaLimiteCredito);
end;

procedure TfrmViewPesquisaLimiteCredito.FormDestroy(Sender: TObject);
begin
  inherited;

  if Assigned(qryLimiteCredito) then
    FreeAndNil(qryLimiteCredito);
end;

procedure TfrmViewPesquisaLimiteCredito.FormShow(Sender: TObject);
begin
  inherited;
  Self.PesquisarLimiteCreditos;
end;

procedure TfrmViewPesquisaLimiteCredito.PesquisarLimiteCreditos;
begin
  inherited;

  qryLimiteCredito :=   frmViewPesquisaProdutor.controllerProdutor.SelecionarLimiteCredito(frmViewPesquisaProdutor.memTabela.FieldByName('CODPRODUTOR').AsInteger);
  try
    qryLimiteCredito.FetchAll;
    memTabela.Close;
    memTabela.Data := qryLimiteCredito.Data;
  finally
    qryLimiteCredito.Close;
  end;

end;

end.
