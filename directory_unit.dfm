object DirectoryForm: TDirectoryForm
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
  ClientHeight = 405
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 769
    Height = 405
    ActivePage = TabSheet8
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1043#1086#1088#1086#1076#1086#1074
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 350
        Width = 761
        Height = 25
        DataSource = DataModule2.DataSource_City
        Align = alBottom
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 761
        Height = 350
        Align = alClient
        DataSource = DataModule2.DataSource_City
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'city_name'
            Title.Caption = #1043#1086#1088#1086#1076
            Width = 350
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1059#1083#1080#1094
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 761
        Height = 350
        Align = alClient
        DataSource = DataModule2.DataSource_Street
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'street_name'
            Title.Caption = #1059#1083#1080#1094#1072
            Visible = True
          end>
      end
      object DBNavigator2: TDBNavigator
        Left = 0
        Top = 350
        Width = 761
        Height = 25
        DataSource = DataModule2.DataSource_Street
        Align = alBottom
        TabOrder = 1
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1044#1086#1084
      ImageIndex = 3
      object DBNavigator4: TDBNavigator
        Left = 0
        Top = 350
        Width = 761
        Height = 25
        DataSource = DataModule2.DataSource_House
        Align = alBottom
        TabOrder = 0
      end
      object DBGrid4: TDBGrid
        Left = 0
        Top = 0
        Width = 761
        Height = 350
        Align = alClient
        DataSource = DataModule2.DataSource_House
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'house_number'
            Title.Caption = #1044#1086#1084
            Width = 120
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1040#1076#1088#1077#1089
      ImageIndex = 2
      OnShow = TabSheet3Show
      object Label2: TLabel
        Left = 32
        Top = 51
        Width = 34
        Height = 15
        Caption = #1059#1083#1080#1094#1072
      end
      object Label1: TLabel
        Left = 32
        Top = 17
        Width = 33
        Height = 15
        Caption = #1043#1086#1088#1086#1076
      end
      object Label3: TLabel
        Left = 32
        Top = 78
        Width = 24
        Height = 15
        Caption = #1044#1086#1084
      end
      object DBNavigator3: TDBNavigator
        Left = 0
        Top = 350
        Width = 761
        Height = 25
        DataSource = DataModule2.DataSource_Address
        Align = alBottom
        TabOrder = 0
        OnClick = DBNavigator3Click
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 72
        Top = 50
        Width = 145
        Height = 23
        DataField = 'street_id'
        DataSource = DataModule2.DataSource_Address
        KeyField = 'id'
        ListField = 'street_name'
        ListSource = DataSource_Str
        TabOrder = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 71
        Top = 16
        Width = 193
        Height = 23
        DataField = 'city_id'
        DataSource = DataModule2.DataSource_Address
        KeyField = 'id'
        ListField = 'city_name'
        ListSource = DataSource_Cty
        TabOrder = 2
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 71
        Top = 79
        Width = 145
        Height = 23
        DataField = 'house_id'
        DataSource = DataModule2.DataSource_Address
        KeyField = 'id'
        ListField = 'house_number'
        ListSource = DataSource_Hou
        TabOrder = 3
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 128
        Width = 761
        Height = 222
        Align = alBottom
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = DBGrid3CellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'city_name'
            Title.Caption = #1043#1086#1088#1086#1076
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'street_name'
            Title.Caption = #1059#1083#1080#1094#1072
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'house_number'
            Title.Caption = #1044#1086#1084
            Width = 50
            Visible = True
          end>
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1043#1088#1091#1079#1086#1074#1080#1082#1080
      ImageIndex = 4
    end
    object Прицеп: TTabSheet
      Caption = #1055#1088#1080#1094#1077#1087
      ImageIndex = 5
    end
    object TabSheet6: TTabSheet
      Caption = #1058#1080#1087' '#1087#1088#1080#1094#1077#1087#1072
      ImageIndex = 6
    end
    object TabSheet7: TTabSheet
      Caption = #1052#1086#1076#1077#1083#1100' '#1075#1088#1091#1079#1086#1074#1080#1082#1072
      ImageIndex = 7
    end
    object TabSheet8: TTabSheet
      Caption = #1042#1086#1076#1080#1090#1077#1083#1080
      ImageIndex = 8
    end
  end
  object FDTable_Str: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = DataModule2.FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = '"Street"'
    Left = 244
    Top = 298
  end
  object FDTable_Hou: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = DataModule2.FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = '"House"'
    Left = 396
    Top = 266
  end
  object DataSource_Str: TDataSource
    DataSet = FDTable_Str
    Left = 180
    Top = 306
  end
  object DataSource_Hou: TDataSource
    DataSet = FDTable_Hou
    Left = 308
    Top = 282
  end
  object DataSource_Cty: TDataSource
    DataSet = FDTable_Cty
    Left = 28
    Top = 298
  end
  object FDTable_Cty: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = DataModule2.FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = '"City"'
    Left = 116
    Top = 306
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = DataModule2.FDConnection1
    SQL.Strings = (
      'select * '
      'from "Total_address"'
      'inner join "City" on "Total_address".city_id = "City".id'
      'inner join "Street" on "Total_address".street_id = "Street".id'
      'inner join "House" on "Total_address".house_id = "House".id')
    Left = 388
    Top = 50
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 308
    Top = 50
  end
end
