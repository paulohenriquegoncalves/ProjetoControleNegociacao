unit uView.CadastroLimiteCredito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.CadastroPadrao, Vcl.StdCtrls,
  Vcl.ExtCtrls, uTypes, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TfrmViewCadastroLimiteCredito = class(TfrmViewCadastroPadrao)
    Label11: TLabel;
    Label2: TLabel;
    edtLimiteCredito: TEdit;
    dbcbxDistribuidor: TDBComboBox;
    dtsDistribuidor: TDataSource;
    memTblDistribuidor: TFDMemTable;
    memTblDistribuidorCODDISTRIBUIDOR: TIntegerField;
    memTblDistribuidorNOMEDISTRIBUIDOR: TWideStringField;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    qryDistribuidor: TFDQuery;
  end;

var
  frmViewCadastroLimiteCredito: TfrmViewCadastroLimiteCredito;

implementation

{$R *.dfm}

uses uView.PesquisaLimiteCredito, System.SysUtils, uExcessoes,
  uView.PesquisaProdutor;

procedure TfrmViewCadastroLimiteCredito.FormCreate(Sender: TObject);
begin
  inherited;
  qryDistribuidor   := TFDQuery.Create(frmViewCadastroLimiteCredito);
end;

procedure TfrmViewCadastroLimiteCredito.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(qryDistribuidor) then
    FreeAndNil(qryDistribuidor);
end;

procedure TfrmViewCadastroLimiteCredito.FormShow(Sender: TObject);
begin
  inherited;

  qryDistribuidor := frmViewPesquisaProdutor.controllerProdutor.ModelLimiteCredito.SelecionarDistribuidoresDisponiveisParaLimiteCredito(frmViewPesquisaLimiteCredito.memTabela.FieldByName('CODPRODUTOR').AsInteger);
  try
    qryDistribuidor.FetchAll;
    memTblDistribuidor.Close;
    memTblDistribuidor.Data := qryDistribuidor.Data;
    memTblDistribuidor.First;
  finally
    qryDistribuidor.Close;
  end;

  if frmViewPesquisaLimiteCredito.TipoOperacao = tpInclusao then
  begin
    dbcbxDistribuidor.Enabled := True;
    edtLimiteCredito.Clear;
  end
  else
  begin
      dbcbxDistribuidor.Enabled := True;
      edtLimiteCredito.Text     := CurrToStr(frmViewPesquisaLimiteCredito.memTabela.FieldByName('LIMITE_CREDITO').AsCurrency);
  end;
end;

procedure TfrmViewCadastroLimiteCredito.btnSalvarClick(Sender: TObject);
begin
  try
  frmViewPesquisaProdutor.controllerProdutor.ModelLimiteCredito.TipoOperacao       := frmViewPesquisaLimiteCredito.TipoOperacao;
  frmViewPesquisaProdutor.controllerProdutor.ModelLimiteCredito.CodigoProdutor     := frmViewPesquisaLimiteCredito.memTabela.FieldByName('CODPRODUTOR').AsInteger;
 {
  if frmViewPesquisaLimiteCredito.TipoOperacao = tpInclusao then
    frmViewPesquisaProdutor.controllerProdutor.ModelLimiteCredito.CodigoDistribuidor := 1;
  else
}
  frmViewPesquisaProdutor.controllerProdutor.ModelLimiteCredito.LimiteCredito      := StrToCurrDef(edtLimiteCredito.Text,0);

  if   frmViewPesquisaProdutor.controllerProdutor.PersistirLimiteCredito then
     showmessage('Operação realizada com sucesso!')
   else
     showmessage('Não foi possível realizar a operação!')
  except
    on E: ENomeObrigatorio do
    begin
      //edtNomeLimiteCredito.SetFocus;
      Raise;
    end;

    on E: EPrecoRevendaInvalido do
    begin
      //edtPrecoVenda.SetFocus;
      Raise;
    end;

    on E: Exception do
    begin
      raise Exception.Create('Não foi possível realizar a operação!'+E.Message);
    end;
  end;

  inherited;
end;

end.
