unit uView.PesquisaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.StdCtrls, uTypes;

type
  TfrmViewPesquisaPadrao = class(TForm)
    dtsTabela: TDataSource;
    memTabela: TFDMemTable;
    pnlGrid: TPanel;
    pnlBotores: TPanel;
    DBGrid1: TDBGrid;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FTipoOperacao: TOperacao;
  public
    { Public declarations }

    property TipoOperacao: TOperacao read FTipoOperacao;
  end;

var
  frmViewPesquisaPadrao: TfrmViewPesquisaPadrao;

implementation

{$R *.dfm}

procedure TfrmViewPesquisaPadrao.btnAlterarClick(Sender: TObject);
begin
  FTipoOperacao := tpAlteracao;
end;

procedure TfrmViewPesquisaPadrao.btnExcluirClick(Sender: TObject);
begin
  FTipoOperacao := tpExclusao;
end;

procedure TfrmViewPesquisaPadrao.btnIncluirClick(Sender: TObject);
begin
  FTipoOperacao := tpInclusao;
end;

procedure TfrmViewPesquisaPadrao.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmViewPesquisaPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self   := Nil;
end;

end.
