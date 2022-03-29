unit uView.PesquisaNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.PesquisaPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, uController.Conexao, uController.Negociacao, uTypes,
  Vcl.DBCtrls;

type
  TfrmViewPesquisaNegociacao = class(TfrmViewPesquisaPadrao)
    GroupBox1: TGroupBox;
    btnPesquisar: TButton;
    Label11: TLabel;
    dbcbxDistribuidor: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisarNegociacao;
    procedure ExibirNegociacao;
  public
    { Public declarations }
     qryNegociacao: TFDQuery;
     controllerNegociacao: TControllerNegociacao;
  end;

var
  frmViewPesquisaNegociacao: TfrmViewPesquisaNegociacao;

implementation


{$R *.dfm}

//uses uView.CadastroNegociacao;

{ TfrmViewPesquisaNegociacao }


procedure TfrmViewPesquisaNegociacao.btnExcluirClick(Sender: TObject);
begin
  inherited;

  controllerNegociacao.ModelNegociacao.TipoOperacao  := uTypes.tpExclusao;
  controllerNegociacao.ModelNegociacao.IDNegociacao  := memTabela.FieldByName('IDNEGOCIACAO').AsInteger;

  if controllerNegociacao.PersistirNegociacao then
  begin
    showmessage('Operação realizada com sucesso!');
    Self.PesquisarNegociacao;
  end
  else
    showmessage('Não foi possível realizar a operação!');
end;

procedure TfrmViewPesquisaNegociacao.ExibirNegociacao;
begin
{
  Application.CreateForm(tfrmViewCadastroNegociacao, frmViewCadastroNegociacao);
  frmViewCadastroNegociacao.ShowModal;
 }
  Self.PesquisarNegociacao;
end;

procedure TfrmViewPesquisaNegociacao.btnIncluirClick(Sender: TObject);
begin
  inherited;
  Self.ExibirNegociacao;
end;

procedure TfrmViewPesquisaNegociacao.btnAlterarClick(Sender: TObject);
begin
  inherited;
  Self.ExibirNegociacao;
end;

procedure TfrmViewPesquisaNegociacao.FormCreate(Sender: TObject);
begin
  inherited;
  controllerNegociacao := TControllerNegociacao.Create;
  qryNegociacao        := TFDQuery.Create(frmViewPesquisaNegociacao);
end;

procedure TfrmViewPesquisaNegociacao.FormDestroy(Sender: TObject);
begin
  inherited;

  if Assigned(qryNegociacao) then
    FreeAndNil(qryNegociacao);

  if Assigned(controllerNegociacao) then
    FreeAndNil(controllerNegociacao);
end;

procedure TfrmViewPesquisaNegociacao.FormShow(Sender: TObject);
begin
  inherited;
  Self.PesquisarNegociacao;
end;

procedure TfrmViewPesquisaNegociacao.PesquisarNegociacao;
begin
  inherited;

  qryNegociacao := controllerNegociacao.SelecionarNegociacao;
  try
    qryNegociacao.FetchAll;
    memTabela.Close;
    memTabela.Data := qryNegociacao.Data;
  finally
    qryNegociacao.Close;
  end;

end;

end.
