object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1054#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1077' '#1075#1088#1091#1079#1086#1087#1077#1088#1077#1074#1086#1079#1086#1082
  ClientHeight = 747
  ClientWidth = 1112
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  TextHeight = 15
  object BitBtn1: TBitBtn
    Left = 312
    Top = 96
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 48
    object N1: TMenuItem
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
      object XML1: TMenuItem
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' XML'
        OnClick = XML1Click
      end
      object JSON1: TMenuItem
        Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' JSON'
        OnClick = JSON1Click
      end
      object N4: TMenuItem
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1086#1073#1083#1072#1082#1086
        OnClick = N4Click
      end
      object N2: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object N5: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1081#1089
        OnClick = N6Click
      end
    end
  end
  object DataSetProvider1: TDataSetProvider
    Left = 984
    Top = 32
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 984
    Top = 104
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders, fdoCreatePrompt]
    Title = #1059#1082#1072#1078#1080#1090#1077' '#1087#1072#1087#1082#1091' '#1076#1083#1103' '#1089#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1093
    Left = 40
    Top = 176
  end
  object IdWebDAV1: TIdWebDAV
    Intercept = IdCompressionIntercept1
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.CacheControl = 'no-cache'
    Request.Connection = 'Keep-Alive'
    Request.ContentEncoding = 'utf-8'
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.AcceptCharSet = 'utf-8'
    Request.BasicAuthentication = True
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 224
    Top = 376
  end
  object IdCompressionIntercept1: TIdCompressionIntercept
    CompressionLevel = 0
    Left = 200
    Top = 472
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Intercept = IdCompressionIntercept1
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 352
    Top = 376
  end
end
