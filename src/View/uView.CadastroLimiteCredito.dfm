inherited frmViewCadastroLimiteCredito: TfrmViewCadastroLimiteCredito
  Caption = 'Cadastro de LimiteCredito'
  ClientHeight = 644
  ClientWidth = 567
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 583
  ExplicitHeight = 683
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCadastro: TPanel
    Width = 567
    Height = 607
    ExplicitWidth = 567
    ExplicitHeight = 52
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
    object SpeedButton1: TSpeedButton
      Left = 272
      Top = 144
      Width = 23
      Height = 22
    end
    object edtLimiteCredito: TEdit
      Left = 435
      Top = 20
      Width = 119
      Height = 21
      NumbersOnly = True
      TabOrder = 0
    end
    object dbcbxDistribuidor: TDBComboBox
      Left = 10
      Top = 20
      Width = 407
      Height = 21
      AutoComplete = False
      DataField = 'NOMEDISTRIBUIDOR'
      DataSource = dtsDistribuidor
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      Left = 168
      Top = 120
      Width = 320
      Height = 120
      DataSource = dtsDistribuidor
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  inherited pnlBotores: TPanel
    Top = 607
    Width = 567
    ExplicitTop = 52
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
