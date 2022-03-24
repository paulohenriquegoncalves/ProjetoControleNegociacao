inherited frmViewCadastroProduto: TfrmViewCadastroProduto
  Caption = 'Cadastro de Produto'
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
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object Label1: TLabel
      Left = 79
      Top = 5
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto:'
    end
    object Label2: TLabel
      Left = 432
      Top = 5
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pre'#231'o de venda:'
    end
    object edtCodigoProduto: TEdit
      Left = 10
      Top = 24
      Width = 59
      Height = 21
      Color = clWhite
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtNomeProduto: TEdit
      Left = 79
      Top = 24
      Width = 343
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
    object edtPrecoVenda: TEdit
      Left = 432
      Top = 24
      Width = 119
      Height = 21
      NumbersOnly = True
      TabOrder = 2
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
