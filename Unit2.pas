unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  REST.Client,
  REST.Authenticator.OAuth,
  REST.Types,
  System.JSON, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,

  Data.DB, Datasnap.DBClient, Datasnap.Provider;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Timer1: TTimer;
    ImageList1: TImageList;
    Label1: TLabel;
    FormatExportRG: TRadioGroup;
    InCloudChkBx: TCheckBox;
    GroupBox1: TGroupBox;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    Edit2: TEdit;
    UpDown1: TUpDown;
    TimeRG: TRadioGroup;
    TimerActiveBtn: TButton;
    DoExportBtn: TButton;
    CancelBtn: TButton;
    FileOpenDialog1: TFileOpenDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure TimerActiveBtnClick(Sender: TObject);
    procedure DoExportBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure SaveJSONFile(AFileName: string; json_str: string);
    procedure ExportToJSON;
    function DataSetToJSON(ADataSet: TDataSet; AName_Tab: string): string;
    procedure UploadFile(FileName: String);
    procedure ExportToXML;
    procedure DataSetToXML(DataSet: TDataSet; const FileName: string);
    procedure ExportToCloud(ext: string);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses MainForm, DataModule;

procedure TForm2.ExportToCloud(ext: string);
begin
  UploadFile(Edit1.Text + '\city.' + ext);
  UploadFile(Edit1.Text + '\dispatch.' + ext);
  UploadFile(Edit1.Text + '\driver.' + ext);
  UploadFile(Edit1.Text + '\house.' + ext);
  UploadFile(Edit1.Text + '\street.' + ext);
  UploadFile(Edit1.Text + '\total_address.' + ext);
  UploadFile(Edit1.Text + '\trailer.' + ext);
  UploadFile(Edit1.Text + '\trailer_type.' + ext);
  UploadFile(Edit1.Text + '\truck.' + ext);
  UploadFile(Edit1.Text + '\truck_model.' + ext);
end;

procedure TForm2.DataSetToXML(DataSet: TDataSet; const FileName: string);
var
  LProvider: TDataSetProvider;
  LClient: TClientDataSet;
begin
  LProvider := TDataSetProvider.Create(nil);
  try
    LProvider.DataSet := DataSet;
    LClient := TClientDataSet.Create(nil);
    try
      DataSet.DisableControls;
      try
        if not DataSet.Active then
          DataSet.Active := true;
        LClient.SetProvider(LProvider);
        LClient.Active := true;
        LClient.SaveToFile(FileName, dfXMLUTF8);
      finally
        DataSet.EnableControls;
      end;
    finally
      LClient.Free;
    end;
  finally
    LProvider.Free;
  end;
end;

procedure TForm2.ExportToXML;
begin
  if Edit1.Text = '' then
    Edit1.Text := 'C:\';
  DataSetToXML(DataModule2.FDTable_City, FileOpenDialog1.FileName +
    '\city.xml');
  DataSetToXML(DataModule2.FDTable_Dispatch, Edit1.Text +
    '\dispatch.xml');
  DataSetToXML(DataModule2.FDTable_Driver, Edit1.Text +
    '\driver.xml');
  DataSetToXML(DataModule2.FDTable_House, Edit1.Text +
    '\house.xml');
  DataSetToXML(DataModule2.FDTable_Street, Edit1.Text +
    '\street.xml');
  DataSetToXML(DataModule2.FDTable_Address, Edit1.Text +
    '\total_address.xml');
  DataSetToXML(DataModule2.FDTable_Trailer, Edit1.Text +
    '\trailer.xml');
  DataSetToXML(DataModule2.FDTable_Trailer_Type, Edit1.Text +
    '\trailer_type.xml');
  DataSetToXML(DataModule2.FDTable_Truck, Edit1.Text +
    '\truck.xml');
  DataSetToXML(DataModule2.FDTable_Truck_Model, Edit1.Text +
    '\truck_model.xml')
end;

