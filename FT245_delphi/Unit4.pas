unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvXPCheckCtrls, StdCtrls, Buttons, DBCtrls, JvExControls, JvXPCore,
  JvXPButtons, ComCtrls, JvTimer, math, JvComponentBase;

type
  TForm4 = class(TForm)
    JvTimer1: TJvTimer;
    JvTimer2: TJvTimer;
    JvTimer3: TJvTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label1: TLabel;
    JvXPButton7: TJvXPButton;
    JvXPButton8: TJvXPButton;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    Label10: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    JvXPButton2: TJvXPButton;
    JvXPButton3: TJvXPButton;
    JvXPButton1: TJvXPButton;
    JvXPButton9: TJvXPButton;
    TabSheet3: TTabSheet;
    Label13: TLabel;
    Label15: TLabel;
    JvXPButton10: TJvXPButton;
    JvXPButton11: TJvXPButton;
    Edit1: TEdit;
    JvXPCheckbox1: TJvXPCheckbox;
    JvXPButton4: TJvXPButton;
    Label12: TLabel;
    JvXPCheckbox2: TJvXPCheckbox;
    Label26: TLabel;
    Label16: TLabel;
    procedure SpeedButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function InviaByte(dato: byte): boolean;
    procedure JvXPButton7Click(Sender: TObject);
    procedure JvXPButton8Click(Sender: TObject);
    procedure SpegniTuttiLED;
    procedure JvXPButton2Click(Sender: TObject);
    procedure JvXPButton3Click(Sender: TObject);
    procedure JvXPButton1Click(Sender: TObject);
    procedure JvXPButton9Click(Sender: TObject);
    procedure JvTimer1Timer(Sender: TObject);
    procedure JvTimer2Timer(Sender: TObject);
    procedure JvXPButton10Click(Sender: TObject);
    procedure JvXPButton11Click(Sender: TObject);
    procedure JvXPCheckbox2Click(Sender: TObject);
    procedure SettaGlyphLED2(bottone: TSpeedButton; valore: byte);
    procedure JvTimer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  ripetizione: integer;

implementation


{$R *.dfm}

uses D2XXUnit, globale, unit2;


procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  jvtimer1.Enabled:=false;
  jvtimer2.Enabled:=false;
  jvtimer3.Enabled:=false;
 end;


//------------ invia 1 byte al device ------------------
//     restituisce: true=ha spedito i byte,  false=0 byte spediti;
function TForm4.InviaByte(dato: byte): boolean;
 begin
  FT_Out_Buffer[0]:=dato;       //-----mette nel buffer 1 solo byte
  result:=Write_USB_Device_Buffer(1) <> 0;   //-----invia il buffer al device
 end;



//=============== GESTIONE ACCENSIONE/SPEGNIMENTO SINGOLE LINEE ====================
//-----------accende tutte le linee / led-------------
procedure TForm4.JvXPButton7Click(Sender: TObject);
 var
  a: byte;
 begin
  //label1.Tag:=255;
  //label1.Caption:=inttostr(label1.tag);
  //if InviaByte(label1.Tag) then
  // begin
    a:=0;
    if speedbutton1.enabled then begin a:=1;  speedbutton1.down:=true; end;
    if speedbutton2.enabled then begin inc(a,2); speedbutton2.down:=true; end;
    if speedbutton3.enabled then begin inc(a,4); speedbutton3.down:=true; end;
    if speedbutton4.enabled then begin inc(a,8); speedbutton4.down:=true; end;
    if speedbutton5.enabled then begin inc(a,16); speedbutton5.down:=true; end;
    if speedbutton6.enabled then begin inc(a,32); speedbutton6.down:=true; end;
    if speedbutton7.enabled then begin inc(a,64); speedbutton7.down:=true; end;
    if speedbutton8.enabled then begin inc(a,128); speedbutton8.down:=true; end;
    InviaByte(a);
    label1.Tag:=a;
    label1.Caption:=inttostr(label1.tag);
  //end;
 end;


