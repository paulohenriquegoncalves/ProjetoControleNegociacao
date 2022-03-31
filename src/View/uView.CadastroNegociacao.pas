unit uView.CadastroNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.CadastroPadrao, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmViewCadastroNegociacao = class(TfrmViewCadastroPadrao)
    Label11: TLabel;
    edtCodigoNegociacao: TEdit;
    edtNomeNegociacao: TEdit;
    Label1: TLabel;
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
  frmViewCadastroNegociacao: TfrmViewCadastroNegociacao;

implementation

{$R *.dfm}
uses uView.PesquisaNegociacao, uExcessoes, uTypes;


procedure TfrmViewCadastroNegociacao.btnSalvarClick(Sender: TObject);
begin
  try
    frmViewPesquisaNegociacao.controllerNegociacao.ModelNegociacao.TipoOperacao    := frmViewPesquisaNegociacao.TipoOperacao;
    frmViewPesquisaNegociacao.controllerNegociacao.ModelNegociacao.CodigoNegociacao  := StrToIntDef(edtCodigoNegociacao.Text,0);
    frmViewPesquisaNegociacao.controllerNegociacao.ModelNegociacao.NomeNegociacao    := edtNomeNegociacao.text;
    frmViewPesquisaNegociacao.controllerNegociacao.ModelNegociacao.CPFCNPJ         := mskEdtCPFCNPJ.Text;

    if frmViewPesquisaNegociacao.controllerNegociacao.PersistirNegociacao then
       showmessage('Operação realizada com sucesso!')
     else
       showmessage('Não foi possível realizar a operação!')
  except
    on E: ENomeObrigatorio do
    begin
      edtNomeNegociacao.SetFocus;
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

procedure TfrmViewCadastroNegociacao.cbxCPFCNPJChange(Sender: TObject);
begin
  inherited;
  Self.SetMascaraDocumento;
end;

procedure TfrmViewCadastroNegociacao.FormShow(Sender: TObject);
begin
  inherited;
  if frmViewPesquisaNegociacao.TipoOperacao = tpInclusao then
  begin
    edtCodigoNegociacao.Clear;
    edtNomeNegociacao.Clear;
    mskEdtCPFCNPJ.Clear;
    cbxCPFCNPJ.ItemIndex := 0;
    Self.SetMascaraDocumento;
  end
  else
  begin
    edtCodigoNegociacao.Text := frmViewPesquisaNegociacao.memTabela.FieldByName('CODNegociacao').AsInteger.ToString;
    edtNomeNegociacao.Text   := frmViewPesquisaNegociacao.memTabela.FieldByName('NOMENegociacao').AsString;
    mskEdtCPFCNPJ.Text     := frmViewPesquisaNegociacao.memTabela.FieldByName('CPF_CNPJ').AsString;

    if Length(mskEdtCPFCNPJ.Text) = 11 then
      cbxCPFCNPJ.ItemIndex := 0
    else cbxCPFCNPJ.ItemIndex := 1;
    Self.SetMascaraDocumento;
  end;
end;

procedure TfrmViewCadastroNegociacao.SetMascaraDocumento;
begin
  case cbxCPFCNPJ.ItemIndex of
    0: mskEdtCPFCNPJ.EditMask := '!999.999.999-99;0;';
    1: mskEdtCPFCNPJ.EditMask := '!99.999.999/9999-99;0';
  end;
end;

end.
