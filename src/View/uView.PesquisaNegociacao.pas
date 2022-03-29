unit uView.PesquisaNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.PesquisaPadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, uController.Conexao, uController.Negociacao, uTypes,
  Vcl.DBCtrls, uController.Produtor, uController.Distribuidor;

type
  TfrmViewPesquisaNegociacao = class(TfrmViewPesquisaPadrao)
    GroupBox1: TGroupBox;
    btnPesquisar: TButton;
    Label11: TLabel;
    dbcbxDistribuidor: TDBLookupComboBox;
    dbcbxProdutor: TDBLookupComboBox;
    rdgStatus: TRadioGroup;
    Label1: TLabel;
    dtsDistribuidor: TDataSource;
    memTblDistribuidor: TFDMemTable;
    memTblDistribuidorCODDISTRIBUIDOR: TIntegerField;
    memTblDistribuidorNOMEDISTRIBUIDOR: TWideStringField;
    dtsProdutor: TDataSource;
    memTblProdutor: TFDMemTable;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisarNegociacao;
    procedure ExibirNegociacao;
  public
    { Public declarations }
     qryNegociacao: TFDQuery;
     controllerNegociacao: TControllerNegociacao;

     qryProdutor: TFDQuery;
     controllerProdutor: TControllerProdutor;

     qryDistribuidor: TFDQuery;
     controllerDistribuidor: TControllerDistribuidor;
  end;

var
  frmViewPesquisaNegociacao: TfrmViewPesquisaNegociacao;

implementation


{$R *.dfm}



//uses uView.CadastroNegociacao;

{ TfrmViewPesquisaNegociacao }

procedure TfrmViewPesquisaNegociacao.FormCreate(Sender: TObject);
begin
  inherited;

  controllerProdutor := TControllerProdutor.Create;
  qryProdutor        := TFDQuery.Create(frmViewPesquisaNegociacao);

  controllerDistribuidor := TControllerDistribuidor.Create;
  qryDistribuidor        := TFDQuery.Create(frmViewPesquisaNegociacao);

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

  if Assigned(qryProdutor) then
    FreeAndNil(qryProdutor);

  if Assigned(controllerProdutor) then
    FreeAndNil(controllerProdutor);

  if Assigned(qryDistribuidor) then
    FreeAndNil(qryDistribuidor);

  if Assigned(controllerDistribuidor) then
    FreeAndNil(controllerDistribuidor);
end;

procedure TfrmViewPesquisaNegociacao.FormShow(Sender: TObject);
begin
  inherited;
  qryDistribuidor := Self.controllerDistribuidor.ModelDistribuidor.selecionar;
  try
    qryDistribuidor.FetchAll;
    memTblDistribuidor.Close;
    memTblDistribuidor.Data := qryDistribuidor.Data;
    memTblDistribuidor.First;
  finally
    qryDistribuidor.Close;
  end;


  qryProdutor := Self.controllerProdutor.ModelProdutor.selecionar;
  try
    qryProdutor.FetchAll;
    memTblProdutor.Close;
    memTblProdutor.Data := qryProdutor.Data;
    memTblProdutor.First;
  finally
    qryProdutor.Close;
  end;
end;

procedure TfrmViewPesquisaNegociacao.btnExcluirClick(Sender: TObject);
begin
  inherited;

  controllerNegociacao.ModelNegociacao.TipoOperacao  := uTypes.tpExclusao;
  controllerNegociacao.ModelNegociacao.IDNegociacao  := memTabela.FieldByName('IDNEGOCIACAO').AsInteger;

  if controllerNegociacao.PersistirNegociacao then
  begin
    showmessage('Opera��o realizada com sucesso!');
    Self.PesquisarNegociacao;
  end
  else
    showmessage('N�o foi poss�vel realizar a opera��o!');
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

procedure TfrmViewPesquisaNegociacao.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  //FILTROS PARA BUSCAR NEGOCIA��O
  controllerNegociacao.ModelNegociacao.CodigoDistribuidor := VarToStrDef(dbcbxDistribuidor.KeyValue,'0').ToInteger;
  controllerNegociacao.ModelNegociacao.CodigoProdutor     := VarToStrDef(dbcbxProdutor.KeyValue,'0').ToInteger;
  case rdgStatus.ItemIndex of
    0: controllerNegociacao.ModelNegociacao.Status        := tpPendente;
    1: controllerNegociacao.ModelNegociacao.Status        := tpAprovado;
    2: controllerNegociacao.ModelNegociacao.Status        := tpConcluido;
    3: controllerNegociacao.ModelNegociacao.Status        := tpCancelado;
    4: controllerNegociacao.ModelNegociacao.Status        := tpTodos;
  end;

  //CONSULTANDO NEGOCIACAO
  qryNegociacao := controllerNegociacao.SelecionarNegociacao;
  try
    qryNegociacao.FetchAll;
    memTabela.Close;
    memTabela.Data := qryNegociacao.Data;
  finally
    qryNegociacao.Close;
  end;
end;

procedure TfrmViewPesquisaNegociacao.btnAlterarClick(Sender: TObject);
begin
  inherited;
  Self.ExibirNegociacao;
end;

procedure TfrmViewPesquisaNegociacao.PesquisarNegociacao;
begin
  inherited;

end;

end.
