unit uView.PesquisaDistribuidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.PesquisaPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, uController.Conexao, uController.Distribuidor, uTypes;

type
  TfrmViewPesquisaDistribuidor = class(TfrmViewPesquisaPadrao)
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisarDistribuidores;
    procedure ExibirDistribuidor;
  public
    { Public declarations }
     qryDistribuidor: TFDQuery;
     controllerDistribuidor: TControllerDistribuidor;
  end;

var
  frmViewPesquisaDistribuidor: TfrmViewPesquisaDistribuidor;
implementation


{$R *.dfm}

uses uView.CadastroDistribuidor;

{ TfrmViewPesquisaDistribuidor }


procedure TfrmViewPesquisaDistribuidor.btnExcluirClick(Sender: TObject);
begin
  inherited;

  controllerDistribuidor.ModelDistribuidor.TipoOperacao  := uTypes.tpExclusao;
  controllerDistribuidor.ModelDistribuidor.CodigoDistribuidor := memTabela.FieldByName('CODDistribuidor').AsInteger;

  if controllerDistribuidor.persistir then
  begin
    showmessage('Operação realizada com sucesso!');
    Self.PesquisarDistribuidores;
  end
  else
    showmessage('Não foi possível realizar a operação!');
end;

procedure TfrmViewPesquisaDistribuidor.ExibirDistribuidor;
begin
  Application.CreateForm(tfrmViewCadastroDistribuidor, frmViewCadastroDistribuidor);
  frmViewCadastroDistribuidor.ShowModal;

  Self.PesquisarDistribuidores;
end;

procedure TfrmViewPesquisaDistribuidor.btnIncluirClick(Sender: TObject);
begin
  inherited;
  Self.ExibirDistribuidor;
end;

procedure TfrmViewPesquisaDistribuidor.btnAlterarClick(Sender: TObject);
begin
  inherited;
  Self.ExibirDistribuidor;
end;

procedure TfrmViewPesquisaDistribuidor.FormCreate(Sender: TObject);
begin
  inherited;
  controllerDistribuidor := TControllerDistribuidor.Create;
  qryDistribuidor        := TFDQuery.Create(frmViewPesquisaDistribuidor);
end;

procedure TfrmViewPesquisaDistribuidor.FormDestroy(Sender: TObject);
begin
  inherited;

  if Assigned(qryDistribuidor) then
    FreeAndNil(qryDistribuidor);

  if Assigned(controllerDistribuidor) then
    FreeAndNil(controllerDistribuidor);
end;

procedure TfrmViewPesquisaDistribuidor.FormShow(Sender: TObject);
begin
  inherited;
  Self.PesquisarDistribuidores;
end;

procedure TfrmViewPesquisaDistribuidor.PesquisarDistribuidores;
begin
  inherited;

  qryDistribuidor := controllerDistribuidor.selecionar;
  try
    qryDistribuidor.FetchAll;
    memTabela.Close;
    memTabela.Data := qryDistribuidor.Data;
  finally
    qryDistribuidor.Close;
  end;

end;

end.
