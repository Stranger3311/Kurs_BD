unit Dispatch_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask;

type
  TForm_Dispatch = class(TForm)
    FDQuery_Dispatch: TFDQuery;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DataSource_Dispatch: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    FDQuery_Dispatchid: TIntegerField;
    FDQuery_Dispatchid_start_address: TIntegerField;
    FDQuery_Dispatchid_final_address: TIntegerField;
    FDQuery_Dispatchdriver_id: TIntegerField;
    FDQuery_Dispatchcargo_weight: TIntegerField;
    FDQuery_Dispatchstatus: TStringField;
    FDQuery_Dispatchcargo_name: TStringField;
    FDQuery_DispatchDiscription: TStringField;
    FDQuery_Dispatchtruck_id: TIntegerField;
    FDQuery_Dispatchid_adr_from: TIntegerField;
    FDQuery_Dispatchfull_adr_from: TMemoField;
    FDQuery_Dispatchid_adr_to: TIntegerField;
    FDQuery_Dispatchfull_adr_to: TMemoField;
    FDQuery_Dispatchdrv_id: TIntegerField;
    FDQuery_Dispatchdrv_full_name: TStringField;
    FDQuery_Dispatchtruck_name: TStringField;
    FDQuery_Adr: TFDQuery;
    DataSource_Adr: TDataSource;
    FDQuery_Truck: TFDQuery;
    FDQuery_Driver: TFDQuery;
    DataSource_Truck: TDataSource;
    DataSource_Driver: TDataSource;
    FDQuery_Adrid: TIntegerField;
    FDQuery_Adrfull_adr: TMemoField;
    procedure FDQuery_Dispatchfull_adr_fromGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure FDQuery_Dispatchfull_adr_toGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure FDQuery_Adrfull_adrGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Dispatch: TForm_Dispatch;

implementation

{$R *.dfm}

uses DataModule;

procedure TForm_Dispatch.GetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (Sender.DataType = ftMemo) then
  begin
    Text := Sender.AsString;
    DisplayText := True;
  end;
end;

procedure TForm_Dispatch.DBGrid1CellClick(Column: TColumn);
var lv_id: Variant;
begin
 lv_id := FDQuery_Dispatch.Fields[0].Value;

 DataModule2.FDTable_Dispatch.Locate('id',lv_id)
end;

procedure TForm_Dispatch.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
 FDQuery_Dispatch.Active := false;
 FDQuery_Dispatch.Active := true
end;

procedure TForm_Dispatch.FDQuery_Adrfull_adrGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
 GetText(Sender,Text,DisplayText)
end;

procedure TForm_Dispatch.FDQuery_Dispatchfull_adr_fromGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
 GetText(Sender,Text,DisplayText)
end;

procedure TForm_Dispatch.FDQuery_Dispatchfull_adr_toGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
 GetText(Sender,Text,DisplayText)
end;

procedure TForm_Dispatch.FormShow(Sender: TObject);
begin
 FDQuery_Dispatch.Active := false;
 FDQuery_Dispatch.Active := true
end;

end.
