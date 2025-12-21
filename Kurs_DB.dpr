program Kurs_DB;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form1},
  DataModule in 'DataModule.pas' {DataModule2: TDataModule},
  directory_unit in 'directory_unit.pas' {DirectoryForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TDirectoryForm, DirectoryForm);
  Application.Run;
end.
