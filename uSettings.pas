unit uSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Buttons;

type
  TfSetting = class(TForm)
    bvl1: TBevel;
    cbbHMSubSystem: TComboBox;
    sgSubSystem: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    chkNeedExtraData: TCheckBox;
    chkNeedMsgDev: TCheckBox;
    eNumDB: TEdit;
    Label3: TLabel;
    bClose: TBitBtn;
    bLoadSt: TButton;
    bSaveSt: TButton;
    Bevel1: TBevel;
    lbl1: TLabel;
    bvl2: TBevel;
    eTemplCP: TEdit;
    lbl2: TLabel;
    eTemplDP: TEdit;
    eTemplAV: TEdit;
    eTemplHeat: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    bvl3: TBevel;
    lbl6: TLabel;
    lbl7: TLabel;
    eSpare: TEdit;
    lbl8: TLabel;
    chkNeedAutoModeUF: TCheckBox;
    chkNeedAutoModeRO: TCheckBox;
    chkNeedAutoModeEDI: TCheckBox;
    lbl9: TLabel;
    eTemplQF: TEdit;
    bFindSubSysem: TButton;
    lblRemSpareUp: TLabel;
    lblRemSpare: TLabel;
    eTemplUF: TEdit;
    lbl10: TLabel;
    eTemplRO: TEdit;
    lbl11: TLabel;
    eTemplEDI: TEdit;
    lbl12: TLabel;
    chkOB32IsPresent: TCheckBox;
    chkNeedLAD: TCheckBox;
    chkNeedWinCCObj: TCheckBox;
    lbl13: TLabel;
    eNameS7P: TEdit;
    bOpenWinCC: TButton;
    Label19: TLabel;
    eSepWinCC: TEdit;
    lblTypeDev: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    procedure cbbHMSubSystemChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkNeedExtraDataClick(Sender: TObject);
    procedure chkNeedMsgDevClick(Sender: TObject);
    procedure bSaveStClick(Sender: TObject);
    procedure bLoadStClick(Sender: TObject);
    procedure eTemplCPExit(Sender: TObject);
    procedure eTemplDPExit(Sender: TObject);
    procedure eTemplAVExit(Sender: TObject);
    procedure eTemplHeatExit(Sender: TObject);
    procedure eSpareExit(Sender: TObject);
    procedure chkNeedAutoModeUFClick(Sender: TObject);
    procedure chkNeedAutoModeROClick(Sender: TObject);
    procedure chkNeedAutoModeEDIClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eTemplQFExit(Sender: TObject);
    procedure bFindSubSysemClick(Sender: TObject);
    procedure sgSubSystemSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgSubSystemGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure eTemplUFExit(Sender: TObject);
    procedure eTemplROExit(Sender: TObject);
    procedure eTemplEDIExit(Sender: TObject);
    procedure chkOB32IsPresentClick(Sender: TObject);
    procedure chkNeedLADClick(Sender: TObject);
    procedure eNameS7PExit(Sender: TObject);
    procedure chkNeedWinCCObjClick(Sender: TObject);
    procedure bOpenWinCCClick(Sender: TObject);
    procedure eSepWinCCChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
// (Пере-)инициализация списка подсистем
  procedure InitStringGrid();
  procedure ShowGridSubSystem();
// Обновление данных на форме настроек
  procedure UpDateFormSettings();
// Формируем надпись о зарезервированых номерах FB, FC, DB
  procedure ShowRemSpare(NumSubSyst:Integer);
// Формируем надпись о зарезервированых номерах FB, FC, DB
  procedure SaveListOfSubSystem();
var
  fSetting: TfSetting;
implementation

uses uMain;
{$R *.dfm}

procedure TfSetting.cbbHMSubSystemChange(Sender: TObject);
var
  i:Integer;
