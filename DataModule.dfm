object DataModule2: TDataModule2
  Height = 600
  Width = 800
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'D:\Postgres_12\12\bin\libpq.dll'
    Left = 45
    Top = 96
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    HistoryEnabled = True
    HistoryWithPassword = False
    Left = 51
    Top = 26
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=Kurs_BD'
      'User_Name=postgres'
      'Password=asd345kl'
      'Server=localhost'
      'DriverID=PG'
      'Port=5433')
    Connected = True
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
    Top = 32
  end
  object DataSource_City: TDataSource
    DataSet = FDTable_City
    Left = 275
    Top = 32
  end
  object FDTable_Street: TFDTable
    Active = True
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'Kurs_DB'
    TableName = '"Street"'
    Left = 179
    Top = 109
  end
  object DataSource_Street: TDataSource
    DataSet = FDTable_Street
    Left = 282
    Top = 109
  end
  object DataSource_House: TDataSource
    DataSet = FDTable_House
    Left = 282
    Top = 192
  end
  object FDTable_House: TFDTable
    Active = True
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'Kurs_DB'
    TableName = '"House"'
    Left = 173
    Top = 198
  end
  object FDTable_Address: TFDTable
    Active = True
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    CatalogName = 'Kurs_DB'
    TableName = '"Total_address"'
    Left = 173
    Top = 288
  end
  object DataSource_Address: TDataSource
    DataSet = FDTable_Address
    Left = 282
    Top = 288
  end
end
