unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Datasnap.Provider, Data.DB,
  Datasnap.DBClient;

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
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    //procedure XML1Click(Sender: TObject);
    //procedure N6Click(Sender: TObject);
    //procedure JSON1Click(Sender: TObject);
  private
    { Private declarations }
    //procedure DataSetToXML(DataSet  : TDataSet; const FileName:string);
    //function  DataSetToJSON(ADataSet: TDataSet; AName_Tab:string):string;
    //procedure SaveJSONFile( AFileName: string; json_str: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses DataModule, directory_unit;

procedure TForm1.N2Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 DirectoryForm.ShowModal;
end;
                     (*
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
         *)
end.
