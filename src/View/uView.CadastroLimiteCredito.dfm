inherited frmViewCadastroLimiteCredito: TfrmViewCadastroLimiteCredito
  Caption = 'Cadastro de LimiteCredito'
  ClientHeight = 97
  ClientWidth = 567
  OnShow = FormShow
  ExplicitWidth = 583
  ExplicitHeight = 136
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCadastro: TPanel
    Width = 567
    Height = 60
    ExplicitWidth = 567
    ExplicitHeight = 60
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
    object edtPrecoVenda: TEdit
      Left = 435
      Top = 20
      Width = 119
      Height = 21
      NumbersOnly = True
      TabOrder = 0
    end
    object DBComboBox1: TDBComboBox
      Left = 10
      Top = 20
      Width = 407
      Height = 21
      TabOrder = 1
    end
  end
  inherited pnlBotores: TPanel
    Top = 60
    Width = 567
    ExplicitTop = 60
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
end