begin
  for i:=1 to HMSubSystem do
  begin
    ListOfSubSystem[i].Name:=sgSubSystem.Cells[1,i];
    ListOfSubSystem[i].Addr:=StrToInt(sgSubSystem.Cells[2,i]);
    ListOfSubSystem[i].Rem:=sgSubSystem.Cells[3,i];
    ListOfSubSystem[i].NumOfDev:=StrToInt(sgSubSystem.Cells[4,i]);
    fMain.cbbSelDBName.Items.Add(ListOfSubSystem[i].Name);
  end;

  HMSubSystem:=cbbHMSubSystem.ItemIndex+1;
//  fMain.eTemp.Text:=IntToStr(HMSubSystem);
  InitStringGrid();
  ShowGridSubSystem();
end;
//_______________________________________________________
// (Пере-)инициализация списка подсистем
procedure InitStringGrid();
var
  i:Integer;
begin
  with fSetting do begin
    sgSubSystem.RowCount:=uMain.HMSubSystem+1;
    sgSubSystem.ColWidths[0] :=20;
    sgSubSystem.Cells[0,0]:='№';
    sgSubSystem.Cells[1,0]:='Символьное имя';
    sgSubSystem.ColWidths[1] :=160;
    sgSubSystem.Cells[2,0]:='Адрес';
    sgSubSystem.ColWidths[2] :=60;
    sgSubSystem.Cells[3,0]:='Коментарий';
    sgSubSystem.ColWidths[3] :=500;
    sgSubSystem.Cells[4,0]:='Машин';
    sgSubSystem.ColWidths[4] :=40;
    sgSubSystem.Cells[5,0]:='Принадл.';
    sgSubSystem.ColWidths[5] :=50;
    for i:=1 to uMain.HMSubSystem do sgSubSystem.Cells[0,i]:=IntToStr(i);
  end;

end;

//_______________________________________________________
procedure ShowGridSubSystem();
var
  i:Integer;
begin
  with fSetting do begin
    for i:=1 to uMain.HMSubSystem do
    begin
      sgSubSystem.Cells[1,i]:=ListOfSubSystem[i].Name;
      sgSubSystem.Cells[2,i]:=IntToStr(ListOfSubSystem[i].Addr);
      sgSubSystem.Cells[3,i]:=ListOfSubSystem[i].Rem;
      sgSubSystem.Cells[4,i]:=IntToStr(ListOfSubSystem[i].NumOfDev);
      case ListOfSubSystem[i].MemberOfSystem of
        0: sgSubSystem.Cells[5,i]:='---';
        1: sgSubSystem.Cells[5,i]:='UF';
        2: sgSubSystem.Cells[5,i]:='RO';
        3: sgSubSystem.Cells[5,i]:='EDI';
      else sgSubSystem.Cells[5,i]:='нет';
      end;
    end;
  end;
end;

procedure TfSetting.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i:integer;
begin
  fMain.cbbSelDBName.Items.Clear;
  for i:=1 to HMSubSystem do
  begin
    ListOfSubSystem[i].Name:=sgSubSystem.Cells[1,i];
    ListOfSubSystem[i].Addr:=StrToInt(sgSubSystem.Cells[2,i]);
    ListOfSubSystem[i].Rem:=sgSubSystem.Cells[3,i];
    ListOfSubSystem[i].NumOfDev:=StrToInt(sgSubSystem.Cells[4,i]);
//    ListOfSubSystem[i].MemberOfSystem:=sgSubSystem.Cells[5,i];
    fMain.cbbSelDBName.Items.Add(ListOfSubSystem[i].Name);
  end;
  fMain.cbbSelDBName.ItemIndex:=0;
  CurrNameDB:=fMain.cbbSelDBName.Text;
  NumDB:=StrToInt(eNumDB.Text);
  FindSubSysem;
end;

procedure TfSetting.chkNeedExtraDataClick(Sender: TObject);
begin
  NeedExtraData:=chkNeedExtraData.Checked;
  if NeedExtraData then chkNeedAutoModeUF.Enabled:=True else chkNeedAutoModeUF.Enabled:=False;
  if NeedExtraData then chkNeedAutoModeRO.Enabled:=True else chkNeedAutoModeRO.Enabled:=False;
  if NeedExtraData then chkNeedAutoModeEDI.Enabled:=True else chkNeedAutoModeEDI.Enabled:=False;