//--------- spegne tutte le linee / led e reset device -------------
procedure TForm4.JvXPButton8Click(Sender: TObject);
 begin
  SpegniTuttiLED;
 end;

procedure TForm4.SpegniTuttiLED;
 begin
  //label1.Tag:=0;
  //if InviaByte(label1.Tag) then
  // begin
    label1.Tag:=255;
    if speedbutton1.enabled then begin label1.Tag:=label1.Tag - 1; speedbutton1.Down:=false; end;
    if speedbutton2.enabled then begin label1.Tag:=label1.Tag - 2; speedbutton2.Down:=false; end;
    if speedbutton3.enabled then begin label1.Tag:=label1.Tag - 4; speedbutton3.Down:=false; end;
    if speedbutton4.enabled then begin label1.Tag:=label1.Tag - 8; speedbutton4.Down:=false; end;
    if speedbutton5.enabled then begin label1.Tag:=label1.Tag - 16; speedbutton5.Down:=false; end;
    if speedbutton6.enabled then begin label1.Tag:=label1.Tag - 32; speedbutton6.Down:=false; end;
    if speedbutton7.enabled then begin label1.Tag:=label1.Tag - 64; speedbutton7.Down:=false; end;
    if speedbutton8.enabled then begin label1.Tag:=label1.Tag - 128; speedbutton8.Down:=false; end;
    InviaByte(label1.Tag);
    label1.Caption:=inttostr(label1.tag);
    //Reset_USB_Device;
   //end;
 end;

//----------- collettore dei click sulle linee / led ---------------
procedure TForm4.SpeedButtonClick(Sender: TObject);
 begin
  if (sender as tspeedbutton).Down then
   label1.tag:=label1.tag + (sender as tspeedbutton).tag
  else
   label1.tag:=label1.tag - (sender as tspeedbutton).tag;

  //label1.Caption:=inttostr(label1.tag);
  InviaByte(label1.Tag);
 end;


//========== GESTIONE PROGRAMMI ==============================
procedure TForm4.JvXPButton1Click(Sender: TObject);
 begin
  form2.ShowModal;
 end;
//--------- avvia programma ---------------
procedure TForm4.JvXPButton2Click(Sender: TObject);
 begin
  jvtimer1.enabled:=false;
  JvTimer1.Interval:=dm1.programmiritardo_ms.AsInteger;
  dm1.flussi.First;
  ripetizione:=dm1.programmiripetizione.AsInteger;
  label10.Caption:=inttostr(ripetizione);
  jvtimer1.enabled:=true;
 end;
//-------- ferma programma --------------
procedure TForm4.JvXPButton3Click(Sender: TObject);
 begin
  jvtimer1.Enabled:=false;
 end;

//------- esecuzione programma (legge da tabella flussi i byte e li invia al device) ------------
procedure TForm4.JvTimer1Timer(Sender: TObject);
 begin
  InviaByte(dm1.flussivalore_byte.AsInteger);
  dm1.flussi.Next;
  if dm1.flussi.Eof then
   begin
    dm1.flussi.First;
    dec(ripetizione);
    label10.Caption:=inttostr(ripetizione);
   end;
  jvtimer1.Enabled:=(ripetizione > 0);
 end;
//----------- avvia/ferma albero di natale ---------------
procedure TForm4.JvXPButton9Click(Sender: TObject);
 begin
  jvxpbutton9.Down:=not jvxpbutton9.Down;
  if jvxpbutton9.Down then
   begin
    jvxpbutton9.Caption:='Ferma "albero natale"';
    randomize;
    jvtimer2.Enabled:=true;
   end
  else
   begin
    jvxpbutton9.Caption:='Avvia "albero natale"';
    jvtimer2.Enabled:=false;
   end;
 end;
