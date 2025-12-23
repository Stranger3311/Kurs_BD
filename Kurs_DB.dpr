program Kurs_DB;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form1},
  DataModule in 'DataModule.pas' {DataModule2: TDataModule},
  directory_unit in 'directory_unit.pas' {DirectoryForm},
  Dispatch_Unit in 'Dispatch_Unit.pas' {Form_Dispatch},
  Unit2 in 'Unit2.pas' {Form2},
  YaDisk in 'YaDisk.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TDirectoryForm, DirectoryForm);
  Application.CreateForm(TForm_Dispatch, Form_Dispatch);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
