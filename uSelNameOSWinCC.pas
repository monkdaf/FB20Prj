unit uSelNameOSWinCC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfSelNameOSWinCC = class(TForm)
    lbl1: TLabel;
    cbbNameOSWinCC: TComboBox;
    btn1: TBitBtn;
    procedure cbbNameOSWinCCChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSelNameOSWinCC: TfSelNameOSWinCC;

implementation
uses uMain;
{$R *.dfm}

procedure TfSelNameOSWinCC.cbbNameOSWinCCChange(Sender: TObject);
begin
  uMain.NameDrvWinCC:=uMain.NameDrvWinCCArr[cbbNameOSWinCC.ItemIndex];
end;

procedure TfSelNameOSWinCC.FormShow(Sender: TObject);
var
  i:Integer;
begin
  cbbNameOSWinCC.Items.Clear;
  for i:=0 to uMain.nNameDrvWinCC-1 do
  cbbNameOSWinCC.Items.Add(uMain.NameDrvWinCCArr[i]);
  cbbNameOSWinCC.ItemIndex:=0;
  uMain.NameDrvWinCC:=uMain.NameDrvWinCCArr[cbbNameOSWinCC.ItemIndex];
end;

end.
