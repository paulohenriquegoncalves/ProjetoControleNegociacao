inherited frmViewPesquisaNegociacao: TfrmViewPesquisaNegociacao
  Caption = 'Negocia'#231#227'o'
  ClientWidth = 882
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 898
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    Width = 882
    inherited DBGrid1: TDBGrid
      Top = 113
      Width = 880
      Height = 253
      Columns = <
        item
          Expanded = False
          FieldName = 'IDNEGOCIACAO'
          Title.Caption = 'ID'
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEPRODUTOR'
          Title.Caption = 'Produtor'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEDISTRIBUIDOR'
          Title.Caption = 'Distribuidor'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Title.Caption = 'Status'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_NEGOCIACAO'
          Title.Caption = 'Data'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_NEGOCIACAO'
          Title.Caption = 'Valor da negocia'#231#227'o'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIMITE_CREDITO_CADASTRADO'
          Title.Caption = 'Limite de cr'#233'dito'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENDAS_APROVADAS'
          Title.Caption = 'Total Aprovado'
          Width = 100
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 880
      Height = 112
      Align = alTop
      Caption = 'Filtros'
      TabOrder = 1
      ExplicitWidth = 656
      object Label11: TLabel
        Left = 10
        Top = 19
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Produtor'
      end
      object Label1: TLabel
        Left = 10
        Top = 60
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Distribuidor'
      end
      object btnPesquisar: TButton
        Left = 548
        Top = 50
        Width = 97
        Height = 25
        Caption = '&Pesquisar'
        TabOrder = 0
        OnClick = btnPesquisarClick
      end
      object dbcbxDistribuidor: TDBLookupComboBox
        Left = 10
        Top = 74
        Width = 269
        Height = 21
        Hint = 'Para limpar o campo utilize Ctrl+A'
        KeyField = 'CODDISTRIBUIDOR'
        ListField = 'NOMEDISTRIBUIDOR'
        ListSource = dtsDistribuidor
        NullValueKey = 16449
        TabOrder = 1
      end
      object dbcbxProdutor: TDBLookupComboBox
        Left = 10
        Top = 32
        Width = 269
        Height = 21
        Hint = 'Para limpar o campo utilize Ctrl+A'
        KeyField = 'CODPRODUTOR'
        ListField = 'NOMEPRODUTOR'
        ListSource = dtsProdutor
        NullValueKey = 16449
        TabOrder = 2
      end
      object rdgStatus: TRadioGroup
        Left = 288
        Top = 19
        Width = 234
        Height = 78
        Caption = 'Status'
        Columns = 3
        ItemIndex = 4
        Items.Strings = (
          'Pendentes'
          'Aprovados'
          'Conclu'#237'dos'
          'Cancelado'
          'Todos')
        TabOrder = 3
      end
    end
  end
  inherited pnlBotores: TPanel
    Width = 882
  end
  inherited memTabela: TFDMemTable
    Left = 357
  end
  object dtsDistribuidor: TDataSource
    DataSet = memTblDistribuidor
    Left = 265
    Top = 229
  end
  object memTblDistribuidor: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 357
    Top = 229
    object memTblDistribuidorCODDISTRIBUIDOR: TIntegerField
      FieldName = 'CODDISTRIBUIDOR'
    end
    object memTblDistribuidorNOMEDISTRIBUIDOR: TWideStringField
      FieldName = 'NOMEDISTRIBUIDOR'
      Size = 100
    end
  end
  object dtsProdutor: TDataSource
    DataSet = memTblProdutor
    Left = 265
    Top = 285
  end
  object memTblProdutor: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 357
    Top = 285
    object IntegerField1: TIntegerField
      FieldName = 'CODPRODUTOR'
    end
    object WideStringField1: TWideStringField
      FieldName = 'NOMEPRODUTOR'
      Size = 100
    end
  end
end