end;

procedure TfSetting.chkNeedMsgDevClick(Sender: TObject);
begin
  NeedMsgDev:=chkNeedMsgDev.Checked;
end;

procedure TfSetting.bSaveStClick(Sender: TObject);
begin
  uMain.SaveSettings;
end;

procedure TfSetting.bLoadStClick(Sender: TObject);
begin
  uMain.LoadSettings;
end;

//_______________________________________________________
// Обновление данных на форме настроек
procedure UpDateFormSettings();
begin
// Количество и содержание подсистем
  fSetting.cbbHMSubSystem.ItemIndex:=uMain.HMSubSystem-1;
  InitStringGrid();
  ShowGridSubSystem();
// Остальное
  fSetting.chkNeedMsgDev.Checked:=uMain.NeedMsgDev;
  fSetting.chkNeedExtraData.Checked:=uMain.NeedExtraData;
  fSetting.eNumDB.Text:=IntToStr(uMain.NumDB);
  fSetting.eTemplCP.Text:=uMain.TemplCP;
  fSetting.eTemplDP.Text:=uMain.TemplDP;
  fSetting.eTemplAV.Text:=uMain.TemplAV;
  fSetting.eTemplHeat.Text:=uMain.TemplHeat;
  fSetting.eSpare.Text:=uMain.Spare;
  fSetting.chkNeedAutoModeUF.Checked:=uMain.NeedAutoModeUF;
  fSetting.chkNeedAutoModeRO.Checked:=uMain.NeedAutoModeRO;
  fSetting.chkNeedAutoModeEDI.Checked:=uMain.NeedAutoModeEDI;
  fSetting.eTemplQF.Text:=uMain.TemplQF;
  fSetting.eTemplUF.Text:=uMain.TemplUF;
  fSetting.eTemplRO.Text:=uMain.TemplRO;
  fSetting.eTemplEDI.Text:=uMain.TemplEDI;
  fSetting.chkOB32IsPresent.Checked:=OB32IsPresent;
  fSetting.chkNeedLAD.Checked:=uMain.NeedLAD;
  fSetting.eNameS7P.Text:=uMain.NameS7P;
  fSetting.chkNeedWinCCObj.Checked:=NeedWinCCObj;
  fSetting.eNameS7P.Text:=uMain.NameS7P;
  fSetting.eSepWinCC.Text:=uMain.SepWinCC;
end;

procedure TfSetting.eTemplCPExit(Sender: TObject);
begin
  uMain.TemplCP:=eTemplCP.Text;
end;

procedure TfSetting.eTemplDPExit(Sender: TObject);
begin
  uMain.TemplDP:=eTemplDP.Text;
end;

procedure TfSetting.eTemplAVExit(Sender: TObject);
begin
  uMain.TemplAV:=eTemplAV.Text;
end;

procedure TfSetting.eTemplHeatExit(Sender: TObject);
begin
  uMain.TemplHeat:=eTemplHeat.Text;
end;

procedure TfSetting.eSpareExit(Sender: TObject);
begin
  uMain.Spare:=eSpare.Text;
end;

procedure TfSetting.chkNeedAutoModeUFClick(Sender: TObject);
begin
 uMain.NeedAutoModeUF:=chkNeedAutoModeUF.Checked;
end;

procedure TfSetting.chkNeedAutoModeROClick(Sender: TObject);
begin
 uMain.NeedAutoModeRO:=chkNeedAutoModeRO.Checked;
end;

procedure TfSetting.chkNeedAutoModeEDIClick(Sender: TObject);
begin
 uMain.NeedAutoModeEDI:=chkNeedAutoModeEDI.Checked;
end;

