unit directory_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Tabs, Vcl.DockTabSet, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.DBCGrids, Vcl.Mask;

type
  TDirectoryForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    TabSheet3: TTabSheet;
    DBNavigator3: TDBNavigator;
    FDTable_Str: TFDTable;
    FDTable_Hou: TFDTable;
    DataSource_Str: TDataSource;
    DataSource_Hou: TDataSource;
    DataSource_Cty: TDataSource;
    FDTable_Cty: TFDTable;
    TabSheet4: TTabSheet;
    DBLookupComboBox2: TDBLookupComboBox;
    Label2: TLabel;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    FDQuery_Address: TFDQuery;
    DataSource1: TDataSource;
    DBGrid3: TDBGrid;
    DBNavigator4: TDBNavigator;
    DBGrid4: TDBGrid;
    Trailer: TTabSheet;
    TabSheet_Trailer_type: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    DBNavigator5: TDBNavigator;
    DBGrid_Trailer: TDBGrid;
    DBNavigator6: TDBNavigator;
    DBGrid6: TDBGrid;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    FDQuery_Trailer: TFDQuery;
    DataSource2: TDataSource;
    TabSheet6: TTabSheet;
    DBNavigator7: TDBNavigator;
    DBGrid_Truck: TDBGrid;
    DBNavigator8: TDBNavigator;
    DBGrid7: TDBGrid;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    DataSource3: TDataSource;
    FDQuery_Truck: TFDQuery;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    DBNavigator9: TDBNavigator;
    DBGrid_Driver: TDBGrid;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBLookupComboBox7: TDBLookupComboBox;
    FDQuery_Driver: TFDQuery;
    DataSource_Driver: TDataSource;
    procedure DBGrid3CellClick(Column: TColumn);
    procedure TabSheet3Show(Sender: TObject);
    procedure DBNavigator3Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure DBLookupComboBox2CloseUp(Sender: TObject);
    procedure DBLookupComboBox3CloseUp(Sender: TObject);
    procedure DBGrid_TrailerCellClick(Column: TColumn);
    procedure DBLookupComboBox4CloseUp(Sender: TObject);
    procedure TrailerShow(Sender: TObject);
    procedure DBNavigator5Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBNavigator7Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBLookupComboBox5CloseUp(Sender: TObject);
    procedure DBLookupComboBox6CloseUp(Sender: TObject);
    procedure DBGrid_TruckCellClick(Column: TColumn);
    procedure TabSheet6Show(Sender: TObject);
    procedure DBNavigator9Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBLookupComboBox7CloseUp(Sender: TObject);
    procedure DBGrid_DriverCellClick(Column: TColumn);
    procedure TabSheet8Show(Sender: TObject);
  private
    { Private declarations }
    procedure refresh_query(Query:TFDQuery);
  public
    { Public declarations }
  end;

var
  DirectoryForm: TDirectoryForm;

implementation

{$R *.dfm}

uses DataModule;

procedure TDirectoryForm.refresh_query(Query:TFDQuery);
begin
  Query.Active := false;
  Query.Active := true;
end;

procedure TDirectoryForm.DBGrid3CellClick(Column: TColumn);
var lv_address_id: Variant;
    col,row: integer;
begin
 col := dbGrid3.SelectedIndex;
 row := dbGrid3.DataSource.DataSet.RecNo;
 lv_address_id := FDQuery_Address.Fields[0].Value;

 DataModule2.FDTable_Address.Locate('id',lv_address_id)
end;

procedure TDirectoryForm.DBGrid_TruckCellClick(Column: TColumn);
var lv_id: Variant;
    col,row: integer;
begin
 col := DBGrid_Truck.SelectedIndex;
 row := DBGrid_Truck.DataSource.DataSet.RecNo;
 lv_id := FDQuery_Truck.Fields[0].Value;

 DataModule2.FDTable_Truck.Locate('id',lv_id)
end;

procedure TDirectoryForm.DBGrid_DriverCellClick(Column: TColumn);
var lv_id: Variant;
    col,row: integer;
begin
 col := DBGrid_Driver.SelectedIndex;
 row := DBGrid_Driver.DataSource.DataSet.RecNo;
 lv_id := FDQuery_Driver.Fields[0].Value;

 DataModule2.FDTable_Driver.Locate('id',lv_id)
end;

procedure TDirectoryForm.DBGrid_TrailerCellClick(Column: TColumn);
var lv_id: Variant;
    col,row: integer;
begin
 col := DBGrid_Trailer.SelectedIndex;
 row := DBGrid_Trailer.DataSource.DataSet.RecNo;
 lv_id := FDQuery_Trailer.Fields[0].Value;

 DataModule2.FDTable_Trailer.Locate('id',lv_id)
end;

procedure TDirectoryForm.DBLookupComboBox1CloseUp(Sender: TObject);
begin
 refresh_query(FDQuery_Address)
end;

procedure TDirectoryForm.DBLookupComboBox2CloseUp(Sender: TObject);
begin
  refresh_query(FDQuery_Address)
end;

procedure TDirectoryForm.DBLookupComboBox3CloseUp(Sender: TObject);
begin
  refresh_query(FDQuery_Address)
end;

procedure TDirectoryForm.DBLookupComboBox4CloseUp(Sender: TObject);
begin
 refresh_query(FDQuery_Trailer)
end;

procedure TDirectoryForm.DBLookupComboBox5CloseUp(Sender: TObject);
begin
 refresh_query(FDQuery_Truck)
end;

procedure TDirectoryForm.DBLookupComboBox6CloseUp(Sender: TObject);
begin
 refresh_query(FDQuery_Truck)
end;

procedure TDirectoryForm.DBLookupComboBox7CloseUp(Sender: TObject);
begin
 refresh_query(FDQuery_Driver)
end;

procedure TDirectoryForm.DBNavigator3Click(Sender: TObject;
  Button: TNavigateBtn);
begin
 refresh_query(FDQuery_Address)
end;

procedure TDirectoryForm.DBNavigator5Click(Sender: TObject;
  Button: TNavigateBtn);
begin
 refresh_query(FDQuery_Trailer)
end;

procedure TDirectoryForm.DBNavigator7Click(Sender: TObject;
  Button: TNavigateBtn);
begin
 refresh_query(FDQuery_Truck)
end;

procedure TDirectoryForm.DBNavigator9Click(Sender: TObject;
  Button: TNavigateBtn);
begin
 refresh_query(FDQuery_Driver)
end;

procedure TDirectoryForm.FormShow(Sender: TObject);
begin
PageControl1.ActivePageIndex := 0
end;

procedure TDirectoryForm.TabSheet3Show(Sender: TObject);
begin
 refresh_query(FDQuery_Address)
end;

procedure TDirectoryForm.TabSheet6Show(Sender: TObject);
begin
 refresh_query(FDQuery_Truck)
end;

procedure TDirectoryForm.TabSheet8Show(Sender: TObject);
begin
 refresh_query(FDQuery_Driver)
end;

procedure TDirectoryForm.TrailerShow(Sender: TObject);
begin
 refresh_query(FDQuery_Trailer)
end;

end.
