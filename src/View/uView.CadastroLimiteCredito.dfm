inherited frmViewCadastroLimiteCredito: TfrmViewCadastroLimiteCredito
  Caption = 'Cadastro de LimiteCredito'
  ClientHeight = 90
  ClientWidth = 567
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 583
  ExplicitHeight = 129
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCadastro: TPanel
    Width = 567
    Height = 53
    ExplicitWidth = 567
    ExplicitHeight = 607
    object Label11: TLabel
      Left = 10
      Top = 5
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Distribuidor'
    end
    object Label2: TLabel
      Left = 439
      Top = 5
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = 'Limite de cr'#233'dito'
    end
    object edtLimiteCredito: TEdit
      Left = 435
      Top = 20
      Width = 119
      Height = 21
      NumbersOnly = True
      TabOrder = 0
    end
    object dbcbxDistribuidor: TDBLookupComboBox
      Left = 10
      Top = 20
      Width = 407
      Height = 21
      KeyField = 'CODDISTRIBUIDOR'
      ListField = 'NOMEDISTRIBUIDOR'
      ListSource = dtsDistribuidor
      TabOrder = 1
    end
  end
  inherited pnlBotores: TPanel
    Top = 53
    Width = 567
    ExplicitTop = 607
    ExplicitWidth = 567
    inherited btnSalvar: TButton
      Left = 254
      ExplicitLeft = 254
    end
    inherited btnCancelar: TButton
      Left = 410
      ExplicitLeft = 410
    end
  end
  object dtsDistribuidor: TDataSource
    DataSet = memTblDistribuidor
    Left = 25
    Top = 45
  end
  object memTblDistribuidor: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 125
    Top = 45
    object memTblDistribuidorCODDISTRIBUIDOR: TIntegerField
      FieldName = 'CODDISTRIBUIDOR'
    end
    object memTblDistribuidorNOMEDISTRIBUIDOR: TWideStringField
      FieldName = 'NOMEDISTRIBUIDOR'
      Size = 100
    end
  end
end