procedure TfSetting.FormShow(Sender: TObject);
begin
  UpDateFormSettings;
  ShowRemSpare(1);
  bSaveSt.Enabled:=SymTablIsLoad;
{  cbbHMSubSystem.ItemIndex:=uMain.HMSubSystem-1;
  InitStringGrid();
  ShowGridSubSystem();
  chkNeedExtraData.Checked:=NeedExtraData;
  chkNeedMsgDev.Checked:=NeedMsgDev;
  eNumDB.Text:=IntToStr(NumDB);
  eTemplCP.Text:=uMain.TemplCP;
  eTemplDP.Text:=uMain.TemplDP;
  eTemplAV.Text:=uMain.TemplAV;
  eTemplHeat.Text:=uMain.TemplHeat;
  eTemplQF.Text:=uMain.TemplQF;
  eSpare.Text:=uMain.Spare;
  eTemplUF.Text:=uMain.TemplUF;
  eTemplRO.Text:=uMain.TemplRO;
  eTemplEDI.Text:=uMain.TemplEDI;
  chkNeedAutoModeUF.Checked:=NeedAutoModeUF;
  chkNeedAutoModeRO.Checked:=NeedAutoModeRO;
  chkNeedAutoModeEDI.Checked:=NeedAutoModeEDI;
  }
end;

procedure TfSetting.eTemplQFExit(Sender: TObject);
begin
  uMain.TemplQF:=eTemplQF.Text;
end;

procedure TfSetting.bFindSubSysemClick(Sender: TObject);
begin
  SaveListOfSubSystem;
  FindSubSysem;
  ShowGridSubSystem;
end;

//_______________________________________________________
// Формируем надпись о зарезервированых номерах FB, FC, DB
procedure ShowRemSpare(NumSubSyst:Integer);
var
  sFB, sFC, sDB, sMb:string;
  i:Integer;
begin
  SaveListOfSubSystem;
  fSetting.lblRemSpareUp.Caption:='Для подсистемы <'+ListOfSubSystem[NumSubSyst].Name+'> зарезервированы следующие № блоков:';
  if (uMain.NeedExtraData)
     and
     (
      ((ListOfSubSystem[NumSubSyst].MemberOfSystem =1) and (uMain.NeedAutoModeUF))
      or
      ((ListOfSubSystem[NumSubSyst].MemberOfSystem =2) and (uMain.NeedAutoModeRO))
      or
      ((ListOfSubSystem[NumSubSyst].MemberOfSystem =3) and (uMain.NeedAutoModeEDI))
     )
  then begin
  sFB:='FB: '+IntToStr(ListOfSubSystem[NumSubSyst].Addr)+', '+
    IntToStr(ListOfSubSystem[NumSubSyst].Addr+4)+', '+
    IntToStr(ListOfSubSystem[NumSubSyst].Addr+5)+', '+
    IntToStr(ListOfSubSystem[NumSubSyst].Addr+10);
  sFC:='FC: '+IntToStr(ListOfSubSystem[NumSubSyst].Addr)+', '+
    IntToStr(ListOfSubSystem[NumSubSyst].Addr+1)+', '+
    IntToStr(ListOfSubSystem[NumSubSyst].Addr+2)+', '+
    IntToStr(ListOfSubSystem[NumSubSyst].Addr+3);
  sDB:='DB: '+IntToStr(ListOfSubSystem[NumSubSyst].Addr)+', '+
    IntToStr(ListOfSubSystem[NumSubSyst].Addr+2)+', '+
    IntToStr(ListOfSubSystem[NumSubSyst].Addr+3)+', '+
    IntToStr(ListOfSubSystem[NumSubSyst].Addr+4)+', '+
    IntToStr(ListOfSubSystem[NumSubSyst].Addr+5)+', '+
    IntToStr(ListOfSubSystem[NumSubSyst].Addr+6);
  if ListOfSubSystem[NumSubSyst].NumOfDev>0 then
  begin
    for i:=1 to ListOfSubSystem[NumSubSyst].NumOfDev do
    begin
      sDB:=sDB+', '+IntToStr(ListOfSubSystem[NumSubSyst].Addr+10+i);
    end;
  end;
  if ListOfSubSystem[NumSubSyst].MemberOfSystem >0 then
    sMb:='MB: '+IntToStr(NumSubSyst*10+10)+'..'+IntToStr(ListOfSubSystem[NumSubSyst].NumOfDev+NumSubSyst*10+10+1);
  end
  else begin
    sFB:='FB: '+IntToStr(ListOfSubSystem[NumSubSyst].Addr);
    sFC:='FC: ---';
    sDB:='DB: '+IntToStr(ListOfSubSystem[NumSubSyst].Addr)+', '+
      IntToStr(ListOfSubSystem[NumSubSyst].Addr+2);
    sMb:='MB: ---';
  end;

  fSetting.lblRemSpare.Caption:=sFB+''#13#10''+sFC+''#13#10''+sDB+''#13#10''+sMb;
