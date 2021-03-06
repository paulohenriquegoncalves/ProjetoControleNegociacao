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
  uView.CadastroDistribuidor in 'View\uView.CadastroDistribuidor.pas' {frmViewCadastroDistribuidor},
  uMinhasFuncoes in 'Model\uMinhasFuncoes.pas',
  uController.Produtor in 'Controller\uController.Produtor.pas',
  uDAO.Produtor in 'DAO\uDAO.Produtor.pas',
  uModel.Produtor in 'Model\uModel.Produtor.pas',
  uView.CadastroProdutor in 'View\uView.CadastroProdutor.pas' {frmViewCadastroProdutor},
  uView.PesquisaProdutor in 'View\uView.PesquisaProdutor.pas' {frmViewPesquisaProdutor},
  uView.CadastroLimiteCredito in 'View\uView.CadastroLimiteCredito.pas' {frmViewCadastroLimiteCredito},
  uView.PesquisaLimiteCredito in 'View\uView.PesquisaLimiteCredito.pas' {frmViewPesquisaLimiteCredito},
  uDAO.LimiteCredito in 'DAO\uDAO.LimiteCredito.pas',
  uModel.LimiteCredito in 'Model\uModel.LimiteCredito.pas',
  uController.Negociacao in 'Controller\uController.Negociacao.pas',
  uDAO.Negociacao in 'DAO\uDAO.Negociacao.pas',
  uModel.Negociacao in 'Model\uModel.Negociacao.pas',
  uView.PesquisaNegociacao in 'View\uView.PesquisaNegociacao.pas' {frmViewPesquisaNegociacao},
  uView.CadastroNegociacao in 'View\uView.CadastroNegociacao.pas' {frmViewCadastroNegociacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := True;
  Application.CreateForm(TfrmViewPrincipal, frmViewPrincipal);
  Application.CreateForm(TfrmViewCadastroLimiteCredito, frmViewCadastroLimiteCredito);
  Application.CreateForm(TfrmViewPesquisaLimiteCredito, frmViewPesquisaLimiteCredito);
  Application.CreateForm(TfrmViewPesquisaNegociacao, frmViewPesquisaNegociacao);
  Application.CreateForm(TfrmViewCadastroNegociacao, frmViewCadastroNegociacao);
  Application.Run;
end.
