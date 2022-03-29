inherited frmViewPesquisaLimiteCredito: TfrmViewPesquisaLimiteCredito
  Caption = 'LimiteCreditos'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrid: TPanel
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'CODPRODUTOR'
          Title.Caption = 'C'#243'd. Produtor'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEPRODUTOR'
          Title.Caption = 'Produtor'
          Width = 129
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODDISTRIBUIDOR'
          Title.Caption = 'Cod. Distribuidor'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEDISTRIBUIDOR'
          Title.Caption = 'Distribuidor'
          Width = 202
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIMITE_CREDITO'
          Title.Caption = 'Limite de Cr'#233'dito'
          Width = 101
          Visible = True
        end>
    end
  end
  inherited pnlBotores: TPanel
    inherited btnAlterar: TButton
      Left = 332
      ExplicitLeft = 332
    end
    inherited btnExcluir: TButton
      Left = 171
      ExplicitLeft = 171
    end
  end
end
