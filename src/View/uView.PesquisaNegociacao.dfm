inherited frmViewPesquisaNegociacao: TfrmViewPesquisaNegociacao
  Caption = 'Negocia'#231#227'o'
  ClientWidth = 875
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 891
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    Width = 875
    ExplicitWidth = 923
    inherited DBGrid1: TDBGrid
      Top = 113
      Width = 873
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
          Title.Caption = 'Vl. Negocia'#231#227'o'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIMITE_CREDITO_CADASTRADO'
          Title.Caption = 'Lim. Cr'#233'dito'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIMITE_CREDITO_DISPONIVEL'
          Title.Caption = 'Lim. Cr'#233'dito Dispon'#237'vel'
          Width = 120
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 873
      Height = 112
      Align = alTop
      Caption = 'Filtros'
      TabOrder = 1
      ExplicitWidth = 921
      object Label11: TLabel
        Left = 10
        Top = 19
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Produtor'
      end
      object Label1: TLabel
        Left = 374
        Top = 19
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Distribuidor'
      end
      object btnPesquisar: TButton
        Left = 742
        Top = 59
        Width = 97
        Height = 25
        Caption = '&Pesquisar'
        TabOrder = 0
        OnClick = btnPesquisarClick
      end
      object dbcbxDistribuidor: TDBLookupComboBox
        Left = 374
        Top = 32
        Width = 350
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
        Width = 350
        Height = 21
        Hint = 'Para limpar o campo utilize Ctrl+A'
        KeyField = 'CODPRODUTOR'
        ListField = 'NOMEPRODUTOR'
        ListSource = dtsProdutor
        NullValueKey = 16449
        TabOrder = 2
      end
      object rdgStatus: TRadioGroup
        Left = 10
        Top = 59
        Width = 714
        Height = 38
        Caption = 'Status'
        Columns = 5
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
    object rptNegociacoes: TRLReport
      Left = 880
      Top = 144
      Width = 1123
      Height = 794
      DataSource = dtsTabela
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      PageSetup.Orientation = poLandscape
      object RLBand1: TRLBand
        Left = 38
        Top = 38
        Width = 1047
        Height = 59
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clWhite
        ParentColor = False
        Transparent = False
        object RLSystemInfo1: TRLSystemInfo
          Left = 505
          Top = 0
          Width = 36
          Height = 16
          Align = faCenterTop
          Info = itTitle
          Text = ''
          Transparent = False
        end
        object RLLabel1: TRLLabel
          Left = 455
          Top = 22
          Width = 144
          Height = 27
          Caption = 'Negocia'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 920
          Top = 0
          Width = 127
          Height = 16
          Align = faRightTop
          Info = itPageNumber
          Text = 'P'#225'gina'
          Transparent = False
        end
      end
      object RLBand2: TRLBand
        Left = 38
        Top = 97
        Width = 1047
        Height = 16
        BandType = btHeader
        Borders.Color = clWhite
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic, fsUnderline]
        ParentColor = False
        ParentFont = False
        Transparent = False
        object RLLabel2: TRLLabel
          Left = 0
          Top = 0
          Width = 41
          Height = 16
          Align = faTopOnly
          Caption = 'ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = False
        end
        object RLLabel3: TRLLabel
          Left = 51
          Top = 0
          Width = 150
          Height = 16
          Align = faTopOnly
          Caption = 'Produtor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = False
        end
        object RLLabel4: TRLLabel
          Left = 206
          Top = 0
          Width = 150
          Height = 16
          Align = faTopOnly
          Caption = 'Distribuidor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = False
        end
        object RLLabel5: TRLLabel
          Left = 362
          Top = 0
          Width = 91
          Height = 16
          Align = faTopOnly
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = False
        end
        object RLLabel6: TRLLabel
          Left = 455
          Top = 0
          Width = 111
          Height = 16
          Align = faTopOnly
          Caption = 'Data negocia'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 575
          Top = 0
          Width = 117
          Height = 16
          Align = faTopOnly
          Caption = 'Valor Negocia'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = False
        end
        object RLLabel8: TRLLabel
          Left = 699
          Top = 0
          Width = 112
          Height = 16
          Align = faTopOnly
          Caption = 'Limite de cr'#233'dito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = False
        end
        object RLLabel9: TRLLabel
          Left = 817
          Top = 0
          Width = 100
          Height = 16
          Align = faTopOnly
          Caption = 'Total aprovado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand3: TRLBand
        Left = 38
        Top = 113
        Width = 1047
        Height = 16
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Borders.Color = clWhite
        object RLDBText1: TRLDBText
          Left = 0
          Top = 0
          Width = 41
          Height = 16
          Align = faTopOnly
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'IDNEGOCIACAO'
          DataSource = dtsTabela
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 51
          Top = 0
          Width = 150
          Height = 16
          Align = faTopOnly
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'NOMEPRODUTOR'
          DataSource = dtsTabela
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 206
          Top = 0
          Width = 150
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'NOMEDISTRIBUIDOR'
          DataSource = dtsTabela
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 362
          Top = 0
          Width = 91
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'STATUS'
          DataSource = dtsTabela
          Text = ''
          BeforePrint = RLDBText4BeforePrint
        end
        object RLDBText5: TRLDBText
          Left = 458
          Top = 0
          Width = 110
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'DATA_NEGOCIACAO'
          DataSource = dtsTabela
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 577
          Top = 0
          Width = 110
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'TOTAL_NEGOCIACAO'
          DataSource = dtsTabela
          Text = ''
          BeforePrint = RLDBText6BeforePrint
        end
        object RLDBText7: TRLDBText
          Left = 701
          Top = 0
          Width = 110
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'LIMITE_CREDITO_CADASTRADO'
          DataSource = dtsTabela
          DisplayMask = '##,##0.00'
          Text = ''
          BeforePrint = RLDBText6BeforePrint
        end
        object RLDBText8: TRLDBText
          Left = 819
          Top = 0
          Width = 110
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'VENDAS_APROVADAS'
          DataSource = dtsTabela
          DisplayMask = '##,##0.00'
          Text = ''
          BeforePrint = RLDBText6BeforePrint
        end
      end
      object RLBand4: TRLBand
        Left = 38
        Top = 129
        Width = 1047
        Height = 16
        BandType = btFooter
        object RLSystemInfo3: TRLSystemInfo
          Left = 977
          Top = 0
          Width = 70
          Height = 16
          Align = faRightTop
          Text = 'Data:'
        end
        object RLSystemInfo4: TRLSystemInfo
          Left = 907
          Top = 0
          Width = 70
          Height = 16
          Align = faRightTop
          Info = itHour
          Text = 'Hora:'
        end
      end
    end
  end
  inherited pnlBotores: TPanel
    Width = 875
    ExplicitWidth = 923
    object btnImprimir: TButton
      Left = 672
      Top = 5
      Width = 150
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 4
      OnClick = btnImprimirClick
    end
  end
  inherited memTabela: TFDMemTable
    Left = 357
    object memTabelaIDNEGOCIACAO: TIntegerField
      FieldName = 'IDNEGOCIACAO'
    end
    object memTabelaNOMEPRODUTOR: TWideStringField
      FieldName = 'NOMEPRODUTOR'
      Size = 100
    end
    object memTabelaNOMEDISTRIBUIDOR: TWideStringField
      FieldName = 'NOMEDISTRIBUIDOR'
      Size = 100
    end
    object memTabelaSTATUS: TWideStringField
      FieldName = 'STATUS'
      Size = 100
    end
    object memTabelaDATA_NEGOCIACAO: TDateField
      FieldName = 'DATA_NEGOCIACAO'
    end
    object memTabelaTOTAL_NEGOCIACAO: TFMTBCDField
      FieldName = 'TOTAL_NEGOCIACAO'
    end
    object memTabelaLIMITE_CREDITO_CADASTRADO: TFMTBCDField
      FieldName = 'LIMITE_CREDITO_CADASTRADO'
    end
    object memTabelaLIMITE_CREDITO_DISPONIVEL: TFMTBCDField
      FieldName = 'LIMITE_CREDITO_DISPONIVEL'
    end
  end
  object dtsDistribuidor: TDataSource
    DataSet = memTblDistribuidor
    Left = 265
    Top = 197
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
    Top = 197
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
    Top = 253
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
    Top = 253
    object IntegerField1: TIntegerField
      FieldName = 'CODPRODUTOR'
    end
    object WideStringField1: TWideStringField
      FieldName = 'NOMEPRODUTOR'
      Size = 100
    end
  end
end
