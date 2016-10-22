unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, JvExControls, JvgButton,
  JvXPCore, JvXPButtons;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    JvXPButton4: TJvXPButton;
    JvXPButton5: TJvXPButton;
    JvXPButton6: TJvXPButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    JvXPButton12: TJvXPButton;
    Label24: TLabel;
    JvXPButton13: TJvXPButton;
    Label26: TLabel;
    Label16: TLabel;
    Label25: TLabel;
    Shape1: TShape;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Chiudi_Device;
    procedure AggiornaListaDevice;
    procedure JvXPButton4Click(Sender: TObject);
    procedure JvXPButton5Click(Sender: TObject);
    procedure JvXPButton6Click(Sender: TObject);
    procedure SpeedInitLineeClick(Sender: TObject);
    procedure JvXPButton12Click(Sender: TObject);
    procedure JvXPButton13Click(Sender: TObject);
    procedure SettaGlyphLED(bottone: TSpeedButton);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  device_aperto, bit_bang_inizializzato: boolean;
  Selected_Device_Serial_Number : ansiString;
  Selected_Device_Description : ansiString;

implementation

uses D2XXUnit, globale, unit4;

{$R *.dfm}



procedure TForm1.FormCreate(Sender: TObject);
 begin
  AggiornaListaDevice;
 end;

//----------- crea/aggiorna la lista dei device -------------------
procedure TForm1.AggiornaListaDevice;
 var
  i: Integer;
  DeviceIndex : DWord;
  lv : TListItem;
 begin
  Selected_Device_Serial_Number:='';
  Selected_Device_Description:='';
  bit_bang_inizializzato:=false;
  device_aperto:=false;
  jvxpbutton4.Enabled:=false;
  jvxpbutton5.Enabled:=false;
  JvxpButton6.Enabled:=false;
  jvxpbutton12.Enabled:=false;
  jvxpbutton13.Enabled:=false;

  FT_Enable_Error_Report := true; // Error reporting = on
  GetFTDeviceCount;
  DeviceIndex := 0;
  if FT_Device_Count > 0 then
   begin
    ListView1.Items.clear;
    for i:=1 to FT_Device_Count do
     begin
      lv:=ListView1.Items.Add;
      lv.Caption:='Device '+IntToStr(i);
      GetFTDeviceSerialNo(DeviceIndex);
      lv.SubItems.Add(FT_Device_String);
      GetFTDeviceDescription (DeviceIndex);
      lv.SubItems.Add(FT_Device_String);
      lv.ImageIndex:=1;
      inc(DeviceIndex);
     end;
   end;
 end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
 begin
  Chiudi_Device;
 end;

//-------------click su listview = scelta di un device ---------------
procedure TForm1.ListView1Click(Sender: TObject);
 var
  lv: TListItem;
 begin
  lv:=ListView1.selected;
  if (lv <> nil) then
   begin
    jvxpbutton4.enabled:=True;
    Selected_Device_Serial_Number:=lv.SubItems[0];
    Selected_Device_Description:=lv.SubItems[1];
   end
  else
   jvxpbutton4.enabled:=false;
 end;

//---------------- chiusura device -------------------
procedure TForm1.BitBtn1Click(Sender: TObject);
 begin
  D2XXUnit.
 end;

procedure TForm1.Chiudi_Device;
 begin
  if device_aperto then Close_USB_Device;
 end;

//------------- apre device -------------------
procedure TForm1.JvXPButton4Click(Sender: TObject);
 begin
  if Open_USB_Device_By_Serial_Number(Selected_Device_Serial_Number) = FT_OK then
   begin
    Reset_USB_Device;
    Purge_USB_Device_Out;
    Purge_USB_Device_In;
    device_aperto:=true;
    jvxpbutton4.Enabled:=false;
    jvxpbutton5.Enabled:=true;
    jvxpbutton6.Enabled:=true;
    jvxpbutton12.Enabled:=true;
   end;
 end;
//------------- chiude device -------------------
procedure TForm1.JvXPButton5Click(Sender: TObject);
 begin
  Chiudi_Device;
  bit_bang_inizializzato:=false;
  device_aperto:=false;
  jvxpbutton4.Enabled:=false;
  jvxpbutton5.Enabled:=false;
  jvXPButton6.Enabled:=false;
  jvxpbutton12.Enabled:=false;
  jvxpbutton13.Enabled:=false;
 end;

//------------- refresh lista device -------------------
procedure TForm1.JvXPButton6Click(Sender: TObject);
 begin
  Chiudi_Device;
  AggiornaListaDevice;
 end;

