unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, StdCtrls, db;

type
  TForm2 = class(TForm)
    JvDBUltimGrid1: TJvDBUltimGrid;
    JvDBUltimGrid2: TJvDBUltimGrid;
    Label1: TLabel;
    Label2: TLabel;
    procedure JvDBUltimGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBUltimGrid2EditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;


implementation

{$R *.dfm}


uses globale, unit3;



procedure TForm2.JvDBUltimGrid2DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
 var
  d, v: byte;
 begin
  if column.FieldName = 'valore_byte' then
   begin
    d:=dm1.ImageList1.Width;
    v:=dm1.flussivalore_byte.AsInteger;
    if (v and 128)=128 then dm1.imagelist1.Draw(jvdbultimgrid2.Canvas, rect.Left+d*0+1, rect.Top, 0);
    if (v and 64)=64   then dm1.imagelist1.Draw(jvdbultimgrid2.Canvas, rect.Left+d*1+1, rect.Top, 0);
    if (v and 32)=32   then dm1.imagelist1.Draw(jvdbultimgrid2.Canvas, rect.Left+d*2+1, rect.Top, 0);
    if (v and 16)=16   then dm1.imagelist1.Draw(jvdbultimgrid2.Canvas, rect.Left+d*3+1, rect.Top, 0);
    if (v and 8)=8     then dm1.imagelist1.Draw(jvdbultimgrid2.Canvas, rect.Left+d*4+1, rect.Top, 0);
    if (v and 4)=4     then dm1.imagelist1.Draw(jvdbultimgrid2.Canvas, rect.Left+d*5+1, rect.Top, 0);
    if (v and 2)=2     then dm1.imagelist1.Draw(jvdbultimgrid2.Canvas, rect.Left+d*6+1, rect.Top, 0);
    if (v and 1)=1     then dm1.imagelist1.Draw(jvdbultimgrid2.Canvas, rect.Left+d*7+1, rect.Top, 0);
   end;
 end;



procedure TForm2.JvDBUltimGrid2EditButtonClick(Sender: TObject);
 var
  v: byte;
 begin
  if jvdbultimgrid2.SelectedField.FieldName = 'valore_byte' then
   begin
    v:=dm1.flussivalore_byte.AsInteger;
    form3.StringGrid1.Rows[1].Clear;
    if (v and 128)=128 then form3.StringGrid1.Cells[0,1]:='128';
    if (v and 64)=64   then form3.StringGrid1.Cells[1,1]:='64';
    if (v and 32)=32   then form3.StringGrid1.Cells[2,1]:='32';
    if (v and 16)=16   then form3.StringGrid1.Cells[3,1]:='16';
    if (v and 8)=8     then form3.StringGrid1.Cells[4,1]:='8';
    if (v and 4)=4     then form3.StringGrid1.Cells[5,1]:='4';
    if (v and 2)=2     then form3.StringGrid1.Cells[6,1]:='2';
    if (v and 1)=1     then form3.StringGrid1.Cells[7,1]:='1';
    form3.label1.Caption:=inttostr(v);
    if form3.ShowModal = mrOk then
     begin
      v:=strtoint(form3.Label1.Caption);
      dm1.flussi.Edit;
      dm1.flussivalore_byte.AsInteger:=v;
      dm1.flussi.Post;
     end;
   end;
 end;

end.
