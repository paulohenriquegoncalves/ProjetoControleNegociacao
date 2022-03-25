unit uView.CadastroLimiteCredito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.CadastroPadrao, Vcl.StdCtrls,
  Vcl.ExtCtrls, uTypes, Vcl.Mask;

type
  TfrmViewCadastroLimiteCredito = class(TfrmViewCadastroPadrao)
    Label11: TLabel;
    edtCodigoLimiteCredito: TEdit;
    Label1: TLabel;
    edtNomeLimiteCredito: TEdit;
    Label2: TLabel;
    edtPrecoVenda: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewCadastroLimiteCredito: TfrmViewCadastroLimiteCredito;

implementation

{$R *.dfm}

uses uView.PesquisaLimiteCredito, System.SysUtils, uExcessoes,
  uView.PesquisaProdutor;

procedure TfrmViewCadastroLimiteCredito.FormShow(Sender: TObject);
begin
  inherited;
  if frmViewPesquisaLimiteCredito.TipoOperacao = tpInclusao then
  begin
    edtCodigoLimiteCredito.Clear;
    edtNomeLimiteCredito.Clear;
    edtPrecoVenda.Clear;
  end
  else
  begin
//    edtCodigoLimiteCredito.Text := frmViewPesquisaLimiteCredito.memTabela.FieldByName('CODLimiteCredito').AsInteger.ToString;
//    edtNomeLimiteCredito.Text   := frmViewPesquisaLimiteCredito.memTabela.FieldByName('NOMELimiteCredito').AsString;
//    edtPrecoVenda.Text          := CurrToStr(frmViewPesquisaLimiteCredito.memTabela.FieldByName('PRECOVENDALimiteCredito').AsCurrency);
  end;
end;

procedure TfrmViewCadastroLimiteCredito.btnSalvarClick(Sender: TObject);
begin
  try
  frmViewPesquisaProdutor.controllerProdutor.ModelProdutor.TipoOperacao      := frmViewPesquisaLimiteCredito.TipoOperacao;
//  frmViewPesquisaProdutor.controllerProdutor.ModelProdutor.CodigoLimiteCredito     := StrToIntDef(edtCodigoLimiteCredito.Text,0);
//  frmViewPesquisaProdutor.controllerProdutor.ModelProdutor.NomeLimiteCredito       := edtNomeLimiteCredito.text;
//  frmViewPesquisaProdutor.controllerProdutor.ModelProdutor.PrecoVendaLimiteCredito := StrToCurrDef(edtPrecoVenda.Text,0);

  if   frmViewPesquisaProdutor.controllerProdutor.persistir then
     showmessage('Operação realizada com sucesso!')
   else
     showmessage('Não foi possível realizar a operação!')
  except
    on E: ENomeObrigatorio do
    begin
      edtNomeLimiteCredito.SetFocus;
      Raise;
    end;

    on E: EPrecoRevendaInvalido do
    begin
      edtPrecoVenda.SetFocus;
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
