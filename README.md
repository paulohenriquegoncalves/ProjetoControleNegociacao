# ProjetoControleNegociacao
Projeto desenvolvimento em Delphi 10.4 Community Edition
O projeto consiste em 3 telas cadastros e 1 tela de negociação.
<br/>
Cadastros de Produto, Distribuidor e Produtor (com limite de crédito por distribuidor).
<p>
O projeto esta estruturado no padrão MVC (Modelo / Visão / Controle) onde:
<p>
<b>1º Visão - Pasta View:</b> Ficam os "forms" do sistema (*.dfm) e (*.pas). Todos os formulários utilizam a seguinte nomeclatura: "uView.*"
<br/>
<i>Exemplo: uView.PesquisaProduto e uView.CadastroProduto<i/>
<p>
Observação: Os formulários de cadsastro e pesquisa são herdados por "formularios padrão" que são "uView.CadastroPadrao" e "uView.PesquisaPadrao".  
