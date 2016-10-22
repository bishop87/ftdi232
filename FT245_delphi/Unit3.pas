unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, JvExControls, JvXPCore, JvXPButtons;

type
  TForm3 = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    JvXPButton1: TJvXPButton;
    JvXPButton2: TJvXPButton;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses globale;

{$R *.dfm}



procedure TForm3.FormCreate(Sender: TObject);
 var
  f: integer;
 begin
  for f := 0 to 7 do stringgrid1.Cells[f,0]:=inttostr(7-f);
 end;

procedure TForm3.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
 begin
  if not (gdfixed in state) then
   begin
    stringgrid1.Canvas.Brush.Color:=clWhite;
    stringgrid1.Canvas.FillRect(rect);
    if (arow = 1) and (stringgrid1.Cells[acol,1] <> '') then dm1.imagelist1.Draw(stringgrid1.Canvas, rect.Left+2, rect.Top+2, 0);
   end;
 end;

procedure TForm3.StringGrid1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  v: byte;
  acol, arow: integer;
 begin
  stringgrid1.MouseToCell(x,y,acol,arow);
  if (button = mbLeft) and (arow=1) then
   begin
    v:=strtointdef(label1.Caption,0);
    if stringgrid1.Cells[acol,arow] = '' then
     begin
      case acol of
       0: stringgrid1.Cells[acol,arow]:='128';
       1: stringgrid1.Cells[acol,arow]:='64';
       2: stringgrid1.Cells[acol,arow]:='32';
       3: stringgrid1.Cells[acol,arow]:='16';
       4: stringgrid1.Cells[acol,arow]:='8';
       5: stringgrid1.Cells[acol,arow]:='4';
       6: stringgrid1.Cells[acol,arow]:='2';
       7: stringgrid1.Cells[acol,arow]:='1';
      end;
      inc(v, strtoint(stringgrid1.Cells[acol,arow]));
     end
    else
     begin
      dec(v, strtoint(stringgrid1.Cells[acol,arow]));
      stringgrid1.Cells[acol,arow]:='';
     end;
    label1.caption:=inttostr(v);
   end;
 end;

end.
