object DataModule2: TDataModule2
  Height = 600
  Width = 800
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'D:\Postgres_12\12\bin\libpq.dll'
    Left = 45
    Top = 96
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=Kurs_BD'
      'User_Name=postgres'
      'Server=localhost'
      'DriverID=PG'
      'Port=5433')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    Connected = True
    LoginDialog = FDGUIxLoginDialog1
    Left = 45
    Top = 179
  end
  object FDTable_City: TFDTable
    Active = True
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.AutoIncFields = 'id'
    CatalogName = 'Kurs_DB'
    TableName = '"City"'
    Left = 179
    Top = 13
  end
  object DataSource_City: TDataSource
    DataSet = FDTable_City
    Left = 275
    Top = 13
  end
  object FDTable_Street: TFDTable
    Active = True
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'Kurs_DB'
    TableName = '"Street"'
    Left = 179
    Top = 75
  end
  object DataSource_Street: TDataSource
    DataSet = FDTable_Street
    Left = 282
    Top = 75
  end
  object DataSource_House: TDataSource
    AutoEdit = False
    DataSet = FDTable_House
    Left = 282
    Top = 131
  end
  object FDTable_House: TFDTable
    Active = True
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'Kurs_DB'
    TableName = '"House"'
    Left = 173
    Top = 138
  end
  object FDTable_Address: TFDTable
    Active = True
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'Kurs_DB'
    TableName = '"Total_address"'
    Left = 173
    Top = 200
  end
  object DataSource_Address: TDataSource
    DataSet = FDTable_Address
    Left = 282
    Top = 200
  end
  object FDTable_Trailer: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = '"Trailer"'
    Left = 173
    Top = 269
  end
  object DataSource_Trailer: TDataSource
    AutoEdit = False
    DataSet = FDTable_Trailer
    Left = 275
    Top = 262
  end
  object FDTable_Trailer_Type: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.KeyFields = 'id'
    TableName = '"Trailer_type"'
    Left = 173
    Top = 333
  end
  object DataSource_Trailer_Type: TDataSource
    AutoEdit = False
    DataSet = FDTable_Trailer_Type
    Left = 275
    Top = 333
  end
  object FDTable_Truck_Model: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    TableName = '"Truck_model"'
    Left = 166
    Top = 403
  end
  object FDTable_Truck: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    TableName = '"Truck"'
    Left = 166
    Top = 474
  end
  object DataSource_TruckModel: TDataSource
    AutoEdit = False
    DataSet = FDTable_Truck_Model
    Left = 275
    Top = 403
  end
  object DataSource_Truck: TDataSource
    AutoEdit = False
    DataSet = FDTable_Truck
    Left = 269
    Top = 474
  end
  object FDTable_Dispatch: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    TableName = '"Dispatch"'
    Left = 429
    Top = 102
  end
  object DataSource_Driver: TDataSource
    DataSet = FDTable_Driver
    Left = 525
    Top = 13
  end
  object DataSource_Dispatch: TDataSource
    DataSet = FDTable_Dispatch
    Left = 525
    Top = 102
  end
  object FDTable_Driver: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    TableName = '"Driver"'
    Left = 422
    Top = 19
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1041#1044
    HistoryWithPassword = False
    Left = 51
    Top = 13
  end
end
