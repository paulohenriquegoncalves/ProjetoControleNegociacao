inherited frmViewPesquisaProdutor: TfrmViewPesquisaProdutor
  Caption = 'Produtores'
  ClientWidth = 825
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 841
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    Width = 825
    ExplicitWidth = 825
    inherited DBGrid1: TDBGrid
      Width = 823
    end
  end
  inherited pnlBotores: TPanel
    Width = 825
    ExplicitWidth = 825
    inherited btnSair: TButton
      Left = 661
      ExplicitLeft = 661
    end
    object btnLimiteCredito: TButton
      Left = 499
      Top = 5
      Width = 150
      Height = 25
      Caption = '&Limite de cr'#233'dito'
      TabOrder = 4
      OnClick = btnLimiteCreditoClick
    end
  end
end
