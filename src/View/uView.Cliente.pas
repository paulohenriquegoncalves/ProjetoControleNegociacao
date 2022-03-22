unit uView.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Comp.Client,
  Vcl.Mask, uController.Conexao, uController.Produto, uTypes, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, Vcl.ExtCtrls;

type
  TfrmViewCliente = class(TForm)
    btnSalvar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnPesquisarProdutos: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    memProduto: TFDMemTable;
    edtCodigoProduto: TEdit;
    Label11: TLabel;
    edtNomeProduto: TLabeledEdit;
    edtPrecoVendaProduto: TLabeledEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnPesquisarProdutosClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frmViewCliente: TfrmViewCliente;
  qryProduto: TFDQuery;

implementation

{$R *.dfm}

procedure TfrmViewCliente.btnSalvarClick(Sender: TObject);
var
  controllerProduto: TControllerProduto;

begin
  controllerProduto := TControllerProduto.Create;
  try
    controllerProduto.ModelProduto.TipoOperacao      := uTypes.tpInclusao;
    controllerProduto.ModelProduto.NomeProduto       := edtNomeProduto.Text;
    controllerProduto.ModelProduto.PrecoVendaProduto := StrToCurr(edtPrecoVendaProduto.Text);


    if controllerProduto.persistir then
    begin
      showmessage('Operação realizada com sucesso!');
    end
    else
    begin
        showmessage('Não foi possível realiazar a operação!');
    end;

  finally
    FreeAndNil(controllerProduto);
  end;

end;

procedure TfrmViewCliente.btnAlterarClick(Sender: TObject);
var
  controllerProduto: TControllerProduto;
begin

  controllerProduto := TControllerProduto.Create;
  try
    controllerProduto.ModelProduto.TipoOperacao      := uTypes.tpAlteracao;
    controllerProduto.ModelProduto.CodigoProduto     := StrToInt(edtCodigoProduto.text);
    controllerProduto.ModelProduto.NomeProduto       := edtNomeProduto.text;
    controllerProduto.ModelProduto.PrecoVendaProduto := StrToCurr(edtPrecoVendaProduto.text);

    if controllerProduto.persistir then
      showmessage('Operaqção realizada com sucesso!')
    else
      showmessage('Não foi possível realiazar a operação!');

  finally
    FreeAndNil(controllerProduto);
  end;

end;

procedure TfrmViewCliente.btnExcluirClick(Sender: TObject);
var
  controllerProduto: TControllerProduto;
begin

  controllerProduto := TControllerProduto.Create;
  try
    controllerProduto.ModelProduto.TipoOperacao := uTypes.tpExclusao;

    controllerProduto.ModelProduto.CodigoProduto := StrToIntDef(edtCodigoProduto.Text,0);

    if controllerProduto.persistir then
      showmessage('Operaqção realizada com sucesso!')
    else
      showmessage('Não foi possível realiazar a operação!');

  finally
    FreeAndNil(controllerProduto);
  end;
end;

procedure TfrmViewCliente.btnPesquisarProdutosClick(Sender: TObject);
var
 controllerProduto: TControllerProduto;
begin
  controllerProduto := TControllerProduto.Create;
  qryProduto := TFDQuery.Create(frmViewCliente);
  try
    qryProduto := controllerProduto.selecionar;
    try
      qryProduto.FetchAll;
      memProduto.Close;
      memProduto.Data := qryProduto.Data;
    finally
      qryProduto.Close;
      FreeAndNil(qryProduto);
    end;
  finally
    FreeAndNil(controllerProduto);
  end;

end;

procedure TfrmViewCliente.DBGrid1DblClick(Sender: TObject);
begin
  edtCodigoProduto.Text     := memProduto.FieldByName('CODPRODUTO').AsInteger.ToString;
  edtNomeProduto.Text       := memProduto.FieldByName('NOMEPRODUTO').AsString;
  edtPrecoVendaProduto.Text := CurrToStr(memProduto.FieldByName('PRECOVENDAPRODUTO').AsCurrency);
end;

end.
