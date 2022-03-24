unit uView.CadastroDistribuidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.CadastroPadrao, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmViewCadastroDistribuidor = class(TfrmViewCadastroPadrao)
    Label11: TLabel;
    edtCodigoDistribuidor: TEdit;
    edtNomeDistribuidor: TEdit;
    Label1: TLabel;
    mskEdtCNPJ: TMaskEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewCadastroDistribuidor: TfrmViewCadastroDistribuidor;

implementation

{$R *.dfm}
uses uView.PesquisaDistribuidor, uExcessoes, uTypes;


procedure TfrmViewCadastroDistribuidor.btnSalvarClick(Sender: TObject);
begin
  try
    frmViewPesquisaDistribuidor.controllerDistribuidor.ModelDistribuidor.TipoOperacao        := frmViewPesquisaDistribuidor.TipoOperacao;
    frmViewPesquisaDistribuidor.controllerDistribuidor.ModelDistribuidor.CodigoDistribuidor  := StrToIntDef(edtCodigoDistribuidor.Text,0);
    frmViewPesquisaDistribuidor.controllerDistribuidor.ModelDistribuidor.NomeDistribuidor    := edtNomeDistribuidor.text;
    frmViewPesquisaDistribuidor.controllerDistribuidor.ModelDistribuidor.CNPJ                := mskEdtCNPJ.Text;

    if frmViewPesquisaDistribuidor.controllerDistribuidor.persistir then
       showmessage('Operação realizada com sucesso!')
     else
       showmessage('Não foi possível realizar a operação!')
  except
    on E: ENomeObrigatorio do
    begin
      edtNomeDistribuidor.SetFocus;
      Raise;
    end;

    on E: ECNPJCPFInvalido do
    begin
      mskEdtCNPJ.SetFocus;
      Raise;
    end;

    on E: Exception do
    begin
      raise Exception.Create('Não foi possível realizar a operação!'+E.Message);
    end;
  end;
  inherited;
end;

procedure TfrmViewCadastroDistribuidor.FormShow(Sender: TObject);
begin
  inherited;
  if frmViewPesquisaDistribuidor.TipoOperacao = tpInclusao then
  begin
    edtCodigoDistribuidor.Clear;
    edtNomeDistribuidor.Clear;
    mskEdtCNPJ.Clear;
  end
  else
  begin
    edtCodigoDistribuidor.Text := frmViewPesquisaDistribuidor.memTabela.FieldByName('CODDISTRIBUIDOR').AsInteger.ToString;
    edtNomeDistribuidor.Text   := frmViewPesquisaDistribuidor.memTabela.FieldByName('NOMEDISTRIBUIDOR').AsString;
    mskEdtCNPJ.Text            := frmViewPesquisaDistribuidor.memTabela.FieldByName('CNPJ').AsString;
  end;
end;

end.
