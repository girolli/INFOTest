object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Teste de Avalia'#231#227'o Seletiva INFO'
  ClientHeight = 458
  ClientWidth = 831
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 817
    Height = 441
    ActivePage = tshDados
    TabOrder = 0
    object tshClientes: TTabSheet
      Caption = 'Clientes'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 809
        Height = 411
        Align = alClient
        DataSource = dsCliente
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telefone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Email'
            Width = 250
            Visible = True
          end>
      end
    end
    object tshDados: TTabSheet
      Caption = 'Dados Cadastrais'
      ImageIndex = 1
      object Label1: TLabel
        Left = 24
        Top = 48
        Width = 33
        Height = 15
        Caption = 'Nome'
        FocusControl = dbeNome
      end
      object Label2: TLabel
        Left = 24
        Top = 104
        Width = 56
        Height = 15
        Caption = 'Identidade'
        FocusControl = dbeIdentidade
      end
      object Label3: TLabel
        Left = 184
        Top = 104
        Width = 21
        Height = 15
        Caption = 'CPF'
        FocusControl = dbeCPF
      end
      object Label4: TLabel
        Left = 336
        Top = 104
        Width = 44
        Height = 15
        Caption = 'Telefone'
        FocusControl = dbeTelefone
      end
      object Label5: TLabel
        Left = 512
        Top = 104
        Width = 29
        Height = 15
        Caption = 'Email'
        FocusControl = dbeEmail
      end
      object Label6: TLabel
        Left = 24
        Top = 160
        Width = 49
        Height = 15
        Caption = 'Endere'#231'o'
      end
      object Bevel1: TBevel
        Left = 88
        Top = 168
        Width = 689
        Height = 7
        Shape = bsTopLine
      end
      object Label7: TLabel
        Left = 24
        Top = 192
        Width = 21
        Height = 15
        Caption = 'CEP'
        FocusControl = dbeCEP
      end
      object Label8: TLabel
        Left = 136
        Top = 192
        Width = 62
        Height = 15
        Caption = 'Logradouro'
        FocusControl = dbeLogradouro
      end
      object Label9: TLabel
        Left = 24
        Top = 248
        Width = 44
        Height = 15
        Caption = 'Numero'
        FocusControl = dbeNumero
      end
      object Label10: TLabel
        Left = 136
        Top = 248
        Width = 77
        Height = 15
        Caption = 'Complemento'
        FocusControl = dbeComplemento
      end
      object Label11: TLabel
        Left = 512
        Top = 248
        Width = 31
        Height = 15
        Caption = 'Bairro'
        FocusControl = dbeBairro
      end
      object Label12: TLabel
        Left = 24
        Top = 304
        Width = 37
        Height = 15
        Caption = 'Cidade'
        FocusControl = dbeCidade
      end
      object Label13: TLabel
        Left = 512
        Top = 304
        Width = 35
        Height = 15
        Caption = 'Estado'
        FocusControl = dbeEstado
      end
      object Label14: TLabel
        Left = 576
        Top = 304
        Width = 21
        Height = 15
        Caption = 'Pa'#237's'
        FocusControl = dbePais
      end
      object DBNavigator1: TDBNavigator
        Left = 467
        Top = 16
        Width = 310
        Height = 33
        DataSource = dsCliente
        Hints.Strings = (
          'Primeiro Registro'
          'Registro Anterior'
          'Pr'#243'ximo Registro'
          #218'ltimo Registro'
          'Inserir Registro'
          'Remover Registro'
          'Editar Registro'
          'Gravar Registro'
          'Cancelar Modifica'#231#245'es'
          'Atualizar'
          'Aplicar Modifica'#231#245'es'
          'Cancelar Altera'#231#245'es')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = DBNavigator1Click
      end
      object dbeNome: TDBEdit
        Left = 24
        Top = 64
        Width = 753
        Height = 23
        CharCase = ecUpperCase
        DataField = 'Nome'
        DataSource = dsCliente
        TabOrder = 1
      end
      object dbeIdentidade: TDBEdit
        Left = 24
        Top = 120
        Width = 137
        Height = 23
        DataField = 'Identidade'
        DataSource = dsCliente
        TabOrder = 2
      end
      object dbeCPF: TDBEdit
        Left = 184
        Top = 120
        Width = 129
        Height = 23
        DataField = 'CPF'
        DataSource = dsCliente
        TabOrder = 3
      end
      object dbeTelefone: TDBEdit
        Left = 336
        Top = 120
        Width = 153
        Height = 23
        DataField = 'Telefone'
        DataSource = dsCliente
        TabOrder = 4
      end
      object dbeEmail: TDBEdit
        Left = 512
        Top = 120
        Width = 265
        Height = 23
        DataField = 'Email'
        DataSource = dsCliente
        TabOrder = 5
      end
      object dbeCEP: TDBEdit
        Left = 24
        Top = 208
        Width = 89
        Height = 23
        DataField = 'CEP'
        DataSource = dsCliente
        TabOrder = 6
        OnExit = dbeCEPExit
      end
      object dbeLogradouro: TDBEdit
        Left = 136
        Top = 208
        Width = 641
        Height = 23
        CharCase = ecUpperCase
        DataField = 'Logradouro'
        DataSource = dsCliente
        TabOrder = 7
      end
      object dbeNumero: TDBEdit
        Left = 24
        Top = 264
        Width = 89
        Height = 23
        DataField = 'Numero'
        DataSource = dsCliente
        TabOrder = 8
      end
      object dbeComplemento: TDBEdit
        Left = 136
        Top = 264
        Width = 353
        Height = 23
        CharCase = ecUpperCase
        DataField = 'Complemento'
        DataSource = dsCliente
        TabOrder = 9
      end
      object dbeBairro: TDBEdit
        Left = 512
        Top = 264
        Width = 265
        Height = 23
        CharCase = ecUpperCase
        DataField = 'Bairro'
        DataSource = dsCliente
        TabOrder = 10
      end
      object dbeCidade: TDBEdit
        Left = 24
        Top = 320
        Width = 465
        Height = 23
        CharCase = ecUpperCase
        DataField = 'Cidade'
        DataSource = dsCliente
        TabOrder = 11
      end
      object dbeEstado: TDBEdit
        Left = 512
        Top = 320
        Width = 35
        Height = 23
        CharCase = ecUpperCase
        DataField = 'Estado'
        DataSource = dsCliente
        TabOrder = 12
      end
      object dbePais: TDBEdit
        Left = 576
        Top = 320
        Width = 201
        Height = 23
        CharCase = ecUpperCase
        DataField = 'Pais'
        DataSource = dsCliente
        TabOrder = 13
      end
      object Button1: TButton
        Left = 24
        Top = 365
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 14
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 112
        Top = 365
        Width = 75
        Height = 25
        Caption = 'Carregar'
        TabOrder = 15
        OnClick = Button2Click
      end
    end
    object tshEmail: TTabSheet
      Caption = 'Enviar E-mail'
      ImageIndex = 2
      object ledOrigem: TLabeledEdit
        Left = 24
        Top = 80
        Width = 361
        Height = 23
        EditLabel.Width = 93
        EditLabel.Height = 15
        EditLabel.Caption = 'E-mail de Origem'
        LabelSpacing = 1
        TabOrder = 2
        Text = ''
      end
      object ledDestino: TLabeledEdit
        Left = 24
        Top = 128
        Width = 361
        Height = 23
        EditLabel.Width = 93
        EditLabel.Height = 15
        EditLabel.Caption = 'E-mail de Destino'
        LabelSpacing = 1
        TabOrder = 3
        Text = ''
      end
      object ledLogin: TLabeledEdit
        Left = 416
        Top = 32
        Width = 361
        Height = 23
        EditLabel.Width = 30
        EditLabel.Height = 15
        EditLabel.Caption = 'Login'
        LabelSpacing = 1
        TabOrder = 4
        Text = ''
      end
      object ledSenha: TLabeledEdit
        Left = 416
        Top = 80
        Width = 361
        Height = 23
        EditLabel.Width = 32
        EditLabel.Height = 15
        EditLabel.Caption = 'Senha'
        LabelSpacing = 1
        TabOrder = 5
        Text = ''
      end
      object ledSMTP: TLabeledEdit
        Left = 24
        Top = 32
        Width = 273
        Height = 23
        EditLabel.Width = 134
        EditLabel.Height = 15
        EditLabel.Caption = 'Servidor SMTP para Envio'
        LabelSpacing = 1
        TabOrder = 0
        Text = ''
      end
      object btnEnviar: TButton
        Left = 664
        Top = 127
        Width = 113
        Height = 25
        Caption = 'Enviar E-mail'
        TabOrder = 8
        OnClick = btnEnviarClick
      end
      object ledPorta: TLabeledEdit
        Left = 312
        Top = 32
        Width = 73
        Height = 23
        EditLabel.Width = 28
        EditLabel.Height = 15
        EditLabel.Caption = 'Porta'
        LabelSpacing = 1
        TabOrder = 1
        Text = ''
      end
      object chbSSL: TCheckBox
        Left = 416
        Top = 131
        Width = 73
        Height = 17
        Caption = 'Usar SSL'
        TabOrder = 6
      end
      object chbTLS: TCheckBox
        Left = 512
        Top = 131
        Width = 81
        Height = 17
        Caption = 'Usar TLS'
        TabOrder = 7
      end
    end
  end
  object cdsCliente: TClientDataSet
    PersistDataPacket.Data = {
      710100009619E0BD01000000180000000D0000000000030000007101044E6F6D
      650100490000000100055749445448020002003C000A4964656E746964616465
      0100490000000100055749445448020002000F00034350460100490000000100
      055749445448020002000B000854656C65666F6E650100490000000100055749
      44544802000200140005456D61696C0100490000000100055749445448020002
      003C000343455001004900000001000557494454480200020008000A4C6F6772
      61646F75726F0100490000000100055749445448020002005000064E756D6572
      6F04000100000000000B436F6D706C656D656E746F0100490000000100055749
      445448020002003C000642616972726F01004900000001000557494454480200
      02003C00064369646164650100490000000100055749445448020002003C0006
      45737461646F0100490000000100055749445448020002000200045061697301
      00490000000100055749445448020002003C000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Identidade'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Telefone'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Email'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Logradouro'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Complemento'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Estado'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Pais'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 110
    Top = 468
    object cdsClienteNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 60
    end
    object cdsClienteIdentidade: TStringField
      FieldName = 'Identidade'
      Size = 15
    end
    object cdsClienteCPF: TStringField
      DisplayWidth = 11
      FieldName = 'CPF'
      Size = 11
    end
    object cdsClienteTelefone: TStringField
      FieldName = 'Telefone'
    end
    object cdsClienteEmail: TStringField
      FieldName = 'Email'
      Size = 60
    end
    object cdsClienteCEP: TStringField
      DisplayWidth = 8
      FieldName = 'CEP'
      Size = 8
    end
    object cdsClienteLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 80
    end
    object cdsClienteNumero: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Numero'
    end
    object cdsClienteComplemento: TStringField
      FieldName = 'Complemento'
      Size = 60
    end
    object cdsClienteBairro: TStringField
      FieldName = 'Bairro'
      Size = 60
    end
    object cdsClienteCidade: TStringField
      FieldName = 'Cidade'
      Size = 60
    end
    object cdsClienteEstado: TStringField
      DisplayWidth = 2
      FieldName = 'Estado'
      Size = 2
    end
    object cdsClientePais: TStringField
      FieldName = 'Pais'
      Size = 60
    end
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 210
    Top = 468
  end
  object SaveDialog: TSaveDialog
    Left = 548
    Top = 483
  end
  object XMLDocument: TXMLDocument
    Options = [doNodeAutoCreate, doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl]
    Left = 380
    Top = 468
  end
  object OpenDialog: TOpenDialog
    Left = 532
    Top = 394
  end
end