//--------esecuzione albero di natale (accensione casuale led) ---------------------
procedure TForm4.JvTimer2Timer(Sender: TObject);
 begin
  label1.Tag:=randomrange(0,255);
  if InviaByte(label1.Tag) then
   begin
    speedbutton8.Down:=(label1.Tag and 128)=128;
    speedbutton7.Down:=(label1.Tag and 64)=64;
    speedbutton6.Down:=(label1.Tag and 32)=32;
    speedbutton5.Down:=(label1.Tag and 16)=16;
    speedbutton4.Down:=(label1.Tag and 8)=8;
    speedbutton3.Down:=(label1.Tag and 4)=4;
    speedbutton2.Down:=(label1.Tag and 2)=2;
    speedbutton1.Down:=(label1.Tag and 1)=1;
   end;
 end;



//======================== lettura device ========================================
procedure TForm4.JvTimer3Timer(Sender: TObject);
 var
  valore, data: byte;
  i: integer;
 begin
  if Get_USB_Device_BitMode(data) = FT_OK then
   begin
    valore:=(label1.Tag and data);
    label1.Caption:=inttostr(data);
    if (not(speedbutton1.Enabled)) then SettaGlyphLED2(speedbutton1, valore);
    if (not(speedbutton2.Enabled)) then SettaGlyphLED2(speedbutton2, valore);
    if (not(speedbutton3.Enabled)) then SettaGlyphLED2(speedbutton3, valore);
    if (not(speedbutton4.Enabled)) then SettaGlyphLED2(speedbutton4, valore);
    if (not(speedbutton5.Enabled)) then SettaGlyphLED2(speedbutton5, valore);
    if (not(speedbutton6.Enabled)) then SettaGlyphLED2(speedbutton6, valore);
    if (not(speedbutton7.Enabled)) then SettaGlyphLED2(speedbutton7, valore);
    if (not(speedbutton8.Enabled)) then SettaGlyphLED2(speedbutton8, valore);
  end;
 end;

procedure TForm4.SettaGlyphLED2(bottone: TSpeedButton; valore: byte);
 var
  bmp: TBitmap;
  imx: integer;
 begin
  if ((valore and bottone.Tag) = bottone.tag) then imx:=1 else imx:=2;
  bmp:=Tbitmap.Create;
  bmp.Width:=64; //dm1.ImageList2.Width;
  bmp.Height:=16; //dm1.ImageList2.Height;
  bmp.Canvas.Brush.Color:=clWhite;
  bmp.Canvas.FillRect(bmp.Canvas.ClipRect);
  try
   dm1.ImageList2.Draw(bmp.Canvas,0,0,imx);
   bottone.Glyph.Assign(bmp);
  finally
   bmp.Free;
  end;
 end;


procedure TForm4.JvXPCheckbox2Click(Sender: TObject);
 begin
  JvTimer3.Enabled:=JvXPCheckbox2.Checked;
 end;





//========================= lettura/scrittura EEPROM ===========================
//-----------legge EEPROM-----------------
procedure TForm4.JvXPButton10Click(Sender: TObject);
 var
  i: integer;
  s: ansistring;
 begin
  FT_UA_Size:=0;
  if USB_FT_EE_UASize = FT_OK then
   begin
    label13.Caption:=' Max char: '+inttostr(FT_UA_Size);
    if USB_FT_EE_UARead = FT_OK then
     begin
      s:='';
      for i:=0 to FT_UA_Size-1 do s:=s+chr(userdata[i]);
      edit1.Text:=s;
     end;
   end;
 end;
//-----------scrive EEPROM-----------------
procedure TForm4.JvXPButton11Click(Sender: TObject);
 var
  i: integer;
  s: Ansistring;
 begin
  FT_UA_Size:=0;
  if USB_FT_EE_UASize = FT_OK then
   begin
    label13.Caption:=' Max char: '+inttostr(FT_UA_Size);
    s:=copy(edit1.text, 1, FT_UA_Size);
    if length(s) <> 0 then
     begin
      if JvXPCheckbox1.Checked then for i:=0 to FT_UA_Size-1 do userdata[i]:=0;
      for i:=1 to length(s) do userdata[i-1]:=ord(s[i]);
      USB_FT_EE_UAWrite;
     end
    else
     showmessage('Nessuna stringa da scrivere');
   end;
 end;

end.