function TForm2.DataSetToJSON(ADataSet: TDataSet; AName_Tab: string): string;
// [{"CityId":"18","CityName":" "},{"CityId":"53","CityName":"Guangzhou"}]
var
  LRecord: string;
  LField: TField;
  i: Integer;
  first_flag: boolean;
begin
  Result := '';
  if (not ADataSet.Active) or (ADataSet.IsEmpty) then
    Exit;
  Result := '{"' + 'Table:' + '":"' + AName_Tab + '"}' + '[';
  first_flag := true;
  ADataSet.DisableControls;
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    for i := 0 to ADataSet.FieldCount - 1 do
    begin
      LField := ADataSet.Fields[i];
      if (LRecord = '') OR first_flag then
      begin
        LRecord := LRecord + '{"' + LField.FieldName + '":"' +
          LField.Text + '"';
      end
      else
        LRecord := LRecord + ',"' + LField.FieldName + '":"' +
          LField.Text + '"';
      if i = ADataSet.FieldCount - 1 then
      begin
        LRecord := LRecord + '}';
        if Result = '[' then
          Result := Result + LRecord
        else if first_flag then
        begin
          first_flag := False;
          Result := Result + LRecord;
        end
        else
          Result := Result + ',' + LRecord;
        LRecord := '';
      end;
    end;
    ADataSet.Next;
  end;
  ADataSet.EnableControls;
  Result := Result + ']';

end;

procedure TForm2.ExportToJSON;

var
  json_str: string;
  AFileName: string;
begin
  AFileName := Edit1.Text;
  json_str := DataSetToJSON(DataModule2.FDTable_City, 'city');
  SaveJSONFile(AFileName + '\city.json', json_str);
  json_str := DataSetToJSON(DataModule2.FDTable_Dispatch, 'dispatch');
  SaveJSONFile(AFileName + '\dispatch.json', json_str);
  json_str := DataSetToJSON(DataModule2.FDTable_Driver, 'driver');
  SaveJSONFile(AFileName + '\driver.json', json_str);
  json_str := DataSetToJSON(DataModule2.FDTable_House, 'house');
  SaveJSONFile(AFileName + '\house.json', json_str);
  json_str := DataSetToJSON(DataModule2.FDTable_Street, 'street');
  SaveJSONFile(AFileName + '\street.json', json_str);
  json_str := DataSetToJSON(DataModule2.FDTable_Address, 'total_address');
  SaveJSONFile(AFileName + '\total_address.json', json_str);
  json_str := DataSetToJSON(DataModule2.FDTable_Trailer, 'trailer');
  SaveJSONFile(AFileName + '\trailer.json', json_str);
  json_str := DataSetToJSON(DataModule2.FDTable_Trailer_Type, 'trailer_type');
  SaveJSONFile(AFileName + '\trailer_type.json', json_str);
  json_str := DataSetToJSON(DataModule2.FDTable_Truck, 'truck');
  SaveJSONFile(AFileName + '\truck.json', json_str);
  json_str := DataSetToJSON(DataModule2.FDTable_Truck_Model, 'truck_model');
  SaveJSONFile(AFileName + '\truck_model.json', json_str);
end;

procedure TForm2.SaveJSONFile(AFileName: string; json_str: string);
var
  f: System.Text; // класс текстового файла
begin
  AssignFile(f, AFileName); // регистрация файла
  Rewrite(f);
  // создание файла, если он там есть, то перезаписываеться (старый удаляеться, новый пустой появляеться)
  Write(f, json_str);
  // записываем строку в файл без перевода курсора на новую строку
  CloseFile(f); // закрываем файл
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  DoExportBtnClick(Form2)
end;

procedure TForm2.TimerActiveBtnClick(Sender: TObject);
var
  multiplier: Integer;
begin
  if Timer1.Enabled then // Акивна периодическая выгрузка
    Timer1.Enabled := False // выключаем
  else
  begin // Включаемs
    if TimeRG.ItemIndex = 0 then
      multiplier := 1
    else
      multiplier := 60;
    Timer1.Interval := multiplier * StrToInt(Edit2.Text);
    Timer1.Enabled := true
  end;
