inherited frmViewCadastroProdutor: TfrmViewCadastroProdutor
  Caption = 'Produtor'
  ClientHeight = 94
  ClientWidth = 669
  OnShow = FormShow
  ExplicitWidth = 685
  ExplicitHeight = 133
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCadastro: TPanel
    Width = 669
    Height = 57
    ExplicitWidth = 669
    ExplicitHeight = 56
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
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produtor:'
    end
    object Label2: TLabel
      Left = 438
      Top = 5
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Documento:'
    end
    object edtCodigoProdutor: TEdit
      Left = 10
      Top = 24
      Width = 59
      Height = 21
      Color = clWhite
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtNomeProdutor: TEdit
      Left = 79
      Top = 24
      Width = 343
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
    object mskEdtCPFCNPJ: TMaskEdit
      Left = 517
      Top = 24
      Width = 139
      Height = 21
      EditMask = '!99.999.999/9999-99;0;'
      MaxLength = 18
      TabOrder = 2
      Text = ''
    end
    object cbxCPFCNPJ: TComboBox
      Left = 435
      Top = 24
      Width = 73
      Height = 21
      ItemIndex = 0
      TabOrder = 3
      Text = 'CPF'
      OnChange = cbxCPFCNPJChange
      Items.Strings = (
        'CPF'
        'CNPJ')
    end
  end
  inherited pnlBotores: TPanel
    Top = 57
    Width = 669
    ExplicitTop = 56
    ExplicitWidth = 669
    inherited btnSalvar: TButton
      Left = 356
      ExplicitLeft = 356
    end
    inherited btnCancelar: TButton
      Left = 512
      ExplicitLeft = 512
    end
  end
end
