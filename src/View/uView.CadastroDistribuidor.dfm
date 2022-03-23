inherited frmViewCadastroDistribuidor: TfrmViewCadastroDistribuidor
  Caption = 'Distribuidor'
  ClientHeight = 93
  OnShow = FormShow
  ExplicitHeight = 132
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCadastro: TPanel
    Height = 56
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
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Distribuidor:'
    end
    object Label2: TLabel
      Left = 428
      Top = 5
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'CNPJ:'
    end
    object edtCodigoDistribuidor: TEdit
      Left = 10
      Top = 24
      Width = 59
      Height = 21
      Color = clWhite
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtNomeDistribuidor: TEdit
      Left = 79
      Top = 24
      Width = 343
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
    object mskEdtCNPJ: TMaskEdit
      Left = 428
      Top = 24
      Width = 247
      Height = 21
      EditMask = '!99.999.999/9999-99;0;'
      MaxLength = 18
      TabOrder = 2
      Text = ''
    end
  end
  inherited pnlBotores: TPanel
    Top = 56
  end
end
