unit uView.CadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.CadastroPadrao, Vcl.StdCtrls,
  Vcl.ExtCtrls, uTypes, Vcl.Mask;

type
  TfrmViewCadastroProduto = class(TfrmViewCadastroPadrao)
    Label11: TLabel;
    edtCodigoProduto: TEdit;
    Label1: TLabel;
    edtNomeProduto: TEdit;
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
  frmViewCadastroProduto: TfrmViewCadastroProduto;

implementation

{$R *.dfm}

uses uView.PesquisaProduto, System.SysUtils, uExcessoes;

procedure TfrmViewCadastroProduto.FormShow(Sender: TObject);
begin
  inherited;
  if frmViewPesquisaProduto.TipoOperacao = tpInclusao then
  begin
    edtCodigoProduto.Clear;
    edtNomeProduto.Clear;
    edtPrecoVenda.Clear;
  end
  else
  begin
    edtCodigoProduto.Text := frmViewPesquisaProduto.memTabela.FieldByName('CODPRODUTO').AsInteger.ToString;
    edtNomeProduto.Text   := frmViewPesquisaProduto.memTabela.FieldByName('NOMEPRODUTO').AsString;
    edtPrecoVenda.Text    := CurrToStr(frmViewPesquisaProduto.memTabela.FieldByName('PRECOVENDAPRODUTO').AsCurrency);
  end;
end;

procedure TfrmViewCadastroProduto.btnSalvarClick(Sender: TObject);
begin
  try
  frmViewPesquisaProduto.controllerProduto.ModelProduto.TipoOperacao      := frmViewPesquisaProduto.TipoOperacao;
  frmViewPesquisaProduto.controllerProduto.ModelProduto.CodigoProduto     := StrToIntDef(edtCodigoProduto.Text,0);
  frmViewPesquisaProduto.controllerProduto.ModelProduto.NomeProduto       := edtNomeProduto.text;
  frmViewPesquisaProduto.controllerProduto.ModelProduto.PrecoVendaProduto := StrToCurrDef(edtPrecoVenda.Text,0);

  if frmViewPesquisaProduto.controllerProduto.persistir then
     showmessage('Operação realizada com sucesso!')
   else
     showmessage('Não foi possível realizar a operação!')
  except
    on E: ENomeObrigatorio do
    begin
      edtNomeProduto.SetFocus;
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
