unit directory_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Tabs, Vcl.DockTabSet, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.DBCGrids;

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
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid3: TDBGrid;
    DBNavigator4: TDBNavigator;
    DBGrid4: TDBGrid;
    TabSheet5: TTabSheet;
    Прицеп: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    procedure DBGrid3CellClick(Column: TColumn);
    procedure TabSheet3Show(Sender: TObject);
    procedure DBNavigator3Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  DirectoryForm: TDirectoryForm;

implementation

{$R *.dfm}

uses DataModule;

procedure TDirectoryForm.DBGrid3CellClick(Column: TColumn);
var lv_address_id: Variant;
    col,row: integer;
begin
 //col := dbGrid3.SelectedIndex;
 //row := dbGrid3.DataSource.DataSet.RecNo;
 lv_address_id := FDQuery1.Fields[0].Value;

 DataModule2.FDTable_Address.Locate('id',lv_address_id)
end;

procedure TDirectoryForm.DBNavigator3Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  FDQuery1.Active := false;
  FDQuery1.Active := true;
end;

procedure TDirectoryForm.FormShow(Sender: TObject);
begin
PageControl1.ActivePageIndex := 0
end;

procedure TDirectoryForm.TabSheet3Show(Sender: TObject);
begin
  FDQuery1.Active := false;
  FDQuery1.Active := true;
end;

end.
