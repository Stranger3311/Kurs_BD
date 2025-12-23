unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  REST.Authenticator.OAuth.WebForm.Win, Data.Bind.Components,
  Data.Bind.ObjectScope,
  REST.Client,
  REST.Authenticator.OAuth,
  REST.Types,
  System.JSON;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    OAuth2Authenticator1: TOAuth2Authenticator;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TitleChanged(const ATitle: string; var DoCloseWebView: boolean);
    procedure AfterRedirect(const AURL: string; var DoCloseWebView: boolean);
    procedure UploadFile(FileName: String);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.AfterRedirect(const AURL: string; var DoCloseWebView: boolean);
begin
  Memo1.Lines.Add('after redirect to ' + AURL);
end;

procedure TForm2.TitleChanged(const ATitle: string;
  var DoCloseWebView: boolean);
begin
  Memo1.Lines.Add('== ' + ATitle);
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
  wf: Tfrm_OAuthWebForm;
begin
  if OpenDialog1.Execute then
  begin
    Edit1.Text := OpenDialog1.FileName;
    UploadFile(Edit1.Text);
  end;
end;

procedure TForm2.UploadFile(FileName: String);
var
  SFileName, Link, Mem: String;
  Code: Integer;
  //RESTRequest1: TRESTRequest;
begin
  // выдел€ем только им€ файла, без путей
  SFileName := ExtractFileName(FileName);
  Memo1.Lines.Add('uploading ' + SFileName);
  // подготавливаем параметры
  //RESTRequest1 := TRestRequest.Create( Form2 );
  //RESTRequest1.Client := RESTClient1;
  RESTRequest1.Params.Clear;
  RESTRequest1.Params.Add;
  // в первую очередь дополнительный заголовок в запрос
  // с токеном, иначе будет 401 UNAUTHORIZED
  RESTRequest1.Params[0].Kind := TRESTRequestParameterKind.pkHTTPHEADER;
  RESTRequest1.Params[0].name := 'Authorization';
  RESTRequest1.Params[0].Options := [poDoNotEncode];
  RESTRequest1.Params[0].Value := 'OAuth ' + OAuth2Authenticator1.AccessToken;

  // далее - путь загрузки
  // делаем просто в папку приложени€
  RESTRequest1.Params.Add;
  RESTRequest1.Params[1].name := 'path';
  RESTRequest1.Params[1].Value := 'app:/' + SFileName;
  // перезапишем без вопросов
  RESTRequest1.Params.Add;
  RESTRequest1.Params[2].name := 'overwrite';
  RESTRequest1.Params[2].Value := 'true';

  RESTRequest1.Resource := '/disk/resources/upload';
  RESTRequest1.Method := rmGet;
  // ну и собственно запрос ссылки на загрузк
  RESTRequest1.Execute;
  if RESTRequest1.Response.StatusCode = 200 then
  begin
    // все нормально, дл€ отладки выведем полученный JSON
    Memo1.Lines.Add(RESTRequest1.Response.Content);

    // выдел€ем ссылку на загрузку
    Link := TJSONObject(RESTRequest1.Response.JSONValue).GetValue('href').Value;
    Memo1.Lines.Add(Link); // запоминаем базовый путь
    Mem := RESTClient1.BaseURL;
    try // прописываем ссылку на загрузку
      RESTClient1.BaseURL := Link;
      // очищаем параметры, токен при это не нужен       RESTRequest1.Params.Clear;
      RESTRequest1.Resource := '';
      // добавл€ем файл в запрос
      RESTRequest1.AddFile(FileName);
      // метод - PUT
      RESTRequest1.Method := rmPUT; // ну и отправл€ем файл на сервер
      RESTRequest1.Execute;
    finally
      // после чего восстанавливаем ссылку на API
      RESTClient1.BaseURL := Mem;
    end;
    Code := RESTRequest1.Response.StatusCode;
    if Code = 201 then
      Memo1.Lines.Add('файл успешно загружен');
    if Code = 202 then
      Memo1.Lines.Add
        ('файл загружен на сервер, но пока не передан в папку назначени€');
    if Code = 412 then
      Memo1.Lines.Add
        ('при дозагрузке файла был передан неверный диапазон в заголовке Content-Range');
    if Code = 413 then
      Memo1.Lines.Add('размер файла превышает 10√б');
    if Code = 500 then
      Memo1.Lines.Add('внутренн€€ ошибка сервера, попробуйте позже');
    if Code = 503 then
      Memo1.Lines.Add('сервис недоступен, попробуйте позже');
    if Code = 507 then
      Memo1.Lines.Add('исчерпано место на ƒиске');

  end
  else
    Memo1.Lines.Add('запрос ссылки - ошибка ' +
      RESTRequest1.Response.StatusCode.ToString);
  RESTRequest1.Free;
end;

end.
