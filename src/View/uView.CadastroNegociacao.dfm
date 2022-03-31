inherited frmViewCadastroNegociacao: TfrmViewCadastroNegociacao
  Caption = 'Negociacao'
  ClientHeight = 481
  ClientWidth = 852
  OnShow = FormShow
  ExplicitWidth = 868
  ExplicitHeight = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCadastro: TPanel
    Width = 852
    Height = 444
    ExplicitWidth = 852
    ExplicitHeight = 444
    object Label11: TLabel
      Left = 10
      Top = 5
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object Label1: TLabel
      Left = 66
      Top = 5
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Negociacao:'
    end
    object edtCodigoNegociacao: TEdit
      Left = 10
      Top = 24
      Width = 59
      Height = 21
      Color = clWhite
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtNomeNegociacao: TEdit
      Left = 79
      Top = 24
      Width = 343
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
  end
  inherited pnlBotores: TPanel
    Top = 444
    Width = 852
    ExplicitTop = 444
    ExplicitWidth = 852
    inherited btnSalvar: TButton
      Left = 539
      ExplicitLeft = 539
    end
    inherited btnCancelar: TButton
      Left = 695
      ExplicitLeft = 695
    end
  end
end
