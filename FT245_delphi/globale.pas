unit globale;

interface

uses
  SysUtils, Classes, Forms, DB, ABSMain, ImgList, Controls, JvTimer;

type
  Tdm1 = class(TDataModule)
    ABSDatabase1: TABSDatabase;
    programmi: TABSTable;
    dsProgrammi: TDataSource;
    flussi: TABSTable;
    dsFlussi: TDataSource;
    programmiprogrammaID: TAutoIncField;
    programmiprogramma: TStringField;
    programmiripetizione: TIntegerField;
    programmiritardo_ms: TIntegerField;
    flussiprogrammaID: TIntegerField;
    flussipos_record: TFloatField;
    flussipos_dummy: TFloatField;
    flussivalore_byte: TIntegerField;
    ImageList1: TImageList;
    ImageList2: TImageList;

    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure flussiAfterScroll(DataSet: TDataSet);
    procedure flussiAfterPost(DataSet: TDataSet);
    procedure flussiNewRecord(DataSet: TDataSet);
    procedure programmiBeforeDelete(DataSet: TDataSet);
    procedure dsFlussiUpdateData(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm1: Tdm1;
  progressivo: single;
  devo_rinumerare: boolean;

implementation

{$R *.dfm}

procedure Tdm1.DataModuleCreate(Sender: TObject);
 begin
  absdatabase1.DatabaseFileName:=extractfilepath(application.ExeName)+'db_programmi.abs';
  absdatabase1.Open;
  programmi.Open;
  flussi.Open;
  programmi.First;
 end;

procedure Tdm1.DataModuleDestroy(Sender: TObject);
 begin
  absdatabase1.Close;
 end;



procedure Tdm1.dsFlussiUpdateData(Sender: TObject);
 begin
  if (flussivalore_byte.AsInteger > 255) then flussivalore_byte.AsInteger:=flussivalore_byte.AsInteger mod 255;
 end;

procedure Tdm1.flussiAfterPost(DataSet: TDataSet);
 var
  progr: single;
  bm: TBookmark;
 begin
  if devo_rinumerare then
   begin
    devo_rinumerare:=false;
    bm:=dm1.flussi.GetBookmark;
    flussi.DisableControls;
    flussi.AfterPost:=nil;
    flussi.afterScroll:=nil;
    // premessa:  NON posso rinumerare un campo indicizzato. quindi:
    //------ rinumero il campo pos_dummy mentre l'indice attivo e' su pos_record
    progr:=1;
    flussi.First;
    while not flussi.Eof do
     begin
      flussi.Edit;
      flussipos_dummy.AsFloat:=progr;
      flussi.Next;
      progr:=progr + 1;
     end;
    flussi.First;
    //----- attivo l'indice su dummy
    flussi.IndexName:='ndx_due';
    //----- rinumero il campo pos_record mentre l'indice attivo e' su pos_dummy
    progr:=1;
    flussi.First;
    while not flussi.Eof do
     begin
      flussi.Edit;
      flussipos_record.AsFloat:=progr;
      flussi.Next;
      progr:=progr + 1;
     end;
    flussi.First;
    //------- attivo l'indice su pos_record
    flussi.IndexName:='ndx_uno';
    if flussi.BookmarkValid(bm) then flussi.GotoBookmark(bm);
    flussi.FreeBookmark(bm);
    flussi.afterScroll:=flussiafterscroll;
    flussi.AfterPost:=flussiafterpost;
    flussi.EnableControls;
   end;
 end;

procedure Tdm1.flussiAfterScroll(DataSet: TDataSet);
 begin
  if not FlussiPos_record.isnull then progressivo:=FlussiPos_record.Asfloat;
 end;

procedure Tdm1.flussiNewRecord(DataSet: TDataSet);
 begin
  if Flussi.Eof then
   progressivo:=progressivo + 0.5
  else
   progressivo:=progressivo - 0.5;
  Flussipos_record.AsFloat:=progressivo;
  devo_rinumerare:=true;
 end;

procedure Tdm1.programmiBeforeDelete(DataSet: TDataSet);
 begin
  flussi.First;
  while not flussi.Eof do flussi.Delete;
 end;

end.
