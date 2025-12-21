unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG, Data.DB, FireDAC.Comp.Client,
  FireDAC.VCLUI.Login, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.UI;

type
  TDataModule2 = class(TDataModule)
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
    FDConnection1: TFDConnection;
    FDTable_City: TFDTable;
    DataSource_City: TDataSource;
    FDTable_Street: TFDTable;
    DataSource_Street: TDataSource;
    DataSource_House: TDataSource;
    FDTable_House: TFDTable;
    FDTable_Address: TFDTable;
    DataSource_Address: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
