unit uMdw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uMain, ExtCtrls;

type
  TfMdw = class(TForm)
    bFB20Tune: TBitBtn;
    bOk: TBitBtn;
    lblMdw1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    bSendMdw1: TButton;
    chkMdw1: TCheckBox;
    bCancel: TBitBtn;
    eTotalMdw: TEdit;
    bVar: TButton;
    lbl1: TLabel;
    bvl1: TBevel;
    lbl4: TLabel;
    bvl2: TBevel;
    lblMdw2: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    bSendMdw2: TButton;
    chkMdw2: TCheckBox;
    bvl3: TBevel;
    lbl5: TLabel;
    lbl8: TLabel;
    lblHint: TLabel;
    lbl9: TLabel;
    bvl4: TBevel;
    lblMdw3: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    bSendMdw3: TButton;
    chkMdw3: TCheckBox;
    lbl15: TLabel;
    lbl16: TLabel;
    bvl5: TBevel;
    lblMdw4: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    bSendMdw4: TButton;
    chkMdw4: TCheckBox;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl10: TLabel;
    lbl23: TLabel;
    bvl6: TBevel;
    lblMdw5: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    bSendMdw5: TButton;
    chkMdw5: TCheckBox;
    bvl7: TBevel;
    lblMdw6: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    bSendMdw6: TButton;
    chkMdw6: TCheckBox;
    bvl8: TBevel;
    lblMdw7: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    bSendMdw7: TButton;
    chkMdw7: TCheckBox;
    lbl35: TLabel;
    lbl36: TLabel;
    bvl9: TBevel;
    lblMdw8: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    bSendMdw8: TButton;
    chkMdw8: TCheckBox;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    bvl10: TBevel;
    bvl11: TBevel;
    bvl12: TBevel;
    bvl13: TBevel;
    procedure bFB20TuneClick(Sender: TObject);
    procedure bOkClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure bVarClick(Sender: TObject);
    procedure bSendMdw1Click(Sender: TObject);
    procedure chkMdw1Click(Sender: TObject);
    procedure chkMdw2Click(Sender: TObject);
    procedure bSendMdw2Click(Sender: TObject);
    procedure chkMdw3Click(Sender: TObject);
    procedure bSendMdw3Click(Sender: TObject);
    procedure chkMdw4Click(Sender: TObject);
    procedure bSendMdw4Click(Sender: TObject);
    procedure bSendMdw5Click(Sender: TObject);
    procedure chkMdw6Click(Sender: TObject);
    procedure bSendMdw6Click(Sender: TObject);
    procedure chkMdw7Click(Sender: TObject);
    procedure bSendMdw7Click(Sender: TObject);
    procedure chkMdw8Click(Sender: TObject);
    procedure bSendMdw8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//____________________________________________________________________
// Трансфер в поле со строкой Mdw
procedure SendToTotalMdw(s:string);
  
var
  fMdw: TfMdw;
  sMdw:string;

implementation

{$R *.dfm}

procedure TfMdw.bFB20TuneClick(Sender: TObject);
begin
  WinExec('FB20Tune.exe', SW_SHOW);
end;

procedure TfMdw.bOkClick(Sender: TObject);
begin
  FB20[CurrFB20].Mdw:=eTotalMdw.Text;
  fMain.eMdw.Text:=FB20[CurrFB20].Mdw;
  fMdw.Close;
end;

procedure TfMdw.bCancelClick(Sender: TObject);
begin
  fMdw.Close;
end;

//____________________________________________________________________
// Трансфер в поле со строкой Mdw
procedure SendToTotalMdw(s:string);
begin
  fMdw.eTotalMdw.Text:=s;
end;  

procedure TfMdw.bVarClick(Sender: TObject);
begin
  SendToTotalMdw(FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Mdw');
  lblHint.Caption:='--- ';
end;
//____________________________________________________________________
// Нажатие кнопок
procedure TfMdw.bSendMdw1Click(Sender: TObject);
begin
  SendToTotalMdw(lblMdw1.Caption);
  lblHint.Caption:='--- ';
end;

procedure TfMdw.bSendMdw2Click(Sender: TObject);
begin
  SendToTotalMdw(lblMdw2.Caption);
  lblHint.Caption:='Необходимо задать время в TmX ';
end;

procedure TfMdw.bSendMdw3Click(Sender: TObject);
begin
  SendToTotalMdw(lblMdw3.Caption);
  lblHint.Caption:='Необходимо задать время в Tm1(2) ';
end;

procedure TfMdw.bSendMdw4Click(Sender: TObject);
begin
  SendToTotalMdw(lblMdw4.Caption);
  lblHint.Caption:='Необходимо задать время в Tm1(2) ';
end;

//____________________________________________________________________
// Выбор количества каналов
procedure TfMdw.chkMdw1Click(Sender: TObject);
begin
  if chkMdw1.Checked
  then lblMdw1.Caption:='W#16#8101'
  else lblMdw1.Caption:='W#16#8100';
end;

procedure TfMdw.chkMdw2Click(Sender: TObject);
begin
  if chkMdw2.Checked
  then lblMdw2.Caption:='W#16#4141'
  else lblMdw2.Caption:='W#16#4100';
end;

procedure TfMdw.chkMdw3Click(Sender: TObject);
begin
  if chkMdw3.Checked
  then lblMdw3.Caption:='W#16#1515'
  else lblMdw3.Caption:='W#16#1500';
end;


procedure TfMdw.chkMdw4Click(Sender: TObject);
begin
  if chkMdw4.Checked
  then lblMdw4.Caption:='W#16#1D1D'
  else lblMdw4.Caption:='W#16#1D00';
end;

procedure TfMdw.bSendMdw5Click(Sender: TObject);
begin
  SendToTotalMdw(lblMdw5.Caption);
  lblHint.Caption:='--- ';
end;

procedure TfMdw.chkMdw6Click(Sender: TObject);
begin
  if chkMdw6.Checked
  then lblMdw6.Caption:='W#16#4040'
  else lblMdw6.Caption:='W#16#4000';
end;

procedure TfMdw.bSendMdw6Click(Sender: TObject);
begin
  SendToTotalMdw(lblMdw6.Caption);
  lblHint.Caption:='Необходимо задать время в TmX ';
end;

procedure TfMdw.chkMdw7Click(Sender: TObject);
begin
  if chkMdw7.Checked
  then lblMdw7.Caption:='W#16#1414'
  else lblMdw7.Caption:='W#16#1400';
end;

procedure TfMdw.bSendMdw7Click(Sender: TObject);
begin
  SendToTotalMdw(lblMdw7.Caption);
  lblHint.Caption:='Необходимо задать время в Tm1(2) ';
end;

procedure TfMdw.chkMdw8Click(Sender: TObject);
begin
  if chkMdw8.Checked
  then lblMdw8.Caption:='W#16#1C1C'
  else lblMdw8.Caption:='W#16#1C00';
end;

procedure TfMdw.bSendMdw8Click(Sender: TObject);
begin
  SendToTotalMdw(lblMdw8.Caption);
  lblHint.Caption:='Необходимо задать время в Tm1(2) ';
end;

end.
