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
        OnCloseUp = DBLookupComboBox2CloseUp
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
        OnCloseUp = DBLookupComboBox1CloseUp
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
        OnCloseUp = DBLookupComboBox3CloseUp
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
    object Trailer: TTabSheet
      Caption = #1055#1088#1080#1094#1077#1087
      ImageIndex = 5
      OnShow = TrailerShow
      object Label4: TLabel
        Left = 90
        Top = 40
        Width = 70
        Height = 15
        Caption = #1058#1080#1087' '#1087#1088#1080#1094#1077#1087#1072
      end
      object Label5: TLabel
        Left = 90
        Top = 72
        Width = 104
        Height = 15
        Caption = #1043#1088#1091#1079#1086#1087#1086#1076#1098#1077#1084#1085#1086#1089#1090#1100
      end
      object Label6: TLabel
        Left = 90
        Top = 101
        Width = 36
        Height = 15
        Caption = #1057#1090#1072#1090#1091#1089
      end
      object Label11: TLabel
        Left = 90
        Top = 8
        Width = 83
        Height = 15
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      object DBNavigator5: TDBNavigator
        Left = 0
        Top = 350
        Width = 761
        Height = 25
        DataSource = DataModule2.DataSource_Trailer
        Align = alBottom
        TabOrder = 0
        OnClick = DBNavigator5Click
      end
      object DBGrid_Trailer: TDBGrid
        Left = 0
        Top = 130
        Width = 761
        Height = 214
        DataSource = DataSource2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = DBGrid_TrailerCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'type'
            Title.Caption = #1058#1080#1087' '#1087#1088#1080#1094#1077#1087#1072
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'capacity'
            Title.Caption = #1043#1088#1091#1079#1086#1074#1086#1076#1098#1077#1084#1085#1086#1089#1090#1100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Title.Caption = #1057#1090#1072#1090#1091#1089
            Visible = True
          end>
      end
      object DBLookupComboBox4: TDBLookupComboBox
        Left = 200
        Top = 37
        Width = 145
        Height = 23
        DataField = 'type_id'
        DataSource = DataModule2.DataSource_Trailer
        KeyField = 'id'
        ListField = 'type'
        ListSource = DataModule2.DataSource_Trailer_Type
        TabOrder = 2
        OnCloseUp = DBLookupComboBox4CloseUp
      end
      object DBEdit1: TDBEdit
        Left = 200
        Top = 69
        Width = 121
        Height = 23
        DataField = 'capacity'
        DataSource = DataModule2.DataSource_Trailer
        TabOrder = 3
      end
      object DBEdit2: TDBEdit
        Left = 200
        Top = 98
        Width = 121
        Height = 23
        DataField = 'status'
        DataSource = DataModule2.DataSource_Trailer
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 200
        Top = 5
        Width = 121
        Height = 23
        DataField = 'name'
        DataSource = DataModule2.DataSource_Trailer
        TabOrder = 5
      end
    end
    object TabSheet_Trailer_type: TTabSheet
      Caption = #1058#1080#1087' '#1087#1088#1080#1094#1077#1087#1072
      ImageIndex = 6
      object DBNavigator6: TDBNavigator
        Left = 0
        Top = 350
        Width = 761
        Height = 25
        DataSource = DataModule2.DataSource_Trailer_Type
        Align = alBottom
        TabOrder = 0
      end
      object DBGrid6: TDBGrid
        Left = 0
        Top = 0
        Width = 761
        Height = 350
        Align = alClient
        DataSource = DataModule2.DataSource_Trailer_Type
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'type'
            Title.Caption = #1058#1080#1087' '#1087#1088#1080#1094#1077#1087#1072
            Width = 450
            Visible = True
          end>
      end
    end
    object TabSheet6: TTabSheet
      Caption = #1043#1088#1091#1079#1086#1074#1080#1082
      ImageIndex = 10
      OnShow = TabSheet6Show
      object Label7: TLabel
        Left = 165
        Top = 48
        Width = 101
        Height = 15
        Caption = #1052#1086#1076#1077#1083#1100' '#1075#1088#1091#1079#1086#1074#1080#1082#1072
      end
      object Label8: TLabel
        Left = 165
        Top = 83
        Width = 104
        Height = 15
        Caption = #1043#1088#1091#1079#1086#1087#1086#1076#1098#1077#1084#1085#1086#1089#1090#1100
      end
      object Label10: TLabel
        Left = 165
        Top = 141
        Width = 36
        Height = 15
        Caption = #1057#1090#1072#1090#1091#1089
      end
      object Label9: TLabel
        Left = 165
        Top = 114
        Width = 43
        Height = 15
        Caption = #1055#1088#1080#1094#1077#1087
      end
      object Label12: TLabel
        Left = 165
        Top = 16
        Width = 83
        Height = 15
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      object DBNavigator7: TDBNavigator
        Left = 0
        Top = 350
        Width = 761
        Height = 25
        DataSource = DataModule2.DataSource_Truck
        Align = alBottom
        TabOrder = 0
        OnClick = DBNavigator7Click
      end
      object DBGrid_Truck: TDBGrid
        Left = 0
        Top = 176
        Width = 761
        Height = 174
        Align = alBottom
        DataSource = DataSource3
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = DBGrid_TruckCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'truck_model'
            Title.Caption = #1052#1086#1076#1077#1083#1100' '#1075#1088#1091#1079#1086#1074#1080#1082#1072
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'truck_cap'
            Title.Caption = #1043#1088#1091#1079#1086#1087#1086#1076#1098#1077#1084#1085#1086#1089#1090#1100' '#1075#1088#1091#1079#1086#1074#1080#1082#1072
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'truck_status'
            Title.Caption = #1057#1090#1072#1090#1091#1089' '#1075#1088#1091#1079#1086#1074#1080#1082#1072
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'trailer_type'
            Title.Caption = #1058#1080#1087' '#1087#1088#1080#1094#1077#1087#1072
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'trailer_cap'
            Title.Caption = #1043#1088#1091#1079#1086#1087#1086#1076#1098#1077#1084#1085#1086#1089#1090#1100' '#1087#1088#1080#1094#1077#1087#1072
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'total_cap'
            Title.Caption = #1054#1073#1097#1072#1103' '#1075#1088#1091#1079#1086#1087#1086#1076#1098#1077#1084#1085#1086#1089#1090#1100
            Width = 120
            Visible = True
          end>
      end
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 272
        Top = 48
        Width = 145
        Height = 23
        DataField = 'model_id'
        DataSource = DataModule2.DataSource_Truck
        KeyField = 'id'
        ListField = 'model'
        ListSource = DataModule2.DataSource_TruckModel
        TabOrder = 2
        OnCloseUp = DBLookupComboBox5CloseUp
      end
      object DBEdit3: TDBEdit
        Left = 272
        Top = 80
        Width = 121
        Height = 23
        DataField = 'load_capacity'
        DataSource = DataModule2.DataSource_Truck
        TabOrder = 3
      end
      object DBLookupComboBox6: TDBLookupComboBox
        Left = 272
        Top = 109
        Width = 145
        Height = 23
        DataField = 'trailer_id'
        DataSource = DataModule2.DataSource_Truck
        KeyField = 'id'
        ListField = 'name'
        ListSource = DataModule2.DataSource_Trailer
        TabOrder = 4
        OnCloseUp = DBLookupComboBox6CloseUp
      end
      object DBEdit4: TDBEdit
        Left = 272
        Top = 138
        Width = 121
        Height = 23
        DataField = 'status'
        DataSource = DataModule2.DataSource_Truck
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 272
        Top = 16
        Width = 121
        Height = 23
        DataField = 'name'
        DataSource = DataModule2.DataSource_Truck
        TabOrder = 6
      end
    end
    object TabSheet7: TTabSheet
      Caption = #1052#1086#1076#1077#1083#1100' '#1075#1088#1091#1079#1086#1074#1080#1082#1072
      ImageIndex = 7
      object DBNavigator8: TDBNavigator
        Left = 0
        Top = 350
        Width = 761
        Height = 25
        DataSource = DataModule2.DataSource_TruckModel
        Align = alBottom
        TabOrder = 0
      end
      object DBGrid7: TDBGrid
        Left = 0
        Top = 0
        Width = 761
        Height = 350
        Align = alClient
        DataSource = DataModule2.DataSource_TruckModel
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'model'
            Title.Caption = #1052#1086#1076#1077#1083#1100' '#1075#1088#1091#1079#1086#1074#1080#1082#1072
            Visible = True
          end>
      end
    end
    object TabSheet8: TTabSheet
      Caption = #1042#1086#1076#1080#1090#1077#1083#1080
      ImageIndex = 8
      OnShow = TabSheet8Show
      object Label13: TLabel
        Left = 184
        Top = 11
        Width = 27
        Height = 15
        Caption = #1060#1048#1054
      end
      object Label14: TLabel
        Left = 184
        Top = 43
        Width = 94
        Height = 15
        Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
      end
      object Label15: TLabel
        Left = 184
        Top = 75
        Width = 36
        Height = 15
        Caption = #1057#1090#1072#1090#1091#1089
      end
      object Label16: TLabel
        Left = 184
        Top = 109
        Width = 50
        Height = 15
        Caption = #1043#1088#1091#1079#1086#1074#1080#1082
      end
      object DBNavigator9: TDBNavigator
        Left = 0
        Top = 350
        Width = 761
        Height = 25
        DataSource = DataModule2.DataSource_Driver
        Align = alBottom
        TabOrder = 0
        OnClick = DBNavigator9Click
      end
      object DBGrid_Driver: TDBGrid
        Left = 0
        Top = 144
        Width = 761
        Height = 206
        Align = alBottom
        DataSource = DataSource_Driver
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = DBGrid_DriverCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'full_name'
            Title.Caption = #1060#1048#1054
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'phone_number'
            Title.Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Title.Caption = #1057#1090#1072#1090#1091#1089
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1043#1088#1091#1079#1086#1074#1080#1082
            Width = 100
            Visible = True
          end>
      end
      object DBEdit7: TDBEdit
        Left = 296
        Top = 8
        Width = 121
        Height = 23
        DataField = 'full_name'
        DataSource = DataModule2.DataSource_Driver
        TabOrder = 2
      end
      object DBEdit8: TDBEdit
        Left = 296
        Top = 40
        Width = 121
        Height = 23
        DataField = 'phone_number'
        DataSource = DataModule2.DataSource_Driver
        TabOrder = 3
      end
      object DBEdit9: TDBEdit
        Left = 296
        Top = 72
        Width = 121
        Height = 23
        DataField = 'status'
        DataSource = DataModule2.DataSource_Driver
        TabOrder = 4
      end
      object DBLookupComboBox7: TDBLookupComboBox
        Left = 296
        Top = 105
        Width = 145
        Height = 23
        DataField = 'truck_id'
        DataSource = DataModule2.DataSource_Driver
        KeyField = 'id'
        ListField = 'name'
        ListSource = DataModule2.DataSource_Truck
        TabOrder = 5
        OnCloseUp = DBLookupComboBox7CloseUp
      end
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
  object FDQuery_Address: TFDQuery
    Active = True
    Connection = DataModule2.FDConnection1
    SQL.Strings = (
      'select * '
      'from "Total_address"'
      'inner join "City" on "Total_address".city_id = "City".id'
      'inner join "Street" on "Total_address".street_id = "Street".id'
      'inner join "House" on "Total_address".house_id = "House".id')
    Left = 716
    Top = 122
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FDQuery_Address
    Left = 668
    Top = 122
  end
  object FDQuery_Trailer: TFDQuery
    Active = True
    Connection = DataModule2.FDConnection1
    SQL.Strings = (
      'select * '
      'from "Trailer"'
      
        'inner join "Trailer_type" on "Trailer".type_id = "Trailer_type".' +
        'id')
    Left = 716
    Top = 66
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = FDQuery_Trailer
    Left = 660
    Top = 66
  end
  object DataSource3: TDataSource
    AutoEdit = False
    DataSet = FDQuery_Truck
    Left = 660
    Top = 186
  end
  object FDQuery_Truck: TFDQuery
    Active = True
    Connection = DataModule2.FDConnection1
    SQL.Strings = (
      'select "Truck_model".model as truck_model,'
      '       "Truck".load_capacity as truck_cap,'
      '       "Truck".status as truck_status,'
      '       "Trailer_type".type as trailer_type,'
      '       "Trailer".capacity as trailer_cap,'
      '       "Truck".load_capacity + "Trailer".capacity as total_cap '
      'from "Truck"'
      'inner join "Truck_model" on "Truck".model_id = "Truck_model".id'
      'inner join "Trailer" on "Truck".trailer_id =  "Trailer".id'
      
        'inner join "Trailer_type" on "Trailer".type_id = "Trailer_type".' +
        'id'
      '')
    Left = 716
    Top = 186
  end
  object FDQuery_Driver: TFDQuery
    Active = True
    Connection = DataModule2.FDConnection1
    SQL.Strings = (
      'select * '
      'from "Driver"'
      'inner join "Truck" on "Truck".id = "Driver".truck_id')
    Left = 716
    Top = 266
  end
  object DataSource_Driver: TDataSource
    DataSet = FDQuery_Driver
    Left = 652
    Top = 266
  end
end
