program GenFB20;

{%ToDo 'GenFB20.todo'}

uses
  Forms,
  uMain in 'uMain.pas' {fMain},
  uSettings in 'uSettings.pas' {fSetting},
  ufWinGenPrgr in 'ufWinGenPrgr.pas' {fWinGenPrgr},
  uAddFilterDQ in 'uAddFilterDQ.pas' {fAddFilterDQ},
  uMdw in 'uMdw.pas' {fMdw},
  uSelNameOSWinCC in 'uSelNameOSWinCC.pas' {fSelNameOSWinCC};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfSetting, fSetting);
  Application.CreateForm(TfWinGenPrgr, fWinGenPrgr);
  Application.CreateForm(TfAddFilterDQ, fAddFilterDQ);
  Application.CreateForm(TfMdw, fMdw);
  Application.CreateForm(TfSelNameOSWinCC, fSelNameOSWinCC);
  Application.Run;
end.
