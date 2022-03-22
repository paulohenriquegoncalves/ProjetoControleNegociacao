object frmViewPrincipal: TfrmViewPrincipal
  Left = 0
  Top = 0
  Caption = 'frmViewPrincipal'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 112
    Top = 104
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
      object Distribuidores1: TMenuItem
        Caption = 'Distribuidores'
        OnClick = Distribuidores1Click
      end
      object Produtores1: TMenuItem
        Caption = 'Produtores'
      end
    end
    object Negociao1: TMenuItem
      Caption = 'Negocia'#231#227'o'
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
    end
  end
end
