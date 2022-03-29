inherited frmViewPesquisaNegociacao: TfrmViewPesquisaNegociacao
  Caption = 'Negocia'#231#227'o'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    inherited DBGrid1: TDBGrid
      Top = 113
      Height = 253
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 656
      Height = 112
      Align = alTop
      Caption = 'Filtros'
      TabOrder = 1
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
        Top = 62
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
      end
      object dbcbxDistribuidor: TDBLookupComboBox
        Left = 10
        Top = 74
        Width = 269
        Height = 21
        KeyField = 'CODDISTRIBUIDOR'
        ListField = 'NOMEDISTRIBUIDOR'
        TabOrder = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 10
        Top = 32
        Width = 269
        Height = 21
        KeyField = 'CODDISTRIBUIDOR'
        ListField = 'NOMEDISTRIBUIDOR'
        TabOrder = 2
      end
      object RadioGroup1: TRadioGroup
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
end
