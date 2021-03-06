unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, FTChipID;

type
  TForm1 = class(TForm)
    lstvDevices: TListView;
    btnFindDevices: TButton;
    Label1: TLabel;
    lblDllVersion: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFindDevicesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    chipID: CFTChipID;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  Width: Integer;
  DllVer: TDllVersion;
begin
  Width := Integer(lstvDevices.Width div 5) - 2;
  lstvDevices.ViewStyle := vsReport;
  lstvDevices.Columns.Add();
  lstvDevices.Columns.Items[0].Caption := 'Number';
  lstvDevices.Columns.Items[0].Width := Width+1;
  lstvDevices.Columns.Add();
  lstvDevices.Columns.Items[1].Caption := 'Serial';
  lstvDevices.Columns.Items[1].Width := Width+1;
  lstvDevices.Columns.Add();
  lstvDevices.Columns.Items[2].Caption := 'Description';
  lstvDevices.Columns.Items[2].Width := Width+1;
  lstvDevices.Columns.Add();
  lstvDevices.Columns.Items[3].Caption := 'LocationID';
  lstvDevices.Columns.Items[3].Width := Width+1;
  lstvDevices.Columns.Add();
  lstvDevices.Columns.Items[4].Caption := 'ChipID';
  lstvDevices.Columns.Items[4].Width := Width+1;

 	chipID.GetDllVersion(@DllVer);

	lblDllVersion.Caption := String(DllVer);
end;

procedure TForm1.btnFindDevicesClick(Sender: TObject);
var
  NumDevices, LocID, myChipID, i: Longword;
  SerialNumber: TSerialNumber;
  Description: TDescription;
  ErrorMessage: TErrorMessage;
	dStatus: FTID_STATUS;
  ListItem: TListItem;
 
begin

  lstvDevices.Clear;
	dStatus := chipID.GetNumDevices(@NumDevices);

	if ((dStatus = FTID_SUCCESS) and (NumDevices <> 0)) then
  begin
    for i:=0 to NumDevices-1 do
    begin
      ListItem := lstvDevices.Items.Add;
      ListItem.Caption := IntToStr(i);

      dStatus := chipID.GetDeviceSerialNumber(i, @SerialNumber);
      if(dStatus = FTID_SUCCESS) then
        ListItem.SubItems.Add(String(SerialNumber));

      dStatus := chipID.GetDeviceDescription(i, @Description);
      if(dStatus = FTID_SUCCESS) then
        ListItem.SubItems.Add(String(Description));

      dStatus := chipID.GetDeviceLocationID(i, @LocID);
      if(dStatus = FTID_SUCCESS) then
        ListItem.SubItems.Add(IntToHex(LocID, 8));

      dStatus := chipID.GetDeviceChipID(i, @myChipID);
      if(dStatus = FTID_SUCCESS) then
        ListItem.SubItems.Add(IntToHex(myChipID, 8));

    end;
  end;

	if(dStatus <> FTID_SUCCESS) then
  begin
		chipID.GetErrorCodeString('EN', dStatus, @ErrorMessage);
		ShowMessage(String(ErrorMessage));
	end;
  
end;

end.
