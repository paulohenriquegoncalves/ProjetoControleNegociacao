# ProjetoControleNegociacao
Projeto desenvolvimento em Delphi 10.4 Community Edition
O projeto consiste em 3 telas cadastros e 1 tela de negociação.
<br/>
Cadastros de Produto, Distribuidor e Produtor (com limite de crédito por distribuidor).
<p>
O projeto esta estruturado no padrão MVC (Modelo / Visão / Controle) onde:
<p>  
<img src="https://github.com/paulohenriquegoncalves/ProjetoControleNegociacao/blob/master/docs/implementando%20arquitetura%20mvc.png" alt="MVC">    
<p>
<b>1º Visão - Pasta View:</b> Ficam os "forms" do sistema (*.dfm) e (*.pas). Todos os formulários utilizam a seguinte nomeclatura: "uView.*"
<p>
<i>Exemplo: uView.PesquisaProduto e uView.CadastroProduto<i/>
<p>
<i>Observação: Os formulários de cadsastro e pesquisa são herdados por "formularios padrão" que são "uView.CadastroPadrao" e "uView.PesquisaPadrao".<i/>  
<p>
<img src="https://github.com/paulohenriquegoncalves/ProjetoControleNegociacao/blob/master/docs/heranca%20de%20formulario.png" alt="HerancaForm">      
<p>
<b>2º Controle - Pasta Controller:</b> Ficam os "controladores" do sistema. Esse controlador é uma ponte entre a visão (formulários) e os modelos (entidades de negócio). Todos os controle utilizam a seguinte nomeclatura: "uController.*"  
<p>
<i>Exemplo: uController.Produtor<i/>
<p>
<img src="https://github.com/paulohenriquegoncalves/ProjetoControleNegociacao/blob/master/docs/controladores.png" alt="controladores">  
<b>3º Modelo - Pasta Modell:</b> Ficam os "modelos" do sistema. O modelo é uma representação de entidades de negócio, ou seja, é uma presentação de um objeto da vida real. Todos os controle utilizam a seguinte nomeclatura: "uModel.*"  
<p>
<i>Exemplo: uModel.Produtor<i/>  
<img src="https://github.com/paulohenriquegoncalves/ProjetoControleNegociacao/blob/master/docs/modelos.png" alt="">
<p>
<b>Camada de persistência - DAO: </b> Para deixar o código mais desacoplado e mais organizado foi criada uma camada de persistência dos "modelos" no banco de dados. É nessa camada que escrevemos os DMLs (select, insert, update e delete). Todos os objetos DAO utilizam a seguinte nomeclatura: "uDAO.*"
<i>Exemplo: uDAO.Produtor<i/>    
<p>  
<img src="https://github.com/paulohenriquegoncalves/ProjetoControleNegociacao/blob/master/docs/DAO.png" alt="DAO">
<p>
<b>Banco de dados: </b>Foi utilizado o FIREBIRD como SGBD da aplicação. Também foi utilizado o FIREDAC como componente de conexão.
<p>  
Os scripts de criação do banco estão na pasta "ProjetoControleNegociacao/docs/" e o banco de dados já armazenado na pasta "ProjetoControleNegociacao/data/"
<p>  
<img src="https://github.com/paulohenriquegoncalves/ProjetoControleNegociacao/blob/master/docs/banco_dados.png" alt="bancodados">
<p>  
<b>Automação de testes unitários - DUnitX: </b>Como trabalhamos com POO nesse projeto é interessante utilizar o recurso DUNIT do Delphi para implementação de testes unitários. Para aqueles que não conhecem o recurso eu aconselho ler o artigo abaixo que mostra de forma bem simples a utilização de testes no Delphi. 
 <p>
 https://blogs.embarcadero.com/learn-how-to-do-unit-testing-in-delphi-with-the-powerful-dunitx-framework/  
<p>  
<img src="https://github.com/paulohenriquegoncalves/ProjetoControleNegociacao/blob/master/docs/testes_unitarios.png" alt="DUNITX">  
<p>
<b>Cadastros: </b> Para esse projeto não foi utilizado nenhum componente de terceiros ou frameworks. Também não foram feitas muitas validações em tela. O intuito foi mostrar que é possível contruir algo do zero utilizando tudo que é nativo do Delphi.  
<p> 
<img src="https://github.com/paulohenriquegoncalves/ProjetoControleNegociacao/blob/master/docs/cadastro_produtos.png" alt="cadastroproduto">
<p>
<img src="https://github.com/paulohenriquegoncalves/ProjetoControleNegociacao/blob/master/docs/cadastro_distribuidor.png" alt="cadastrodistribuidor">
<p>
<img src="https://github.com/paulohenriquegoncalves/ProjetoControleNegociacao/blob/master/docs/cadastro_produtor.png" alt="cadastroprodutor">
<p> 
<img src="https://github.com/paulohenriquegoncalves/ProjetoControleNegociacao/blob/master/docs/limite_credito.png" alt="limtecredito">
<p> 
 <b>Relatório: </b>Como o Delphi Community 10.4 não trás nenhum gerador de relatório padrão eu utilizei o FORTES REPORT que é um gerador de relatório OPEN SOURCE e esta disponível para baixar no GIT HUB: https://github.com/fortesinformatica/fortesreport-ce.git
<p>
<img src="https://github.com/paulohenriquegoncalves/ProjetoControleNegociacao/blob/master/docs/relatorio_negociacao.png" alt="relatorio">
 
