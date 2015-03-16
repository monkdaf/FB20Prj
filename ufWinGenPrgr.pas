unit ufWinGenPrgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TfWinGenPrgr = class(TForm)
    bClose: TBitBtn;
    lblProgressText: TLabel;
    pbPercGenPrgr: TProgressBar;
    procedure bCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fWinGenPrgr: TfWinGenPrgr;

implementation

{$R *.dfm}

procedure TfWinGenPrgr.bCloseClick(Sender: TObject);
begin
  fWinGenPrgr.Close;
end;

procedure TfWinGenPrgr.FormShow(Sender: TObject);
begin
  pbPercGenPrgr.Position:=0;
end;

end.
