unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    XML1: TMenuItem;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    N6: TMenuItem;
    FileOpenDialog1: TFileOpenDialog;
    JSON1: TMenuItem;
    Upload1: TMenuItem;
    NetHTTPClient1: TNetHTTPClient;
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure XML1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure JSON1Click(Sender: TObject);
    procedure Upload1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DataSetToXML(DataSet  : TDataSet; const FileName:string);
    function  DataSetToJSON(ADataSet: TDataSet; AName_Tab:string):string;
    procedure SaveJSONFile( AFileName: string; json_str: string);

    function InitiateResumableUpload(const AAccessToken, AFileNameOnDrive: string; const ParentId: string = ''): string;
    procedure UploadFileInChunks(const UploadUrl: string; const ALocalFilePath: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses DataModule, directory_unit, Dispatch_Unit;

procedure TForm1.N2Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 DirectoryForm.ShowModal;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 Form_Dispatch.ShowModal
end;

function TForm1.DataSetToJson(ADataset: TDataSet; AName_Tab: string): string;
// [{"CityId":"18","CityName":" "},{"CityId":"53","CityName":"Guangzhou"}]
var
  LRecord: string;
  LField: TField;
  i: integer;
  first_flag: boolean;
begin
  Result := '';
  if (not ADataset.Active) or (ADataset.IsEmpty) then
  Exit;
  Result := '{"' + 'Table:' + '":"' + AName_Tab + '"}' + '[' ;
  first_flag := true;
  ADataset.DisableControls;
  ADataset.First;
  while not ADataset.Eof do
    begin
    for i := 0 to ADataset.FieldCount - 1 do
      begin
      LField := ADataset.Fields[i];
      if ( LRecord = '' ) OR  first_flag  then
       begin
        LRecord := LRecord + '{"' + LField.FieldName + '":"' + LField.Text + '"';
       end
      else
       LRecord := LRecord + ',"' + LField.FieldName + '":"' + LField.Text + '"';
      if i = ADataset.FieldCount - 1 then
       begin
        LRecord := LRecord + '}';
        if Result = '[' then
        Result := Result + LRecord
        else
         if first_flag then
          begin
            first_flag := false;
            Result := Result  + LRecord;
          end
         else Result := Result + ',' + LRecord;
        LRecord := '';
       end;
      end;
    ADataset.Next;
    end;
  ADataset.EnableControls;
  Result := Result + ']';

end;

procedure TForm1.XML1Click(Sender: TObject);
begin
 if FileOpenDialog1.Execute
  then
    begin
      DataSetToXML(DataModule2.FDTable_City,     FileOpenDialog1.FileName + '\city.xml');
      DataSetToXML(DataModule2.FDTable_Dispatch, FileOpenDialog1.FileName + '\dispatch.xml');
      DataSetToXML(DataModule2.FDTable_Driver,   FileOpenDialog1.FileName + '\driver.xml');
      DataSetToXML(DataModule2.FDTable_House,    FileOpenDialog1.FileName + '\house.xml');
      DataSetToXML(DataModule2.FDTable_Street,   FileOpenDialog1.FileName + '\street.xml');
      DataSetToXML(DataModule2.FDTable_Address,  FileOpenDialog1.FileName + '\total_address.xml');
      DataSetToXML(DataModule2.FDTable_Trailer,  FileOpenDialog1.FileName + '\trailer.xml');
      DataSetToXML(DataModule2.FDTable_Trailer_Type, FileOpenDialog1.FileName + '\trailer_type.xml');
      DataSetToXML(DataModule2.FDTable_Truck,        FileOpenDialog1.FileName + '\truck.xml');
      DataSetToXML(DataModule2.FDTable_Truck_Model,  FileOpenDialog1.FileName + '\truck_model.xml')
    end;
end;

procedure TForm1.DataSetToXML(DataSet  : TDataSet; const FileName:string);
var
 LProvider : TDataSetProvider;
 LClient   : TClientDataSet;
begin
   LProvider:=TDataSetProvider.Create(nil);
   try
     LProvider.DataSet:=DataSet;
     LClient:=TClientDataSet.Create(nil);
     try
       DataSet.DisableControls;
       try
        if not DataSet.Active then
          DataSet.Active:=True;
          LClient.SetProvider(LProvider);
          LClient.Active:=True;
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

procedure TForm1.SaveJSONFile( AFileName: string; json_str: string);
var f:System.Text; //класс текстового файла
begin
  AssignFile(f, AFileName); //регистрация файла
  Rewrite(f); //создание файла, если он там есть, то перезаписываеться (старый удаляеться, новый пустой появляеться)
  Write(f,json_str); //записываем строку в файл без перевода курсора на новую строку
  CloseFile(f); //закрываем файл
end;

procedure TForm1.JSON1Click(Sender: TObject);
var json_str: string;

begin
 if FileOpenDialog1.Execute then
   begin
      json_str := DataSetToJSON(DataModule2.FDTable_City, 'city');
      SaveJSONFile(FileOpenDialog1.FileName + '\city.json', json_str);
      json_str := DataSetToJSON(DataModule2.FDTable_Dispatch, 'dispatch');
      SaveJSONFile(FileOpenDialog1.FileName + '\dispatch.json', json_str);
      json_str := DataSetToJSON(DataModule2.FDTable_Driver, 'driver');
      SaveJSONFile(FileOpenDialog1.FileName + '\driver.json', json_str);
      json_str := DataSetToJSON(DataModule2.FDTable_House, 'house');
      SaveJSONFile(FileOpenDialog1.FileName + '\house.json', json_str);
      json_str := DataSetToJSON(DataModule2.FDTable_Street, 'street');
      SaveJSONFile(FileOpenDialog1.FileName + '\street.json', json_str);
      json_str := DataSetToJSON(DataModule2.FDTable_Address, 'total_address');
      SaveJSONFile(FileOpenDialog1.FileName + '\total_address.json', json_str);
      json_str := DataSetToJSON(DataModule2.FDTable_Trailer, 'trailer');
      SaveJSONFile(FileOpenDialog1.FileName + '\trailer.json', json_str);
      json_str := DataSetToJSON(DataModule2.FDTable_Trailer_Type, 'trailer_type');
      SaveJSONFile(FileOpenDialog1.FileName + '\trailer_type.json', json_str);
      json_str := DataSetToJSON(DataModule2.FDTable_Truck, 'truck');
      SaveJSONFile(FileOpenDialog1.FileName + '\truck.json', json_str);
      json_str := DataSetToJSON(DataModule2.FDTable_Truck_Model, 'truck_model');
      SaveJSONFile(FileOpenDialog1.FileName + '\truck_model.json', json_str);
   end
end;




function TForm1.InitiateResumableUpload(const AAccessToken, AFileNameOnDrive: string; const ParentId: string = ''): string;
var
  HttpClient: TNetHTTPClient;
  RequestStream: TStringStream;
  Response: IHTTPResponse;
  MetadataJson: string;
begin
  HttpClient := TNetHTTPClient.Create(nil);
  RequestStream := TStringStream.Create('', TEncoding.UTF8);
  try
    HttpClient.CustomHeaders['Authorization'] := 'Bearer ' + AAccessToken;
    HttpClient.CustomHeaders['Content-Type'] := 'application/json; charset=UTF-8';
    // Указываем URL с параметром uploadType=resumable[citation:2]
    HttpClient.CustomHeaders['X-Upload-Content-Type'] := 'application/octet-stream';

    // Формируем JSON с метаданными файла
    MetadataJson := '{"name": "' + AFileNameOnDrive + '"';
    if ParentId <> '' then
      MetadataJson := MetadataJson + ', "parents": ["' + ParentId + '"]';
    MetadataJson := MetadataJson + '}';
    RequestStream.WriteString(MetadataJson);
    RequestStream.Position := 0;

    // Отправляем POST-запрос для инициирования сессии[citation:2]
    Response := HttpClient.Post('https://www.googleapis.com/upload/drive/v3/files?uploadType=resumable',
                                RequestStream);

    if Response.StatusCode = 200 then
    begin
      // Извлекаем URL для загрузки из заголовка 'Location'
      Result := Response.HeaderValue['Location'];
      if Result = '' then
        raise Exception.Create('Не получен URL для загрузки.');
    end
    else
    begin
      raise Exception.CreateFmt('Ошибка инициализации. Код: %d. Сообщение: %s',
                                [Response.StatusCode, Response.ContentAsString]);
    end;
  finally
    RequestStream.Free;
    HttpClient.Free;
  end;
end;


procedure TForm1.Upload1Click(Sender: TObject);
var URL: string;
    token : string;
begin
  FileOpenDialog1.Options := FileOpenDialog1.Options - [fdoPickFolders];

  if FileOpenDialog1.Execute then
  begin
    token := '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';
    URL := InitiateResumableUpload(token, '123');

  end;


FileOpenDialog1.Options := FileOpenDialog1.Options + [fdoPickFolders];
end;

procedure TForm1.UploadFileInChunks(const UploadUrl: string; const ALocalFilePath: string);
var
  HttpClient: TNetHTTPClient;
  FileStream: TFileStream;
  SourceStream: TMemoryStream;
  StartByte, EndByte, FileSize: Int64;
  Response: IHTTPResponse;
  ChunkSize: Integer;
begin
  FileStream := TFileStream.Create(ALocalFilePath, fmOpenRead or fmShareDenyWrite);
  HttpClient := TNetHTTPClient.Create(nil);
  SourceStream := TMemoryStream.Create;
  try
    FileSize := FileStream.Size;
    StartByte := 0;
    ChunkSize := 1 * 1024 * 1024; // 1 МБ

    while StartByte < FileSize do
    begin
      EndByte := StartByte + ChunkSize - 1;
      if EndByte >= FileSize then EndByte := FileSize - 1;



      HttpClient.CustomHeaders['Content-Range'] := Format('bytes %d-%d/%d', [StartByte, EndByte, FileSize]);
      HttpClient.CustomHeaders['Content-Type'] := 'application/octet-stream';

      SourceStream.Clear;
      FileStream.Position := StartByte;
      SourceStream.CopyFrom(FileStream, (EndByte - StartByte + 1));
      SourceStream.Position := 0;


      Response := HttpClient.Put(UploadUrl, SourceStream);

      if (Response.StatusCode <> 200) and
         (Response.StatusCode <> 201) and
         (Response.StatusCode <> 308) then
        raise Exception.CreateFmt('Ошибка: %d - %s', [Response.StatusCode, Response.ContentAsString]);

      StartByte := EndByte + 1;
    end;
  finally
    SourceStream.Free;
    FileStream.Free;
    HttpClient.Free;
  end;
end;



end.
