object frmViewCadastroPadrao: TfrmViewCadastroPadrao
  Left = 0
  Top = 0
  Caption = 'frmViewCadastroPadrao'
  ClientHeight = 299
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCadastro: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 262
    Align = alClient
    TabOrder = 0
  end
  object pnlBotores: TPanel
    Left = 0
    Top = 262
    Width = 683
    Height = 37
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      683
      37)
    object btnSalvar: TButton
      Left = 370
      Top = 6
      Width = 150
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 526
      Top = 6
      Width = 150
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
