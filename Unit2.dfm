object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object SpeedButton1: TSpeedButton
    Left = 64
    Top = 56
    Width = 23
    Height = 22
    Caption = '111'
    OnClick = SpeedButton1Click
  end
  object Memo1: TMemo
    Left = 88
    Top = 200
    Width = 305
    Height = 193
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 48
    Top = 144
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'Edit1'
  end
  object OAuth2Authenticator1: TOAuth2Authenticator
    AccessToken = 'y0__xC_1vPKBRjfwzwgjNqt5BWPmr9X3G8OqUI2tnNB_YNetwCZJw'
    AccessTokenEndpoint = 'https://oauth.yandex.ru/token'
    AuthorizationEndpoint = 'https://oauth.yandex.ru/authorize'
    ClientID = 'ec1bfb17cdca4c82a2ad869b32021ba5'
    ClientSecret = '4963603bd2f847a6adec0b21ba0d128c'
    RedirectionEndpoint = 'https://oauth.yandex.ru/verification_code'
    Left = 328
    Top = 64
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://cloud-api.yandex.net/v1'
    Params = <>
    SynchronizedEvents = False
    Left = 472
    Top = 168
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    SynchronizedEvents = False
    Left = 448
    Top = 264
  end
  object OpenDialog1: TOpenDialog
    Left = 168
    Top = 56
  end
end
