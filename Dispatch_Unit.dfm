object Form_Dispatch: TForm_Dispatch
  Left = 0
  Top = 0
  Caption = #1056#1077#1081#1089
  ClientHeight = 515
  ClientWidth = 1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 144
    Top = 9
    Width = 55
    Height = 15
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 144
    Top = 35
    Width = 115
    Height = 15
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1079#1072
  end
  object Label3: TLabel
    Left = 144
    Top = 99
    Width = 105
    Height = 15
    Caption = #1040#1076#1088#1077#1089' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
  end
  object Label4: TLabel
    Left = 144
    Top = 130
    Width = 100
    Height = 15
    Caption = #1040#1076#1088#1077#1089' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
  end
  object Label5: TLabel
    Left = 144
    Top = 163
    Width = 50
    Height = 15
    Caption = #1043#1088#1091#1079#1086#1074#1080#1082
  end
  object Label6: TLabel
    Left = 144
    Top = 191
    Width = 51
    Height = 15
    Caption = #1042#1086#1076#1080#1090#1077#1083#1100
  end
  object Label7: TLabel
    Left = 144
    Top = 222
    Width = 36
    Height = 15
    Caption = #1057#1090#1072#1090#1091#1089
  end
  object Label8: TLabel
    Left = 144
    Top = 70
    Width = 51
    Height = 15
    Caption = #1042#1077#1089' '#1075#1088#1091#1079#1072
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 490
    Width = 1103
    Height = 25
    DataSource = DataModule2.DataSource_Dispatch
    Align = alBottom
    TabOrder = 0
    OnClick = DBNavigator1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 264
    Width = 1103
    Height = 226
    Align = alBottom
    DataSource = DataSource_Dispatch
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Discription'
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cargo_name'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1079#1072
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cargo_weight'
        Title.Caption = #1042#1077#1089' '#1075#1088#1091#1079#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'full_adr_from'
        Title.Caption = #1040#1076#1088#1077#1089' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'full_adr_to'
        Title.Caption = #1040#1076#1088#1077#1089' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'truck_name'
        Title.Caption = #1043#1088#1091#1079#1086#1074#1080#1082
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'drv_full_name'
        Title.Caption = #1042#1086#1076#1080#1090#1077#1083#1100
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Width = 100
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 288
    Top = 2
    Width = 305
    Height = 23
    DataField = 'Discription'
    DataSource = DataModule2.DataSource_Dispatch
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 288
    Top = 32
    Width = 305
    Height = 23
    DataField = 'cargo_name'
    DataSource = DataModule2.DataSource_Dispatch
    TabOrder = 3
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 288
    Top = 94
    Width = 305
    Height = 23
    DataField = 'id_start_address'
    DataSource = DataModule2.DataSource_Dispatch
    KeyField = 'id'
    ListField = 'full_adr'
    ListSource = DataSource_Adr
    TabOrder = 4
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 288
    Top = 123
    Width = 305
    Height = 23
    DataField = 'id_final_address'
    DataSource = DataModule2.DataSource_Dispatch
    KeyField = 'id'
    ListField = 'full_adr'
    ListSource = DataSource_Adr
    TabOrder = 5
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 288
    Top = 157
    Width = 305
    Height = 23
    DataField = 'truck_id'
    DataSource = DataModule2.DataSource_Dispatch
    KeyField = 'id'
    ListField = 'name'
    ListSource = DataSource_Truck
    TabOrder = 6
  end
  object DBLookupComboBox4: TDBLookupComboBox
    Left = 288
    Top = 189
    Width = 305
    Height = 23
    DataField = 'driver_id'
    DataSource = DataModule2.DataSource_Dispatch
    KeyField = 'id'
    ListField = 'full_name'
    ListSource = DataSource_Driver
    TabOrder = 7
  end
  object DBEdit3: TDBEdit
    Left = 288
    Top = 218
    Width = 121
    Height = 23
    DataField = 'status'
    DataSource = DataModule2.DataSource_Dispatch
    TabOrder = 8
  end
  object DBEdit4: TDBEdit
    Left = 288
    Top = 64
    Width = 305
    Height = 23
    DataField = 'cargo_weight'
    DataSource = DataModule2.DataSource_Dispatch
    TabOrder = 9
  end
  object FDQuery_Dispatch: TFDQuery
    Active = True
    Connection = DataModule2.FDConnection1
    SQL.Strings = (
      'select "disp".*,'
      '       "adr_from".id as id_adr_from,'
      
        '       CONCAT("city_from".city_name, '#39' '#39',"street_from".street_na' +
        'me, '#39' '#39', "hous_from".house_number ) as full_adr_from, '
      '       "adr_to".id   as id_adr_to,'
      
        '       CONCAT("city_to".city_name, '#39' '#39',"street_to".street_name, ' +
        #39' '#39', "hous_to".house_number) as full_adr_to,'
      '       "Driver".id   as drv_id,'
      '       "Driver".full_name as drv_full_name,'
      
        '       "Truck".name as truck_name                               ' +
        '         '
      'from "Dispatch"            as "disp"'
      
        'inner join "Total_address" as "adr_from"    on "adr_from".id = "' +
        'disp".id_start_address'
      
        'inner join "City"          as "city_from"   on "city_from".id = ' +
        '"adr_from".city_id'
      
        'inner join "Street"        as "street_from" on "street_from".id ' +
        '= "adr_from".street_id'
      
        'inner join "House"         as "hous_from"   on "hous_from".id = ' +
        '"adr_from".house_id'
      
        'inner join "Total_address" as "adr_to"      on "adr_to".id = "di' +
        'sp".id_final_address'
      
        'inner join "City"          as "city_to"     on "city_to".id = "a' +
        'dr_to".city_id'
      
        'inner join "Street"        as "street_to"   on "street_to".id = ' +
        '"adr_to".street_id'
      
        'inner join "House"         as "hous_to"     on "hous_to".id = "a' +
        'dr_to".house_id'
      
        'inner join "Truck"                          on "Truck".id = "dis' +
        'p".truck_id'
      
        'inner join "Driver"                         on "Driver".id = "di' +
        'sp".driver_id'
      '')
    Left = 1016
    Top = 32
    object FDQuery_Dispatchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuery_Dispatchid_start_address: TIntegerField
      FieldName = 'id_start_address'
      Origin = 'id_start_address'
    end
    object FDQuery_Dispatchid_final_address: TIntegerField
      FieldName = 'id_final_address'
      Origin = 'id_final_address'
    end
    object FDQuery_Dispatchdriver_id: TIntegerField
      FieldName = 'driver_id'
      Origin = 'driver_id'
    end
    object FDQuery_Dispatchcargo_weight: TIntegerField
      FieldName = 'cargo_weight'
      Origin = 'cargo_weight'
    end
    object FDQuery_Dispatchstatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 50
    end
    object FDQuery_Dispatchcargo_name: TStringField
      FieldName = 'cargo_name'
      Origin = 'cargo_name'
      Size = 100
    end
    object FDQuery_Dispatchcargo_type_need: TStringField
      FieldName = 'cargo_type_need'
      Origin = 'cargo_type_need'
      Size = 100
    end
    object FDQuery_DispatchDiscription: TStringField
      FieldName = 'Discription'
      Origin = '"Discription"'
      Size = 50
    end
    object FDQuery_Dispatchtruck_id: TIntegerField
      FieldName = 'truck_id'
      Origin = 'truck_id'
    end
    object FDQuery_Dispatchid_adr_from: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_adr_from'
      Origin = 'id_adr_from'
    end
    object FDQuery_Dispatchfull_adr_from: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'full_adr_from'
      Origin = 'full_adr_from'
      ReadOnly = True
      OnGetText = FDQuery_Dispatchfull_adr_fromGetText
      BlobType = ftMemo
    end
    object FDQuery_Dispatchid_adr_to: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_adr_to'
      Origin = 'id_adr_to'
    end
    object FDQuery_Dispatchfull_adr_to: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'full_adr_to'
      Origin = 'full_adr_to'
      ReadOnly = True
      OnGetText = FDQuery_Dispatchfull_adr_toGetText
      BlobType = ftMemo
    end
    object FDQuery_Dispatchdrv_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'drv_id'
      Origin = 'drv_id'
    end
    object FDQuery_Dispatchdrv_full_name: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'drv_full_name'
      Origin = 'drv_full_name'
      Size = 8190
    end
    object FDQuery_Dispatchtruck_name: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'truck_name'
      Origin = 'truck_name'
      Size = 80
    end
  end
  object DataSource_Dispatch: TDataSource
    DataSet = FDQuery_Dispatch
    Left = 1016
    Top = 88
  end
  object FDQuery_Adr: TFDQuery
    Active = True
    Connection = DataModule2.FDConnection1
    SQL.Strings = (
      'select  "adr".id,'
      
        ' CONCAT("City".city_name, '#39' '#39',"Street".street_name, '#39' '#39', "House"' +
        '.house_number ) as full_adr '
      'from "Total_address" as adr'
      'inner join "City" on "City".id = adr.city_id'
      'inner join "Street" on "Street".id = adr.street_id'
      'inner join "House" on "House".id = adr.house_id'
      ' ')
    Left = 1024
    Top = 408
    object FDQuery_Adrid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuery_Adrfull_adr: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'full_adr'
      Origin = 'full_adr'
      ReadOnly = True
      OnGetText = FDQuery_Adrfull_adrGetText
      BlobType = ftMemo
    end
  end
  object DataSource_Adr: TDataSource
    DataSet = FDQuery_Adr
    Left = 928
    Top = 416
  end
  object FDQuery_Truck: TFDQuery
    Active = True
    Connection = DataModule2.FDConnection1
    SQL.Strings = (
      'select *'
      'from "Truck"')
    Left = 1024
    Top = 320
  end
  object FDQuery_Driver: TFDQuery
    Active = True
    Connection = DataModule2.FDConnection1
    SQL.Strings = (
      'select *'
      'from "Driver"')
    Left = 808
    Top = 416
  end
  object DataSource_Truck: TDataSource
    DataSet = FDQuery_Truck
    Left = 928
    Top = 328
  end
  object DataSource_Driver: TDataSource
    DataSet = FDQuery_Driver
    Left = 720
    Top = 424
  end
end
