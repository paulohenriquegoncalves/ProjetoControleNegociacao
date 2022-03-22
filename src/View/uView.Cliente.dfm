object frmViewCliente: TfrmViewCliente
  Left = 0
  Top = 0
  Caption = 'frmViewCliente'
  ClientHeight = 498
  ClientWidth = 1118
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 14
    Top = 49
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'C'#243'digo:'
  end
  object btnSalvar: TButton
    Left = 94
    Top = 388
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 0
    OnClick = btnSalvarClick
  end
  object btnAlterar: TButton
    Left = 352
    Top = 388
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 1
    OnClick = btnAlterarClick
  end
  object btnExcluir: TButton
    Left = 568
    Top = 388
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 2
    OnClick = btnExcluirClick
  end
  object btnPesquisarProdutos: TButton
    Left = 744
    Top = 336
    Width = 165
    Height = 25
    Caption = 'Pesquisar Produtos'
    TabOrder = 3
    OnClick = btnPesquisarProdutosClick
  end
  object DBGrid1: TDBGrid
    Left = 469
    Top = 8
    Width = 497
    Height = 209
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object edtCodigoProduto: TEdit
    Left = 14
    Top = 68
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edtNomeProduto: TLabeledEdit
    Tag = 1
    Left = 14
    Top = 117
    Width = 426
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 6
  end
  object edtPrecoVendaProduto: TLabeledEdit
    Tag = 1
    Left = 14
    Top = 165
    Width = 121
    Height = 21
    EditLabel.Width = 80
    EditLabel.Height = 13
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'Limite de Cr'#233'dito'
    EditLabel.ParentBiDiMode = False
    TabOrder = 7
    Text = '0,00'
  end
  object DataSource1: TDataSource
    DataSet = memProduto
    Left = 630
    Top = 112
  end
  object memProduto: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 790
    Top = 136
  end
end
