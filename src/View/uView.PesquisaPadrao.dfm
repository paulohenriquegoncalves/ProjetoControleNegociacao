object frmViewPesquisaPadrao: TfrmViewPesquisaPadrao
  Left = 0
  Top = 0
  Caption = 'frmViewPesquisaPadrao'
  ClientHeight = 404
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGrid: TPanel
    Left = 0
    Top = 0
    Width = 658
    Height = 367
    Align = alClient
    Caption = 'pnlGrid'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 656
      Height = 365
      Align = alClient
      DataSource = dtsTabela
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnlBotores: TPanel
    Left = 0
    Top = 367
    Width = 658
    Height = 37
    Align = alBottom
    TabOrder = 1
    object btnIncluir: TButton
      Left = 9
      Top = 5
      Width = 150
      Height = 25
      Caption = '&Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 172
      Top = 5
      Width = 150
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TButton
      Left = 335
      Top = 5
      Width = 150
      Height = 25
      Caption = '&Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnSair: TButton
      Left = 496
      Top = 5
      Width = 150
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = btnSairClick
    end
  end
  object dtsTabela: TDataSource
    AutoEdit = False
    DataSet = memTabela
    Left = 265
    Top = 144
  end
  object memTabela: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 333
    Top = 144
  end
end