//------------ collettore click su speedbutton per inizializzazione linee in/out ----------------------
procedure TForm1.SpeedInitLineeClick(Sender: TObject);
 begin
  jvxpbutton13.Enabled:=false;
  if speedbutton16.Down then speedbutton16.Caption:='IN' else speedbutton16.Caption:='OUT';
  if speedbutton15.Down then speedbutton15.Caption:='IN' else speedbutton15.Caption:='OUT';
  if speedbutton14.Down then speedbutton14.Caption:='IN' else speedbutton14.Caption:='OUT';
  if speedbutton13.Down then speedbutton13.Caption:='IN' else speedbutton13.Caption:='OUT';
  if speedbutton12.Down then speedbutton12.Caption:='IN' else speedbutton12.Caption:='OUT';
  if speedbutton11.Down then speedbutton11.Caption:='IN' else speedbutton11.Caption:='OUT';
  if speedbutton10.Down then speedbutton10.Caption:='IN' else speedbutton10.Caption:='OUT';
  if speedbutton9.Down then speedbutton9.Caption:='IN'else speedbutton9.Caption:='OUT';
  if (sender as tspeedbutton).Down then
   label24.tag:=label24.tag - (sender as tspeedbutton).Tag
  else
   label24.tag:=label24.tag + (sender as tspeedbutton).Tag;

  label24.Caption:=inttostr(label24.tag);
 end;

(*---------- inizializza il bit_bang_mode -------------
 Set_USB_Device_BitMode(mask, enable)

 1° parametro (mask) = bit a 1=output  0=input   es: con 255 si impostano tutte le 8 linee come output
 2° parametro = 0 = Reset
                1 = Asynchronous Bit Bang
                2 = MPSSE (FT2232, FT2232H, FT4232H and FT232H devices only)
                4 = Synchronous Bit Bang (FT232R, FT245R, FT2232, FT2232H, FT4232H and FT232H devices only)
                8 = MCU Host Bus Emulation Mode (FT2232, FT2232H, FT4232H and FT232H devices only)
               16 = Fast Opto-Isolated Serial Mode (FT2232, FT2232H, FT4232H and FT232H devices only)
               32 = CBUS Bit Bang Mode (FT232R and FT232H devices only)
               64 = Single Channel Synchronous 245 FIFO Mode (FT2232H and FT232H devices only)   *)
procedure TForm1.JvXPButton12Click(Sender: TObject);
 begin
  if bit_bang_inizializzato then //...reset bitbang mode
   begin
    //SpegniTuttiLED;
    Set_USB_Device_BitMode(255, 0); //---reset bitbang mode
    Purge_USB_Device_Out;
    Purge_USB_Device_In;
    Reset_USB_Device;
    bit_bang_inizializzato:=false;
   end;
  sleep(200);
  bit_bang_inizializzato:=Set_USB_Device_BitMode(label24.Tag, 4) = FT_OK;
  jvxpbutton13.Enabled:=bit_bang_inizializzato;
 end;



procedure TForm1.SettaGlyphLED(bottone: TSpeedButton);
 var
  bmp: TBitmap;
  imx: integer;
 begin
  if bottone.Enabled then imx:=0 else imx:=1;
  bmp:=Tbitmap.Create;
  bmp.Width:=dm1.ImageList2.Width;
  bmp.Height:=dm1.ImageList2.Height;
  bmp.Canvas.Brush.Color:=clWhite;
  bmp.Canvas.FillRect(bmp.Canvas.ClipRect);
  try
   dm1.ImageList2.Draw(bmp.Canvas,0,0,imx);
   bottone.Glyph.Assign(bmp);
   case imx of
    0: bottone.Caption:='OUT';
    1: bottone.Caption:='IN';
   end;
  finally
   bmp.Free;
  end;
 end;


procedure TForm1.JvXPButton13Click(Sender: TObject);
 begin
  form4.SpeedButton8.Enabled:=not speedbutton16.Down;
  form4.SpeedButton7.Enabled:=not speedbutton15.Down;
  form4.SpeedButton6.Enabled:=not speedbutton14.Down;
  form4.SpeedButton5.Enabled:=not speedbutton13.Down;
  form4.SpeedButton4.Enabled:=not speedbutton12.Down;
  form4.SpeedButton3.Enabled:=not speedbutton11.Down;
  form4.SpeedButton2.Enabled:=not speedbutton10.Down;
  form4.SpeedButton1.Enabled:=not speedbutton9.Down;
  SettaGlyphLED(form4.SpeedButton8);
  SettaGlyphLED(form4.SpeedButton7);
  SettaGlyphLED(form4.SpeedButton6);
  SettaGlyphLED(form4.SpeedButton5);
  SettaGlyphLED(form4.SpeedButton4);
  SettaGlyphLED(form4.SpeedButton3);
  SettaGlyphLED(form4.SpeedButton2);
  SettaGlyphLED(form4.SpeedButton1);

  form4.JvXPCheckbox2.Checked:=false;
  form4.label1.Caption:='';
  form4.Label1.Tag:=not label24.Tag;
  form4.ShowModal;
 end;


end.
