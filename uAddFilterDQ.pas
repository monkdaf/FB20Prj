unit uAddFilterDQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uMain;

type
  TfAddFilterDQ = class(TForm)
    chkMsgAV: TCheckBox;
    chkNeedMsg: TCheckBox;
    lbl7: TLabel;
    chkpriNameDB: TCheckBox;
    cbbSelDBName: TComboBox;
    chkDevice: TCheckBox;
    bApply: TBitBtn;
    bApplyAndFind: TBitBtn;
    procedure cbbSelDBNameChange(Sender: TObject);
    procedure chkMsgAVClick(Sender: TObject);
    procedure chkNeedMsgClick(Sender: TObject);
    procedure chkpriNameDBClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkDeviceClick(Sender: TObject);
    procedure bApplyClick(Sender: TObject);
    procedure bApplyAndFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// Инициализация
  procedure InitForm();

var
  fAddFilterDQ: TfAddFilterDQ;

implementation

{$R *.dfm}


//______________________________________________________________________________
// Инициализация
procedure InitForm();
var
  i:Integer;
begin
  fAddFilterDQ.chkDevice.Checked:=uMain.DqAddFilter.Device;
  fAddFilterDQ.chkNeedMsg.Checked:=uMain.DqAddFilter.NeedMsg;
  fAddFilterDQ.chkMsgAV.Checked:=uMain.DqAddFilter.MsgAV;
  fAddFilterDQ.chkpriNameDB.Checked:=uMain.DqAddFilter.priNameDB;
  fAddFilterDQ.cbbSelDBName.Items.Clear;
  for i:=0 to HMSubSystem-1 do
  begin
    fAddFilterDQ.cbbSelDBName.Items.Add(uMain.ListOfSubSystem[i+1].Name);
  end;
  fAddFilterDQ.cbbSelDBName.ItemIndex:=uMain.ItemAddFilterDQ_cbbSelDBName;
 uMain.DqAddFilter.NameDB:='"dt'+fAddFilterDQ.cbbSelDBName.Text+'"';
end;

procedure TfAddFilterDQ.cbbSelDBNameChange(Sender: TObject);
begin
  uMain.DqAddFilter.NameDB:='"dt'+fAddFilterDQ.cbbSelDBName.Text+'"';
  uMain.ItemAddFilterDQ_cbbSelDBName:=fAddFilterDQ.cbbSelDBName.ItemIndex;
end;

procedure TfAddFilterDQ.chkMsgAVClick(Sender: TObject);
begin
 uMain.DqAddFilter.MsgAV:=fAddFilterDQ.chkMsgAV.Checked;
end;

procedure TfAddFilterDQ.chkNeedMsgClick(Sender: TObject);
begin
  uMain.DqAddFilter.NeedMsg:=fAddFilterDQ.chkNeedMsg.Checked;
end;

procedure TfAddFilterDQ.chkpriNameDBClick(Sender: TObject);
begin
  uMain.DqAddFilter.priNameDB:=fAddFilterDQ.chkpriNameDB.Checked;
end;

procedure TfAddFilterDQ.FormShow(Sender: TObject);
begin
  InitForm();
end;

procedure TfAddFilterDQ.chkDeviceClick(Sender: TObject);
begin
  uMain.DqAddFilter.Device:=fAddFilterDQ.chkDevice.Checked;
end;

procedure TfAddFilterDQ.bApplyClick(Sender: TObject);
begin
  if uMain.DqAddFilter.Device or uMain.DqAddFilter.priNameDB or uMain.DqAddFilter.NeedMsg or uMain.DqAddFilter.MsgAV 
  then fMain.bvlFiltrDQ.Visible:=True
  else fMain.bvlFiltrDQ.Visible:=False;
  fAddFilterDQ.Close;
end;

procedure TfAddFilterDQ.bApplyAndFindClick(Sender: TObject);
begin
  if uMain.DqAddFilter.Device or uMain.DqAddFilter.priNameDB or uMain.DqAddFilter.NeedMsg or uMain.DqAddFilter.MsgAV 
  then fMain.bvlFiltrDQ.Visible:=True
  else fMain.bvlFiltrDQ.Visible:=False;
  fAddFilterDQ.Close;
  uMain.FindAndShowDQ();
end;

end.