end;

procedure TForm2.CancelBtnClick(Sender: TObject);
begin
  Form2.Close
end;

procedure TForm2.DoExportBtnClick(Sender: TObject);
begin
  if Edit1.Text = '' then
    Edit1.Text := 'C:\';
  if FormatExportRG.ItemIndex = 0 then
  begin
    ExportToXML;
    if InCloudChkBx.Checked then
      ExportToCloud('xml')
  end
  else
  begin
    ExportToJSON;
    if InCloudChkBx.Checked then
      ExportToCloud('json')
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  if Timer1.Enabled then
    TimerActiveBtn.Caption := 'Деактивировать'
  else
    TimerActiveBtn.Caption := 'Активировать'

end;

procedure TForm2.SpeedButton1Click(Sender: TObject);

begin
  if FileOpenDialog1.Execute then
  begin
    Edit1.Text := FileOpenDialog1.FileName;
    // UploadFile(Edit1.Text);
  end;
end;

procedure TForm2.UploadFile(FileName: String);
var
  SFileName, Link, Mem: String;
  Code: Integer;
  RESTRequest1: TRESTRequest;
  RESTClient1: TRESTClient;
begin
  // выделяем только имя файла, без путей
  SFileName := ExtractFileName(FileName);
  Memo1.Lines.Add('uploading ' + SFileName);
  // подготавливаем параметры
  RESTRequest1 := TRESTRequest.Create(Form2);
  RESTClient1 := TRESTClient.Create(Form2);
  RESTClient1.Authenticator := nil;
  RESTClient1.BaseURL := 'https://cloud-api.yandex.net/v1';

  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Params.Clear;
  RESTRequest1.Params.Add;
  // в первую очередь дополнительный заголовок в запрос
  // с токеном, иначе будет 401 UNAUTHORIZED
  RESTRequest1.Params[0].Kind := TRESTRequestParameterKind.pkHTTPHEADER;
  RESTRequest1.Params[0].name := 'Authorization';
  RESTRequest1.Params[0].Options := [poDoNotEncode];
  RESTRequest1.Params[0].Value :=
    'OAuth y0__xC_1vPKBRjfwzwgjNqt5BWPmr9X3G8OqUI2tnNB_YNetwCZJw';

  // далее - путь загрузки
  // делаем просто в папку приложения
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
    // все нормально, для отладки выведем полученный JSON
    Memo1.Lines.Add(RESTRequest1.Response.Content);

    // выделяем ссылку на загрузку
    Link := TJSONObject(RESTRequest1.Response.JSONValue).GetValue('href').Value;
    Memo1.Lines.Add(Link); // запоминаем базовый путь
    Mem := RESTClient1.BaseURL;
    try // прописываем ссылку на загрузку
      RESTClient1.BaseURL := Link;
      // очищаем параметры, токен при это не нужен       RESTRequest1.Params.Clear;
      RESTRequest1.Resource := '';
      // добавляем файл в запрос
      RESTRequest1.AddFile(FileName);
      // метод - PUT
      RESTRequest1.Method := rmPUT; // ну и отправляем файл на сервер
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
        ('файл загружен на сервер, но пока не передан в папку назначения');
    if Code = 412 then
      Memo1.Lines.Add
        ('при дозагрузке файла был передан неверный диапазон в заголовке Content-Range');
    if Code = 413 then
      Memo1.Lines.Add('размер файла превышает 10Гб');
    if Code = 500 then
      Memo1.Lines.Add('внутренняя ошибка сервера, попробуйте позже');
    if Code = 503 then
      Memo1.Lines.Add('сервис недоступен, попробуйте позже');
    if Code = 507 then
      Memo1.Lines.Add('исчерпано место на Диске');

  end
  else
    Memo1.Lines.Add('запрос ссылки - ошибка ' +
      RESTRequest1.Response.StatusCode.ToString);
  RESTRequest1.Free;
  RESTClient1.Free;
end;

end.
