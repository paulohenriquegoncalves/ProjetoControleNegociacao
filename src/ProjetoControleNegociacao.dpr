program ProjetoControleNegociacao;

uses
  Vcl.Forms,
  uController.Conexao in 'Controller\uController.Conexao.pas',
  uDAO.Conexao in 'DAO\uDAO.Conexao.pas',
  uView.Cliente in 'View\uView.Cliente.pas' {frmViewCliente},
  uDAO.Produto in 'DAO\uDAO.Produto.pas',
  uController.Produto in 'Controller\uController.Produto.pas',
  uModel.Produto in 'Model\uModel.Produto.pas',
  uTypes in 'Model\uTypes.pas',
  uView.Principal in 'View\uView.Principal.pas' {frmViewPrincipal},
  uView.CadastroPadrao in 'View\uView.CadastroPadrao.pas' {frmViewCadastroPadrao},
  uView.PesquisaPadrao in 'View\uView.PesquisaPadrao.pas' {frmViewPesquisaPadrao},
  uView.PesquisaProduto in 'View\uView.PesquisaProduto.pas' {frmViewPesquisaProduto},
  uView.CadastroProduto in 'View\uView.CadastroProduto.pas' {frmViewCadastroProduto},
  uExcessoes in 'Model\uExcessoes.pas',
  uModel.Distribuidor in 'Model\uModel.Distribuidor.pas',
  uDAO.Distribuidor in 'DAO\uDAO.Distribuidor.pas',
  uController.Distribuidor in 'Controller\uController.Distribuidor.pas',
  uView.PesquisaDistribuidor in 'View\uView.PesquisaDistribuidor.pas' {frmViewPesquisaDistribuidor},
  uView.CadastroDistribuidor in 'View\uView.CadastroDistribuidor.pas' {frmViewCadastroDistribuidor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := True;
  Application.CreateForm(TfrmViewPrincipal, frmViewPrincipal);
  Application.CreateForm(TfrmViewPesquisaDistribuidor, frmViewPesquisaDistribuidor);
  Application.CreateForm(TfrmViewCadastroDistribuidor, frmViewCadastroDistribuidor);
  Application.Run;
end.
