program test245;

uses
  Forms,
  D2XXUnit in 'D2XXUnit.pas',
  globale in 'globale.pas' {dm1: TDataModule},
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