end;

//_______________________________________________________
// Формируем надпись о зарезервированых номерах FB, FC, DB
procedure SaveListOfSubSystem();
var
  i,x:Integer;
begin
  for i:=1 to HMSubSystem do
  begin
    ListOfSubSystem[i].Name:=fSetting.sgSubSystem.Cells[1,i];

    if TryStrToInt(fSetting.sgSubSystem.Cells[2,i], x)
    then ListOfSubSystem[i].Addr:=x
    else begin
      Application.MessageBox('Значение должно быть числом', 'Ошибка', MB_OK + MB_ICONSTOP);
      ShowGridSubSystem;
      Exit;
    end;

    ListOfSubSystem[i].Rem:=fSetting.sgSubSystem.Cells[3,i];

    if TryStrToInt(fSetting.sgSubSystem.Cells[4,i], x)
    then begin
      if x<=8 then ListOfSubSystem[i].NumOfDev:=x
      else begin
      Application.MessageBox('Значение должно быть не более 8', 'Ошибка', MB_OK + MB_ICONSTOP);
      ShowGridSubSystem;
      Exit;
      end;
    end
    else begin
      Application.MessageBox('Значение должно быть числом', 'Ошибка', MB_OK + MB_ICONSTOP);
      ShowGridSubSystem;
      Exit;
    end;

  end;
end;
procedure TfSetting.sgSubSystemSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  ShowRemSpare(ARow);
//fSetting.lblRemSpare.Caption:='ACol='+IntToStr(ACol)+'; ARow='+IntToStr(ARow);
  if ACol=5
    then fSetting.sgSubSystem.Options:=fSetting.sgSubSystem.Options-[goEditing]
    else fSetting.sgSubSystem.Options:=fSetting.sgSubSystem.Options+[goEditing];
end;

procedure TfSetting.sgSubSystemGetEditText(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
//  if ARow<=0 then
//  if StrToInt(Value)>10 then Value:='10';
end;

procedure TfSetting.eTemplUFExit(Sender: TObject);
begin
  uMain.TemplUF:=eTemplUF.Text;
end;

procedure TfSetting.eTemplROExit(Sender: TObject);
begin
  uMain.TemplRO:=eTemplRO.Text;
end;

procedure TfSetting.eTemplEDIExit(Sender: TObject);
begin
  uMain.TemplEDI:=eTemplEDI.Text;
end;

procedure TfSetting.chkOB32IsPresentClick(Sender: TObject);
begin
  OB32IsPresent:=chkOB32IsPresent.Checked;
end;

procedure TfSetting.chkNeedLADClick(Sender: TObject);
begin
  NeedLAD:=chkNeedLAD.Checked;
end;

procedure TfSetting.eNameS7PExit(Sender: TObject);
begin
  uMain.NameS7P:=eNameS7P.Text;
end;

procedure TfSetting.chkNeedWinCCObjClick(Sender: TObject);
begin
  NeedWinCCObj:=chkNeedWinCCObj.Checked;
end;

procedure TfSetting.bOpenWinCCClick(Sender: TObject);
begin
  uMain.OpenWinCC_cex;
  UpDateFormSettings;
end;

procedure TfSetting.eSepWinCCChange(Sender: TObject);
begin
  uMain.SepWinCC:=eSepWinCC.Text;
end;

end.
