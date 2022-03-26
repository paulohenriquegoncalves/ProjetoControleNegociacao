unit uView.CadastroProdutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.CadastroPadrao, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmViewCadastroProdutor = class(TfrmViewCadastroPadrao)
    Label11: TLabel;
    edtCodigoProdutor: TEdit;
    edtNomeProdutor: TEdit;
    Label1: TLabel;
    mskEdtCPFCNPJ: TMaskEdit;
    Label2: TLabel;
    cbxCPFCNPJ: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cbxCPFCNPJChange(Sender: TObject);
  private
    { Private declarations }
    procedure SetMascaraDocumento;
  public
    { Public declarations }
  end;

var
  frmViewCadastroProdutor: TfrmViewCadastroProdutor;

implementation

{$R *.dfm}
uses uView.PesquisaProdutor, uExcessoes, uTypes;


procedure TfrmViewCadastroProdutor.btnSalvarClick(Sender: TObject);
begin
  try
    frmViewPesquisaProdutor.controllerProdutor.ModelProdutor.TipoOperacao    := frmViewPesquisaProdutor.TipoOperacao;
    frmViewPesquisaProdutor.controllerProdutor.ModelProdutor.CodigoProdutor  := StrToIntDef(edtCodigoProdutor.Text,0);
    frmViewPesquisaProdutor.controllerProdutor.ModelProdutor.NomeProdutor    := edtNomeProdutor.text;
    frmViewPesquisaProdutor.controllerProdutor.ModelProdutor.CPFCNPJ         := mskEdtCPFCNPJ.Text;

    if frmViewPesquisaProdutor.controllerProdutor.PersistirProdutor then
       showmessage('Operação realizada com sucesso!')
     else
       showmessage('Não foi possível realizar a operação!')
  except
    on E: ENomeObrigatorio do
    begin
      edtNomeProdutor.SetFocus;
      Raise;
    end;

    on E: ECNPJCPFInvalido do
    begin
      mskEdtCPFCNPJ.SetFocus;
      Raise;
    end;

    on E: Exception do
    begin
      raise Exception.Create('Não foi possível realizar a operação!'+E.Message);
    end;
  end;
  inherited;
end;

procedure TfrmViewCadastroProdutor.cbxCPFCNPJChange(Sender: TObject);
begin
  inherited;
  Self.SetMascaraDocumento;
end;

procedure TfrmViewCadastroProdutor.FormShow(Sender: TObject);
begin
  inherited;
  if frmViewPesquisaProdutor.TipoOperacao = tpInclusao then
  begin
    edtCodigoProdutor.Clear;
    edtNomeProdutor.Clear;
    mskEdtCPFCNPJ.Clear;
    cbxCPFCNPJ.ItemIndex := 0;
    Self.SetMascaraDocumento;
  end
  else
  begin
    edtCodigoProdutor.Text := frmViewPesquisaProdutor.memTabela.FieldByName('CODPRODUTOR').AsInteger.ToString;
    edtNomeProdutor.Text   := frmViewPesquisaProdutor.memTabela.FieldByName('NOMEPRODUTOR').AsString;
    mskEdtCPFCNPJ.Text     := frmViewPesquisaProdutor.memTabela.FieldByName('CPF_CNPJ').AsString;

    if Length(mskEdtCPFCNPJ.Text) = 11 then
      cbxCPFCNPJ.ItemIndex := 0
    else cbxCPFCNPJ.ItemIndex := 1;
    Self.SetMascaraDocumento;
  end;
end;

procedure TfrmViewCadastroProdutor.SetMascaraDocumento;
begin
  case cbxCPFCNPJ.ItemIndex of
    0: mskEdtCPFCNPJ.EditMask := '!999.999.999-99;0;';
    1: mskEdtCPFCNPJ.EditMask := '!99.999.999/9999-99;0';
  end;
end;

end.
