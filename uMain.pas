unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, jpeg, ExtCtrls, ComCtrls, ImgList;

const
  DqMax=1000;
  DiMax=1000;
  FB20Max=1000;
  SubSystMax=10;
  SepTextMax=10;
type
  FB20Rec=record
    Device:Boolean; //���������� �� ���? (���� ��, �� ��������� �-��� ���������)
    TypeDev:Byte;      // ��� ���������� =1-������, =2-��������, =3-�������, =4-�����������, =0-���������
    NameDB:string; //��� DB � FB � �������� ����������� �-��
    NameDQ:string; //��� �������� ���������� (Dq)
    Addr:string; //����� �������� ���������� (Dq)
    NeedMsg:Boolean; //=True-���������� ����������� ��������� ��� WinCC
    MsgAV:Boolean; // ������������ ���������� ������ ��������� (��� �������� � �����������)
    Name:string; //��� ����������
    Name4Msg:string; //��� ���������� ������������ � ��������� (���� Alarm_D)
    Rem:string;  //���������� � ����������
    Kx1:string;  //����-������� Km1 (������������� ������������ Km1==Kx1)
    SQ1:string;  //�������� ����������� ��� Km1 (0==�������) (� ���������� ��� ���)
    SB1:string;  //������ ��������� Km1 (����� �������)  (� ��������� ��� ���)
    SU1:string;  //������ ������� ��������� Km1 � ���������� ������
    Kx2:string;  //����-������� Km2 (������������� ������������ Km2==Kx2)
    SQ2:string;  //�������� ����������� ��� Km2 (0==�������) (� ���������� ��� ���)
    SB2:string;  //������ ��������� Km2 (����� �������)  (� ��������� ��� ���)
    SU2:string;  //������ ������� ��������� Km2 � ���������� ������
    OFF:string;  //������ "����" ��� ������ �������� (1==�������)
    Dis:string;  //������ ������ ("��������� ����" ��� ������ �����)  (1==�������)
    QFx:string;  //�������� ������� ����� ��������� (1==�������)
    Ack:string;  //����� ��������� ������ (������������)  (1==�������)
    Mdt:string;  //���������� ����� (������ (���������) ����������)
    Mdx:string;  //������� ������ ������ (0==������/1==�������)
    Mdw:string;  //����� ������� ������ ������ ������ � �� (1 ���� �� �����)
    Mdu:string;  //����� ��������� ������ ������ (����� ��� ����� �������)
    Tm1:string;  //�������� ������� ������ Km1 (T#0MS/T#24D - ��� �����������)
    Tm2:string;  //�������� ������� ������ Km2 (T#0MS/T#24D - ��� �����������)
    TmX:string;  //�������� ������� ������������ ����-��������� Kx1 � Kx2
    Km1:string;  //���������� ��������� �� SB1
    Lr1:string;  //��������� �������� �� SB1 (�������)
    Lg1:string;  //��������� �������� �� SB1 (�������)
    Km2:string;  //���������� ��������� �� SB2
    Lr2:string;  //��������� �������� �� SB2 (�������)
    Lg2:string;  //��������� �������� �� SB2 (�������)
    Ste:string;  //��������� ��������� (��� HMI)
    Kx1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    SQ1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    SB1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    SU1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Kx2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    SQ2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    SB2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    SU2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    OFF_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Dis_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    QFx_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Ack_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Mdt_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Mdx_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Mdw_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Mdu_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Tm1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Tm2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    TmX_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Km1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Lr1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Lg1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Km2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Lr2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Lg2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Ste_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
  end;
  FB20RecForFile=record
    Device:Boolean; //���������� �� ���? (���� ��, �� ��������� �-��� ���������)
    TypeDev:Byte;      // ��� ���������� =1-������, =2-��������, =3-�������, =4-�����������, =0-���������
    NameDB:string[255]; //��� DB � FB � �������� ����������� �-��
    NameDQ:string[255]; //��� �������� ���������� (Dq)    
    Addr:string[255]; //����� �������� ���������� (Dq)
    NeedMsg:Boolean; //=True-���������� ����������� ��������� ��� WinCC
    MsgAV:Boolean; // ������������ ���������� ������ ��������� (��� �������� � �����������)
    Name:string[255]; //��� ����������
    Name4Msg:string[255]; //��� ���������� ������������ � ��������� (���� Alarm_D)
    Rem:string[255];  //���������� � ����������
    Kx1:string[255];  //����-������� Km1 (������������� ������������ Km1==Kx1)
    SQ1:string[255];  //�������� ����������� ��� Km1 (0==�������) (� ���������� ��� ���)
    SB1:string[255];  //������ ��������� Km1 (����� �������)  (� ��������� ��� ���)
    SU1:string[255];  //������ ������� ��������� Km1 � ���������� ������
    Kx2:string[255];  //����-������� Km2 (������������� ������������ Km2==Kx2)
    SQ2:string[255];  //�������� ����������� ��� Km2 (0==�������) (� ���������� ��� ���)
    SB2:string[255];  //������ ��������� Km2 (����� �������)  (� ��������� ��� ���)
    SU2:string[255];  //������ ������� ��������� Km2 � ���������� ������
    OFF:string[255];  //������ "����" ��� ������ �������� (1==�������)
    Dis:string[255];  //������ ������ ("��������� ����" ��� ������ �����)  (1==�������)
    QFx:string[255];  //�������� ������� ����� ��������� (1==�������)
    Ack:string[255];  //����� ��������� ������ (������������)  (1==�������)
    Mdt:string[255];  //���������� ����� (������ (���������) ����������)
    Mdx:string[255];  //������� ������ ������ (0==������/1==�������)
    Mdw:string[255];  //����� ������� ������ ������ ������ � �� (1 ���� �� �����)
    Mdu:string[255];  //����� ��������� ������ ������ (����� ��� ����� �������)
    Tm1:string[255];  //�������� ������� ������ Km1 (T#0MS/T#24D - ��� �����������)
    Tm2:string[255];  //�������� ������� ������ Km2 (T#0MS/T#24D - ��� �����������)
    TmX:string[255];  //�������� ������� ������������ ����-��������� Kx1 � Kx2
    Km1:string[255];  //���������� ��������� �� SB1
    Lr1:string[255];  //��������� �������� �� SB1 (�������)
    Lg1:string[255];  //��������� �������� �� SB1 (�������)
    Km2:string[255];  //���������� ��������� �� SB2
    Lr2:string[255];  //��������� �������� �� SB2 (�������)
    Lg2:string[255];  //��������� �������� �� SB2 (�������)
    Ste:string[255];  //��������� ��������� (��� HMI)
    Kx1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    SQ1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    SB1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    SU1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Kx2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    SQ2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    SB2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    SU2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    OFF_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Dis_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    QFx_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Ack_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Mdt_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Mdx_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Mdw_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Mdu_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Tm1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Tm2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    TmX_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Km1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Lr1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Lg1_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Km2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Lr2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Lg2_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
    Ste_S7mc:Boolean;  //������������� �������� ���������� � WinCC (=1-���� S7_m_c=True)
  end;
  DIRec=record
    Name:string;
    Addr:string;
    Rem:string;
  end;
  DQRec=record
    Name:string;
    Addr:string;
    Rem:string;
  end;
  ListOfSubSystemRec=record
    Name:string[255];
    Addr:Integer;
    Rem:string[255];
    NumOfDev:Integer;
    MemberOfSystem:Byte; // �������������� � ����������
                         // =0-��� ��������������
                         // =1-����������������
                         // =2-�������� �����
                         // =3-������������������
  end;
  Setting2FileRec=record
    CntDi, CntDq: Integer; // ���-�� ���������� ������ � �������
    CntDev: Integer; // ���-�� ����������������� ���������
    HMSubSystem:Integer; // ������� ��������� ��������������� ������������(1..10)
    NeedMsgDev:Boolean; // ���������� �� ����������� ��������� ��� WinCC
    NeedExtraData:Boolean; // ���������� �� ����������� ����������� ������
    NeedAutoModeUF:Boolean; // ���������� �� ����������� ����� "����" ��� UF
    NeedAutoModeRO:Boolean; // ���������� �� ����������� ����� "����" ��� RO
    NeedAutoModeEDI:Boolean; // ���������� �� ����������� ����� "����" ��� EDI
    NumDB:Integer; // � ������ ������ ����������� �������-DB
    AddrtEnablePLCMsg:Byte; // ����� ������� ��� ���������� �����������
    TemplCP:string[255]; // ������(������) ��� ������ ������� � ����. ��������
    TemplDP:string[255]; // ������(������) ��� ������ �������-��������� � ����. ��������
    TemplAV:string[255]; // ������(������) ��� ������ �������� � ����. ��������
    TemplHeat:string[255]; // ������(������) ��� ������ ������������ � ����. ��������
    Spare: string[255]; // ������(������) ��� ������ ������� � ����. ��������
    TemplQF:string[255]; // ������(������) ��� ������ �������������� ������������ � ����. ��������
    TemplUF:string[255]; // ������(������) ��� ����������� UF � ������ ���������
    TemplRO:string[255]; // ������(������) ��� ����������� UF � ������ ���������
    TemplEDI:string[255]; // ������(������) ��� ����������� UF � ������ ���������
    OB32IsPresent:Boolean; // �������������� �� OB32 ������� ������������
    NeedLAD:Boolean; // �� ����������� ������������ LAD
    NeedWinCCObj:Boolean; // ���������� �� ����������� ������� ��� ����������� WinCC
    NameS7P:string[255]; // ��� S7 ���������
    SepWinCC:string[255]; // ����������� � ����� ���������� WinCC
  end;
  DqFilterRec=record
    Visible:Boolean; // ��������� ���������� � ������ �������
    Num: Integer;    // ��������������� ����� � ������ FB20
  end;
  DqAddFilterRec=record  // �������������� ������ ��� ������ ����������
    Device:Boolean; //���������� �� ���? (���� ��, �� ��������� �-��� ���������)
    priNameDB:Boolean; //�� ����� ���������� (DB � FB) � ������� ����������� �-��
    NameDB:string; //��� ���������� (DB � FB) � ������� ����������� �-��
    NeedMsg:Boolean; //�� ������������� ����������� ��������� ��� WinCC
    MsgAV:Boolean; // �� ������������� ���������� ������ ��������� (��� �������� � �����������)
  end;
  AddrMemoryBitRec=record
    Byte:Byte;
    Bit:Byte;
  end;
  TSepText = array[0..SepTextMax] of string;

  TfMain = class(TForm)
    sgDI: TStringGrid;
    OpenDialogPLC: TOpenDialog;
    bOpenPLC: TButton;
    mmoRawSmbTbl: TMemo;
    sgDq: TStringGrid;
    Label2: TLabel;
    eName: TEdit;
    eRem: TEdit;
    Label1: TLabel;
    eKx1: TEdit;
    eKx2: TEdit;
    eSQ1: TEdit;
    eSB1: TEdit;
    eSU1: TEdit;
    eSQ2: TEdit;
    eSB2: TEdit;
    eSU2: TEdit;
    chkEnable: TCheckBox;
    eOFF: TEdit;
    eDis: TEdit;
    eQFx: TEdit;
    eAck: TEdit;
    eMdt: TEdit;
    eMdx: TEdit;
    eMdw: TEdit;
    eMdu: TEdit;
    eTm1: TEdit;
    eTm2: TEdit;
    eTmx: TEdit;
    eKm1: TEdit;
    eLr1: TEdit;
    eLg1: TEdit;
    eKm2: TEdit;
    eLr2: TEdit;
    eLg2: TEdit;
    eSte: TEdit;
    bFB20Tune: TBitBtn;
    btnSetting: TButton;
    cbbSelDBName: TComboBox;
    bAckChNameDB: TButton;
    Label3: TLabel;
    bGenPrgr: TButton;
    mmoGenPrgr: TMemo;
    mmoGenSmbl: TMemo;
    chkNeedMsg: TCheckBox;
    eTemporary: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    bvl1: TBevel;
    mmoGenTxtLbr: TMemo;
    eName4Msg: TEdit;
    Label6: TLabel;
    bChNameDev: TButton;
    OpenDialogSetting: TOpenDialog;
    SaveDialogSetting: TSaveDialog;
    bChkErr: TButton;
    eFiltrDq: TEdit;
    chkMsgAV: TCheckBox;
    bvl2: TBevel;
    bvl3: TBevel;
    eFiltrDi: TEdit;
    spFiltrDQ: TSpeedButton;
    bFiltrDq: TSpeedButton;
    bFiltrDi: TSpeedButton;
    lbl1: TLabel;
    lbl2: TLabel;
    bClose: TBitBtn;
    bvlFiltrDQ: TBevel;
    bvlFindFiltrDQ: TBevel;
    bvlFindFiltrDI: TBevel;
    bGenVarKx1: TButton;
    bGenVarSQ1: TButton;
    bGenVarSB1: TButton;
    bGenVarSU1: TButton;
    bGenVarKx2: TButton;
    bGenVarSQ2: TButton;
    bGenVarSB2: TButton;
    bGenVarSU2: TButton;
    bGenVarOFF: TButton;
    bGenVarDis: TButton;
    bGenVarQFx: TButton;
    bGenVarAck: TButton;
    bGenVarMdt: TButton;
    bGenVarKm1: TButton;
    bGenVarLr1: TButton;
    bGenVarLg1: TButton;
    bGenVarKm2: TButton;
    bGenVarLr2: TButton;
    bGenVarLg2: TButton;
    bGenVarTmx: TButton;
    bGenVarTm2: TButton;
    bGenVarTm1: TButton;
    bGenVarMdu: TButton;
    bGenVarMdw: TButton;
    bGenVarMdx: TButton;
    bGenVarSte: TButton;
    chkWinCCKx1: TCheckBox;
    lbl3: TLabel;
    bvl4: TBevel;
    chkWinCCSQ1: TCheckBox;
    chkWinCCSU1: TCheckBox;
    chkWinCCSB1: TCheckBox;
    chkWinCCSU2: TCheckBox;
    chkWinCCSB2: TCheckBox;
    chkWinCCSQ2: TCheckBox;
    chkWinCCKx2: TCheckBox;
    chkWinCCMdu: TCheckBox;
    chkWinCCMdw: TCheckBox;
    chkWinCCMdx: TCheckBox;
    chkWinCCMdt: TCheckBox;
    chkWinCCAck: TCheckBox;
    chkWinCCQFx: TCheckBox;
    chkWinCCDis: TCheckBox;
    chkWinCCOFF: TCheckBox;
    chkWinCCSte: TCheckBox;
    chkWinCCLg2: TCheckBox;
    chkWinCCLr2: TCheckBox;
    chkWinCCKm2: TCheckBox;
    chkWinCCLg1: TCheckBox;
    chkWinCCLr1: TCheckBox;
    chkWinCCKm1: TCheckBox;
    chkWinCCTmx: TCheckBox;
    chkWinCCTm2: TCheckBox;
    chkWinCCTm1: TCheckBox;
    b1: TButton;
    lbl4: TLabel;
    mmoGenWinCCObj: TMemo;
    chkPrSave: TCheckBox;
    bPrPaste: TButton;
    OpenDialogWinCC: TOpenDialog;
    MemoWinCC_cex: TMemo;
    eIn: TEdit;
    mmoOut: TMemo;
    bTest2: TButton;
    lblTypeDev: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bOpenPLCClick(Sender: TObject);
    procedure sgDqSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgDISelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure chkEnableClick(Sender: TObject);
    procedure bFB20TuneClick(Sender: TObject);
    procedure btnSettingClick(Sender: TObject);
    procedure bAckChNameDBClick(Sender: TObject);
    procedure cbbSelDBNameChange(Sender: TObject);
    procedure sgDqDblClick(Sender: TObject);
    procedure bGenPrgrClick(Sender: TObject);
    procedure chkNeedMsgClick(Sender: TObject);
    procedure eNameExit(Sender: TObject);
    procedure eKx1Exit(Sender: TObject);
    procedure eKx2Exit(Sender: TObject);
    procedure eSQ1Exit(Sender: TObject);
    procedure eSQ2Exit(Sender: TObject);
    procedure eSB1Exit(Sender: TObject);
    procedure eSB2Exit(Sender: TObject);
    procedure eSU1Exit(Sender: TObject);
    procedure eSU2Exit(Sender: TObject);
    procedure eOFFExit(Sender: TObject);
    procedure eDisExit(Sender: TObject);
    procedure eQFxExit(Sender: TObject);
    procedure eAckExit(Sender: TObject);
    procedure eMdtExit(Sender: TObject);
    procedure eMdxExit(Sender: TObject);
    procedure eMdwExit(Sender: TObject);
    procedure eMduExit(Sender: TObject);
    procedure eTm1Exit(Sender: TObject);
    procedure eTm2Exit(Sender: TObject);
    procedure eTmxExit(Sender: TObject);
    procedure eKm1Exit(Sender: TObject);
    procedure eKm2Exit(Sender: TObject);
    procedure eLr1Exit(Sender: TObject);
    procedure eLr2Exit(Sender: TObject);
    procedure eLg1Exit(Sender: TObject);
    procedure eLg2Exit(Sender: TObject);
    procedure eSteExit(Sender: TObject);
    procedure eKx1DblClick(Sender: TObject);
    procedure eSQ1DblClick(Sender: TObject);
    procedure eSB1DblClick(Sender: TObject);
    procedure eSU1DblClick(Sender: TObject);
    procedure eKx2DblClick(Sender: TObject);
    procedure eSQ2DblClick(Sender: TObject);
    procedure eSB2DblClick(Sender: TObject);
    procedure eSU2DblClick(Sender: TObject);
    procedure eOFFDblClick(Sender: TObject);
    procedure eDisDblClick(Sender: TObject);
    procedure eQFxDblClick(Sender: TObject);
    procedure eAckDblClick(Sender: TObject);
    procedure eMdtDblClick(Sender: TObject);
    procedure eMdxDblClick(Sender: TObject);
    procedure eMdwDblClick(Sender: TObject);
    procedure eMduDblClick(Sender: TObject);
    procedure eTm1DblClick(Sender: TObject);
    procedure eTm2DblClick(Sender: TObject);
    procedure eTmxDblClick(Sender: TObject);
    procedure eKm1DblClick(Sender: TObject);
    procedure eLr1DblClick(Sender: TObject);
    procedure eLg1DblClick(Sender: TObject);
    procedure eKm2DblClick(Sender: TObject);
    procedure eLr2DblClick(Sender: TObject);
    procedure eLg2DblClick(Sender: TObject);
    procedure eSteDblClick(Sender: TObject);
    procedure sgDIDblClick(Sender: TObject);
    procedure eName4MsgExit(Sender: TObject);
    procedure bChNameDevClick(Sender: TObject);
    procedure bChkErrClick(Sender: TObject);
    procedure eFiltrDqExit(Sender: TObject);
    procedure chkMsgAVClick(Sender: TObject);
    procedure eFiltrDiExit(Sender: TObject);
    procedure eFiltrDqKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eFiltrDiKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bFiltrDqClick(Sender: TObject);
    procedure bFiltrDiClick(Sender: TObject);
    procedure spFiltrDQClick(Sender: TObject);
    procedure bGenVarKx1Click(Sender: TObject);
    procedure bGenVarSQ1Click(Sender: TObject);
    procedure bGenVarSB1Click(Sender: TObject);
    procedure bGenVarSU1Click(Sender: TObject);
    procedure bGenVarKx2Click(Sender: TObject);
    procedure bGenVarSQ2Click(Sender: TObject);
    procedure bGenVarSB2Click(Sender: TObject);
    procedure bGenVarSU2Click(Sender: TObject);
    procedure bGenVarOFFClick(Sender: TObject);
    procedure bGenVarDisClick(Sender: TObject);
    procedure bGenVarQFxClick(Sender: TObject);
    procedure bGenVarAckClick(Sender: TObject);
    procedure bGenVarMdtClick(Sender: TObject);
    procedure bGenVarMdxClick(Sender: TObject);
    procedure bGenVarMdwClick(Sender: TObject);
    procedure bGenVarMduClick(Sender: TObject);
    procedure bGenVarTm1Click(Sender: TObject);
    procedure bGenVarTm2Click(Sender: TObject);
    procedure bGenVarTmxClick(Sender: TObject);
    procedure bGenVarKm1Click(Sender: TObject);
    procedure bGenVarLr1Click(Sender: TObject);
    procedure bGenVarLg1Click(Sender: TObject);
    procedure bGenVarKm2Click(Sender: TObject);
    procedure bGenVarLr2Click(Sender: TObject);
    procedure bGenVarLg2Click(Sender: TObject);
    procedure bGenVarSteClick(Sender: TObject);
    procedure chkWinCCKx1Click(Sender: TObject);
    procedure chkWinCCSQ1Click(Sender: TObject);
    procedure chkWinCCSB1Click(Sender: TObject);
    procedure chkWinCCSU1Click(Sender: TObject);
    procedure chkWinCCKx2Click(Sender: TObject);
    procedure chkWinCCSQ2Click(Sender: TObject);
    procedure chkWinCCSB2Click(Sender: TObject);
    procedure chkWinCCSU2Click(Sender: TObject);
    procedure chkWinCCOFFClick(Sender: TObject);
    procedure chkWinCCDisClick(Sender: TObject);
    procedure chkWinCCQFxClick(Sender: TObject);
    procedure chkWinCCAckClick(Sender: TObject);
    procedure chkWinCCMdtClick(Sender: TObject);
    procedure chkWinCCMdxClick(Sender: TObject);
    procedure chkWinCCMdwClick(Sender: TObject);
    procedure chkWinCCMduClick(Sender: TObject);
    procedure chkWinCCTm1Click(Sender: TObject);
    procedure chkWinCCTm2Click(Sender: TObject);
    procedure chkWinCCTmxClick(Sender: TObject);
    procedure chkWinCCKm1Click(Sender: TObject);
    procedure chkWinCCLr1Click(Sender: TObject);
    procedure chkWinCCLg1Click(Sender: TObject);
    procedure chkWinCCKm2Click(Sender: TObject);
    procedure chkWinCCLr2Click(Sender: TObject);
    procedure chkWinCCLg2Click(Sender: TObject);
    procedure chkWinCCSteClick(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure chkPrSaveClick(Sender: TObject);
    procedure bPrPasteClick(Sender: TObject);
    procedure bTest2Click(Sender: TObject);
    procedure eRemExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
    function DelSpace(str:string):string ;
    procedure ShowGridDi();
    procedure ShowGridDq();
// �������� ��������� s1 � s2 � Source
    function FindPartOfDev(s1,s2:string):String;
// ������� ���������� � ���� ��� ������� ��������� ����������
    procedure ShowFieldDev(Pos:Integer);
//��������� ������ ��� ������� �-���
    procedure CreateMatrixDev();
//�������� �������� ���������� � ������ ����������
// (���������� ������ ��� ��� �-��� � ������ ������)
    procedure ChangeNameDBForDev();    
//��������� ��������� �� ����� ���������
    function NotSpare(s:string):Boolean;
//�������� ������ ������ ��� ���
    function NoBlank(s:string):Boolean;
//�������������� ����� � ������ (��� ����� �������� ���� "_NNN")
    function Num2Lbl(n:Integer): string;
// ���������� ����� ��������� ���������� � ������
    function SaveStr(StrIn:string):string;
// ������ ������� ������������� ����
    procedure ShowColorFieldDev();
// � Source ���� ��������� OldName � �������� ��������� �� "����� ���"
// "����� ���" - ��� FB20[CurrFB20].Name
    procedure ChangeFieldFromName(var Source:string);
// ��������� ���������
    function SaveSettings():Integer;
// ��������� ���������
    function LoadSettings():Integer;
// �������� ��������� FB20 � FB20ForFile
    procedure FB20SaveToFB20ForFile();
// �������� ��������� FB20ForFile � FB20
    procedure FB20ForFileSaveToFB20();
// �������� �� ������ (=False - �� ��; =True - ���� ������)
    function CheckErr(): Boolean;
// ��������� ���������� ������ (=True-���� ��� �� �������)
    function FiltrDq(filtr:string):Boolean ;
// ����� � ������� FB20 ������������ ���������������� ���������� FB20
    function FindCurrFB20(sgDqPos:Integer): Integer;
// ��������� ����� ������� �� ������������
    procedure SeparateFiltrText(Text:string; var SepText: TSepText);
// ��������� ���������� ����� (=True-���� ��� �� �������)
    function FiltrDi(filtr:string):Boolean ;
// ����� � ������� Di ������������ ���������������� Di
    function FindCurrDi(sgDiPos:Integer): Integer;
// ��������� (�������������)  ���������� ������ (=True-���� ��� �� �������)
    function AddFiltrDq(pos:Integer):Boolean ;
// �������� ������������ � ����������� ���� ��� ������� �� ������� DQ
    procedure FindAndShowDQ();
// �������� ������������ � ����������� ���� ��� ������� �� ������� DI
    procedure FindAndShowDI();
// ������ ���������� � DB (� mmoGenPrgr)
    procedure WriteDev2mmoGenPrgr(index:Integer; TextDev:string);
// ������ � ���������� ���������� ������ ���� �� �� ������
    function AllowReplaceFieldText(s:string):Boolean;
// ������ "������������" �������� �� ������ "_"
    function ReplaceBadChar(s:string):string ;
// �������� �� ������ ������ ��������� (=False - �� ��; =True - ���� ������)
    function CheckErrSubSystem(): Boolean;
// ���������� �������������� ��������� � UF, RO, EDI
    procedure FindSubSysem();
// ���������� ���������� ������ ��� ��������������� ������
    procedure GenSymData4Auto();
// ���������� FB "<��� ����������>DevSel" ��� ��������������� ������
    procedure GenBlDevSel(NumSubSyst:Integer);
// ���������� FB "<��� ����������>AutoCntrl" ��� ��������������� ������
    procedure GenBlAutoCntrl(NumSubSyst:Integer);
// ���������� FB "<��� ����������>ShiftStackDev" ��� ��������������� ������
    procedure GenBlShiftStackDev(NumSubSyst:Integer);
// ���������� FB "<��� ����������>DownStackHand" ��� ��������������� ������
    procedure GenBlDownStackHand(NumSubSyst:Integer);
// ���������� NetWork � ����������� � ������� ��������� � LAD
    procedure GenDevNetworkLAD(NumDev:Integer);
// ���������� NetWork � ����������� � ������� ��������� � STL
    procedure GenDevNetworkSTL(NumDev:Integer);
// ���������� OB32
    procedure GenOB32();
// ���������� OB35
    procedure GenOB35();
// ���������� NetWork ��� ������ TimeToSwitch
    procedure GenTimeToSwitch();
// ���������� DB ��� ������ FB � OB3x
    procedure GenDBForOB3x();
// ���������� �-��� ��� ����������� ��������/��������� ����� TimeConvert
    procedure GenTimeConvert();
// ���������� ����� F� TimeConvert
    procedure GenTimeConvertCall();
// ���������� �-��� ��� �������� ����� TimeCount
    procedure GenTimeCount();
// ���������� ����� F� TimeCount
    procedure GenTimeCountCall();
//����� ��������� ��������� ������ sTmpl � �������� ������ sSource
    function FindFromTemplate(sTmpl, sSource:string):bool ;
//���������� ������ �� ��������� ������ ����� �����������
    function SeparateString(sSource:string; var Count: Integer; var sOut: array of string): Boolean ;
// ���������� ��� ��� ������������� �������� � WinCC
// TypeDev: =1-Cpump, =2-Dpump, =3-AV, =4-�����������, =0-���������
    procedure GenWinCCObj(NumDev:Integer; TypeDev:Byte);
// ���������� ��� ��� ������������� �������� � WinCC (����� VBA ��������)
    procedure GenWinCCObjTop();
// ����� ������������ �������� � ��������� ����������
    function SearchCyrSmb(s: string): boolean;
// ������� ���� ��������� WinCC ("*_cex.csv")
    function OpenWinCC_cex(): boolean;

var
  fMain: TfMain;
  ListSmb: TStringList;
  CntDi, CntDq: Integer; // ���-�� ���������� ������ � �������
  CntDev: Integer; // ���-�� ����������������� ���������
  NumCurrFieldsDev:Integer=0; // ����� �������� �������������� ���� ��� ����������
                             // =0-�������, =1-Kx1, =2-SQ1, =3-SB1 � �.�.
  Dq: array[0..DqMax] of DQRec;
  DqFiltr:array[0..DqMax] of DqFilterRec;
  DqFiltrText:string='*'; // ������ ��� ������� ��� ������ Dq (��������� FB20)
  Di: array[0..DiMax] of DIRec;
  DiFiltr:array[0..DiMax] of DqFilterRec;
  DiFiltrText:string='*'; // ������ ��� ������� ��� ������ Di 
  FB20: array[0..FB20Max] of FB20Rec;
  FB20Prop: FB20Rec;
  FB20PropSave:Boolean=False; // ������� ��� �������� ���������� FB20Prop
  FB20ForFile: array[0..FB20Max] of FB20RecForFile;
  CurrNameDB:string='dtCom'; //��� DB � FB � �������� ����������� �-��
  CurrPosDq, CurrPosDi: Integer; //������� ���. �������� � ����. DI � DQ
  CurrFB20: Integer; // ������� FB20 �� ������
  CurrFiltrDi: Integer; // ������� ��������������� ���� Di
  OldCurrPosDq:Integer=0;
  HMSubSystem:Integer=1; // ������� ��������� ��������������� ������������(1..10)
  ListOfSubSystem: array[1..SubSystMax] of ListOfSubSystemRec;
  NeedMsgDev:Boolean=True; // ���������� �� ����������� ��������� ��� WinCC
  NeedExtraData:Boolean=True; // ���������� �� ����������� ����������� ������
  NeedAutoModeUF:Boolean=True; // ���������� �� ����������� ����� "����" ��� UF
  NeedAutoModeRO:Boolean=True; // ���������� �� ����������� ����� "����" ��� RO
  NeedAutoModeEDI:Boolean=True; // ���������� �� ����������� ����� "����" ��� EDI
  NumDB:Integer=800; // � ������ ������ ����������� �������-DB
  TemplCP:string='cp'; // ������(������) ��� ������ ������� � ����. ��������
  TemplDP:string='dp'; // ������(������) ��� ������ �������-��������� � ����. ��������
  TemplAV:string='av'; // ������(������) ��� ������ �������� � ����. ��������
  TemplHeat:string='heat'; // ������(������) ��� ������ ������������ � ����. ��������
  Spare: string='spare'; // ������(������) ��� ������ ������� � ����. ��������
  TemplQF:string='qf'; // ������(������) ��� ������ �������������� ������������ � ����. ��������
  TemplUF:string='uf'; // ������(������) ��� ����������� UF � ������ ���������
  TemplRO:string='ro'; // ������(������) ��� ����������� UF � ������ ���������
  TemplEDI:string='edi'; // ������(������) ��� ����������� UF � ������ ���������
  AddrtEnablePLCMsg:Byte=1; // ����� ������� ��� ���������� �����������
  OldName:string; // ��������� ���������� ��� �������������� ����� ���������
  PercGenPrgr: Byte;
  NameTblSmbl: string; // ��� ������� �������� �� ������ ������� ����� �����������
                       // ����� ������������ ������
  DqAddFilter: DqAddFilterRec;  // �������������� ������ ��� ������ ����������
  ItemAddFilterDQ_cbbSelDBName:Integer; // ������� ��������� ����������
  SymTablIsLoad:Boolean=False; // =True-���� ��� ��������� ������� ��������
//  AddrAiChSet,
//  AddrReStart:AddrMemoryBitRec; // ������ ��� ������� ��������
  OB32IsPresent:Boolean=False; // �������������� �� OB32 ������� ������������
  NeedLAD:Boolean=False; // �� ����������� ������������ LAD
  NameS7P:string='S7P_StPrjV13'; // ��� ���������� WinCC (��� ������������� WinCC ��������)
  CountWinCCObj:Integer; // ������� WinCC �������� (��� ��������� �� �����������)
  NeedWinCCObj:Boolean=True; // ���������� �� ����������� ������� ��� ����������� WinCC
  priCyrSmb: Boolean=False; // � ����� ���� �� ����� ���������� ������������ ������������ �������

  NameDrvWinCC, NameOSWinCC:string; //��� �������� � ��� (OS) WinCC
  NameDrvWinCCArr:array[0..20] of string[50]; //������ ��� ��������� ��� WinCC
  nNameDrvWinCC:Integer; // ���������� ������������ ��� ��������� ��� WinCC
  SepWinCC:string=';'; // ����������� � ����� ���������� WinCC
implementation

uses uSettings, ufWinGenPrgr, uAddFilterDQ, uMdw, uSelNameOSWinCC;

{$R *.dfm}
//_______________________________________________________
procedure TfMain.FormCreate(Sender: TObject);
var i:Integer;
begin

 sgDI.ColWidths[0] :=10;
 sgDI.Cells[1,0]:='���������� ���';
 sgDI.ColWidths[1] :=160;
 sgDI.Cells[2,0]:='�����';
 sgDI.ColWidths[2] :=60;
 sgDI.Cells[3,0]:='����������';
 sgDI.ColWidths[3] :=500;

 sgDq.ColWidths[0] :=10;
 sgDq.Cells[1,0]:='���������� ���';
// sgDq.Cells[1,0]:='��� ����������';
 sgDq.ColWidths[1] :=160;
 sgDq.Cells[2,0]:='�����';
 sgDq.ColWidths[2] :=60;
 sgDq.Cells[3,0]:='����������';
 sgDq.ColWidths[3] :=500;

  eName.Text:='';
  eRem.Text:='��� ������� ������� �-��� ��������� �� �����������';
  eKx1.Text:='';
  eSQ1.Text:='';
  eSB1.Text:='';
  eSU1.Text:='';
  eKx2.Text:='';
  eSQ2.Text:='';
  eSB2.Text:='';
  eSU2.Text:='';
  eOFF.Text:='';
  eDis.Text:='';
  eQFx.Text:='';
  eAck.Text:='';
  eMdt.Text:='';
  eMdx.Text:='';
  eMdw.Text:='';
  eMdu.Text:='';
  eTm1.Text:='';
  eTm2.Text:='';
  eTmx.Text:='';
  eKm1.Text:='';
  eLr1.Text:='';
  eLg1.Text:='';
  eKm2.Text:='';
  eLr2.Text:='';
  eLg2.Text:='';
  eSte.Text:='';

  eName.Enabled:=False;
  eName4Msg.Enabled:=False;  
  eRem.Enabled:=False;
  eKx1.Enabled:=False;
  eSQ1.Enabled:=False;
  eSB1.Enabled:=False;
  eSU1.Enabled:=False;
  eKx2.Enabled:=False;
  eSQ2.Enabled:=False;
  eSB2.Enabled:=False;
  eSU2.Enabled:=False;
  eOFF.Enabled:=False;
  eDis.Enabled:=False;
  eQFx.Enabled:=False;
  eAck.Enabled:=False;
  eMdt.Enabled:=False;
  eMdx.Enabled:=False;
  eMdw.Enabled:=False;
  eMdu.Enabled:=False;
  eTm1.Enabled:=False;
  eTm2.Enabled:=False;
  eTmx.Enabled:=False;
  eKm1.Enabled:=False;
  eLr1.Enabled:=False;
  eLg1.Enabled:=False;
  eKm2.Enabled:=False;
  eLr2.Enabled:=False;
  eLg2.Enabled:=False;
  eSte.Enabled:=False;

  bChNameDev.Enabled:=False;  
  bGenVarKx1.Enabled:=False;
  bGenVarSQ1.Enabled:=False;
  bGenVarSB1.Enabled:=False;
  bGenVarSU1.Enabled:=False;
  bGenVarKx2.Enabled:=False;
  bGenVarSQ2.Enabled:=False;
  bGenVarSB2.Enabled:=False;
  bGenVarSU2.Enabled:=False;
  bGenVarOFF.Enabled:=False;
  bGenVarDis.Enabled:=False;
  bGenVarQFx.Enabled:=False;
  bGenVarAck.Enabled:=False;
  bGenVarMdt.Enabled:=False;
  bGenVarMdx.Enabled:=False;
  bGenVarMdw.Enabled:=False;
  bGenVarMdu.Enabled:=False;
  bGenVarTm1.Enabled:=False;
  bGenVarTm2.Enabled:=False;
  bGenVarTmx.Enabled:=False;
  bGenVarKm1.Enabled:=False;
  bGenVarLr1.Enabled:=False;
  bGenVarLg1.Enabled:=False;
  bGenVarKm2.Enabled:=False;
  bGenVarLr2.Enabled:=False;
  bGenVarLg2.Enabled:=False;
  bGenVarSte.Enabled:=False;
    
  ListOfSubSystem[1].Name:='UF';
  ListOfSubSystem[1].Addr:=120;
  ListOfSubSystem[1].Rem:='����������������';
  ListOfSubSystem[1].NumOfDev:=5;
  ListOfSubSystem[1].MemberOfSystem:=1;

  ListOfSubSystem[2].Name:='RO';
  ListOfSubSystem[2].Addr:=140;
  ListOfSubSystem[2].Rem:='�������� �����';
  ListOfSubSystem[2].NumOfDev:=3;
  ListOfSubSystem[2].MemberOfSystem:=2;

  ListOfSubSystem[3].Name:='EDI';
  ListOfSubSystem[3].Addr:=160;
  ListOfSubSystem[3].Rem:='������������������';
  ListOfSubSystem[3].NumOfDev:=3;
  ListOfSubSystem[3].MemberOfSystem:=3;

  for i:=4 to SubSystMax do
  begin
    ListOfSubSystem[i].Name:='Com';
    ListOfSubSystem[i].Addr:=190;
    ListOfSubSystem[i].Rem:='����� ����������';
    ListOfSubSystem[i].NumOfDev:=0;
    ListOfSubSystem[i].MemberOfSystem:=0;
  end;
  HMSubSystem:=4;
  cbbSelDBName.Items.Clear;
  cbbSelDBName.Items.Add(ListOfSubSystem[1].Name);
  cbbSelDBName.Items.Add(ListOfSubSystem[2].Name);
  cbbSelDBName.Items.Add(ListOfSubSystem[3].Name);
  cbbSelDBName.Items.Add(ListOfSubSystem[4].Name);
  cbbSelDBName.ItemIndex:=3;
//  cbbSelDBName.Name:=ListOfSubSystem[1].Name;
  CurrNameDB:=cbbSelDBName.Text;
  for i:=0 to DqMax do
  begin
    DqFiltr[i].Visible:=True;
    DqFiltr[i].Num:=i;
  end;
  for i:=0 to DiMax do
  begin
    DiFiltr[i].Visible:=True;
    DiFiltr[i].Num:=i;
  end;
  eFiltrDq.Text:=DqFiltrText;
  eFiltrDi.Text:=DiFiltrText;
// ������������� ���. ������
  DqAddFilter.Device:=False;
  DqAddFilter.priNameDB:=False;
  DqAddFilter.NameDB:='';
  DqAddFilter.NeedMsg:=False;
  DqAddFilter.MsgAV:=False;
  uMain.ItemAddFilterDQ_cbbSelDBName:=0;
end;
//_______________________________________________________
procedure TfMain.bOpenPLCClick(Sender: TObject);
var
  i,j,k:Integer;
  s, s1:string;
begin
  mmoGenSmbl.Visible:=False;
  mmoGenPrgr.Visible:=False;
//  mmoRawSmbTbl.Visible:=False;
  priCyrSmb:=False;
// ��������� ���������� �������
 if OpenDialogPLC.Execute then
 begin
   SymTablIsLoad:=True;
   bGenPrgr.Enabled:=True;
  ListSmb:=TStringList.Create;
//  ListSmb.Sorted:=True;
  NameTblSmbl:=OpenDialogPLC.FileName;
  ListSmb.LoadFromFile(NameTblSmbl);
Label1.Caption:=IntToStr(ListSmb.Count);
//  mmoRawSmbTbl.Visible:=False;
// ���� ���������� �����
 j:=0;
 for i:=0 to ListSmb.Count-1 do
  begin
    s:=ListSmb.strings[i];
    if Pos('"i', s)<>0 then
    begin
      // ���������� ��� ����������
      k:=Pos('","i', LowerCase(s));
      s1:=copy(s,3,k-3);
      while pos(' ',s1)<>0 do s1:=StringReplace(s1,' ','',[rfreplaceall]);
      Di[j].name:=s1;
      if not priCyrSmb then priCyrSmb:=SearchCyrSmb(Di[j].name);
//mmoRawSmbTbl.Lines.Add('s1='+s1);
      // ���������� �����
      k:=Pos('","', s);
      Delete(s,1,k+2);
      k:=Pos('","', s);
      Di[j].Addr:=copy(s,1,k-1);
      Di[j].Addr:=DelSpace(Di[j].Addr);
      Delete(s,1,k+2);
      k:=Pos('","', s);
      Delete(s,1,k+2);
      // ���������� ����������
      k:=Pos('"', s);
      Di[j].rem:=copy(s,1,k-1);
      Di[j].rem:=DelSpace(Di[j].rem);
//mmoRawSmbTbl.Lines.Add('s='+s);
//mmoRawSmbTbl.Lines.Add('Di[j].Name=^'+Di[j].Name+'^');
//mmoRawSmbTbl.Lines.Add('Di[j].Addr=^'+Di[j].Addr+'^');
//mmoRawSmbTbl.Lines.Add('Di[j].rem=^'+Di[j].rem+'^');
//mmoRawSmbTbl.Lines.Add('###################################');
      j:=j+1;
    end;
  end;
  CntDi:=j;

// ���� ���������� ������
 j:=0;
 for i:=0 to ListSmb.Count-1 do
  begin
    s:=ListSmb.strings[i];
    if Pos('"q', s)<>0 then
    begin
      // ���������� ��� ����������
      k:=Pos('","q', LowerCase(s));
      s1:=copy(s,3,k-3);
      while pos(' ',s1)<>0 do s1:=StringReplace(s1,' ','',[rfreplaceall]);
      Dq[j].name:=s1;
//mmoRawSmbTbl.Lines.Add('s1='+s1);
      // ���������� �����
      k:=Pos('","', s);
      Delete(s,1,k+2);
      k:=Pos('","', s);
      Dq[j].Addr:=copy(s,1,k-1);
      Dq[j].Addr:=DelSpace(Dq[j].Addr);
      Delete(s,1,k+2);
      k:=Pos('","', s);
      Delete(s,1,k+2);
      // ���������� ����������
      k:=Pos('"', s);
      Dq[j].rem:=copy(s,1,k-1);
      Dq[j].rem:=DelSpace(Dq[j].rem);
//mmoRawSmbTbl.Lines.Add('s='+s);
//mmoRawSmbTbl.Lines.Add('Dq[j].Name=^'+Dq[j].Name+'^');
//mmoRawSmbTbl.Lines.Add('Dq[j].Addr=^'+Dq[j].Addr+'^');
//mmoRawSmbTbl.Lines.Add('Dq[j].rem=^'+Dq[j].rem+'^');
//mmoRawSmbTbl.Lines.Add('###################################');
// ����������� �������
      j:=j+1;
    end;
  end;
  CntDq:=j;
  ListSmb.Destroy;
  CreateMatrixDev();
//  mmoRawSmbTbl.Visible:=True;
  sgDI.RowCount:=CntDi+1;
  ShowGridDi;
  sgDq.RowCount:=CntDev+1;
// ��������� ������ ��� ������� �-���
  ShowGridDq;
  ShowFieldDev(0);
  ShowColorFieldDev;
  if Application.MessageBox('���� �������� ���������?', '������', MB_YESNO +
    MB_ICONQUESTION) = IDYES then LoadSettings
    else if NeedWinCCObj then OpenWinCC_cex;
 end;
end;
//_______________________________________________________
function DelSpace(str:string):string ;
 var s:string;
begin
  if length(str)>0 then
  begin
   s:=str;
   while pos('  ',s)<>0 do s:=StringReplace(s,'  ',' ',[rfreplaceall]);
   if s[length(s)]=' ' then delete(s, Length(s), 1);
  end
  else s:='';
  DelSpace:=s;
end;
//_______________________________________________________
procedure ShowGridDi();
var
  i,j:Integer;
begin
  j:=0;
  for i:=0 to CntDi-1 do
  begin
    if DiFiltr[i].Visible then
    begin
      fMain.sgDI.Cells[1,j+1]:=di[i].Name;
      fMain.sgDI.Cells[2,j+1]:=di[i].Addr;
      fMain.sgDI.Cells[3,j+1]:=di[i].Rem;
      j:=j+1;
    end;
  end;
  if j<>0 then fMain.sgDI.RowCount:=j+1
  else begin
    fMain.sgDI.RowCount:=2;
    fMain.sgDI.Cells[1,1]:=' ';
    fMain.sgDI.Cells[2,1]:=' ';
    fMain.sgDI.Cells[3,1]:=' ';
  end;
end;
//_______________________________________________________
procedure ShowGridDq();
var
  i,j:Integer;
begin
  j:=0;
  for i:=0 to CntDev-1 do
  begin
//    if FB20[i].NeedMsg then fMain.sgDq.Cells[0,i+1]:='@';
    if DqFiltr[i].Visible then
    begin
      fMain.sgDq.Cells[1,j+1]:=FB20[i].NameDQ;
      fMain.sgDq.Cells[2,j+1]:=FB20[i].Addr;
      fMain.sgDq.Cells[3,j+1]:=FB20[i].Rem;
      j:=j+1;
    end;
  end;
  if j<>0 then fMain.sgDq.RowCount:=j+1
  else begin
    fMain.sgDq.RowCount:=2;
    fMain.sgDq.Cells[1,1]:=' ';
    fMain.sgDq.Cells[2,1]:=' ';
    fMain.sgDq.Cells[3,1]:=' ';

  end;
end;
//_______________________________________________________
procedure TfMain.sgDqSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  OldCurrPosDq:=CurrPosDq;
  CurrPosDq:=ARow-1;
  if OldCurrPosDq <> CurrPosDq then
  begin
    OldName:=FB20[CurrFB20].Name;
    //eName.Hint:='���������� ��������: "' + OldName + '"';
    eName.Hint:='---';
    CurrFB20:=FindCurrFB20(CurrPosDq);
    ShowFieldDev(CurrFB20);
  end;

{  if ACol=0 then
  begin
    if FB20[CurrPosDq].NeedMsg then FB20[CurrPosDq].NeedMsg:=False;
    if not FB20[CurrPosDq].NeedMsg then FB20[CurrPosDq].NeedMsg:=True;
  end;
  ShowGridDq;}
end;
//_______________________________________________________
procedure TfMain.sgDISelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  CurrPosDi:=ARow-1;
  CurrFiltrDi:=FindCurrDi(CurrPosDi);
end;
//_______________________________________________________
procedure TfMain.chkEnableClick(Sender: TObject);
begin
  FB20[CurrFB20].Device:=chkEnable.Checked;
  ShowFieldDev(CurrFB20);
end;
//_______________________________________________________
// �������� ��������� s1 � s2 � Source
function FindPartOfDev(s1,s2:string):string;
var
s:string;
l:Integer;
begin
  l:=0;
  s:='';
  while l<CntDi do
    begin
      if (Pos(LowerCase(s1),LowerCase(Di[l].Name))<>0)
        and (Pos(LowerCase(s2),LowerCase(Di[l].Name))<>0)
      then
        begin
          s:='i'+Di[l].Name;
          l:=CntDi;
        end;

      l:=l+1;
    end;
  FindPartOfDev:=s;
end;
//____________________________________________________________________
// ������� ���������� � ���� ��� ������� ��������� ����������
procedure ShowFieldDev(Pos:Integer);
begin
 with fMain do
 begin
  if FB20[Pos].Device and (Pos>=0) then
  begin
  eName.Enabled:=True;
  eName4Msg.Enabled:=True;
  eRem.Enabled:=True;
  eKx1.Enabled:=True;
  eSQ1.Enabled:=True;
  eSB1.Enabled:=True;
  eSU1.Enabled:=True;
  eKx2.Enabled:=True;
  eSQ2.Enabled:=True;
  eSB2.Enabled:=True;
  eSU2.Enabled:=True;
  eOFF.Enabled:=True;
  eDis.Enabled:=True;
  eQFx.Enabled:=True;
  eAck.Enabled:=True;
  eMdt.Enabled:=True;
  eMdx.Enabled:=True;
  eMdw.Enabled:=True;
  eMdu.Enabled:=True;
  eTm1.Enabled:=True;
  eTm2.Enabled:=True;
  eTmx.Enabled:=True;
  eKm1.Enabled:=True;
  eLr1.Enabled:=True;
  eLg1.Enabled:=True;
  eKm2.Enabled:=True;
  eLr2.Enabled:=True;
  eLg2.Enabled:=True;
  eSte.Enabled:=True;

  chkWinCCKx1.Enabled:=True;
  chkWinCCSQ1.Enabled:=True;
  chkWinCCSB1.Enabled:=True;
  chkWinCCSU1.Enabled:=True;
  chkWinCCKx2.Enabled:=True;
  chkWinCCSQ2.Enabled:=True;
  chkWinCCSB2.Enabled:=True;
  chkWinCCSU2.Enabled:=True;
  chkWinCCOFF.Enabled:=True;
  chkWinCCDis.Enabled:=True;
  chkWinCCQFx.Enabled:=True;
  chkWinCCAck.Enabled:=True;
  chkWinCCMdt.Enabled:=True;
  chkWinCCMdx.Enabled:=True;
  chkWinCCMdw.Enabled:=True;
  chkWinCCMdu.Enabled:=True;
  chkWinCCTm1.Enabled:=True;
  chkWinCCTm2.Enabled:=True;
  chkWinCCTmx.Enabled:=True;
  chkWinCCKm1.Enabled:=True;
  chkWinCCLr1.Enabled:=True;
  chkWinCCLg1.Enabled:=True;
  chkWinCCKm2.Enabled:=True;
  chkWinCCLr2.Enabled:=True;
  chkWinCCLg2.Enabled:=True;
  chkWinCCSte.Enabled:=True;

  chkWinCCKx1.Checked:=FB20[Pos].Kx1_S7mc;
  chkWinCCSQ1.Checked:=FB20[Pos].SQ1_S7mc;
  chkWinCCSB1.Checked:=FB20[Pos].SB1_S7mc;
  chkWinCCSU1.Checked:=FB20[Pos].SU1_S7mc;
  chkWinCCKx2.Checked:=FB20[Pos].Kx2_S7mc;
  chkWinCCSQ2.Checked:=FB20[Pos].SQ2_S7mc;
  chkWinCCSB2.Checked:=FB20[Pos].SB2_S7mc;
  chkWinCCSU2.Checked:=FB20[Pos].SU2_S7mc;
  chkWinCCOFF.Checked:=FB20[Pos].OFF_S7mc;
  chkWinCCDis.Checked:=FB20[Pos].Dis_S7mc;
  chkWinCCQFx.Checked:=FB20[Pos].QFx_S7mc;
  chkWinCCAck.Checked:=FB20[Pos].Ack_S7mc;
  chkWinCCMdt.Checked:=FB20[Pos].Mdt_S7mc;
  chkWinCCMdx.Checked:=FB20[Pos].Mdx_S7mc;
  chkWinCCMdw.Checked:=FB20[Pos].Mdw_S7mc;
  chkWinCCMdu.Checked:=FB20[Pos].Mdu_S7mc;
  chkWinCCTm1.Checked:=FB20[Pos].Tm1_S7mc;
  chkWinCCTm2.Checked:=FB20[Pos].Tm2_S7mc;
  chkWinCCTmx.Checked:=FB20[Pos].Tmx_S7mc;
  chkWinCCKm1.Checked:=FB20[Pos].Km1_S7mc;
  chkWinCCLr1.Checked:=FB20[Pos].Lr1_S7mc;
  chkWinCCLg1.Checked:=FB20[Pos].Lg1_S7mc;
  chkWinCCKm2.Checked:=FB20[Pos].Km2_S7mc;
  chkWinCCLr2.Checked:=FB20[Pos].Lr2_S7mc;
  chkWinCCLg2.Checked:=FB20[Pos].Lg2_S7mc;
  chkWinCCSte.Checked:=FB20[Pos].Ste_S7mc;

  bChNameDev.Enabled:=True;
  bGenVarKx1.Enabled:=True;
  bGenVarSQ1.Enabled:=True;
  bGenVarSB1.Enabled:=True;
  bGenVarSU1.Enabled:=True;
  bGenVarKx2.Enabled:=True;
  bGenVarSQ2.Enabled:=True;
  bGenVarSB2.Enabled:=True;
  bGenVarSU2.Enabled:=True;
  bGenVarOFF.Enabled:=True;
  bGenVarDis.Enabled:=True;
  bGenVarQFx.Enabled:=True;
  bGenVarAck.Enabled:=True;
  bGenVarMdt.Enabled:=True;
  bGenVarMdx.Enabled:=True;
  bGenVarMdw.Enabled:=True;
  bGenVarMdu.Enabled:=True;
  bGenVarTm1.Enabled:=True;
  bGenVarTm2.Enabled:=True;
  bGenVarTmx.Enabled:=True;
  bGenVarKm1.Enabled:=True;
  bGenVarLr1.Enabled:=True;
  bGenVarLg1.Enabled:=True;
  bGenVarKm2.Enabled:=True;
  bGenVarLr2.Enabled:=True;
  bGenVarLg2.Enabled:=True;
  bGenVarSte.Enabled:=True;

  eName.Text:=FB20[Pos].Name;
  eName4Msg.Text:=FB20[Pos].Name4Msg;
  eRem.Text:=FB20[Pos].Rem;
  eKx1.Text:=FB20[Pos].Kx1;
  eSQ1.Text:=FB20[Pos].SQ1;
  eSB1.Text:=FB20[Pos].SB1;
  eSU1.Text:=FB20[Pos].SU1;
  eKx2.Text:=FB20[Pos].Kx2;
  eSQ2.Text:=FB20[Pos].SQ2;
  eSB2.Text:=FB20[Pos].SB2;
  eSU2.Text:=FB20[Pos].SU2;
  eOFF.Text:=FB20[Pos].OFF;
  eDis.Text:=FB20[Pos].Dis;
  eQFx.Text:=FB20[Pos].QFx;
  eAck.Text:=FB20[Pos].Ack;
  eMdt.Text:=FB20[Pos].Mdt;
  eMdx.Text:=FB20[Pos].Mdx;
  eMdw.Text:=FB20[Pos].Mdw;
  eMdu.Text:=FB20[Pos].Mdu;
  eTm1.Text:=FB20[Pos].Tm1;
  eTm2.Text:=FB20[Pos].Tm2;
  eTmx.Text:=FB20[Pos].TmX;
  eKm1.Text:=FB20[Pos].Km1;
  eLr1.Text:=FB20[Pos].Lr1;
  eLg1.Text:=FB20[Pos].Lg1;
  eKm2.Text:=FB20[Pos].Km2;
  eLr2.Text:=FB20[Pos].Lr2;
  eLg2.Text:=FB20[Pos].Lg2;
  eSte.Text:=FB20[Pos].Ste;
  end
  else
  begin
  eName.Text:='';
  eName4Msg.Text:='';
  eRem.Text:='��� ������� ������� �-��� ��������� �� �����������';
  eKx1.Text:='';
  eSQ1.Text:='';
  eSB1.Text:='';
  eSU1.Text:='';
  eKx2.Text:='';
  eSQ2.Text:='';
  eSB2.Text:='';
  eSU2.Text:='';
  eOFF.Text:='';
  eDis.Text:='';
  eQFx.Text:='';
  eAck.Text:='';
  eMdt.Text:='';
  eMdx.Text:='';
  eMdw.Text:='';
  eMdu.Text:='';
  eTm1.Text:='';
  eTm2.Text:='';
  eTmx.Text:='';
  eKm1.Text:='';
  eLr1.Text:='';
  eLg1.Text:='';
  eKm2.Text:='';
  eLr2.Text:='';
  eLg2.Text:='';
  eSte.Text:='';

  eName.Enabled:=False;
  eName4Msg.Enabled:=False;
  eRem.Enabled:=False;
  eKx1.Enabled:=False;
  eSQ1.Enabled:=False;
  eSB1.Enabled:=False;
  eSU1.Enabled:=False;
  eKx2.Enabled:=False;
  eSQ2.Enabled:=False;
  eSB2.Enabled:=False;
  eSU2.Enabled:=False;
  eOFF.Enabled:=False;
  eDis.Enabled:=False;
  eQFx.Enabled:=False;
  eAck.Enabled:=False;
  eMdt.Enabled:=False;
  eMdx.Enabled:=False;
  eMdw.Enabled:=False;
  eMdu.Enabled:=False;
  eTm1.Enabled:=False;
  eTm2.Enabled:=False;
  eTmx.Enabled:=False;
  eKm1.Enabled:=False;
  eLr1.Enabled:=False;
  eLg1.Enabled:=False;
  eKm2.Enabled:=False;
  eLr2.Enabled:=False;
  eLg2.Enabled:=False;
  eSte.Enabled:=False;

  chkWinCCKx1.Enabled:=False;
  chkWinCCSQ1.Enabled:=False;
  chkWinCCSB1.Enabled:=False;
  chkWinCCSU1.Enabled:=False;
  chkWinCCKx2.Enabled:=False;
  chkWinCCSQ2.Enabled:=False;
  chkWinCCSB2.Enabled:=False;
  chkWinCCSU2.Enabled:=False;
  chkWinCCOFF.Enabled:=False;
  chkWinCCDis.Enabled:=False;
  chkWinCCQFx.Enabled:=False;
  chkWinCCAck.Enabled:=False;
  chkWinCCMdt.Enabled:=False;
  chkWinCCMdx.Enabled:=False;
  chkWinCCMdw.Enabled:=False;
  chkWinCCMdu.Enabled:=False;
  chkWinCCTm1.Enabled:=False;
  chkWinCCTm2.Enabled:=False;
  chkWinCCTmx.Enabled:=False;
  chkWinCCKm1.Enabled:=False;
  chkWinCCLr1.Enabled:=False;
  chkWinCCLg1.Enabled:=False;
  chkWinCCKm2.Enabled:=False;
  chkWinCCLr2.Enabled:=False;
  chkWinCCLg2.Enabled:=False;
  chkWinCCSte.Enabled:=False;

  bChNameDev.Enabled:=False;
  bGenVarKx1.Enabled:=False;
  bGenVarSQ1.Enabled:=False;
  bGenVarSB1.Enabled:=False;
  bGenVarSU1.Enabled:=False;
  bGenVarKx2.Enabled:=False;
  bGenVarSQ2.Enabled:=False;
  bGenVarSB2.Enabled:=False;
  bGenVarSU2.Enabled:=False;
  bGenVarOFF.Enabled:=False;
  bGenVarDis.Enabled:=False;
  bGenVarQFx.Enabled:=False;
  bGenVarAck.Enabled:=False;
  bGenVarMdt.Enabled:=False;
  bGenVarMdx.Enabled:=False;
  bGenVarMdw.Enabled:=False;
  bGenVarMdu.Enabled:=False;
  bGenVarTm1.Enabled:=False;
  bGenVarTm2.Enabled:=False;
  bGenVarTmx.Enabled:=False;
  bGenVarKm1.Enabled:=False;
  bGenVarLr1.Enabled:=False;
  bGenVarLg1.Enabled:=False;
  bGenVarKm2.Enabled:=False;
  bGenVarLr2.Enabled:=False;
  bGenVarLg2.Enabled:=False;
  bGenVarSte.Enabled:=False;
  end;
  chkEnable.Checked:=FB20[Pos].Device;
  chkNeedMsg.Checked:=FB20[Pos].NeedMsg;
  chkMsgAV.Checked:=FB20[Pos].MsgAV;
  Label2.Enabled:=FB20[Pos].Device;
  Label3.Enabled:=FB20[Pos].Device;
  Label6.Enabled:=FB20[Pos].Device;
//��� ���������� =1-������, =2-��������, =3-�������, =4-�����������, =0-���������
  case FB20[Pos].TypeDev of
    0:lblTypeDev.Caption:='---';
    1:lblTypeDev.Caption:=' M ';
    2:lblTypeDev.Caption:=' D ';
    3:lblTypeDev.Caption:=' V ';
    4:lblTypeDev.Caption:=' H ';
  else lblTypeDev.Caption:='---';
  end;    
 end;
 ShowColorFieldDev();
end;
//____________________________________________________________________
// ������ ������� ������������� ����
procedure ShowColorFieldDev();
begin
  fMain.eKx1.Color:=clWindow;
  fMain.eKx1.Font.Color:=clWindowText;
  fMain.eKx2.Color:=clWindow;
  fMain.eKx2.Font.Color:=clWindowText;
  fMain.eSQ1.Color:=clWindow;
  fMain.eSQ1.Font.Color:=clWindowText;
  fMain.eSQ2.Color:=clWindow;
  fMain.eSQ2.Font.Color:=clWindowText;
  fMain.eSB1.Color:=clWindow;
  fMain.eSB1.Font.Color:=clWindowText;
  fMain.eSB2.Color:=clWindow;
  fMain.eSB2.Font.Color:=clWindowText;
  fMain.eSU1.Color:=clWindow;
  fMain.eSU1.Font.Color:=clWindowText;
  fMain.eSU2.Color:=clWindow;
  fMain.eSU2.Font.Color:=clWindowText;
  fMain.eOFF.Color:=clWindow;
  fMain.eOFF.Font.Color:=clWindowText;
  fMain.eDis.Color:=clWindow;
  fMain.eDis.Font.Color:=clWindowText;
  fMain.eQFx.Color:=clWindow;
  fMain.eQFx.Font.Color:=clWindowText;
  fMain.eAck.Color:=clWindow;
  fMain.eAck.Font.Color:=clWindowText;
  fMain.eMdt.Color:=clWindow;
  fMain.eMdt.Font.Color:=clWindowText;
  fMain.eMdx.Color:=clWindow;
  fMain.eMdx.Font.Color:=clWindowText;
  fMain.eMdw.Color:=clWindow;
  fMain.eMdw.Font.Color:=clWindowText;
  fMain.eMdu.Color:=clWindow;
  fMain.eMdu.Font.Color:=clWindowText;
  fMain.eTm1.Color:=clWindow;
  fMain.eTm1.Font.Color:=clWindowText;
  fMain.eTm2.Color:=clWindow;
  fMain.eTm2.Font.Color:=clWindowText;
  fMain.eTmx.Color:=clWindow;
  fMain.eTmX.Font.Color:=clWindowText;
  fMain.eKm1.Color:=clWindow;
  fMain.eKm1.Font.Color:=clWindowText;
  fMain.eKm2.Color:=clWindow;
  fMain.eKm2.Font.Color:=clWindowText;
  fMain.eLr1.Color:=clWindow;
  fMain.eLr1.Font.Color:=clWindowText;
  fMain.eLr2.Color:=clWindow;
  fMain.eLr2.Font.Color:=clWindowText;
  fMain.eLg1.Color:=clWindow;
  fMain.eLg1.Font.Color:=clWindowText;
  fMain.eLg2.Color:=clWindow;
  fMain.eLg2.Font.Color:=clWindowText;
  fMain.eSte.Color:=clWindow;
  fMain.eSte.Font.Color:=clWindowText;

  case NumCurrFieldsDev of
  1:begin
      fMain.eKx1.Color:=clHotLight; //clMenuHighlight;;
      fMain.eKx1.Font.Color:=clHighlightText;
    end;
  2:begin
      fMain.eSQ1.Color:=clHotLight; //clMenuHighlight;;
      fMain.eSQ1.Font.Color:=clHighlightText;
    end;
  3:begin
      fMain.eSB1.Color:=clHotLight; //clMenuHighlight;;
      fMain.eSB1.Font.Color:=clHighlightText;
    end;
  4:begin
      fMain.eSU1.Color:=clHotLight; //clMenuHighlight;;
      fMain.eSU1.Font.Color:=clHighlightText;
    end;
  5:begin
      fMain.eKx2.Color:=clHotLight; //clMenuHighlight;;
      fMain.eKx2.Font.Color:=clHighlightText;
    end;
  6:begin
      fMain.eSQ2.Color:=clHotLight; //clMenuHighlight;;
      fMain.eSQ2.Font.Color:=clHighlightText;
    end;
  7:begin
      fMain.eSB2.Color:=clHotLight; //clMenuHighlight;;
      fMain.eSB2.Font.Color:=clHighlightText;
    end;
  8:begin
      fMain.eSU2.Color:=clHotLight; //clMenuHighlight;;
      fMain.eSU2.Font.Color:=clHighlightText;
    end;
  9:begin
      fMain.eOFF.Color:=clHotLight; //clMenuHighlight;;
      fMain.eOFF.Font.Color:=clHighlightText;
    end;
  10:begin
      fMain.eDis.Color:=clHotLight; //clMenuHighlight;;
      fMain.eDis.Font.Color:=clHighlightText;
    end;
  11:begin
      fMain.eQFx.Color:=clHotLight; //clMenuHighlight;;
      fMain.eQFx.Font.Color:=clHighlightText;
    end;
  12:begin
      fMain.eAck.Color:=clHotLight; //clMenuHighlight;;
      fMain.eAck.Font.Color:=clHighlightText;
    end;
  13:begin
      fMain.eMdt.Color:=clHotLight; //clMenuHighlight;;
      fMain.eMdt.Font.Color:=clHighlightText;
    end;
  14:begin
      fMain.eMdx.Color:=clHotLight; //clMenuHighlight;;
      fMain.eMdx.Font.Color:=clHighlightText;
    end;
  15:begin
      fMain.eMdw.Color:=clHotLight; //clMenuHighlight;;
      fMain.eMdw.Font.Color:=clHighlightText;
    end;
  16:begin
      fMain.eMdu.Color:=clHotLight; //clMenuHighlight;;
      fMain.eMdu.Font.Color:=clHighlightText;
    end;
  17:begin
      fMain.eTm1.Color:=clHotLight; //clMenuHighlight;;
      fMain.eTm1.Font.Color:=clHighlightText;
    end;
  18:begin
      fMain.eTm2.Color:=clHotLight; //clMenuHighlight;;
      fMain.eTm2.Font.Color:=clHighlightText;
    end;
  19:begin
      fMain.eTmx.Color:=clHotLight; //clMenuHighlight;;
      fMain.eTmX.Font.Color:=clHighlightText;
    end;
  20:begin
      fMain.eKm1.Color:=clHotLight; //clMenuHighlight;;
      fMain.eKm1.Font.Color:=clHighlightText;
    end;
  21:begin
      fMain.eLr1.Color:=clHotLight; //clMenuHighlight;;
      fMain.eLr1.Font.Color:=clHighlightText;
    end;
  22:begin
      fMain.eLg1.Color:=clHotLight; //clMenuHighlight;;
      fMain.eLg1.Font.Color:=clHighlightText;
    end;
  23:begin
      fMain.eKm2.Color:=clHotLight; //clMenuHighlight;;
      fMain.eKm2.Font.Color:=clHighlightText;
    end;
  24:begin
      fMain.eLr2.Color:=clHotLight; //clMenuHighlight;;
      fMain.eLr2.Font.Color:=clHighlightText;
    end;
  25:begin
      fMain.eLg2.Color:=clHotLight; //clMenuHighlight;;
      fMain.eLg2.Font.Color:=clHighlightText;
    end;
  26:begin
      fMain.eSte.Color:=clHotLight; //clMenuHighlight;
      fMain.eSte.Font.Color:=clHighlightText;
    end;
  end;
end;
//____________________________________________________________________
// ���������� ����� ��������� ���������� � ������
function SaveStr(StrIn:string):string;
begin
  SaveStr:=StrIn;
end;

procedure CreateMatrixDev();
var
  i,j,k,n,m:Integer;
  s:string;
  sArr: array [1..100] of string;
  dev:Boolean;
begin
  i:=0;
  For j:=0 to CntDq-1 do
    begin
    if NotSpare(Dq[j].Name) then
     begin
      FB20[i].NameDB:='"dt'+CurrNameDB+'"';
//      FB20[i].idSubSystem:=fMain.cbbSelDBName.ItemIndex+1;
      FB20[i].Name:=ReplaceBadChar(Dq[j].Name);
//      FB20[i].Name:=StringReplace(Dq[j].Name,'-','_',[rfreplaceall]);
//      FB20[i].Name:=StringReplace(FB20[i].Name,'+','_',[rfreplaceall]);
//      FB20[i].Name:=StringReplace(FB20[i].Name,'.','_',[rfreplaceall]);
      FB20[i].Name4Msg:=Dq[j].Name; //FB20[i].Name;
      FB20[i].Rem:=Dq[j].Rem;
      FB20[i].NameDQ:=Dq[j].Name;
      FB20[i].Addr:=Dq[j].Addr;

      // ���������� �������������� � ������������ ����������
      FB20[i].Device:=False;
      FB20[i].TypeDev:=0;
      m:=1;

      while (m<=4) and (FB20[i].Device=False) do
      begin
        k:=1;
        case m of
          1: SeparateString(TemplCP, n, sArr);
          2: SeparateString(TemplDP, n, sArr);
          3: SeparateString(TemplAV, n, sArr);
          4: SeparateString(TemplHeat, n, sArr);
        end;

        while (k<=n) and (FB20[i].Device=False) do
        begin
          if FindFromTemplate(sArr[k],FB20[i].Name)
          then begin
            FB20[i].Device:=True;
            FB20[i].TypeDev:=m;
          end
          else Inc(k);
        end;
        Inc(m);
      end;

(*      if  FindFromTemplate(TemplAV,FB20[i].Name) or
          FindFromTemplate(TemplCP,FB20[i].Name) or
          FindFromTemplate(TemplDP,FB20[i].Name) or
          FindFromTemplate(TemplHeat,FB20[i].Name)
      then FB20[i].Device:=True
      else
      begin
       FB20[i].Device:=False;
       FB20[i].TypeDev:=0;
      end;
*)

      FB20[i].MsgAV:=False;
      {if  (Pos('av',LowerCase(FB20[i].Name))<>0)
      then FB20[i].MsgAV:=True
      else FB20[i].MsgAV:=False;}

      FB20[i].NeedMsg:=NeedMsgDev;
      
      FB20[i].Kx1:='';
      FB20[i].SQ1:='';
      FB20[i].SB1:=FB20[i].NameDB+'.cm'+FB20[i].Name+'HandOn';
      FB20[i].SB1_S7mc:=True;
      FB20[i].SU1:='';

      FB20[i].Kx2:='';
      FB20[i].SQ2:='';
      FB20[i].SB2:=''; //FB20[i].NameDB+'.cm'+FB20[i].Name+'HandOff';
      //FB20[i].SB2_S7mc:=True;
      FB20[i].SU2:='';

      FB20[i].OFF:='';
      FB20[i].Dis:=FB20[i].NameDB+'.b'+FB20[i].Name;

      s:=FindPartOfDev(FB20[i].Name,TemplQF);
      if NoBlank(s) then FB20[i].QFx:='"'+s+'"' else FB20[i].QFx:='';

      FB20[i].Ack:='"_Ack"';
      FB20[i].Mdt:='';
      FB20[i].Mdx:=FB20[i].NameDB+'.Mode'+FB20[i].Name;
      FB20[i].Mdx_S7mc:=True;
      FB20[i].Mdw:='W#16#8100';
      FB20[i].Mdu:='W#16#8000';
      FB20[i].Tm1:='';
      FB20[i].Tm2:='';
      FB20[i].TmX:='';

      FB20[i].Km1:='"q'+Dq[j].Name+'"';
      FB20[i].Lr1:='';
      FB20[i].Lg1:='';

      FB20[i].Km2:='';
      FB20[i].Lr2:='';
      FB20[i].Lg2:='';

      FB20[i].Ste:=FB20[i].NameDB+'.st'+FB20[i].Name;
      FB20[i].Ste_S7mc:=True;

      i:=i+1;
     end;
    end;
  CntDev:=i;
end;
//____________________________________________________________________
//�������� �������� ���������� � ������ ����������
// (���������� ������ ��� ��� �-��� � ������ ������)
procedure ChangeNameDBForDev();
var
  i:Integer;
  OldNameDB, NewNameDB:string;
begin
  if CurrFB20<0 then Exit;
  i:=CurrFB20;
  OldNameDB:=FB20[i].NameDB;
  NewNameDB:='"dt'+CurrNameDB+'"';
  FB20[i].NameDB:=NewNameDB;

  FB20[i].Kx1:=StringReplace(FB20[i].Kx1,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].SQ1:=StringReplace(FB20[i].SQ1,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].SB1:=StringReplace(FB20[i].SB1,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].SU1:=StringReplace(FB20[i].SU1,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Kx2:=StringReplace(FB20[i].Kx2,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].SQ2:=StringReplace(FB20[i].SQ2,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].SB2:=StringReplace(FB20[i].SB2,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].SU2:=StringReplace(FB20[i].SU2,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].OFF:=StringReplace(FB20[i].OFF,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Dis:=StringReplace(FB20[i].Dis,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].QFx:=StringReplace(FB20[i].QFx,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Ack:=StringReplace(FB20[i].Ack,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Mdt:=StringReplace(FB20[i].Mdt,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Mdx:=StringReplace(FB20[i].Mdx,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Mdw:=StringReplace(FB20[i].Mdw,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Mdu:=StringReplace(FB20[i].Mdu,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Tm1:=StringReplace(FB20[i].Tm1,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Tm2:=StringReplace(FB20[i].Tm2,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].TmX:=StringReplace(FB20[i].TmX,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Km1:=StringReplace(FB20[i].Km1,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Lr1:=StringReplace(FB20[i].Lr1,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Lg1:=StringReplace(FB20[i].Lg1,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Km2:=StringReplace(FB20[i].Km2,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Lr2:=StringReplace(FB20[i].Lr2,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Lg2:=StringReplace(FB20[i].Lg2,OldNameDB,NewNameDB,[rfreplaceall]);
  FB20[i].Ste:=StringReplace(FB20[i].Ste,OldNameDB,NewNameDB,[rfreplaceall]);
end;
//____________________________________________________________________
//��������� ��������� �� ����� ���������
function NotSpare(s:string):Boolean;
var
  b:Boolean;
begin
  if Pos(LowerCase(Spare),LowerCase(s))=0 then b:=True else b:=False;
  NotSpare:=b;
end;
//____________________________________________________________________
//�������������� ����� � ������ (��� ����� �������� ���� "_NNN")
function Num2Lbl(n:Integer): string;
var
  s:string;
  x:Integer;
begin
  s:=IntToStr(n);
  if n<=9 then s:='_00'+s else
    if n<=99 then s:='_0'+s else
      if n<=999 then s:='_'+s else
      begin
        x:=Trunc(n/1000);
        case x of
          1:s:='a';
          2:s:='b';
          3:s:='c';
          4:s:='d';
          5:s:='e';
          6:s:='f';
          7:s:='g';
          8:s:='h';
          9:s:='j';
        end;
        s:=s+IntToStr(n-x*1000);
      end;
  Num2Lbl:=s;
end;

procedure TfMain.bFB20TuneClick(Sender: TObject);
begin
WinExec('FB20Tune.exe', SW_SHOW);
end;

procedure TfMain.btnSettingClick(Sender: TObject);
begin
fSetting.ShowModal;
end;

procedure TfMain.bAckChNameDBClick(Sender: TObject);
begin
  ChangeNameDBForDev();
  ShowFieldDev(CurrFB20);
end;

procedure TfMain.cbbSelDBNameChange(Sender: TObject);
begin
  CurrNameDB:=cbbSelDBName.Text;
//  Label1.Caption:=IntToStr(cbbSelDBName.ItemIndex);
end;

procedure TfMain.sgDqDblClick(Sender: TObject);
begin
  ChangeNameDBForDev();
  ShowFieldDev(CurrFB20);
end;
//____________________________________________________________________
//����� ��������� ��������� ������ sTmpl � �������� ������ sSource
function FindFromTemplate(sTmpl, sSource:string):bool ;
var
  b:BOOL;
  sPart, sSepWord:array[0..100] of string;
  i, n, k, SepNum, j:integer;
  s:string;
begin
 SeparateString(sSource, SepNum, sSepWord);
 for j:=0 to SepNum-1 do
 begin
  s:=sSepWord[j];
  s:=StringReplace(sTmpl,'**','*',[rfReplaceAll]);
  s:=StringReplace(s,'**','*',[rfReplaceAll]);
  if (Pos('*',s)=0) or (s='*') then
    if (Pos(LowerCase(s),LowerCase(sSource))<>0) or (s='*') then b:=True else b:=False
  else
  begin
    for i:=0 to 10 do sPart[i]:='';
    s:=sTmpl+'*';
    k:=Pos('*',s);
    n:=0;
    while (length(s)>0) and (k>0) do
      begin
        if k>1 then
        begin
          sPart[n]:=copy(s,1,k-1);
          inc(n);
        end;
        delete(s,1,k);
        k:=Pos('*',s);
      end;
    b:=True;
    for i:=0 to n-1 do
      if (Pos(LowerCase(sPart[i]),LowerCase(sSource))=0) then b:=False;
  end;
 end;
  FindFromTemplate:=b;
end;

//____________________________________________________________________
//���������� ������ �� ��������� ������ ����� �����������
function SeparateString(sSource:string; var Count: Integer; var sOut: array of string): Boolean ;
var
  b:BOOL;
  sPart:array[0..100] of string;
  i, n, k:integer;
  s:string;
begin
  n:=0;
  s:=StringReplace(sSource,',,',',',[rfReplaceAll]);
  s:=StringReplace(s,',,',',',[rfReplaceAll]);
  if (Pos(',',s)=0) or (s=',') then begin
    b:=False;
    sPart[0]:=s;
    inc(n);
  end
  else begin
    for i:=0 to 100 do sPart[i]:='';
    s:=sSource+',';
    k:=Pos(',',s);
    n:=0;
    while (length(s)>0) and (k>0) do
      begin
        if k>1 then
        begin
          sPart[n]:=copy(s,1,k-1);
          inc(n);
        end;
        delete(s,1,k);
        k:=Pos(',',s);
      end;
    b:=True;
    for i:=0 to n-1 do
      if (Pos(LowerCase(sPart[i]),LowerCase(sSource))=0) then b:=False;
  end;

  for i:=0 to n-1 do sOut[i]:=sPart[i];
//  for i:=0 to n-1 do fMain.mmoOut.Lines.Add(sPart[i]);
  Count:=n;
  SeparateString:=b;
end;
//____________________________________________________________________
//�������� ������ ������ ��� ���
function NoBlank(s:string):Boolean;
var
  s1:string;
  b:Boolean;
begin
  s1:=DelSpace(s);
  if Length(s1)>0 then b:=True else b:=False;
  NoBlank:=b;
end;

//____________________________________________________________________
//���������� ������ ���������
procedure TfMain.bGenPrgrClick(Sender: TObject);
var
  s,sType,sDev:string;
  i,j,k,n:Integer;
  st:Int64;
begin
  if CheckErr then Exit;
// ������������� ��������� ����������
  PercGenPrgr:=0;
  fWinGenPrgr.bClose.Enabled:=False;
  fWinGenPrgr.Caption:='���������� ���������...';
  fWinGenPrgr.lblProgressText.Caption:='���������� ���������...';
  fWinGenPrgr.Show;
  CountWinCCObj:=0;
// ������� ���� memo
  mmoGenSmbl.Clear;
  mmoGenPrgr.Clear;
  mmoGenTxtLbr.Clear;
  mmoGenWinCCObj.Clear;
// �� ����� ��������� ������ ��� ��������� �������� -
// ���� Memo ������ ����������
  mmoGenSmbl.Visible:=False;
  mmoGenPrgr.Visible:=False;
  mmoGenTxtLbr.Visible:=False;
// ---
  if NeedWinCCObj then GenWinCCObjTop;
// ###########################################
// ## ��������� ���������� ������� �������� ##
// ###########################################
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
//  mmoGenSmbl.Lines.Add('"_Ack","M 2.1 ","BOOL","������������� ������"');
//  mmoGenSmbl.Lines.Add('"tEnablePLCMsg ","T'+IntToStr(AddrtEnablePLCMsg)+' ","TIMER ","������ ��� ���������� ������ ��� ��������� "');
  mmoGenSmbl.Lines.Add('"CYC_INT5 ","OB     35   ","OB     35 ","Cyclic Interrupt 5 "');
  if OB32IsPresent then
  mmoGenSmbl.Lines.Add('"CYC_INT2 ","OB     32   ","OB     32 ","Cyclic Interrupt 2 "');
  for i:=1 to HMSubSystem do
  begin
    mmoGenSmbl.Lines.Add('"'+ListOfSubSystem[i].Name+'Cntrl","FB     '+IntToStr(ListOfSubSystem[i].Addr)+'","FB     '+IntToStr(ListOfSubSystem[i].Addr)+' ","'+ListOfSubSystem[i].Rem+'"');
    mmoGenSmbl.Lines.Add('"db4'+ListOfSubSystem[i].Name+'Cntrl","DB     '+IntToStr(ListOfSubSystem[i].Addr)+'","FB     '+IntToStr(ListOfSubSystem[i].Addr)+' ","�������. ������: '+ListOfSubSystem[i].Rem+'"');
    mmoGenSmbl.Lines.Add('"dt'+ListOfSubSystem[i].Name+'","DB     '+IntToStr(ListOfSubSystem[i].Addr+2)+'","DB     '+IntToStr(ListOfSubSystem[i].Addr+2)+' ","������: '+ListOfSubSystem[i].Rem+'"');
  end;
// ��������� ������� DB ��������� ��� ��������� �� HMI
// � ��������� ���������� ��� ���������
  j:=0;
  if NeedMsgDev then
  begin
    for i:=0 to CntDev-1 do
    begin
      if FB20[i].Device and FB20[i].NeedMsg then
      begin
        if FB20[i].MsgAV then s:='FB 21' else s:='FB 22';
        mmoGenSmbl.Lines.Add('"msg'+FB20[i].Name+'","DB '+IntToStr(NumDB+j)+'","'+s+'","'+FB20[i].Rem+'"');
        // ��������� ��������� ����������
        mmoGenTxtLbr.Lines.Add(IntToStr(NumDB+j)+';'+FB20[i].Name4Msg+';');
        j:=j+1;
      end;
    end;
  end;
// ���������� ������� ��� ��������������� ������  
  GenSymData4Auto;
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
// ###########################################
// ## ��������� ���������
// ###########################################
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
for i:=1 to HMSubSystem do
begin
  mmoGenPrgr.Lines.Add('DATA_BLOCK "dt'+ListOfSubSystem[i].Name+'"');
  mmoGenPrgr.Lines.Add('TITLE ='+ListOfSubSystem[i].Rem);
  mmoGenPrgr.Lines.Add('AUTHOR : daf');
  mmoGenPrgr.Lines.Add('FAMILY : '+ListOfSubSystem[i].Name);
  mmoGenPrgr.Lines.Add('NAME : dt'+ListOfSubSystem[i].Name);
  mmoGenPrgr.Lines.Add('VERSION : 0.1');
  mmoGenPrgr.Lines.Add(' ');
  mmoGenPrgr.Lines.Add('  STRUCT');

 if NeedExtraData then  // ���������� �������������� ������ ��� ����������
 begin
  mmoGenPrgr.Lines.Add('Spare_00 : BYTE ;	//===========����������==========================================================');
  mmoGenPrgr.Lines.Add('Mode { S7_m_c := '+#39+'true'+#39+' }: BOOL ;	//����� ������: =0-������, =1-�������           ');

  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('Mode'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: BOOL ;	//����� ������: =0-������, =1-������� (������ '+IntToStr(j)+')');

  mmoGenPrgr.Lines.Add('Stup { S7_m_c := '+#39+'true'+#39+' }: BYTE ;	//������� ������� (�������� ������� ��������, � ����������� �� ��������� ������)');
  mmoGenPrgr.Lines.Add('NumberDev : BYTE ;	//������� ������� ����� ��������)');

  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('WorkDev'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: BOOL ;	//������ '+IntToStr(j)+' ��������');

  mmoGenPrgr.Lines.Add('cmNeedRun { S7_m_c := '+#39+'true'+#39+' }: BOOL ;	//������� ��������� � �������������� ������: =1-����');

  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('cmNeedStopDev'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: BOOL ;	//��������� ���� ��� ������ '+IntToStr(j)+' (�� HMI)');

  mmoGenPrgr.Lines.Add('LvlCurr : REAL ;	//������� ������� � ����');
  if ListOfSubSystem[i].MemberOfSystem = 1 then
  begin
  mmoGenPrgr.Lines.Add('Lvl4BWOk : BOOL ;	//������� ��� ���������� BW ����������');
  mmoGenPrgr.Lines.Add('Lvl4CEBOk : BOOL ;	//������� ��� ���������� CEB ����������');
  end;

//  mmoGenPrgr.Lines.Add('Time2SwitchHour { S7_m_c := '+#39+'true'+#39+' }: REAL ;	//����� �� ����� ��������');
  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('TimeDevWork'+IntToStr(j)+' : TIME ;	//����� ������ ������ '+IntToStr(j));

  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('TimeDevStop'+IntToStr(j)+' : TIME ;	//����� ������� ������ '+IntToStr(j));

  if ListOfSubSystem[i].NumOfDev <= 8 then sType:='BYTE  := B'
    else if ListOfSubSystem[i].NumOfDev <= 16 then sType:='WORD  := W'
      else sType:='DWORD  := DW';
  for j:=0 to ListOfSubSystem[i].NumOfDev-1 do
  begin
  st:=Round(Exp((j)*Ln(2)));
  s:=IntToHex(st,1);
  mmoGenPrgr.Lines.Add('DevStack'+IntToStr(j+1)+' { S7_m_c := '+#39+'true'+#39+' }: '+sType+'#16#'+s+';	//���� ��� ������ ���������� �����');
  end;

  if ListOfSubSystem[i].MemberOfSystem = 1 then
  begin
  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('NeedBWDev'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: BOOL ; //��������� BW ��� ������ �'+IntToStr(j));
  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('cmNeedBWDev'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: BOOL ; //��������� BW ��� ������ �'+IntToStr(j)+' (�� HMI)');
  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('NeedCEB1Dev'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: BOOL ; //��������� CEB1 ��� ������ �'+IntToStr(j));
  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('cmNeedCEB1Dev'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: BOOL ; //��������� CEB1 ��� ������ �'+IntToStr(j)+' (�� HMI)');
  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('NeedCEB2Dev'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: BOOL ;	//��������� CEB2 ��� ������ �'+IntToStr(j));
  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('cmNeedCEB2Dev'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: BOOL ;	//��������� CEB2 ��� ������ �'+IntToStr(j)+' (�� HMI)');

  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('TimeAfterBWDev'+IntToStr(j)+' : TIME ; //����� ��������� ����� BW ������ '+IntToStr(j));
  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('TimeAfterCEB1Dev'+IntToStr(j)+' : TIME ; //����� ��������� ����� CEB1 ������ '+IntToStr(j));
  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('TimeAfterCEB2Dev'+IntToStr(j)+' : TIME ; //����� ��������� ����� CEB2 ������ '+IntToStr(j));
  end;

  mmoGenPrgr.Lines.Add('Time2SwitchHour { S7_m_c := '+#39+'true'+#39+' }: REAL ;	//����� �� ����� ��������');

  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('FluxDev'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: REAL ;	//���������� Flux ������ '+IntToStr(j));

  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('TMPDev'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: REAL ;	//��������������� �������� ������ '+IntToStr(j));

  mmoGenPrgr.Lines.Add('b'+ListOfSubSystem[i].Name+' : BOOL ;	//���������� ������ '+ListOfSubSystem[i].Name);
  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('bDev'+IntToStr(j)+' : BOOL ;	//���������� ������ ������ '+IntToStr(j)+' (�������)');

  mmoGenPrgr.Lines.Add('Spare_SetTehData : BOOL ;	//-------���������� ��������������� ��������-------');
  for j:=1 to ListOfSubSystem[i].NumOfDev do
  begin
    mmoGenPrgr.Lines.Add('Lvl_St'+IntToStr(j)+'On { S7_m_c := '+#39+'true'+#39+' }: REAL ;	//������� �� �-���� ���������� ������� '+IntToStr(j));
    mmoGenPrgr.Lines.Add('Lvl_St'+IntToStr(j)+'Off { S7_m_c := '+#39+'true'+#39+' }: REAL ;	//������� �� �-���� ����������� ������� '+IntToStr(j));
  end;

  mmoGenPrgr.Lines.Add('TimeChangeStup : TIME ;	//����� ����� ����� ����������� ����� ���. �������� (����*60���*60���*1000��)');
  mmoGenPrgr.Lines.Add('TimeHourChangeStup { S7_m_c := '+#39+'true'+#39+' }: INT ;	//����� ������� ����� ����������� ����� ���������� ��������');

 if (ListOfSubSystem[i].MemberOfSystem = 1) or (ListOfSubSystem[i].MemberOfSystem = 2) then
  begin
  mmoGenPrgr.Lines.Add('TimeLenPurge : TIME ;	//������������ Purge (����*60���*60���*1000��)');
  mmoGenPrgr.Lines.Add('TimeSecLenPurge { S7_m_c := '+#39+'true'+#39+' }: INT ;	//������������ � �������� Purge');
  end;

 if ListOfSubSystem[i].MemberOfSystem = 1 then
  begin
  mmoGenPrgr.Lines.Add('TimeBW : TIME ;	//����� ������� ����� ����������� BW (����*60���*60���*1000��)');
  mmoGenPrgr.Lines.Add('TimeMinBW { S7_m_c := '+#39+'true'+#39+' }: INT ;	//����� ������� ����� ����������� BW');

  mmoGenPrgr.Lines.Add('TimeWshDwn : TIME ;	//������������ "������" ��������');
  mmoGenPrgr.Lines.Add('TimeSecWshDwn { S7_m_c := '+#39+'true'+#39+' }: INT ;	//������������ "������" �������� � ��������');

  mmoGenPrgr.Lines.Add('TimeWshUp : TIME ;	//������������ "�������" ��������');
  mmoGenPrgr.Lines.Add('TimeSecWshUp { S7_m_c := '+#39+'true'+#39+' }: INT ;	//������������ "�������" �������� � ��������');

  mmoGenPrgr.Lines.Add('TimeCEB1 : TIME ;	//����� ������� ����������� CEB1 (����*60���*60���*1000��)');
  mmoGenPrgr.Lines.Add('TimeHourCEB1 { S7_m_c := '+#39+'true'+#39+' }: INT ;	//����� ������� ����� ����������� CEB1');

  mmoGenPrgr.Lines.Add('TimeCEB2 : TIME ;	//����� ������� ����������� CEB2 (����*60���*60���*1000��)');
  mmoGenPrgr.Lines.Add('TimeHourCEB2 { S7_m_c := '+#39+'true'+#39+' }: INT ;	//����� ������� ����� ����������� CEB2');

  mmoGenPrgr.Lines.Add('TimeZamach : TIME ;	//����� ����������� (����� CEB � BW)');
  mmoGenPrgr.Lines.Add('TimeMinZamach { S7_m_c := '+#39+'true'+#39+' }: INT ;	//����� ����������� (����� CEB � BW) � �������');
  end;
 end;  // ����� ��������������� �������������� ������ ��� ����������

  mmoGenPrgr.Lines.Add('Spare_01 : BYTE ; //=========== ������ ============================================================');
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      // ���� ��� �����
      if FB20[k].TypeDev=1 {FindFromTemplate(TemplCP, FB20[k].Name)} then WriteDev2mmoGenPrgr(k, '�����');
  end;

  mmoGenPrgr.Lines.Add('Spare_02 : BYTE ; //=========== ������-�������� ==================================================');
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      // ���� ��� �����-�������
      if FB20[k].TypeDev=2 {FindFromTemplate(TemplDP, FB20[k].Name)} then WriteDev2mmoGenPrgr(k, '�����-�������');
  end;

  mmoGenPrgr.Lines.Add('Spare_03 : BYTE ; //========= ���������� ������� ======================================');
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      // ���� ��� ���������� ������
      if FB20[k].TypeDev=3 {FindFromTemplate(TemplAV, FB20[k].Name)} then  WriteDev2mmoGenPrgr(k, '������');
  end;

  mmoGenPrgr.Lines.Add('Spare_04 : BYTE ; //========= ��������� ===============================================');
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      // ���� ��� ���������
      if  FB20[k].TypeDev > 3
{      (not FindFromTemplate(TemplCP, FB20[k].Name)) and
         (not FindFromTemplate(TemplDP, FB20[k].Name)) and
         (not FindFromTemplate(TemplAV, FB20[k].Name))}
      then WriteDev2mmoGenPrgr(k, '���������');
  end;
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  if NeedExtraData then  // ���������� ������ ��� ������
  begin
   mmoGenPrgr.Lines.Add('Spare_Err : BYTE ; //======== ������ ===============================================================');
   mmoGenPrgr.Lines.Add('EmergStop { S7_m_c := '+#39+'true'+#39+' }: BOOL ;	//������ ���������� � ����������� �������� ���� �����');
   mmoGenPrgr.Lines.Add('Err4Stop { S7_m_c := '+#39+'true'+#39+' }: BOOL ;	//������ ���������� � �������� ���� �����');
   for j:=1 to ListOfSubSystem[i].NumOfDev do
   begin
   mmoGenPrgr.Lines.Add('Err4StopDev'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: BOOL ;	//������ ���������� � �������� ������ '+IntToStr(j));
   if ListOfSubSystem[i].MemberOfSystem = 1 then
   mmoGenPrgr.Lines.Add('ErrBWDev'+IntToStr(j)+' { S7_m_c := '+#39+'true'+#39+' }: BOOL ;	//������ ��������� ��� ���������� BW.������������ ��� ���� �������� ���������� BW');
   end;
  end;

  mmoGenPrgr.Lines.Add('  END_STRUCT ;');
  mmoGenPrgr.Lines.Add('BEGIN');
  mmoGenPrgr.Lines.Add('  ');
  mmoGenPrgr.Lines.Add('END_DATA_BLOCK');
  mmoGenPrgr.Lines.Add('  ');
end;

// ###########################################
// ## ��������� ����� ��� ���������
// ###########################################
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  for k:=0 to CntDev-1 do
  if NeedMsgDev and FB20[k].Device and FB20[k].NeedMsg then
  begin
  mmoGenPrgr.Lines.Add('DATA_BLOCK "msg'+FB20[k].Name+'"       ');
  mmoGenPrgr.Lines.Add('TITLE =                 ');
  mmoGenPrgr.Lines.Add('AUTHOR : daf            ');
  mmoGenPrgr.Lines.Add('VERSION : 0.0           ');
  mmoGenPrgr.Lines.Add('                        ');
  if FB20[k].MsgAV then mmoGenPrgr.Lines.Add('"MsgDevEx"') else mmoGenPrgr.Lines.Add('"MsgDev"');
  mmoGenPrgr.Lines.Add('BEGIN                   ');
  mmoGenPrgr.Lines.Add('END_DATA_BLOCK          ');
  mmoGenPrgr.Lines.Add('                        ');
  end;


// ###########################################
// ## ��������� ����������� ��������� [*Cntrl]
// ###########################################
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
for i:=1 to HMSubSystem do
 begin
  if (NeedExtraData)
   and
   (
    ((ListOfSubSystem[i].MemberOfSystem =1) and (NeedAutoModeUF))
    or
    ((ListOfSubSystem[i].MemberOfSystem =2) and (NeedAutoModeRO))
    or
    ((ListOfSubSystem[i].MemberOfSystem =3) and (NeedAutoModeEDI))
   )
  then
  begin
  GenBlShiftStackDev(i);
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  GenBlDownStackHand(i);
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  GenBlDevSel(i);
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  GenBlAutoCntrl(i);
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  end;
  
  mmoGenPrgr.Lines.Add('FUNCTION_BLOCK "'+ListOfSubSystem[i].Name+'Cntrl" ');
  mmoGenPrgr.Lines.Add('TITLE ='+ListOfSubSystem[i].Rem+': ���������� ');
  mmoGenPrgr.Lines.Add('AUTHOR : daf                                                ');
  mmoGenPrgr.Lines.Add('NAME : '+ListOfSubSystem[i].Name+'Cntrl ');
  mmoGenPrgr.Lines.Add('VERSION : 0.1                                               ');
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('VAR                                                         ');

 //=========== ������ ============================================================
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      // ���� ��� �����
      if FB20[k].TypeDev=1 {FindFromTemplate(TemplCP, FB20[k].Name)} then
      begin
        mmoGenPrgr.Lines.Add(FB20[k].Name+' : "PPSB2"; //'+FB20[k].Rem);
      end;
  end;

 //=========== ������-�������� ==================================================
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      // ���� ��� �����-�������
      if FB20[k].TypeDev=2 {FindFromTemplate(TemplDP, FB20[k].Name)} then
      begin
        mmoGenPrgr.Lines.Add(FB20[k].Name+' : "PPSB2"; //'+FB20[k].Rem);
      end;
  end;

 //========= ���������� ������� ==================================================
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      // ���� ��� ���������� ������
      if FB20[k].TypeDev=3 {FindFromTemplate(TemplAV, FB20[k].Name)} then
      begin
        mmoGenPrgr.Lines.Add(FB20[k].Name+' : "PPSB2"; //'+FB20[k].Rem);
      end;
  end;

 //========= ��������� ===========================================================
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      // ���� ��� ���������
      if FB20[k].TypeDev > 3
      {(not FindFromTemplate(TemplCP, FB20[k].Name)) and
         (not FindFromTemplate(TemplDP, FB20[k].Name)) and
         (not FindFromTemplate(TemplAV, FB20[k].Name))}
      then
      begin
        mmoGenPrgr.Lines.Add(FB20[k].Name+' : "PPSB2"; //'+FB20[k].Rem);
      end;
  end;

  mmoGenPrgr.Lines.Add('tBool : BOOL; //��������� ����������');
  mmoGenPrgr.Lines.Add('END_VAR                                                     ');

  mmoGenPrgr.Lines.Add('BEGIN                                                       ');
  mmoGenPrgr.Lines.Add('NETWORK                                                     ');
  mmoGenPrgr.Lines.Add('TITLE =������ �������� ����������                           ');
  mmoGenPrgr.Lines.Add('                                                            ');

  mmoGenPrgr.Lines.Add('      NOP   0;                                              ');
  if (NeedExtraData)
   and
   (
    ((ListOfSubSystem[i].MemberOfSystem =1) and (NeedAutoModeUF))
    or
    ((ListOfSubSystem[i].MemberOfSystem =2) and (NeedAutoModeRO))
    or
    ((ListOfSubSystem[i].MemberOfSystem =3) and (NeedAutoModeEDI))
   )
  then
  begin
   mmoGenPrgr.Lines.Add('// ����� ����� ������� ��������');
   mmoGenPrgr.Lines.Add('CALL "'+ListOfSubSystem[i].Name+'DevSel" , "db4'+ListOfSubSystem[i].Name+'DevSel" ;');
   mmoGenPrgr.Lines.Add('                                                            ');
   mmoGenPrgr.Lines.Add('// �������������� ����� ������ UF');
   mmoGenPrgr.Lines.Add('CALL "'+ListOfSubSystem[i].Name+'AutoCntrl" , "db4'+ListOfSubSystem[i].Name+'AutoCntrl" ;');
  end;

  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('NETWORK                                                     ');
  mmoGenPrgr.Lines.Add('TITLE =���������� ��������                                  ');
  mmoGenPrgr.Lines.Add('                                                            ');
 if (NeedExtraData) and (ListOfSubSystem[i].NumOfDev>0)
    and
   (
    ((ListOfSubSystem[i].MemberOfSystem =1) and (NeedAutoModeUF))
    or
    ((ListOfSubSystem[i].MemberOfSystem =2) and (NeedAutoModeRO))
    or
    ((ListOfSubSystem[i].MemberOfSystem =3) and (NeedAutoModeEDI))
   )
then
 begin
  mmoGenPrgr.Lines.Add('      NOP   0;                                              ');
  mmoGenPrgr.Lines.Add('// ����������� �� ���� �� ���� ������');
  for j:=1 to ListOfSubSystem[i].NumOfDev do
   mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'RunDev'+IntToStr(j)+'";');
  mmoGenPrgr.Lines.Add('=     "pri'+ListOfSubSystem[i].Name+'Run";');
  mmoGenPrgr.Lines.Add('                                                            ');

  mmoGenPrgr.Lines.Add('// ��������������� �� ���� �� ���� ������');
  for j:=1 to ListOfSubSystem[i].NumOfDev do
   mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'StopDev'+IntToStr(j)+'";');
  mmoGenPrgr.Lines.Add('=     "pri'+ListOfSubSystem[i].Name+'Stop";');
  mmoGenPrgr.Lines.Add('                                                            ');

  mmoGenPrgr.Lines.Add('// ���������� �� ���������� ������� ���� �� �� ����� ������');
  mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'Run";');
  mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'Stop";');
  mmoGenPrgr.Lines.Add('=     "pri'+ListOfSubSystem[i].Name+'Pereh";');
  mmoGenPrgr.Lines.Add('                                                            ');

  mmoGenPrgr.Lines.Add('// �������� �� ���� �� ���� ������');
  for j:=1 to ListOfSubSystem[i].NumOfDev do
   mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'WorkDev'+IntToStr(j)+'";');
  mmoGenPrgr.Lines.Add('=     "pri'+ListOfSubSystem[i].Name+'Work";');

  if ListOfSubSystem[i].MemberOfSystem=1 then
   begin
    mmoGenPrgr.Lines.Add('                                                            ');
    mmoGenPrgr.Lines.Add('// ��������� �� BW ���� �� �� ����� ������');
    for j:=1 to ListOfSubSystem[i].NumOfDev do
     mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'BWDev'+IntToStr(j)+'";');
    mmoGenPrgr.Lines.Add('=     "pri'+ListOfSubSystem[i].Name+'BW";');
    mmoGenPrgr.Lines.Add('                                                            ');

    mmoGenPrgr.Lines.Add('// ��������� �� CEB ���� �� �� ����� ������');
    for j:=1 to ListOfSubSystem[i].NumOfDev do begin
     mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'CEB1Dev'+IntToStr(j)+'";');
     mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'CEB2Dev'+IntToStr(j)+'";');
    end;
    mmoGenPrgr.Lines.Add('=     "pri'+ListOfSubSystem[i].Name+'CEB";');
    mmoGenPrgr.Lines.Add('                                                            ');

    mmoGenPrgr.Lines.Add('// ��������� �� BW ��� CEB ���� �� �� ����� ������');
    for j:=1 to ListOfSubSystem[i].NumOfDev do
     mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'PurgeDev'+IntToStr(j)+'";');
    mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'BW";');
    mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'CEB";');
    mmoGenPrgr.Lines.Add('=     "pri'+ListOfSubSystem[i].Name+'Wash";');
    mmoGenPrgr.Lines.Add('                                                            ');

    mmoGenPrgr.Lines.Add('// ��������� �� ����������� ���� �� �� ����� ������');
    for j:=1 to ListOfSubSystem[i].NumOfDev do
     mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'CEBZmchDev'+IntToStr(j)+'";');
    mmoGenPrgr.Lines.Add('=     "pri'+ListOfSubSystem[i].Name+'Zamachiv";');
   end;

   if ListOfSubSystem[i].MemberOfSystem>1 then
   begin
    mmoGenPrgr.Lines.Add('                                                            ');
    mmoGenPrgr.Lines.Add('// ��������� �� �������� ���� �� �� ����� ������');
    for j:=1 to ListOfSubSystem[i].NumOfDev do
     mmoGenPrgr.Lines.Add('O     "pri'+ListOfSubSystem[i].Name+'WashDev'+IntToStr(j)+'";');
    mmoGenPrgr.Lines.Add('=     "pri'+ListOfSubSystem[i].Name+'Wash";');
   end;
 end
 else
  mmoGenPrgr.Lines.Add('      NOP   0;                                              ');
  mmoGenPrgr.Lines.Add('                                                            ');
 if NeedExtraData then
 begin
  mmoGenPrgr.Lines.Add('NETWORK                                                     ');
  mmoGenPrgr.Lines.Add('TITLE =����� ������: =0-������, =1-�������                  ');
  mmoGenPrgr.Lines.Add('//�������� ����� ������ '+ListOfSubSystem[i].Name+' ���� �� ���������. ');
  mmoGenPrgr.Lines.Add('      NOP   0;                                              ');
  mmoGenPrgr.Lines.Add('// !!! �������� !!!                                         ');
  mmoGenPrgr.Lines.Add('      A     "_Disable";                                     ');
  mmoGenPrgr.Lines.Add('      =     "dt'+ListOfSubSystem[i].Name+'".Mode; ');
  mmoGenPrgr.Lines.Add('                                                            ');

  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('//      O     "dt'+ListOfSubSystem[i].Name+'".Mode'+IntToStr(j));
  mmoGenPrgr.Lines.Add('//      =     "dt'+ListOfSubSystem[i].Name+'".Mode ');
 end;
  mmoGenPrgr.Lines.Add('NETWORK                                                     ');
  mmoGenPrgr.Lines.Add('TITLE =������/�������������� ������ ��������� ');
  mmoGenPrgr.Lines.Add('//                                                          ');
  mmoGenPrgr.Lines.Add('//                                                          ');
  mmoGenPrgr.Lines.Add('      A     "_Disable"; // !!!�������� �� ���               ');
 if NeedExtraData then
 begin
  mmoGenPrgr.Lines.Add('      A     "dt'+ListOfSubSystem[i].Name+'".Mode; ');
 end;
  for k:=0 to CntDev-1 do
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      mmoGenPrgr.Lines.Add('      =     "dt'+ListOfSubSystem[i].Name+'".Mode'+FB20[k].Name+'; ');
 if NeedExtraData then
 begin
  mmoGenPrgr.Lines.Add('NETWORK                                                     ');
  mmoGenPrgr.Lines.Add('TITLE =���������� ��� ��������� '+ListOfSubSystem[i].Name);
  mmoGenPrgr.Lines.Add('//                                                          ');
  mmoGenPrgr.Lines.Add('      NOP   0;                                              ');
  mmoGenPrgr.Lines.Add('//      A     "_EmSTOP"                   // ����� �� ���?  ');
  mmoGenPrgr.Lines.Add('      A     "_TRUE"; // "���������" �� �������             ');
  mmoGenPrgr.Lines.Add('      =     "dt'+ListOfSubSystem[i].Name+'".b'+ListOfSubSystem[i].Name+'; ');
  mmoGenPrgr.Lines.Add('                                                            ');
  if ListOfSubSystem[i].NumOfDev > 0 then
  begin
  mmoGenPrgr.Lines.Add('      A     "dt'+ListOfSubSystem[i].Name+'".b'+ListOfSubSystem[i].Name+'; ');
  for j:=1 to ListOfSubSystem[i].NumOfDev do
  mmoGenPrgr.Lines.Add('      =     "dt'+ListOfSubSystem[i].Name+'".bDev'+IntToStr(j)+'; ');
  end;
 end;
  if NeedExtraData then
  begin
  mmoGenPrgr.Lines.Add('NETWORK                                                     ');
  mmoGenPrgr.Lines.Add('TITLE =������ Flux                                          ');
  mmoGenPrgr.Lines.Add('//������                                                    ');
  mmoGenPrgr.Lines.Add('      NOP   0;                                              ');
  mmoGenPrgr.Lines.Add('// UF Dev1                                                  ');
  mmoGenPrgr.Lines.Add('//    L     "dtAiCh".FE1.Par;                               ');
  mmoGenPrgr.Lines.Add('//    L     2.800000e+000;                                  ');
  mmoGenPrgr.Lines.Add('//    /R    ;                                               ');
  mmoGenPrgr.Lines.Add('//    T     "dt'+ListOfSubSystem[i].Name+'".FluxDev1;                                ');
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('NETWORK                                                     ');
  mmoGenPrgr.Lines.Add('TITLE =������ TMP                                           ');
  mmoGenPrgr.Lines.Add('//������                                                    ');
  mmoGenPrgr.Lines.Add('      NOP   0;                                              ');
  mmoGenPrgr.Lines.Add('// UF Dev1                                                  ');
  mmoGenPrgr.Lines.Add('//    L     "dtAiCh".PE2.Par;                               ');
  mmoGenPrgr.Lines.Add('//    L     "dtAiCh".PE1.Par;                               ');
  mmoGenPrgr.Lines.Add('//    -R    ;                                               ');
  mmoGenPrgr.Lines.Add('//    T     "dt'+ListOfSubSystem[i].Name+'".TMPDev1;                                 ');
  end;

 //=========== ������ ============================================================
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      // ���� ��� �����
      if FB20[k].TypeDev=1 {FindFromTemplate(TemplCP, FB20[k].Name)} then
      begin
       if NeedLAD then GenDevNetworkLAD(k)
        else GenDevNetworkSTL(k);
       if NeedWinCCObj then GenWinCCObj(k, 1);
      end;
  end; // ������
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
 //=========== ������-�������� ==================================================
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      // ���� ��� �����-�������
      if FB20[k].TypeDev=2 {FindFromTemplate(TemplDP, FB20[k].Name)} then
      begin
       if NeedLAD then GenDevNetworkLAD(k)
        else GenDevNetworkSTL(k);
       if NeedWinCCObj then GenWinCCObj(k, 2);
      end;
  end; // ������-��������

  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
 //========= ���������� ������� ==================================================
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      // ���� ��� ���������� ������
      if FB20[k].TypeDev=3 {FindFromTemplate(TemplAV, FB20[k].Name)} then
      begin
       if NeedLAD then GenDevNetworkLAD(k)
        else GenDevNetworkSTL(k);
       if NeedWinCCObj then GenWinCCObj(k, 3);
      end;
  end; // ���������� �������
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
 //========= ��������� ===========================================================
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) and (FindFromTemplate(ListOfSubSystem[i].Name,FB20[k].NameDB)) then
      // ���� ��� ���������
      if FB20[k].TypeDev > 3 {(not FindFromTemplate(TemplCP, FB20[k].Name)) and
         (not FindFromTemplate(TemplDP, FB20[k].Name)) and
         (not FindFromTemplate(TemplAV, FB20[k].Name))}
      then
      begin
       if NeedLAD then GenDevNetworkLAD(k)
        else GenDevNetworkSTL(k);
       if NeedWinCCObj then
        if FB20[k].TypeDev=4 {FindFromTemplate(TemplHeat, FB20[k].Name)}
        then GenWinCCObj(k, 4) else GenWinCCObj(k, 0);
      end;
  end; // ���������
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('END_FUNCTION_BLOCK                                          ');
 end; // ����� ������������ ����������� ��������� [*Cntrl]
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
//-----------------------------------------------------------------------
// ��������� OB1
//-----------------------------------------------------------------------
// �����
   mmoGenPrgr.Lines.Add(' ');
   mmoGenPrgr.Lines.Add('ORGANIZATION_BLOCK OB 1');
   mmoGenPrgr.Lines.Add('TITLE = "Main Program Sweep (Cycle)"');
   mmoGenPrgr.Lines.Add('VERSION : 0.1');
   mmoGenPrgr.Lines.Add(' ');
   mmoGenPrgr.Lines.Add('VAR_TEMP');
   mmoGenPrgr.Lines.Add('  OB1_EV_CLASS : BYTE ;	//Bits 0-3 = 1 (Coming event), Bits 4-7 = 1 (Event class 1)');
   mmoGenPrgr.Lines.Add('  OB1_SCAN_1 : BYTE ;	//1 (Cold restart scan 1 of OB 1), 3 (Scan 2-n of OB 1)');
   mmoGenPrgr.Lines.Add('  OB1_PRIORITY : BYTE ;	//Priority of OB Execution                                 ');
   mmoGenPrgr.Lines.Add('  OB1_OB_NUMBR : BYTE ;	//1 (Organization block 1, OB1)                            ');
   mmoGenPrgr.Lines.Add('  OB1_RESERVED_1 : BYTE ;	//Reserved for system                                      ');
   mmoGenPrgr.Lines.Add('  OB1_RESERVED_2 : BYTE ;	//Reserved for system                                      ');
   mmoGenPrgr.Lines.Add('  OB1_PREV_CYCLE : INT ;	//Cycle time of previous OB1 scan (milliseconds)           ');
   mmoGenPrgr.Lines.Add('  OB1_MIN_CYCLE : INT ;	//Minimum cycle time of OB1 (milliseconds)                 ');
   mmoGenPrgr.Lines.Add('  OB1_MAX_CYCLE : INT ;	//Maximum cycle time of OB1 (milliseconds)                 ');
   mmoGenPrgr.Lines.Add('  OB1_DATE_TIME : DATE_AND_TIME ;	//Date and time OB1 started                        ');
   mmoGenPrgr.Lines.Add('END_VAR                                                                                   ');
// ���� ����� OB1
   mmoGenPrgr.Lines.Add('BEGIN                                                                                     ');
   mmoGenPrgr.Lines.Add('NETWORK                                                                                   ');
   mmoGenPrgr.Lines.Add('TITLE =������� �� ��������� STOP � RUN');
   mmoGenPrgr.Lines.Add('//�������� �� ������ ������ OB1                                                           ');
   mmoGenPrgr.Lines.Add('      O(    ;                                                                             ');
   mmoGenPrgr.Lines.Add('      L     #OB1_SCAN_1;                                                                  ');
   mmoGenPrgr.Lines.Add('      L     1;                                                                            ');
   mmoGenPrgr.Lines.Add('      ==I   ;                                                                             ');
   mmoGenPrgr.Lines.Add('      )     ;                                                                             ');
   mmoGenPrgr.Lines.Add('      O(    ;                                                                             ');
   mmoGenPrgr.Lines.Add('      L     #OB1_SCAN_1; //  ������ �������� 2 ����� ���� ������                          ');
   mmoGenPrgr.Lines.Add('      L     2; //  ��� S7-300                                                             ');
   mmoGenPrgr.Lines.Add('      ==I   ;                                                                             ');
   mmoGenPrgr.Lines.Add('      )     ;                                                                             ');
   mmoGenPrgr.Lines.Add('      =     "_ReStart";                                                                   ');
   mmoGenPrgr.Lines.Add('NETWORK                                                                                   ');
   mmoGenPrgr.Lines.Add('TITLE =���������� ������������ ������������� ��������� (���� Alarm_D)');
   mmoGenPrgr.Lines.Add('//���������� ������� ������������ ��������� Alarm ����� ���� ������ ����� ������ �����������');
   mmoGenPrgr.Lines.Add('      A     "_FALSE";                                                                     ');
   mmoGenPrgr.Lines.Add('      =     L     20.0;                                                                   ');
   mmoGenPrgr.Lines.Add('      BLD   103;                                                                          ');
   mmoGenPrgr.Lines.Add('      CALL "EnPLCMsgCntrl" , "db4EnPLCMsgCntrl" (                                         ');
   mmoGenPrgr.Lines.Add('           MsgOFF                   := L     20.0,                                        ');
   mmoGenPrgr.Lines.Add('           FreqMsg                  := B#16#0,                                            ');
   mmoGenPrgr.Lines.Add('           DelayTime                := T#2S);                                           ');
   mmoGenPrgr.Lines.Add('      NOP   0;                                                                            ');
   mmoGenPrgr.Lines.Add('NETWORK                                                                                   ');
   mmoGenPrgr.Lines.Add('TITLE =Tune analog data');
   mmoGenPrgr.Lines.Add('                                                                                          ');
   mmoGenPrgr.Lines.Add('      A     "_Ack";                                                                       ');
   mmoGenPrgr.Lines.Add('      S     "_AiChSet";                                                                   ');
   mmoGenPrgr.Lines.Add('END_ORGANIZATION_BLOCK                                                                    ');
   mmoGenPrgr.Lines.Add('                                                                                          ');
//-----------------------------------------------------------------------
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  GenTimeConvert;
//-----------------------------------------------------------------------
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  GenTimeCount;
//-----------------------------------------------------------------------
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  GenOB35;
  if OB32IsPresent then  GenOB32;
//-----------------------------------------------------------------------
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
//  GenWinCCObjTop();
// ###########################################
// ## ��������� ����� � ����                ##
// ###########################################
  s:=OpenDialogPLC.FileName;
  n:=Pos('.sdf',LowerCase(s));
  s:=Copy(s,1,n-1);

  mmoGenPrgr.Lines.SaveToFile(s + '_Dev.awl');
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  mmoGenSmbl.Lines.SaveToFile(s + '_add_Dev.sdf');
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  mmoGenTxtLbr.Lines.SaveToFile(s + '_TxtLbr_Dev.csv');
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  if NeedWinCCObj then mmoGenWinCCObj.Lines.SaveToFile(s+'_WinCC_PTD.cls'); //PTD = ProjectTemplateDocument
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
{  mmoGenSmbl.Left:=30;
  mmoGenSmbl.Top:=15;
  mmoGenSmbl.Width:=715;
  mmoGenSmbl.Height:=120;
  mmoGenSmbl.Visible:=True;

  mmoGenPrgr.Left:=30;
  mmoGenPrgr.Top:=145;
  mmoGenPrgr.Width:=715;
  mmoGenPrgr.Height:=380;
  mmoGenPrgr.Visible:=True;Visible:=True;}
  //mmoGenWinCCObj.Visible:=True;
  PercGenPrgr:=100;
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  fWinGenPrgr.Caption:='�������� ������������� ���������';
  fWinGenPrgr.lblProgressText.Caption:='�������� ������������� ���������';
  fWinGenPrgr.bClose.Enabled:=True;
  fWinGenPrgr.pbPercGenPrgr.Position:=fWinGenPrgr.pbPercGenPrgr.Max;
end;

procedure TfMain.chkNeedMsgClick(Sender: TObject);
begin
FB20[CurrFB20].NeedMsg:=chkNeedMsg.Checked;
end;

procedure TfMain.eNameExit(Sender: TObject);
begin
  OldName:=FB20[CurrFB20].Name;
  FB20[CurrFB20].Name:=SaveStr(eName.Text);
  if OldName <> FB20[CurrFB20].Name then
  begin
    eName.Hint:='���������� ��������: "' + OldName + '"';
  end;
end;

procedure TfMain.eName4MsgExit(Sender: TObject);
begin
  FB20[CurrFB20].Name4Msg:=SaveStr(eName4Msg.Text);
end;

procedure TfMain.eKx1Exit(Sender: TObject);
begin
  FB20[CurrFB20].Kx1:=SaveStr(eKx1.Text);
end;

procedure TfMain.eKx2Exit(Sender: TObject);
begin
  FB20[CurrFB20].Kx2:=SaveStr(eKx2.Text);
end;

procedure TfMain.eSQ1Exit(Sender: TObject);
begin
  FB20[CurrFB20].SQ1:=SaveStr(eSQ1.Text);
end;

procedure TfMain.eSQ2Exit(Sender: TObject);
begin
  FB20[CurrFB20].SQ2:=SaveStr(eSQ2.Text);
end;

procedure TfMain.eSB1Exit(Sender: TObject);
begin
  FB20[CurrFB20].SB1:=SaveStr(eSB1.Text);
end;

procedure TfMain.eSB2Exit(Sender: TObject);
begin
  FB20[CurrFB20].SB2:=SaveStr(eSB2.Text);
end;

procedure TfMain.eSU1Exit(Sender: TObject);
begin
  FB20[CurrFB20].SU1:=SaveStr(eSU1.Text);
end;

procedure TfMain.eSU2Exit(Sender: TObject);
begin
  FB20[CurrFB20].SU2:=SaveStr(eSU2.Text);
end;

procedure TfMain.eOFFExit(Sender: TObject);
begin
  FB20[CurrFB20].OFF:=SaveStr(eOFF.Text);
end;

procedure TfMain.eDisExit(Sender: TObject);
begin
  FB20[CurrFB20].Dis:=SaveStr(eDis.Text);
end;

procedure TfMain.eQFxExit(Sender: TObject);
begin
  FB20[CurrFB20].QFx:=SaveStr(eQFx.Text);
end;

procedure TfMain.eAckExit(Sender: TObject);
begin
  FB20[CurrFB20].Ack:=SaveStr(eAck.Text);
end;

procedure TfMain.eMdtExit(Sender: TObject);
begin
  FB20[CurrFB20].Mdt:=SaveStr(eMdt.Text);
end;

procedure TfMain.eMdxExit(Sender: TObject);
begin
  FB20[CurrFB20].Mdx:=SaveStr(eMdx.Text);
end;

procedure TfMain.eMdwExit(Sender: TObject);
begin
  FB20[CurrFB20].Mdw:=SaveStr(eMdw.Text);
end;

procedure TfMain.eMduExit(Sender: TObject);
begin
  FB20[CurrFB20].Mdu:=SaveStr(eMdu.Text);
end;

procedure TfMain.eTm1Exit(Sender: TObject);
begin
  FB20[CurrFB20].Tm1:=SaveStr(eTm1.Text);
end;

procedure TfMain.eTm2Exit(Sender: TObject);
begin
  FB20[CurrFB20].Tm2:=SaveStr(eTm2.Text);
end;

procedure TfMain.eTmxExit(Sender: TObject);
begin
  FB20[CurrFB20].Tmx:=SaveStr(eTmx.Text);
end;

procedure TfMain.eKm1Exit(Sender: TObject);
begin
  FB20[CurrFB20].Km1:=SaveStr(eKm1.Text);
end;

procedure TfMain.eKm2Exit(Sender: TObject);
begin
  FB20[CurrFB20].Km2:=SaveStr(eKm2.Text);
end;

procedure TfMain.eLr1Exit(Sender: TObject);
begin
  FB20[CurrFB20].Lr1:=SaveStr(eLr1.Text);
end;

procedure TfMain.eLr2Exit(Sender: TObject);
begin
  FB20[CurrFB20].Lr2:=SaveStr(eLr2.Text);
end;

procedure TfMain.eLg1Exit(Sender: TObject);
begin
  FB20[CurrFB20].Lg1:=SaveStr(eLg1.Text);
end;

procedure TfMain.eLg2Exit(Sender: TObject);
begin
  FB20[CurrFB20].Lg2:=SaveStr(eLg2.Text);
end;

procedure TfMain.eSteExit(Sender: TObject);
begin
  FB20[CurrFB20].Ste:=SaveStr(eSte.Text);
end;


procedure TfMain.eKx1DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=1;
  ShowColorFieldDev;
end;

procedure TfMain.eSQ1DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=2;
  ShowColorFieldDev;
end;

procedure TfMain.eSB1DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=3;
  ShowColorFieldDev;
end;

procedure TfMain.eSU1DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=4;
  ShowColorFieldDev;
end;

procedure TfMain.eKx2DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=5;
  ShowColorFieldDev;
end;

procedure TfMain.eSQ2DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=6;
  ShowColorFieldDev;
end;

procedure TfMain.eSB2DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=7;
  ShowColorFieldDev;
end;

procedure TfMain.eSU2DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=8;
  ShowColorFieldDev;
end;

procedure TfMain.eOFFDblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=9;
  ShowColorFieldDev;
end;

procedure TfMain.eDisDblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=10;
  ShowColorFieldDev;
end;

procedure TfMain.eQFxDblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=11;
  ShowColorFieldDev;
end;

procedure TfMain.eAckDblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=12;
  ShowColorFieldDev;
end;

procedure TfMain.eMdtDblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=13;
  ShowColorFieldDev;
end;

procedure TfMain.eMdxDblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=14;
  ShowColorFieldDev;
end;

procedure TfMain.eMdwDblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=15;
  ShowColorFieldDev;
end;

procedure TfMain.eMduDblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=16;
  ShowColorFieldDev;
end;

procedure TfMain.eTm1DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=17;
  ShowColorFieldDev;
end;

procedure TfMain.eTm2DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=18;
  ShowColorFieldDev;
end;

procedure TfMain.eTmxDblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=19;
  ShowColorFieldDev;
end;

procedure TfMain.eKm1DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=20;
  ShowColorFieldDev;
end;

procedure TfMain.eLr1DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=21;
  ShowColorFieldDev;
end;

procedure TfMain.eLg1DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=22;
  ShowColorFieldDev;
end;

procedure TfMain.eKm2DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=23;
  ShowColorFieldDev;
end;

procedure TfMain.eLr2DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=24;
  ShowColorFieldDev;
end;

procedure TfMain.eLg2DblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=25;
  ShowColorFieldDev;
end;

procedure TfMain.eSteDblClick(Sender: TObject);
begin
  NumCurrFieldsDev:=26;
  ShowColorFieldDev;
end;

procedure TfMain.eRemExit(Sender: TObject);
begin
  FB20[CurrFB20].Rem:=SaveStr(eRem.Text);
end;

procedure TfMain.sgDIDblClick(Sender: TObject);
begin
  if (NumCurrFieldsDev > 0) and (CurrFiltrDi >=0) then
  begin
    case NumCurrFieldsDev of
      1:FB20[CurrFB20].Kx1:='"i'+Di[CurrFiltrDi].Name+'"';
      2:FB20[CurrFB20].SQ1:='"i'+Di[CurrFiltrDi].Name+'"';
      3:FB20[CurrFB20].SB1:='"i'+Di[CurrFiltrDi].Name+'"';
      4:FB20[CurrFB20].SU1:='"i'+Di[CurrFiltrDi].Name+'"';
      5:FB20[CurrFB20].Kx2:='"i'+Di[CurrFiltrDi].Name+'"';
      6:FB20[CurrFB20].SQ2:='"i'+Di[CurrFiltrDi].Name+'"';
      7:FB20[CurrFB20].SB2:='"i'+Di[CurrFiltrDi].Name+'"';
      8:FB20[CurrFB20].SU2:='"i'+Di[CurrFiltrDi].Name+'"';
      9:FB20[CurrFB20].OFF:='"i'+Di[CurrFiltrDi].Name+'"';
      10:FB20[CurrFB20].Dis:='"i'+Di[CurrFiltrDi].Name+'"';
      11:FB20[CurrFB20].QFx:='"i'+Di[CurrFiltrDi].Name+'"';
      12:FB20[CurrFB20].Ack:='"i'+Di[CurrFiltrDi].Name+'"';
      13:FB20[CurrFB20].Mdt:='"i'+Di[CurrFiltrDi].Name+'"';
      14:FB20[CurrFB20].Mdx:='"i'+Di[CurrFiltrDi].Name+'"';
      15:FB20[CurrFB20].Mdw:='"i'+Di[CurrFiltrDi].Name+'"';
      16:FB20[CurrFB20].Mdu:='"i'+Di[CurrFiltrDi].Name+'"';
      17:FB20[CurrFB20].Tm1:='"i'+Di[CurrFiltrDi].Name+'"';
      18:FB20[CurrFB20].Tm2:='"i'+Di[CurrFiltrDi].Name+'"';
      19:FB20[CurrFB20].TmX:='"i'+Di[CurrFiltrDi].Name+'"';
      20:FB20[CurrFB20].Km1:='"i'+Di[CurrFiltrDi].Name+'"';
      21:FB20[CurrFB20].Lr1:='"i'+Di[CurrFiltrDi].Name+'"';
      22:FB20[CurrFB20].Lg1:='"i'+Di[CurrFiltrDi].Name+'"';
      23:FB20[CurrFB20].Km2:='"i'+Di[CurrFiltrDi].Name+'"';
      24:FB20[CurrFB20].Lr2:='"i'+Di[CurrFiltrDi].Name+'"';
      25:FB20[CurrFB20].Lg2:='"i'+Di[CurrFiltrDi].Name+'"';
      26:FB20[CurrFB20].Ste:='"i'+Di[CurrFiltrDi].Name+'"';
    end;
  ShowFieldDev(CurrFB20);
  end;
end;

//____________________________________________________________________
// � Source ���� ��������� OldName � �������� ��������� �� "����� ���"
// "����� ���" - ��� FB20[CurrFB20].Name
procedure ChangeFieldFromName(var Source:string);
var
  s:string;
begin
  if (length(Source))<>0 then
  begin
    s:=LowerCase(Source);
    if (s[2]<>'i') and (s[2]<>'q') then
    begin
      Source:=StringReplace(Source,OldName,FB20[CurrFB20].Name,[rfreplaceall]);
    end;
  end
end;

procedure TfMain.bChNameDevClick(Sender: TObject);
begin
  if (length(OldName))<>0 then
  begin
    ChangeFieldFromName(FB20[CurrFB20].Name4Msg);
    ChangeFieldFromName(FB20[CurrFB20].Kx1);
    ChangeFieldFromName(FB20[CurrFB20].SQ1);
    ChangeFieldFromName(FB20[CurrFB20].SB1);
    ChangeFieldFromName(FB20[CurrFB20].SU1);
    ChangeFieldFromName(FB20[CurrFB20].Kx2);
    ChangeFieldFromName(FB20[CurrFB20].SQ2);
    ChangeFieldFromName(FB20[CurrFB20].SB2);
    ChangeFieldFromName(FB20[CurrFB20].SU2);
    ChangeFieldFromName(FB20[CurrFB20].OFF);
    ChangeFieldFromName(FB20[CurrFB20].Dis);
    ChangeFieldFromName(FB20[CurrFB20].QFx);
    ChangeFieldFromName(FB20[CurrFB20].Ack);
    ChangeFieldFromName(FB20[CurrFB20].Mdt);
    ChangeFieldFromName(FB20[CurrFB20].Mdx);
    ChangeFieldFromName(FB20[CurrFB20].Mdw);
    ChangeFieldFromName(FB20[CurrFB20].Mdu);
    ChangeFieldFromName(FB20[CurrFB20].Tm1);
    ChangeFieldFromName(FB20[CurrFB20].Tm2);
    ChangeFieldFromName(FB20[CurrFB20].TmX);
    ChangeFieldFromName(FB20[CurrFB20].Km1);
    ChangeFieldFromName(FB20[CurrFB20].Lr1);
    ChangeFieldFromName(FB20[CurrFB20].Lg1);
    ChangeFieldFromName(FB20[CurrFB20].Km2);
    ChangeFieldFromName(FB20[CurrFB20].Lr2);
    ChangeFieldFromName(FB20[CurrFB20].Lg2);
    ChangeFieldFromName(FB20[CurrFB20].Ste);
    ShowFieldDev(CurrFB20);
  end;

end;
//____________________________________________________________________
// ��������� ���������
function SaveSettings():Integer;
var
  fMain: file of Setting2FileRec;
  Setting2File: Setting2FileRec;
  fListOfSubSystem: file of ListOfSubSystemRec;
  fFB20:  file of FB20RecForFile;
  s, NameFile:string;
  Res, n, i: Integer;
begin
  fWinGenPrgr.Show;
  fWinGenPrgr.bClose.Enabled:=False;
  fWinGenPrgr.Caption:='��������� ���������...';
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
//-----------------------------------------------------------------------
// ���������� ������ ����� �����
//-----------------------------------------------------------------------
  s:=NameTblSmbl;
  n:=Pos('.sdf',LowerCase(s));
  s:=Copy(s,1,n-1);
//-----------------------------------------------------------------------
// ������ � ������� ���� ��������
//-----------------------------------------------------------------------
// �������� ����������
  Setting2File.CntDi:=CntDi; // ���-�� ���������� ������ � �������
  Setting2File.CntDq:=CntDq; // ���-�� ���������� ������ � �������
  Setting2File.CntDev:=CntDev; // ���-�� ����������������� ���������
  Setting2File.HMSubSystem:=HMSubSystem; // ������� ��������� ��������������� ������������(1..10)
  Setting2File.NeedMsgDev:=NeedMsgDev; // ���������� �� ����������� ��������� ��� WinCC
  Setting2File.NeedExtraData:=NeedExtraData; // ���������� �� ����������� ����������� ������
  Setting2File.NeedAutoModeUF:=NeedAutoModeUF; // ���������� �� ����������� ����� "����" ��� UF
  Setting2File.NeedAutoModeRO:=NeedAutoModeRO; // ���������� �� ����������� ����� "����" ��� RO
  Setting2File.NeedAutoModeEDI:=NeedAutoModeEDI; // ���������� �� ����������� ����� "����" ��� EDI
  Setting2File.NumDB:=NumDB; // � ������ ������ ����������� �������-DB
  Setting2File.AddrtEnablePLCMsg:=AddrtEnablePLCMsg; // ����� ������� ��� ���������� �����������
  Setting2File.TemplCP:=uMain.TemplCP;
  Setting2File.TemplDP:=uMain.TemplDP;
  Setting2File.TemplAV:=uMain.TemplAV;
  Setting2File.TemplHeat:=uMain.TemplHeat;
  Setting2File.Spare:=uMain.Spare;
  Setting2File.TemplQF:=TemplQF;
  Setting2File.TemplUF:=TemplUF;
  Setting2File.TemplRO:=TemplRO;
  Setting2File.TemplEDI:=TemplEDI;
  Setting2File.OB32IsPresent:=OB32IsPresent;
  Setting2File.NeedLAD:=NeedLAD;
  Setting2File.NeedWinCCObj:=NeedWinCCObj;
  Setting2File.NameS7P:=NameS7P; // ��� S7 ���������
  Setting2File.SepWinCC:=SepWinCC;
// ��������� � ���� ������� ���������
  NameFile:=s+'_MainSetting.cfg';
  AssignFile(fMain, NameFile);
  {$I-}
  Rewrite(fMain);
  {$I+}
  Res:=IOResult;
  if Res <> 0 then
  begin
    fWinGenPrgr.Hide;
    SaveSettings:=Res;
    MessageDlg('��������� ������ ��� �������� ����� "'+ NameFile+'"', mtError, [mbOk], 0);
    Exit;
  end;
  {$I-}
  Write(fMain,Setting2File);
  {$I+}
  Res:=IOResult;
  if Res <> 0 then
  begin
    fWinGenPrgr.Hide;
    SaveSettings:=Res;
    MessageDlg('��������� ������ ��� ������ ����� "'+ NameFile+'"', mtError, [mbOk], 0);
    CloseFile(fMain);
    Exit;
  end;
  CloseFile(fMain);
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
//-----------------------------------------------------------------------
// ������ � ���� ������� ���������
//-----------------------------------------------------------------------
// ��������� �������� �� StringGrid
  for i:=1 to HMSubSystem do
  begin
    ListOfSubSystem[i].Name:=fSetting.sgSubSystem.Cells[1,i];
    ListOfSubSystem[i].Addr:=StrToInt(fSetting.sgSubSystem.Cells[2,i]);
    ListOfSubSystem[i].Rem:=fSetting.sgSubSystem.Cells[3,i];
    ListOfSubSystem[i].NumOfDev:=StrToInt(fSetting.sgSubSystem.Cells[4,i]);
//    fMain.cbbSelDBName.Items.Add(ListOfSubSystem[i].Name);
  end;

// ��������� � ����
  NameFile:=s+'_ListOfSubSystem.lst';
  AssignFile(fListOfSubSystem, NameFile);
  {$I-}
  Rewrite(fListOfSubSystem);
  {$I+}
  Res:=IOResult;
  if Res <> 0 then
  begin
    fWinGenPrgr.Hide;
    SaveSettings:=Res;
    MessageDlg('��������� ������ ��� �������� ����� "'+ NameFile+'"', mtError, [mbOk], 0);
    Exit;
  end;
  for i:=1 to HMSubSystem do
  begin
    {$I-}
    Write(fListOfSubSystem, ListOfSubSystem[i]);
    {$I+}
    Res:=IOResult;
    if Res <> 0 then
    begin
      fWinGenPrgr.Hide;
      SaveSettings:=Res;
      MessageDlg('��������� ������ ��� ������ ����� "'+ NameFile+'"', mtError, [mbOk], 0);
      CloseFile(fListOfSubSystem);
      Exit;
    end;
  end;
  CloseFile(fListOfSubSystem);
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
//-----------------------------------------------------------------------
// ������ � ���� ������� ���������
//-----------------------------------------------------------------------
  FB20SaveToFB20ForFile();
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
// ��������� � ����
  NameFile:=s+'_FB20.lst';
  AssignFile(fFB20, NameFile);
  {$I-}
  Rewrite(fFB20);
  {$I+}
  Res:=IOResult;
  if Res <> 0 then
  begin
    fWinGenPrgr.Hide;
    SaveSettings:=Res;
    MessageDlg('��������� ������ ��� �������� ����� "'+ NameFile+'"', mtError, [mbOk], 0);
    Exit;
  end;
  for i:=0 to CntDev-1 do
  begin
    {$I-}
    Write(fFB20, FB20ForFile[i]);
    {$I+}
    Res:=IOResult;
    if Res <> 0 then
    begin
      fWinGenPrgr.Hide;
      SaveSettings:=Res;
      MessageDlg('��������� ������ ��� ������ ����� "'+ NameFile+'"', mtError, [mbOk], 0);
      CloseFile(fFB20);
      Exit;
    end;
  end;
  CloseFile(fFB20);
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
//-----------------------------------------------------------------------
// ���� ��� �������� ����������� ������
//-----------------------------------------------------------------------
  fWinGenPrgr.Caption:='��������� ���������';
  fWinGenPrgr.lblProgressText.Caption:='��������� ���������';
  fWinGenPrgr.bClose.Enabled:=True;
  fWinGenPrgr.pbPercGenPrgr.Position:=fWinGenPrgr.pbPercGenPrgr.Max;
//-----------------------------------------------------------------------
  SaveSettings:=0;
end;

//____________________________________________________________________
// ��������� ���������
function LoadSettings():Integer;
var
  FileMain: file of Setting2FileRec;
  Setting2File: Setting2FileRec;
  fListOfSubSystem: file of ListOfSubSystemRec;
  fFB20:  file of FB20RecForFile;
  s, NameFile:string;
  Res, n, i : Integer;
begin
 if not SymTablIsLoad then
 Application.MessageBox('���� ������� �������� �� ��������!' + #13#10 +
   '�� ����� �������� ����� ��������� ������ ����� ������!', '��������������',
   MB_OK + MB_ICONWARNING);

//-----------------------------------------------------------------------
// ��������� ������� ���� ��������
//-----------------------------------------------------------------------
 if fMain.OpenDialogSetting.Execute then
 begin
  fWinGenPrgr.Show;
  fWinGenPrgr.bClose.Enabled:=False;
  fWinGenPrgr.Caption:='��������� ���������...';
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^

  NameFile:=fMain.OpenDialogSetting.FileName;
// ���������� ��� ����� ������� ��������
  s:=NameFile;
  n:=Pos('_MainSetting.cfg',s);
  s:=Copy(s,1,n-1);
  NameTblSmbl:=s+'.sdf';
//-----------------------------------------------------------------------
// ��������� �� ����� ������� ���������
//-----------------------------------------------------------------------
  AssignFile(FileMain, NameFile);
  {$I-}
  Reset(FileMain);
  {$I+}
  Res:=IOResult;
  if Res <> 0 then
  begin
    fWinGenPrgr.Hide;
    LoadSettings:=10;
    MessageDlg('��������� ������ ��� �������� ����� "'+ NameFile+'"', mtError, [mbOk], 0);
    Exit;
  end;
  {$I-}
  Read(FileMain,Setting2File);
  {$I+}
  Res:=IOResult;
  if Res <> 0 then
  begin
    fWinGenPrgr.Hide;
    LoadSettings:=20;
    MessageDlg('��������� ������ ��� ������ �� ����� "'+ NameFile+'"', mtError, [mbOk], 0);
    CloseFile(FileMain);
    Exit;
  end;

  CloseFile(FileMain);
// ���� ������� �������� ���������
  if SymTablIsLoad then
  begin
// �������� ������ �� ������
    if CntDi<>Setting2File.CntDi then
    begin
      LoadSettings:=30;
      Res:=MessageBox(0,
        PChar('��������� ������ ��� �������� ����������� ������.'#13#10'�� ��������� ����������� ���������� ������.'#13#10#13#10'��������� �������� ��������?'),
        PChar('������ ��� �������� �����'), MB_YESNO + MB_ICONERROR + MB_TASKMODAL);
      if Res = IDYES then
      begin
        fWinGenPrgr.Hide;
        Exit;
      end;
    end;

    if CntDq<>Setting2File.CntDq then
    begin
      LoadSettings:=40;
//    MessageDlg('��������� ������ ��� �������� ������.'#13#10'�� ��������� ����������� ���������� �������', mtError, [mbOk], 0);
      Res:=MessageBox(0,
        PChar('��������� ������ ��� �������� ����������� ������.'#13#10'�� ��������� ����������� ���������� �������.'#13#10#13#10'��������� �������� ��������?'),
        PChar('������ ��� �������� �����'), MB_YESNO + MB_ICONERROR + MB_TASKMODAL);
      if Res = IDYES then
      begin
        fWinGenPrgr.Hide;
        Exit;
      end;
    end;
  end;

// �������� ����������
  if SymTablIsLoad then // ���� ������� �������� ���������
  begin
    CntDi:=Setting2File.CntDi; // ���-�� ���������� ������
    CntDq:=Setting2File.CntDq; // ���-�� ���������� �������
    CntDev:=Setting2File.CntDev; // ���-�� ����������������� ���������
  end;
  HMSubSystem:=Setting2File.HMSubSystem; // ������� ��������� ��������������� ������������(1..10)
  NeedMsgDev:=Setting2File.NeedMsgDev; // ���������� �� ����������� ��������� ��� WinCC
  NeedExtraData:=Setting2File.NeedExtraData; // ���������� �� ����������� ����������� ������
  NeedAutoModeUF:=Setting2File.NeedAutoModeUF; // ���������� �� ����������� ����� "����" ��� UF
  NeedAutoModeRO:=Setting2File.NeedAutoModeRO; // ���������� �� ����������� ����� "����" ��� RO
  NeedAutoModeEDI:=Setting2File.NeedAutoModeEDI; // ���������� �� ����������� ����� "����" ��� EDI
  NumDB:=Setting2File.NumDB; // � ������ ������ ����������� �������-DB
  AddrtEnablePLCMsg:=Setting2File.AddrtEnablePLCMsg; // ����� ������� ��� ���������� �����������
  uMain.TemplCP:=Setting2File.TemplCP;
  uMain.TemplDP:=Setting2File.TemplDP;
  uMain.TemplAV:=Setting2File.TemplAV;
  uMain.TemplHeat:=Setting2File.TemplHeat;
  uMain.Spare:=Setting2File.Spare;
  TemplQF:=Setting2File.TemplQF;
  TemplUF:=Setting2File.TemplUF;
  TemplRO:=Setting2File.TemplRO;
  TemplEDI:=Setting2File.TemplEDI;
  OB32IsPresent:=Setting2File.OB32IsPresent;
  NeedLAD:=Setting2File.NeedLAD;
  NeedWinCCObj:=Setting2File.NeedWinCCObj;
  NameS7P:=Setting2File.NameS7P; // ��� S7 ���������
  SepWinCC:=Setting2File.SepWinCC;
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
//-----------------------------------------------------------------------
// ��������� ���� ������� ���������
//-----------------------------------------------------------------------
// ��������� ��� �����
  NameFile:=s+'_ListOfSubSystem.lst';
  AssignFile(fListOfSubSystem, NameFile);
  {$I-}
  Reset(fListOfSubSystem);
  {$I+}
  Res:=IOResult;
  if Res <> 0 then
  begin
    fWinGenPrgr.Hide;
    LoadSettings:=Res;
    MessageDlg('��������� ������ ��� �������� ����� "'+ NameFile+'"', mtError, [mbOk], 0);
    Exit;
  end;
  fMain.cbbSelDBName.Items.Clear;
  for i:=1 to HMSubSystem do
  begin
    {$I-}
    Read(fListOfSubSystem, ListOfSubSystem[i]);
    {$I+}
    Res:=IOResult;
    if Res <> 0 then
    begin
      fWinGenPrgr.Hide;
      LoadSettings:=Res;
      MessageDlg('��������� ������ ��� ������ �� ����� "'+ NameFile+'"', mtError, [mbOk], 0);
      CloseFile(fListOfSubSystem);
      Exit;
    end;
    fMain.cbbSelDBName.Items.Add(ListOfSubSystem[i].Name);
  end;
  fMain.cbbSelDBName.ItemIndex:=0;
  CurrNameDB:=fMain.cbbSelDBName.Text;
  CloseFile(fListOfSubSystem);
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
//-----------------------------------------------------------------------
// ��������� � ���� ������� ���������
//-----------------------------------------------------------------------
  if SymTablIsLoad then // ���� ������� �������� ���������
  begin
// ��������� ��� �����
    NameFile:=s+'_FB20.lst';
    AssignFile(fFB20, NameFile);
    {$I-}
    Reset(fFB20);
    {$I+}
    Res:=IOResult;
    if Res <> 0 then
    begin
      fWinGenPrgr.Hide;
      LoadSettings:=Res;
      MessageDlg('��������� ������ ��� �������� ����� "'+ NameFile+'"', mtError, [mbOk], 0);
      Exit;
    end;
    for i:=0 to CntDev-1 do
    begin
      {$I-}
      Read(fFB20, FB20ForFile[i]);
      {$I+}
      Res:=IOResult;
      if Res <> 0 then
      begin
        fWinGenPrgr.Hide;
        LoadSettings:=Res;
        MessageDlg('��������� ������ ��� ������ �� ����� "'+ NameFile+'"', mtError, [mbOk], 0);
        CloseFile(fFB20);
        Exit;
      end;
    end;
    CloseFile(fFB20);
    fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
    FB20ForFileSaveToFB20();
    fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
    ShowFieldDev(CurrFB20);
  end;
//-----------------------------------------------------------------------
// ���� �������� ����������� ������
//-----------------------------------------------------------------------
// ��������� ���������� �� ������ ��������
  uSettings.UpDateFormSettings;
//-----------------------------------------------------------------------
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
  fWinGenPrgr.Caption:='��������� ���������';
  fWinGenPrgr.lblProgressText.Caption:='��������� ���������';
  fWinGenPrgr.bClose.Enabled:=True;
  fWinGenPrgr.pbPercGenPrgr.Position:=fWinGenPrgr.pbPercGenPrgr.Max;
  end;
// ������� ���� ������ (= 0 - �� Ok)
  LoadSettings:=0;
end;

//____________________________________________________________________
// �������� ��������� FB20 � FB20ForFile
procedure FB20SaveToFB20ForFile();
var
  i:Integer;
begin
  for i:=0 to CntDev-1 do
  begin
    FB20ForFile[i].Device  :=FB20[i].Device   ;
    FB20ForFile[i].TypeDev :=FB20[i].TypeDev   ;
    FB20ForFile[i].NameDB  :=FB20[i].NameDB   ;
    FB20ForFile[i].Addr    :=FB20[i].Addr     ;
    FB20ForFile[i].NeedMsg :=FB20[i].NeedMsg  ;
    FB20ForFile[i].MsgAV   :=FB20[i].MsgAV    ;
    FB20ForFile[i].Name    :=FB20[i].Name     ;
    FB20ForFile[i].Name4Msg:=FB20[i].Name4Msg ;
    FB20ForFile[i].Rem     :=FB20[i].Rem      ;
    FB20ForFile[i].Kx1     :=FB20[i].Kx1      ;
    FB20ForFile[i].SQ1     :=FB20[i].SQ1      ;
    FB20ForFile[i].SB1     :=FB20[i].SB1      ;
    FB20ForFile[i].SU1     :=FB20[i].SU1      ;
    FB20ForFile[i].Kx2     :=FB20[i].Kx2      ;
    FB20ForFile[i].SQ2     :=FB20[i].SQ2      ;
    FB20ForFile[i].SB2     :=FB20[i].SB2      ;
    FB20ForFile[i].SU2     :=FB20[i].SU2      ;
    FB20ForFile[i].OFF     :=FB20[i].OFF      ;
    FB20ForFile[i].Dis     :=FB20[i].Dis      ;
    FB20ForFile[i].QFx     :=FB20[i].QFx      ;
    FB20ForFile[i].Ack     :=FB20[i].Ack      ;
    FB20ForFile[i].Mdt     :=FB20[i].Mdt      ;
    FB20ForFile[i].Mdx     :=FB20[i].Mdx      ;
    FB20ForFile[i].Mdw     :=FB20[i].Mdw      ;
    FB20ForFile[i].Mdu     :=FB20[i].Mdu      ;
    FB20ForFile[i].Tm1     :=FB20[i].Tm1      ;
    FB20ForFile[i].Tm2     :=FB20[i].Tm2      ;
    FB20ForFile[i].TmX     :=FB20[i].TmX      ;
    FB20ForFile[i].Km1     :=FB20[i].Km1      ;
    FB20ForFile[i].Lr1     :=FB20[i].Lr1      ;
    FB20ForFile[i].Lg1     :=FB20[i].Lg1      ;
    FB20ForFile[i].Km2     :=FB20[i].Km2      ;
    FB20ForFile[i].Lr2     :=FB20[i].Lr2      ;
    FB20ForFile[i].Lg2     :=FB20[i].Lg2      ;
    FB20ForFile[i].Ste     :=FB20[i].Ste      ;

    FB20ForFile[i].Kx1_S7mc:=FB20[i].Kx1_S7mc;
    FB20ForFile[i].SQ1_S7mc:=FB20[i].SQ1_S7mc;
    FB20ForFile[i].SB1_S7mc:=FB20[i].SB1_S7mc;
    FB20ForFile[i].SU1_S7mc:=FB20[i].SU1_S7mc;
    FB20ForFile[i].Kx2_S7mc:=FB20[i].Kx2_S7mc;
    FB20ForFile[i].SQ2_S7mc:=FB20[i].SQ2_S7mc;
    FB20ForFile[i].SB2_S7mc:=FB20[i].SB2_S7mc;
    FB20ForFile[i].SU2_S7mc:=FB20[i].SU2_S7mc;
    FB20ForFile[i].OFF_S7mc:=FB20[i].OFF_S7mc;
    FB20ForFile[i].Dis_S7mc:=FB20[i].Dis_S7mc;
    FB20ForFile[i].QFx_S7mc:=FB20[i].QFx_S7mc;
    FB20ForFile[i].Ack_S7mc:=FB20[i].Ack_S7mc;
    FB20ForFile[i].Mdt_S7mc:=FB20[i].Mdt_S7mc;
    FB20ForFile[i].Mdx_S7mc:=FB20[i].Mdx_S7mc;
    FB20ForFile[i].Mdw_S7mc:=FB20[i].Mdw_S7mc;
    FB20ForFile[i].Mdu_S7mc:=FB20[i].Mdu_S7mc;
    FB20ForFile[i].Tm1_S7mc:=FB20[i].Tm1_S7mc;
    FB20ForFile[i].Tm2_S7mc:=FB20[i].Tm2_S7mc;
    FB20ForFile[i].TmX_S7mc:=FB20[i].TmX_S7mc;
    FB20ForFile[i].Km1_S7mc:=FB20[i].Km1_S7mc;
    FB20ForFile[i].Lr1_S7mc:=FB20[i].Lr1_S7mc;
    FB20ForFile[i].Lg1_S7mc:=FB20[i].Lg1_S7mc;
    FB20ForFile[i].Km2_S7mc:=FB20[i].Km2_S7mc;
    FB20ForFile[i].Lr2_S7mc:=FB20[i].Lr2_S7mc;
    FB20ForFile[i].Lg2_S7mc:=FB20[i].Lg2_S7mc;
    FB20ForFile[i].Ste_S7mc:=FB20[i].Ste_S7mc;
  end;
end;

//____________________________________________________________________
// �������� ��������� FB20ForFile � FB20
procedure FB20ForFileSaveToFB20();
var
  i:Integer;
begin
  for i:=0 to CntDev-1 do
  begin
    FB20[i].Device  :=FB20ForFile[i].Device   ;
    FB20[i].TypeDev  :=FB20ForFile[i].TypeDev ;
    FB20[i].NameDB  :=FB20ForFile[i].NameDB   ;
    FB20[i].Addr    :=FB20ForFile[i].Addr     ;
    FB20[i].NeedMsg :=FB20ForFile[i].NeedMsg  ;
    FB20[i].MsgAV   :=FB20ForFile[i].MsgAV    ;
    FB20[i].Name    :=FB20ForFile[i].Name     ;
    FB20[i].Name4Msg:=FB20ForFile[i].Name4Msg ;
    FB20[i].Rem     :=FB20ForFile[i].Rem      ;
    FB20[i].Kx1     :=FB20ForFile[i].Kx1      ;
    FB20[i].SQ1     :=FB20ForFile[i].SQ1      ;
    FB20[i].SB1     :=FB20ForFile[i].SB1      ;
    FB20[i].SU1     :=FB20ForFile[i].SU1      ;
    FB20[i].Kx2     :=FB20ForFile[i].Kx2      ;
    FB20[i].SQ2     :=FB20ForFile[i].SQ2      ;
    FB20[i].SB2     :=FB20ForFile[i].SB2      ;
    FB20[i].SU2     :=FB20ForFile[i].SU2      ;
    FB20[i].OFF     :=FB20ForFile[i].OFF      ;
    FB20[i].Dis     :=FB20ForFile[i].Dis      ;
    FB20[i].QFx     :=FB20ForFile[i].QFx      ;
    FB20[i].Ack     :=FB20ForFile[i].Ack      ;
    FB20[i].Mdt     :=FB20ForFile[i].Mdt      ;
    FB20[i].Mdx     :=FB20ForFile[i].Mdx      ;
    FB20[i].Mdw     :=FB20ForFile[i].Mdw      ;
    FB20[i].Mdu     :=FB20ForFile[i].Mdu      ;
    FB20[i].Tm1     :=FB20ForFile[i].Tm1      ;
    FB20[i].Tm2     :=FB20ForFile[i].Tm2      ;
    FB20[i].TmX     :=FB20ForFile[i].TmX      ;
    FB20[i].Km1     :=FB20ForFile[i].Km1      ;
    FB20[i].Lr1     :=FB20ForFile[i].Lr1      ;
    FB20[i].Lg1     :=FB20ForFile[i].Lg1      ;
    FB20[i].Km2     :=FB20ForFile[i].Km2      ;
    FB20[i].Lr2     :=FB20ForFile[i].Lr2      ;
    FB20[i].Lg2     :=FB20ForFile[i].Lg2      ;
    FB20[i].Ste     :=FB20ForFile[i].Ste      ;

    FB20[i].Kx1_S7mc:=FB20ForFile[i].Kx1_S7mc;
    FB20[i].SQ1_S7mc:=FB20ForFile[i].SQ1_S7mc;
    FB20[i].SB1_S7mc:=FB20ForFile[i].SB1_S7mc;
    FB20[i].SU1_S7mc:=FB20ForFile[i].SU1_S7mc;
    FB20[i].Kx2_S7mc:=FB20ForFile[i].Kx2_S7mc;
    FB20[i].SQ2_S7mc:=FB20ForFile[i].SQ2_S7mc;
    FB20[i].SB2_S7mc:=FB20ForFile[i].SB2_S7mc;
    FB20[i].SU2_S7mc:=FB20ForFile[i].SU2_S7mc;
    FB20[i].OFF_S7mc:=FB20ForFile[i].OFF_S7mc;
    FB20[i].Dis_S7mc:=FB20ForFile[i].Dis_S7mc;
    FB20[i].QFx_S7mc:=FB20ForFile[i].QFx_S7mc;
    FB20[i].Ack_S7mc:=FB20ForFile[i].Ack_S7mc;
    FB20[i].Mdt_S7mc:=FB20ForFile[i].Mdt_S7mc;
    FB20[i].Mdx_S7mc:=FB20ForFile[i].Mdx_S7mc;
    FB20[i].Mdw_S7mc:=FB20ForFile[i].Mdw_S7mc;
    FB20[i].Mdu_S7mc:=FB20ForFile[i].Mdu_S7mc;
    FB20[i].Tm1_S7mc:=FB20ForFile[i].Tm1_S7mc;
    FB20[i].Tm2_S7mc:=FB20ForFile[i].Tm2_S7mc;
    FB20[i].TmX_S7mc:=FB20ForFile[i].TmX_S7mc;
    FB20[i].Km1_S7mc:=FB20ForFile[i].Km1_S7mc;
    FB20[i].Lr1_S7mc:=FB20ForFile[i].Lr1_S7mc;
    FB20[i].Lg1_S7mc:=FB20ForFile[i].Lg1_S7mc;
    FB20[i].Km2_S7mc:=FB20ForFile[i].Km2_S7mc;
    FB20[i].Lr2_S7mc:=FB20ForFile[i].Lr2_S7mc;
    FB20[i].Lg2_S7mc:=FB20ForFile[i].Lg2_S7mc;
    FB20[i].Ste_S7mc:=FB20ForFile[i].Ste_S7mc;
    
  end;
end;

//____________________________________________________________________
// �������� �� ������ (=False - �� ��; =True - ���� ������)
function CheckErr(): Boolean;
var
  i, j: Integer;
  s: string;
  Err:Boolean;
begin
//------------------------------------------------------------------------------
// ������ (������ ��������� � ������������� ������������� ���������)
//------------------------------------------------------------------------------
  if CheckErrSubSystem() then
  begin
    CheckErr:=True;
    Exit;
  end;
  
  for i:=0 to CntDev-1 do
  begin
   if FB20[i].Device then
   begin
    Err:=True;
    for j:=1 to HMSubSystem do
    begin
      s:='"dt'+ListOfSubSystem[j].Name+'"';
      if FB20[i].NameDB=s then Err:=False;
    end;
    if Err then
    begin
      CheckErr:=True;
      Application.MessageBox(PChar('���������� �������������� � �������������� ���������� � ������ ���������'#13#10#13#10'����������: "'+FB20[i].Name+'"'#13#10'�������������� ���� ������: '+FB20[i].NameDB),
       '������', MB_OK +
        MB_ICONSTOP);
      Exit;
    end;
   end;
  end;
//------------------------------------------------------------------------------
// �������������� (������������� ��������� ��������)
//------------------------------------------------------------------------------
  for i:=1 to HMSubSystem do
    for j:=i+1 to HMSubSystem do
      if ListOfSubSystem[i].Rem=ListOfSubSystem[j].Rem then
      begin
        //CheckErr:=False;
        Application.MessageBox(PChar('���������� ������������� ����������� ���������'#13#10#13#10'������������� �����������: "'+ ListOfSubSystem[i].Rem+'"'#13#10'����� ��������� ������������� �������: "'+ ListOfSubSystem[i].Name+'" � "'+ ListOfSubSystem[j].Name+'"'#13#10'������  ���������: '+IntToStr(i) + ' � ' + IntToStr(j)),
        '��������������', MB_OK +
          MB_ICONWARNING);
        //Exit;
      end;
//------------------------------------------------------------------------------
// ���� ��� ������
//------------------------------------------------------------------------------
//  MessageDlg('������ �� ����������', mtInformation, [mbOk], 0);
  CheckErr:=False;
end;
//____________________________________________________________________
// �������� �� ������ ������ ��������� (=False - �� ��; =True - ���� ������)
function CheckErrSubSystem(): Boolean;
var
  i, j: Integer;
begin
  for i:=1 to HMSubSystem do
    for j:=i+1 to HMSubSystem do
      if ListOfSubSystem[i].Name=ListOfSubSystem[j].Name then
      begin
        CheckErrSubSystem:=True;
        Application.MessageBox(PChar('���������� ������������� ����� ���������'#13#10#13#10'������������� ���: "'+ ListOfSubSystem[i].Name+'"'#13#10'������  ���������: '+IntToStr(i) + ' � ' + IntToStr(j)),
                   '������', MB_OK + MB_ICONSTOP);
        Exit;
      end;
  for i:=1 to HMSubSystem do
    for j:=i+1 to HMSubSystem do
      if ListOfSubSystem[i].Addr=ListOfSubSystem[j].Addr then
      begin
        CheckErrSubSystem:=True;
        Application.MessageBox(PChar('���������� ������������� ������ ���������'#13#10#13#10'������������� �����: "'+ IntToStr(ListOfSubSystem[i].Addr)+'"'#13#10'����� ��������� ������������� �������: "'+ ListOfSubSystem[i].Name+'" � "'+ ListOfSubSystem[j].Name+'"'#13#10'������  ���������: '+IntToStr(i) + ' � ' + IntToStr(j)),
                   '������', MB_OK + MB_ICONSTOP);
        Exit;
      end;
  for i:=1 to HMSubSystem do
    for j:=i+1 to HMSubSystem do
      if Abs(ListOfSubSystem[j].Addr-ListOfSubSystem[i].Addr)<20 then
      begin
        CheckErrSubSystem:=True;
        Application.MessageBox(PChar('���������� "���������" ��������� ������� ���������'#13#10#13#10'��������� �������: ['+ IntToStr(ListOfSubSystem[i].Addr)+'..'+IntToStr(ListOfSubSystem[i].Addr+20)+']'+
                  ' � ['+ IntToStr(ListOfSubSystem[j].Addr)+'..'+IntToStr(ListOfSubSystem[j].Addr+20)+']'+
                  ''#13#10'����� ���������: "'+ ListOfSubSystem[i].Name+'" � "'+ ListOfSubSystem[j].Name+'"'#13#10'������  ���������: '+IntToStr(i) + ' � ' + IntToStr(j)),
                   '������', MB_OK + MB_ICONSTOP);
        Exit;
      end;

end;

procedure TfMain.bChkErrClick(Sender: TObject);
begin
  if not CheckErr
  then Application.MessageBox('������ �� ����������','����������', MB_OK + MB_ICONINFORMATION);
//  if not CheckErr then MessageDlg('������ �� ����������', mtInformation, [mbOk], 0);
end;

//____________________________________________________________________
// ��������� ���������� ������ (=True-���� ��� �� �������)
function FiltrDq(filtr:string):Boolean ;
var
  i, j, k: Integer;
  s: TSepText;
  FindRes,FindAddRes, FiltrRes:Boolean;
begin
  k:=0;
  FiltrRes:=False;
  SeparateFiltrText(filtr, s);
  for i:=0 to CntDev-1 do
  begin
    FindRes:=True;
    DqFiltr[i].Visible:=False;
    for j:=0 to SepTextMax do
    if not FindFromTemplate(s[j],FB20[i].Name) then FindRes:=False;
    FindAddRes:=AddFiltrDq(i);
    if FindRes and FindAddRes then
    begin
      DqFiltr[i].Visible:=True;
      DqFiltr[i].Num:=k;
      k:=k+1;
      if (s[0]<>'*') then FiltrRes:=True;
    end;
  end;
  if (k=0) or (DqAddFilter.NeedMsg or DqAddFilter.Device or DqAddFilter.priNameDB or DqAddFilter.MsgAV)
  then FiltrRes:=True;
  FiltrDq:=FiltrRes;
end;

//____________________________________________________________________
// ��������� (�������������)  ���������� ������ (=True-���� ��� �� �������)
function AddFiltrDq(pos:Integer):Boolean ;
var
  bNeedMsg, bMsgAV, priNameDB, bDevice:Boolean;
begin
  if (DqAddFilter.Device and FB20[pos].Device) or not DqAddFilter.Device
    then bDevice:=True
    else bDevice:=False;

  if (DqAddFilter.NeedMsg and FB20[pos].NeedMsg) or not DqAddFilter.NeedMsg
    then bNeedMsg:=True
    else bNeedMsg:=False;
  if (DqAddFilter.MsgAV and FB20[pos].MsgAV) or not DqAddFilter.MsgAV
    then bMsgAV:=True
    else bMsgAV:=False;
  if (DqAddFilter.priNameDB and (DqAddFilter.NameDB=FB20[pos].NameDB))
      or not DqAddFilter.priNameDB
    then priNameDB:=True
    else priNameDB:=False;
  AddFiltrDq:=bNeedMsg and bMsgAV and priNameDB and bDevice;
end;

//____________________________________________________________________
// ��������� ���������� ����� (=True-���� ��� �� �������)
function FiltrDi(filtr:string):Boolean ;
var
  i, j, k: Integer;
  s: TSepText;
  FindRes, FiltrRes:Boolean;
begin
  k:=0;
  FiltrRes:=False;
  SeparateFiltrText(filtr, s);
  for i:=0 to CntDi-1 do
  begin
    FindRes:=True;
    DiFiltr[i].Visible:=False;
    for j:=0 to SepTextMax do
    if not FindFromTemplate(s[j],di[i].Name) then FindRes:=False;
    if FindRes then
    begin
      DiFiltr[i].Visible:=True;
      DiFiltr[i].Num:=k;
      k:=k+1;
      if (s[0]<>'*') then FiltrRes:=True;
    end;
  end;
  if k=0 then FiltrRes:=True;
  FiltrDi:=FiltrRes;
end;
//______________________________________________________________________________
// ��������� ����� ������� �� ������������
procedure SeparateFiltrText(Text:string; var SepText: TSepText);
var
  s:string;
  Sep:TSepText;
  i,n:Integer;
begin
  s:=Text;
  for i:=0 to 10 do Sep[i]:='*';
//  if s='*' then Exit;
  s:=s+'*';
  i:=0;
  if pos('*',s)=1 then delete(s,1,1);
  while pos('*',s)<>0 do
  begin
    n:=Pos('*',s);
    if n>1 then
    begin
      Sep[i]:=Copy(s,1,n-1);
      i:=i+1;
    end;
    Delete(s,1,n);
  end;
  SepText:=Sep;
end;

//______________________________________________________________________________
// ����� � ������� FB20 ������������ ���������������� ���������� FB20
function FindCurrFB20(sgDqPos:Integer): Integer;
var
  i,n: Integer;
begin
  n:=-1;
  for i:=0 to cntDev do
    if DqFiltr[i].Visible and (DqFiltr[i].Num=sgDqPos) then
    begin
      n:=i;
      Break;
    end;
   FindCurrFB20:=n;
end;
//______________________________________________________________________________
// ����� � ������� Di ������������ ���������������� Di
function FindCurrDi(sgDiPos:Integer): Integer;
var
  i,n: Integer;
begin
  n:=-1;
  for i:=0 to CntDi do
    if DiFiltr[i].Visible and (DiFiltr[i].Num=sgDiPos) then
    begin
      n:=i;
      Break;
    end;
   FindCurrDi:=n;
end;

procedure TfMain.eFiltrDqExit(Sender: TObject);
begin
  DqFiltrText:=eFiltrDq.Text;
end;

procedure TfMain.chkMsgAVClick(Sender: TObject);
begin
  FB20[CurrFB20].MsgAV:=chkMsgAV.Checked;
  ShowFieldDev(CurrFB20);
end;

procedure TfMain.eFiltrDiExit(Sender: TObject);
begin
  DiFiltrText:=eFiltrDi.Text;
end;

procedure TfMain.eFiltrDqKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then FindAndShowDQ();
end;
//______________________________________________________________________________
// �������� ������������ � ����������� ���� ��� ������� �� ������� DQ
procedure FindAndShowDQ();
begin
  DqFiltrText:=fMain.eFiltrDq.Text;
  DqFiltrText:=DelSpace(DqFiltrText);
  fMain.bvlFindFiltrDQ.Visible:=FiltrDq(DqFiltrText);
  ShowGridDq;
  CurrFB20:=FindCurrFB20(CurrPosDq);
  ShowFieldDev(CurrFB20);
end;
//______________________________________________________________________________
// �������� ������������ � ����������� ���� ��� ������� �� ������� DI
procedure FindAndShowDI();
begin
  DiFiltrText:=fMain.eFiltrDi.Text;
  DiFiltrText:=DelSpace(DiFiltrText);
  fMain.bvlFindFiltrDI.Visible:=FiltrDi(DiFiltrText);
  ShowGridDi;
end;

procedure TfMain.eFiltrDiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then FindAndShowDI();
end;

procedure TfMain.bFiltrDqClick(Sender: TObject);
begin
  FindAndShowDQ();
end;

procedure TfMain.bFiltrDiClick(Sender: TObject);
begin
FindAndShowDI();
end;

procedure TfMain.spFiltrDQClick(Sender: TObject);
begin
fAddFilterDQ.ShowModal;
end;

//______________________________________________________________________________
// ������ ���������� � DB (� mmoGenPrgr)
procedure WriteDev2mmoGenPrgr(index:Integer; TextDev:string);
var
  s,S7mc :string;
begin
  if (NoBlank(FB20[index].Kx1)) and (Pos(FB20[Index].NameDB,FB20[Index].Kx1)<>0) then
  begin
    s:=StringReplace(FB20[index].Kx1,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Kx1_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //����-������� 1 '+TextDev+'�');
  end;
 if (NoBlank(FB20[index].SQ1)) and (Pos(FB20[Index].NameDB,FB20[Index].SQ1)<>0) then
  begin
    s:=StringReplace(FB20[index].SQ1,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].SQ1_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //�������� ����������� 1 '+TextDev+'�');
  end;
  if (NoBlank(FB20[index].SB1)) and (Pos(FB20[Index].NameDB,FB20[Index].SB1)<>0) then
  begin
    s:=StringReplace(FB20[index].SB1,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].SB1_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //���������� '+TextDev+'�� � ������ ������ ������� ��� (=1-���., =0-����.)');
  end;
  if (NoBlank(FB20[index].SU1)) and (Pos(FB20[Index].NameDB,FB20[Index].SU1)<>0) then
  begin
    s:=StringReplace(FB20[index].SU1,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].SU1_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //������ ������� ��������� Km1 '+TextDev+'� � ���������� ������ ');
  end;
  if (NoBlank(FB20[index].Kx2)) and (Pos(FB20[Index].NameDB,FB20[Index].Kx2)<>0) then
  begin
    s:=StringReplace(FB20[index].Kx2,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Kx2_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //����-������� 2 '+TextDev+'�');
  end;
  if (NoBlank(FB20[index].SQ2)) and (Pos(FB20[Index].NameDB,FB20[Index].SQ2)<>0) then
  begin
    s:=StringReplace(FB20[index].SQ2,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].SQ2_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //�������� ����������� 2 '+TextDev+'�');
  end;
  if (NoBlank(FB20[index].SB2)) and (Pos(FB20[Index].NameDB,FB20[Index].SB2)<>0) then
  begin
    s:=StringReplace(FB20[index].SB2,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].SB2_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //���������� '+TextDev+'�� � ������ ������ ������� ���� (=1-���., =0-����.)');
  end;
  if (NoBlank(FB20[index].SU2)) and (Pos(FB20[Index].NameDB,FB20[Index].SU2)<>0) then
  begin
    s:=StringReplace(FB20[index].SU2,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].SU2_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //������ ������� ��������� Km2 '+TextDev+'� � ���������� ������ ');
  end;
  if (NoBlank(FB20[index].OFF)) and (Pos(FB20[Index].NameDB,FB20[Index].OFF)<>0) then
  begin
    s:=StringReplace(FB20[index].OFF,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].OFF_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //������ "����" ��� ������ �������� (=1-�������) '+TextDev+'�');
  end;
  if (NoBlank(FB20[index].Dis)) and (Pos(FB20[Index].NameDB,FB20[Index].Dis)<>0) then
  begin
    s:=StringReplace(FB20[index].Dis,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Dis_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //���������� ������ '+TextDev+'� (�������) (=1-�������)');
  end;
  if (NoBlank(FB20[index].QFx)) and (Pos(FB20[Index].NameDB,FB20[Index].QFx)<>0) then
  begin
    s:=StringReplace(FB20[index].QFx,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].QFx_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //�������� ������� ����� '+TextDev+'� (=1-�������)');
  end;
  if (NoBlank(FB20[index].Ack)) and (Pos(FB20[Index].NameDB,FB20[Index].Ack)<>0) then
  begin
    s:=StringReplace(FB20[index].Ack,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Ack_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //����� ��������� ������ '+TextDev+'� (������������) (=1-�������)');
  end;
  if (NoBlank(FB20[index].Mdt)) and (Pos(FB20[Index].NameDB,FB20[Index].Mdt)<>0) then
  begin
    s:=StringReplace(FB20[index].Mdt,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Mdt_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //���������� ����� (������ (���������) ����������) '+TextDev+'�');
  end;
  if (NoBlank(FB20[index].Mdx)) and (Pos(FB20[Index].NameDB,FB20[Index].Mdx)<>0) then
  begin
    s:=StringReplace(FB20[index].Mdx,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Mdx_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //����� ������ '+TextDev+'� (=0-������, =1-�������)');
  end;
  if (NoBlank(FB20[index].Mdw)) and (Pos(FB20[Index].NameDB,FB20[Index].Mdw)<>0) then
  begin
    s:=StringReplace(FB20[index].Mdw,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Mdw_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : WORD ; //����� ������� ������ ������ ������ � �� '+TextDev+'�');
  end;
  if (NoBlank(FB20[index].Mdu)) and (Pos(FB20[Index].NameDB,FB20[Index].Mdu)<>0) then
  begin
    s:=StringReplace(FB20[index].Mdu,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Mdu_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : WORD ; //����� ��������� ������ ������ (����� ��� ����� �������) '+TextDev+'�');
  end;
  if (NoBlank(FB20[index].Tm1)) and (Pos(FB20[Index].NameDB,FB20[Index].Tm1)<>0) then
  begin
    s:=StringReplace(FB20[index].Tm1,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Tm1_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : TIME ; //�������� ������� ������ Km1 (T#0MS/T#24D - ��� �����������) '+TextDev+'�');
  end;
  if (NoBlank(FB20[index].Tm2)) and (Pos(FB20[Index].NameDB,FB20[Index].Tm2)<>0) then
  begin
    s:=StringReplace(FB20[index].Tm2,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Tm2_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : TIME ; //�������� ������� ������ Km2 (T#0MS/T#24D - ��� �����������) '+TextDev+'�');
  end;
  if (NoBlank(FB20[index].TmX)) and (Pos(FB20[Index].NameDB,FB20[Index].TmX)<>0) then
  begin
    s:=StringReplace(FB20[index].TmX,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].TmX_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : TIME ; //�������� ������� ������������ ����-��������� Kx1 � Kx2 '+TextDev+'�');
  end;
  if (NoBlank(FB20[index].Km1)) and (Pos(FB20[Index].NameDB,FB20[Index].Km1)<>0) then
  begin
    s:=StringReplace(FB20[index].Km1,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Km1_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //������� �� ������ '+TextDev+'� (Km1)');
  end;
  if (NoBlank(FB20[index].Lr1)) and (Pos(FB20[Index].NameDB,FB20[Index].Lr1)<>0) then
  begin
    s:=StringReplace(FB20[index].Lr1,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Lr1_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //��������� �������� (����� 1, �������)');
  end;
  if (NoBlank(FB20[index].Lg1)) and (Pos(FB20[Index].NameDB,FB20[Index].Lg1)<>0) then
  begin
    s:=StringReplace(FB20[index].Lg1,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Lg1_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //��������� �������� (����� 1, �������)');
  end;
  if (NoBlank(FB20[index].Km2)) and (Pos(FB20[Index].NameDB,FB20[Index].Km2)<>0) then
  begin
    s:=StringReplace(FB20[index].Km2,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Km2_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //������� �� ������ '+TextDev+'� (Km2)');
  end;
  if (NoBlank(FB20[index].Lr2)) and (Pos(FB20[Index].NameDB,FB20[Index].Lr2)<>0) then
  begin
    s:=StringReplace(FB20[index].Lr2,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Lr2_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //��������� �������� (����� 2, �������)');
  end;
  if (NoBlank(FB20[index].Lg2)) and (Pos(FB20[Index].NameDB,FB20[Index].Lg2)<>0) then
  begin
    s:=StringReplace(FB20[index].Lg2,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Lg2_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : BOOL ; //��������� �������� (����� 2, �������)');
  end;
  if (NoBlank(FB20[index].Ste)) and (Pos(FB20[Index].NameDB,FB20[Index].Ste)<>0) then
  begin
    s:=StringReplace(FB20[index].Ste,FB20[Index].NameDB+'.','',[rfreplaceall]);
    if FB20[index].Ste_S7mc then S7mc:=' { S7_m_c := '+#39+'true'+#39+' }' else S7mc:='';
    fMain.mmoGenPrgr.Lines.Add(s+S7mc+' : WORD ; //��������� '+TextDev+'�');
  end;
end;
//______________________________________________________________________________
// ������ � ���������� ���������� ������ ���� �� �� ������
function AllowReplaceFieldText(s:string):Boolean;
var
  a,b,c:Boolean;
begin
  a:=NoBlank(s);
  if a then
  b:=IDYES = MessageBox(fMain.Handle,'���� �� ������'#13#10'��������������?','���������� �������������',MB_YESNO or MB_ICONQUESTION );
  c:=not a or (a and b);
  AllowReplaceFieldText:=c;
end;

procedure TfMain.bGenVarKx1Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Kx1) then
  begin
  FB20[CurrFB20].Kx1:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Kx1';
  eKx1.Text:=FB20[CurrFB20].Kx1;
  end;
end;

procedure TfMain.bGenVarSQ1Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].SQ1) then
  begin
  FB20[CurrFB20].SQ1:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_SQ1';
  eSQ1.Text:=FB20[CurrFB20].SQ1;
  end;
end;

procedure TfMain.bGenVarSB1Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].SB1) then
  begin
  FB20[CurrFB20].SB1:=FB20[CurrFB20].NameDB+'.cm'+FB20[CurrFB20].Name+'HandOn';
  eSB1.Text:=FB20[CurrFB20].SB1;
  end;
end;

procedure TfMain.bGenVarSU1Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].SU1) then
  begin
  FB20[CurrFB20].SU1:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_SU1';
  eSU1.Text:=FB20[CurrFB20].SU1;
  end;
end;
 
procedure TfMain.bGenVarKx2Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Kx2) then
  begin
  FB20[CurrFB20].Kx2:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Kx2';
  eKx2.Text:=FB20[CurrFB20].Kx2;
  end;
end;

procedure TfMain.bGenVarSQ2Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].SQ2) then
  begin
  FB20[CurrFB20].SQ2:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_SQ2';
  eSQ2.Text:=FB20[CurrFB20].SQ2;
  end;
end;

procedure TfMain.bGenVarSB2Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].SB2) then
  begin
  FB20[CurrFB20].SB2:=FB20[CurrFB20].NameDB+'.cm'+FB20[CurrFB20].Name+'HandOff';
  eSB2.Text:=FB20[CurrFB20].SB2;
  end;
end;

procedure TfMain.bGenVarSU2Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].SU2) then
  begin
  FB20[CurrFB20].SU2:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_SU2';
  eSU2.Text:=FB20[CurrFB20].SU2;
  end;
end;

procedure TfMain.bGenVarOFFClick(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].OFF) then
  begin
  FB20[CurrFB20].OFF:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_OFF';
  eOFF.Text:=FB20[CurrFB20].OFF;
  end;
end;

procedure TfMain.bGenVarDisClick(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Dis) then
  begin
  FB20[CurrFB20].Dis:=FB20[CurrFB20].NameDB+'.b'+FB20[CurrFB20].Name;
  eDis.Text:=FB20[CurrFB20].Dis;
  end;
end;

procedure TfMain.bGenVarQFxClick(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].QFx) then
  begin
  FB20[CurrFB20].QFx:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_QFx';
  eQFx.Text:=FB20[CurrFB20].QFx;
  end;
end;

procedure TfMain.bGenVarAckClick(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Ack) then
  begin
  FB20[CurrFB20].Ack:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Ack';
  eAck.Text:=FB20[CurrFB20].Ack;
  end;
end;

procedure TfMain.bGenVarMdtClick(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Mdt) then
  begin
  FB20[CurrFB20].Mdt:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Mdt';
  eMdt.Text:=FB20[CurrFB20].Mdt;
  end;
end;

procedure TfMain.bGenVarMdxClick(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Mdx) then
  begin
  FB20[CurrFB20].Mdx:=FB20[CurrFB20].NameDB+'.Mode'+FB20[CurrFB20].Name;;
  eMdx.Text:=FB20[CurrFB20].Mdx;
  end;
end;

procedure TfMain.bGenVarMdwClick(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Mdw) then
  begin
  fMdw.eTotalMdw.Text:=eMdw.Text;
  fMdw.ShowModal;
//  FB20[CurrFB20].Mdw:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Mdw';
//  eMdw.Text:=FB20[CurrFB20].Mdw;
  end;
end;

procedure TfMain.bGenVarMduClick(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Mdu) then
  begin
  FB20[CurrFB20].Mdu:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Mdu';
  eMdu.Text:=FB20[CurrFB20].Mdu;
  end;
end;

procedure TfMain.bGenVarTm1Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Tm1) then
  begin
  FB20[CurrFB20].Tm1:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Tm1';
  eTm1.Text:=FB20[CurrFB20].Tm1;
  end;
end;

procedure TfMain.bGenVarTm2Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Tm2) then
  begin
  FB20[CurrFB20].Tm2:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Tm2';
  eTm2.Text:=FB20[CurrFB20].Tm2;
  end;
end;

procedure TfMain.bGenVarTmxClick(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Tmx) then
  begin
  FB20[CurrFB20].Tmx:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Tmx';
  eTmx.Text:=FB20[CurrFB20].Tmx;
  end;
end;

procedure TfMain.bGenVarKm1Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Km1) then
  begin
  FB20[CurrFB20].Km1:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Km1';
  eKm1.Text:=FB20[CurrFB20].Km1;
  end;
end;

procedure TfMain.bGenVarLr1Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Lr1) then
  begin
  FB20[CurrFB20].Lr1:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Lr1';
  eLr1.Text:=FB20[CurrFB20].Lr1;
  end;
end;

procedure TfMain.bGenVarLg1Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Lg1) then
  begin
  FB20[CurrFB20].Lg1:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Lg1';
  eLg1.Text:=FB20[CurrFB20].Lg1;
  end;
end;

procedure TfMain.bGenVarKm2Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Km2) then
  begin
  FB20[CurrFB20].Km2:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Km2';
  eKm2.Text:=FB20[CurrFB20].Km2;
  end;
end;

procedure TfMain.bGenVarLr2Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Lr2) then
  begin
  FB20[CurrFB20].Lr2:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Lr2';
  eLr2.Text:=FB20[CurrFB20].Lr2;
  end;
end;

procedure TfMain.bGenVarLg2Click(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Lg2) then
  begin
  FB20[CurrFB20].Lg2:=FB20[CurrFB20].NameDB+'.'+FB20[CurrFB20].Name+'_Lg2';
  eLg2.Text:=FB20[CurrFB20].Lg2;
  end;
end;

procedure TfMain.bGenVarSteClick(Sender: TObject);
begin
  if AllowReplaceFieldText(FB20[CurrFB20].Ste) then
  begin
  FB20[CurrFB20].Ste:=FB20[CurrFB20].NameDB+'.st'+FB20[CurrFB20].Name;
  eSte.Text:=FB20[CurrFB20].Ste;
  end;
end;

procedure TfMain.chkWinCCKx1Click(Sender: TObject);
begin
  FB20[CurrFB20].Kx1_S7mc:=chkWinCCKx1.Checked;
end;

procedure TfMain.chkWinCCSQ1Click(Sender: TObject);
begin
  FB20[CurrFB20].SQ1_S7mc:=chkWinCCSQ1.Checked;
end;

procedure TfMain.chkWinCCSB1Click(Sender: TObject);
begin
  FB20[CurrFB20].SB1_S7mc:=chkWinCCSB1.Checked;
end;

procedure TfMain.chkWinCCSU1Click(Sender: TObject);
begin
  FB20[CurrFB20].SU1_S7mc:=chkWinCCSU1.Checked;
end;

procedure TfMain.chkWinCCKx2Click(Sender: TObject);
begin
  FB20[CurrFB20].Kx2_S7mc:=chkWinCCKx2.Checked;
end;

procedure TfMain.chkWinCCSQ2Click(Sender: TObject);
begin
  FB20[CurrFB20].SQ2_S7mc:=chkWinCCSQ2.Checked;
end;

procedure TfMain.chkWinCCSB2Click(Sender: TObject);
begin
  FB20[CurrFB20].SB2_S7mc:=chkWinCCSB2.Checked;
end;

procedure TfMain.chkWinCCSU2Click(Sender: TObject);
begin
  FB20[CurrFB20].SU2_S7mc:=chkWinCCSU2.Checked;
end;

procedure TfMain.chkWinCCOFFClick(Sender: TObject);
begin
  FB20[CurrFB20].OFF_S7mc:=chkWinCCOFF.Checked;
end;

procedure TfMain.chkWinCCDisClick(Sender: TObject);
begin
  FB20[CurrFB20].Dis_S7mc:=chkWinCCDis.Checked;
end;

procedure TfMain.chkWinCCQFxClick(Sender: TObject);
begin
  FB20[CurrFB20].QFx_S7mc:=chkWinCCQFx.Checked;
end;

procedure TfMain.chkWinCCAckClick(Sender: TObject);
begin
  FB20[CurrFB20].Ack_S7mc:=chkWinCCAck.Checked;
end;

procedure TfMain.chkWinCCMdtClick(Sender: TObject);
begin
  FB20[CurrFB20].Mdt_S7mc:=chkWinCCMdt.Checked;
end;

procedure TfMain.chkWinCCMdxClick(Sender: TObject);
begin
  FB20[CurrFB20].Mdx_S7mc:=chkWinCCMdx.Checked;
end;

procedure TfMain.chkWinCCMdwClick(Sender: TObject);
begin
  FB20[CurrFB20].Mdw_S7mc:=chkWinCCMdw.Checked;
end;

procedure TfMain.chkWinCCMduClick(Sender: TObject);
begin
  FB20[CurrFB20].Mdu_S7mc:=chkWinCCMdu.Checked;
end;

procedure TfMain.chkWinCCTm1Click(Sender: TObject);
begin
  FB20[CurrFB20].Tm1_S7mc:=chkWinCCTm1.Checked;
end;

procedure TfMain.chkWinCCTm2Click(Sender: TObject);
begin
  FB20[CurrFB20].Tm2_S7mc:=chkWinCCTm2.Checked;
end;

procedure TfMain.chkWinCCTmxClick(Sender: TObject);
begin
  FB20[CurrFB20].TmX_S7mc:=chkWinCCTmX.Checked;
end;

procedure TfMain.chkWinCCKm1Click(Sender: TObject);
begin
  FB20[CurrFB20].Km1_S7mc:=chkWinCCKm1.Checked;
end;

procedure TfMain.chkWinCCLr1Click(Sender: TObject);
begin
  FB20[CurrFB20].Lr1_S7mc:=chkWinCCLr1.Checked;
end;

procedure TfMain.chkWinCCLg1Click(Sender: TObject);
begin
  FB20[CurrFB20].Lg1_S7mc:=chkWinCCLg1.Checked;
end;

procedure TfMain.chkWinCCKm2Click(Sender: TObject);
begin
  FB20[CurrFB20].Km2_S7mc:=chkWinCCKm2.Checked;
end;

procedure TfMain.chkWinCCLr2Click(Sender: TObject);
begin
  FB20[CurrFB20].Lr2_S7mc:=chkWinCCLr2.Checked;
end;

procedure TfMain.chkWinCCLg2Click(Sender: TObject);
begin
  FB20[CurrFB20].Lg2_S7mc:=chkWinCCLg2.Checked;
end;

procedure TfMain.chkWinCCSteClick(Sender: TObject);
begin
  FB20[CurrFB20].Ste_S7mc:=chkWinCCSte.Checked;
end;

//______________________________________________________________________________
// ������ "������������" �������� �� ������ "_"
function ReplaceBadChar(s:string):string ;
var
  s1:string;
begin
  s1:=StringReplace(s,'-','_',[rfreplaceall]);
  s1:=StringReplace(s1,'+','_',[rfreplaceall]);
  s1:=StringReplace(s1,'.','_',[rfreplaceall]);
  ReplaceBadChar:=s1;
end;
//______________________________________________________________________________
// ���������� �������������� ��������� � UF, RO, EDI
procedure FindSubSysem();
var
  i:Integer;
begin
  for i:=1 to HMSubSystem do
  begin
    ListOfSubSystem[i].MemberOfSystem:=0;
    if Pos(LowerCase(TemplUF), LowerCase(ListOfSubSystem[i].Name))>0
      then ListOfSubSystem[i].MemberOfSystem:=1;
    if Pos(LowerCase(TemplRO), LowerCase(ListOfSubSystem[i].Name))>0
      then ListOfSubSystem[i].MemberOfSystem:=2;
    if Pos(LowerCase(TemplEDI), LowerCase(ListOfSubSystem[i].Name))>0
      then ListOfSubSystem[i].MemberOfSystem:=3;
  end;
end;
//______________________________________________________________________________
// ���������� ���������� ������ ��� ��������������� ������
procedure GenSymData4Auto();
var
  i,j:Integer;
  NameSubSyst:string;
begin
  for i:=1 to HMSubSystem do
  begin
    if (ListOfSubSystem[i].MemberOfSystem>0)
     and
     (uMain.NeedExtraData)
     and
     (
      ((ListOfSubSystem[i].MemberOfSystem =1) and (uMain.NeedAutoModeUF))
      or
      ((ListOfSubSystem[i].MemberOfSystem =2) and (uMain.NeedAutoModeRO))
      or
      ((ListOfSubSystem[i].MemberOfSystem =3) and (uMain.NeedAutoModeEDI))
     )
    then
    begin
    NameSubSyst:=ListOfSubSystem[i].Name;
// ��������� ��������� ������
    fMain.mmoGenSmbl.Lines.Add('"Work'+NameSubSyst+'","MB'+IntToStr(i*10+10)+' ","BYTE","�������� ����� ������� '+NameSubSyst+' ��������"');
    for j:=1 to ListOfSubSystem[i].NumOfDev do
    fMain.mmoGenSmbl.Lines.Add('"Work'+NameSubSyst+'Dev'+IntToStr(j)+'","M'+IntToStr(i*10+10)+'.'+IntToStr(j-1)+' ","BOOL","������ '+IntToStr(j)+' '+NameSubSyst+' - ��������"');

    for j:=1 to ListOfSubSystem[i].NumOfDev do
    begin
    fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'Dev'+IntToStr(j)+'","MB'+IntToStr(i*10+10+j)+'","BYTE","��������� ������ '+NameSubSyst+' (������ '+IntToStr(j)+')"');
    fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'RunDev'+IntToStr(j)+'","M'+IntToStr(i*10+10+j)+'.0 ","BOOL","��������� '+NameSubSyst+': ����������� (������ '+IntToStr(j)+')"');
    fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'StopDev'+IntToStr(j)+'","M'+IntToStr(i*10+10+j)+'.1 ","BOOL","��������� '+NameSubSyst+': ��������������� (������ '+IntToStr(j)+')"');
    fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'WorkDev'+IntToStr(j)+'","M'+IntToStr(i*10+10+j)+'.2 ","BOOL","��������� '+NameSubSyst+': �������� (������ '+IntToStr(j)+')"');
    if ListOfSubSystem[i].MemberOfSystem=1 then
      begin
      fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'PurgeDev'+IntToStr(j)+'","M'+IntToStr(i*10+10+j)+'.3 ","BOOL","��������� '+NameSubSyst+': ������������ Purge (������ '+IntToStr(j)+')"');
      fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'BWDev'+IntToStr(j)+'","M'+IntToStr(i*10+10+j)+'.4 ","BOOL","��������� '+NameSubSyst+': ������������ BW (������ '+IntToStr(j)+')"');
      fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'CEB1Dev'+IntToStr(j)+'","M'+IntToStr(i*10+10+j)+'.5 ","BOOL","��������� '+NameSubSyst+': ������������ CEB1 (������ '+IntToStr(j)+')"');
      fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'CEB2Dev'+IntToStr(j)+'","M'+IntToStr(i*10+10+j)+'.6 ","BOOL","��������� '+NameSubSyst+': ������������ CEB2 (������ '+IntToStr(j)+')"');
      fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'CEBZmchDev'+IntToStr(j)+'","M'+IntToStr(i*10+10+j)+'.7 ","BOOL","��������� '+NameSubSyst+': ������������ ����������� ��� CEBn (������ '+IntToStr(j)+')"');
      end
    else
      fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'WashDev'+IntToStr(j)+'","M'+IntToStr(i*10+10+j)+'.3 ","BOOL","��������� '+NameSubSyst+': ������������ �������� (������ '+IntToStr(j)+')"');
    end;

    fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'Pereh","M'+IntToStr(i*10+10+9)+'.0 ","BOOL","��������� '+NameSubSyst+': ������� ����������� �������� (������, �������)"');
    fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'Wash","M'+IntToStr(i*10+10+9)+'.1 ","BOOL","��������� '+NameSubSyst+': ������������ ����� ��������"');
    fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'Run","M'+IntToStr(i*10+10+9)+'.2 ","BOOL","��������� '+NameSubSyst+': ������� ������� ����� ������"');
    fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'Stop","M'+IntToStr(i*10+10+9)+'.3 ","BOOL","��������� '+NameSubSyst+': ������� �������� ����� ������"');
    fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'Work","M'+IntToStr(i*10+10+9)+'.4 ","BOOL","��������� '+NameSubSyst+': ������� ������ ����� ������"');
    if ListOfSubSystem[i].MemberOfSystem=1 then
    begin
    fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'BW","M'+IntToStr(i*10+10+9)+'.5 ","BOOL","��������� '+NameSubSyst+': ������� BW �� ����� ������"');
    fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'CEB","M'+IntToStr(i*10+10+9)+'.6 ","BOOL","��������� '+NameSubSyst+': ������� CEB �� ����� ������"');
    fMain.mmoGenSmbl.Lines.Add('"pri'+NameSubSyst+'Zamachiv","M'+IntToStr(i*10+10+9)+'.7 ","BOOL","��������� '+NameSubSyst+': ������������� ����������� �� ����� �� �����"');
    end;

// ��������� ����������� ����� ��� FB, FC, DB
    fMain.mmoGenSmbl.Lines.Add('"'+NameSubSyst+'AutoCntrl","FB '+IntToStr(ListOfSubSystem[i].Addr+4)+'","FB '+IntToStr(ListOfSubSystem[i].Addr+4)+' ","�������������� ����� ������ '+NameSubSyst+'"');
    fMain.mmoGenSmbl.Lines.Add('"'+NameSubSyst+'DevSel","FB '+IntToStr(ListOfSubSystem[i].Addr+5)+'","FB '+IntToStr(ListOfSubSystem[i].Addr+5)+' ","����� ����� ������� '+NameSubSyst+' ��������"');
    fMain.mmoGenSmbl.Lines.Add('"'+NameSubSyst+'Work","FB '+IntToStr(ListOfSubSystem[i].Addr+10)+'","FB '+IntToStr(ListOfSubSystem[i].Addr+10)+' ","�������������� ����� ������ ������ '+NameSubSyst+'"');

    fMain.mmoGenSmbl.Lines.Add('"'+NameSubSyst+'ShiftStackDev","FC '+IntToStr(ListOfSubSystem[i].Addr)+'","FC '+IntToStr(ListOfSubSystem[i].Addr)+' ","'+NameSubSyst+': ����� ����� �����, � ��������� ������-����"');
    fMain.mmoGenSmbl.Lines.Add('"'+NameSubSyst+'DownStackHand","FC '+IntToStr(ListOfSubSystem[i].Addr+1)+'","FC '+IntToStr(ListOfSubSystem[i].Addr+1)+' ","'+NameSubSyst+': �������� ���� ����� ������ ������� � ������ ���. ��� � ����"');
    fMain.mmoGenSmbl.Lines.Add('"'+NameSubSyst+'TimeConvert","FC '+IntToStr(ListOfSubSystem[i].Addr+2)+'","FC '+IntToStr(ListOfSubSystem[i].Addr+2)+'","'+NameSubSyst+': �������������� �������� ����� "');
    fMain.mmoGenSmbl.Lines.Add('"'+NameSubSyst+'TimeCount","FC '+IntToStr(ListOfSubSystem[i].Addr+3)+'","FC '+IntToStr(ListOfSubSystem[i].Addr+3)+'","'+NameSubSyst+': ������� ����� "');

    fMain.mmoGenSmbl.Lines.Add('"db4'+ListOfSubSystem[i].Name+'SelStup","DB '+IntToStr(ListOfSubSystem[i].Addr+3)+'","FB 23 ","�������. ������ SelStup ��� '+NameSubSyst+'"');
    fMain.mmoGenSmbl.Lines.Add('"db4'+ListOfSubSystem[i].Name+'AutoCntrl","DB '+IntToStr(ListOfSubSystem[i].Addr+4)+'","FB '+IntToStr(ListOfSubSystem[i].Addr+4)+' ","�������. ������ '+NameSubSyst+'AutoCntrl"');
    fMain.mmoGenSmbl.Lines.Add('"db4'+ListOfSubSystem[i].Name+'DevSel","DB '+IntToStr(ListOfSubSystem[i].Addr+5)+'","FB '+IntToStr(ListOfSubSystem[i].Addr+5)+' ","�������. ������ '+NameSubSyst+'DevSel"');
    fMain.mmoGenSmbl.Lines.Add('"db4'+ListOfSubSystem[i].Name+'TimeToSw","DB '+IntToStr(ListOfSubSystem[i].Addr+6)+'","FB 24 ","�������. ������ TimeToSwitch ��� '+NameSubSyst+'"');

     for j:=1 to ListOfSubSystem[i].NumOfDev do
     begin
      fMain.mmoGenSmbl.Lines.Add('"db4'+ListOfSubSystem[i].Name+'WorkDev'+IntToStr(j)+'" ,"DB '+IntToStr(ListOfSubSystem[i].Addr+10+j-1)+'","FB '+IntToStr(ListOfSubSystem[i].Addr+10)+' ","�������. ������ '+NameSubSyst+'Work"');
     end
    end;

//    fMain.mmoGenSmbl.Lines.Add('"db4'+ListOfSubSystem[i].Name+'Cntrl","DB     '+IntToStr(ListOfSubSystem[i].Addr)+'","FB     '+IntToStr(ListOfSubSystem[i].Addr)+' ","�������. ������: '+ListOfSubSystem[i].Rem+'"');
//    fMain.mmoGenSmbl.Lines.Add('"dt'+ListOfSubSystem[i].Name+'","DB     '+IntToStr(ListOfSubSystem[i].Addr+2)+'","DB     '+IntToStr(ListOfSubSystem[i].Addr+2)+' ","������: '+ListOfSubSystem[i].Rem+'"');

  end;
end;

procedure TfMain.b1Click(Sender: TObject);
begin
//  GenTimeToSwitch;
//  FindFromTemplate(eTemporary.Text, 'cpdpav01');
// mmoGenPrgr.Visible:=True;
if mmoGenWinCCObj.Visible=True
then mmoGenWinCCObj.Visible:=False
else mmoGenWinCCObj.Visible:=True;

//GenWinCCObj(CurrPosDq,1);
end;

//______________________________________________________________________________
// ���������� FB "<��� ����������>DevSel" ��� ��������������� ������
procedure GenBlDevSel(NumSubSyst:Integer);
var
  i,j, NumDev:Integer;
  sName, sHex, sType:string;
  st:Int64;
begin
  NumDev:=ListOfSubSystem[NumSubSyst].NumOfDev;
  if NumDev<=1 then Exit;
  sName:=ListOfSubSystem[NumSubSyst].Name;
  with fMain do
  begin

//------ ���� ������ -----------------------------------------------------------
  mmoGenPrgr.Lines.Add('DATA_BLOCK "db4'+sName+'SelStup"');
  mmoGenPrgr.Lines.Add('TITLE =                 ');
  mmoGenPrgr.Lines.Add('AUTHOR : daf            ');
  mmoGenPrgr.Lines.Add('VERSION : 0.0           ');
  mmoGenPrgr.Lines.Add('                        ');
  mmoGenPrgr.Lines.Add('"SelStup" ');
  mmoGenPrgr.Lines.Add('BEGIN                   ');
  mmoGenPrgr.Lines.Add('END_DATA_BLOCK          ');
  mmoGenPrgr.Lines.Add('                        ');

//------ �������������� ���� ---------------------------------------------------
  mmoGenPrgr.Lines.Add('FUNCTION_BLOCK "'+sName+'DevSel" ');
  mmoGenPrgr.Lines.Add('TITLE ='+sName+': ����� ����� ������� ��������');
  mmoGenPrgr.Lines.Add('//� ����������� �� �������� ������� � ������� ��������� ����� - ����� ������');
  mmoGenPrgr.Lines.Add('//�������� � ������');
  mmoGenPrgr.Lines.Add('AUTHOR : daf');
  mmoGenPrgr.Lines.Add('NAME : '+sName+'DvSl ');
  mmoGenPrgr.Lines.Add('VERSION : 0.2                                               ');
  mmoGenPrgr.Lines.Add(' ');
  mmoGenPrgr.Lines.Add('VAR                                                         ');
  for i:=1 to NumDev do
  mmoGenPrgr.Lines.Add('  priTimeDev'+IntToStr(i)+' : BOOL ;	');
  mmoGenPrgr.Lines.Add('END_VAR                                                     ');

  mmoGenPrgr.Lines.Add('BEGIN');
//------------------------------------------------------------------------------
  mmoGenPrgr.Lines.Add('NETWORK                                                     ');
  mmoGenPrgr.Lines.Add('TITLE =���������� ����� ����� ������������� ������');
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add(' NOP 0;');
  for i:=1 to NumDev do
  begin

  if i <= 8 then sType:='B'
    else if i <= 16 then sType:='W'
      else sType:='DW';
  st:=Round(Exp((i-1)*Ln(2)));
  sHex:=IntToHex(st,1);

  mmoGenPrgr.Lines.Add('// ������ �'+IntToStr(i));
  mmoGenPrgr.Lines.Add('// ������� ����� �� ������� �����������');
  mmoGenPrgr.Lines.Add('// ���� ���� ������������� ������, ��');
  mmoGenPrgr.Lines.Add('// ������ ����� ����� � �������� �����');
  mmoGenPrgr.Lines.Add('AN    "pri'+sName+'Pereh";');
  mmoGenPrgr.Lines.Add('//      AN    "pri'+sName+'Wash"');
  mmoGenPrgr.Lines.Add('A(    ;');
  mmoGenPrgr.Lines.Add('L     "dt'+sName+'".TimeDevWork'+IntToStr(i)+';');
  mmoGenPrgr.Lines.Add('L     "dt'+sName+'".TimeChangeStup;');
  mmoGenPrgr.Lines.Add('>D    ;');
  mmoGenPrgr.Lines.Add(')     ;');
  mmoGenPrgr.Lines.Add('JCN   _0'+IntToStr(i)+'0;');
  mmoGenPrgr.Lines.Add('CALL "'+sName+'ShiftStackDev" (');
  mmoGenPrgr.Lines.Add('     Device                   := '+sType+'#16#'+sHex+');');
  mmoGenPrgr.Lines.Add('CALL "'+sName+'DownStackHand" ;');
  mmoGenPrgr.Lines.Add('L     T#0MS;');
  mmoGenPrgr.Lines.Add('T     "dt'+sName+'".TimeDevWork'+IntToStr(i)+';');
  mmoGenPrgr.Lines.Add('_0'+IntToStr(i)+'0: NOP   0;');
  mmoGenPrgr.Lines.Add('');
  end;
//------------------------------------------------------------------------------
  mmoGenPrgr.Lines.Add('NETWORK');
  mmoGenPrgr.Lines.Add('TITLE =������ � ������ ������� � ����������� �� ������');
  mmoGenPrgr.Lines.Add('  ');
  mmoGenPrgr.Lines.Add(' NOP 0;');
  mmoGenPrgr.Lines.Add('// ���������� �� ����� ������� ��������');
  mmoGenPrgr.Lines.Add('CALL "SelStup" , "db4'+sName+'SelStup" ( ');
  mmoGenPrgr.Lines.Add('     LE                       := "dt'+sName+'".LvlCurr,     ');
  mmoGenPrgr.Lines.Add('     cmNeedRun                := "dt'+sName+'".cmNeedRun,       ');
  mmoGenPrgr.Lines.Add('     NumberDev                := "dt'+sName+'".NumberDev,       ');
  mmoGenPrgr.Lines.Add('     Err4Stop                 := "dt'+sName+'".Err4Stop,');
  mmoGenPrgr.Lines.Add('     priPereh                 := "pri'+sName+'Pereh",           ');
  mmoGenPrgr.Lines.Add('     priWash                  := "pri'+sName+'Wash",            ');
  if ListOfSubSystem[NumSubSyst].MemberOfSystem = 1 then
  mmoGenPrgr.Lines.Add('     priZamachiv              := "pri'+sName+'Zamachiv", ');
  mmoGenPrgr.Lines.Add('     MaxStup                  := B#16#'+IntToStr(NumDev)+', ');
  for i:=1 to NumDev do
  begin
  mmoGenPrgr.Lines.Add('     St'+IntToStr(i)+'On                    := "dt'+sName+'".Lvl_St'+IntToStr(i)+'On,');
  mmoGenPrgr.Lines.Add('     St'+IntToStr(i)+'Off                   := "dt'+sName+'".Lvl_St'+IntToStr(i)+'Off,');
  end;
  mmoGenPrgr.Lines.Add('     Stup                     := "dt'+sName+'".Stup);           ');


  mmoGenPrgr.Lines.Add('');
  mmoGenPrgr.Lines.Add('// ��� ������� ������ ������� ������ �������');
  mmoGenPrgr.Lines.Add('//      L     0');
  mmoGenPrgr.Lines.Add('//      T     "dt'+sName+'".Stup');
  mmoGenPrgr.Lines.Add('');
  mmoGenPrgr.Lines.Add('// �������� �������� ����� ������� ��������');

  mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".Stup;');
  mmoGenPrgr.Lines.Add('      JL    EndL;       ');
  for i:=0 to NumDev do
   mmoGenPrgr.Lines.Add('      JU    _st'+IntToStr(i)+';       ');
  mmoGenPrgr.Lines.Add('EndL: JU    _end;       ');

  mmoGenPrgr.Lines.Add('_st0: L     0;               ');
  mmoGenPrgr.Lines.Add('      T     "Work'+sName+'";     ');
  mmoGenPrgr.Lines.Add('      JU    _end;            ');
  mmoGenPrgr.Lines.Add('');
  mmoGenPrgr.Lines.Add('_st1: L     0;               ');
  mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".DevStack1;');
  mmoGenPrgr.Lines.Add('      OW    ;                ');
  mmoGenPrgr.Lines.Add('      T     "Work'+sName+'";     ');
  mmoGenPrgr.Lines.Add('      JU    _end;            ');
  mmoGenPrgr.Lines.Add('');

  for i:=2 to NumDev do
  begin
  mmoGenPrgr.Lines.Add('_st'+IntToStr(i)+': L     "dt'+sName+'".DevStack1;');
  mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".DevStack2;');

    for j:=3 to i do
    begin
    mmoGenPrgr.Lines.Add('      OW    ;                ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".DevStack'+IntToStr(j)+';');
    end;

  mmoGenPrgr.Lines.Add('      OW    ;                ');
  mmoGenPrgr.Lines.Add('      T     "Work'+sName+'";     ');
  mmoGenPrgr.Lines.Add('      JU    _end;            ');
  mmoGenPrgr.Lines.Add('');
  end;
  mmoGenPrgr.Lines.Add('_end: NOP   0; ');
  mmoGenPrgr.Lines.Add('');

  mmoGenPrgr.Lines.Add('// ������� ����������� ����');
  for i:=1 to NumDev do
  begin
  mmoGenPrgr.Lines.Add('A     "Work'+sName+'Dev'+IntToStr(i)+'";             ');
  mmoGenPrgr.Lines.Add('A     "dt'+sName+'".Mode'+IntToStr(i)+';           ');
  mmoGenPrgr.Lines.Add('A     "dt'+sName+'".cmNeedRun;         ');
  mmoGenPrgr.Lines.Add('AN    "dt'+sName+'".cmNeedStopDev'+IntToStr(i)+';    ');
  mmoGenPrgr.Lines.Add('AN    "dt'+sName+'".Err4StopDev'+IntToStr(i)+';');
  mmoGenPrgr.Lines.Add('AN    "dt'+sName+'".EmergStop; ');
  if ListOfSubSystem[NumSubSyst].MemberOfSystem = 1 then
  begin
  mmoGenPrgr.Lines.Add('AN    "pri'+sName+'BWDev'+IntToStr(i)+'";            ');
  mmoGenPrgr.Lines.Add('AN    "pri'+sName+'CEB1Dev'+IntToStr(i)+'";          ');
  mmoGenPrgr.Lines.Add('AN    "pri'+sName+'CEB2Dev'+IntToStr(i)+'";          ');
  end;
  mmoGenPrgr.Lines.Add('=     "dt'+sName+'".WorkDev'+IntToStr(i)+';          ');
  mmoGenPrgr.Lines.Add('');
  end;
//------------------------------------------------------------------------------
  mmoGenPrgr.Lines.Add('NETWORK                                                  ');
  mmoGenPrgr.Lines.Add('TITLE =������� ���-�� ���������� �����                   ');
  mmoGenPrgr.Lines.Add(' ');
  mmoGenPrgr.Lines.Add('CALL "HowMuchBit" ( ');
  for i:=1 to 10 do
  begin
   if i<=NumDev then
  mmoGenPrgr.Lines.Add(' Bit'+IntToStr(i)+' := "pri'+sName+'WorkDev'+IntToStr(i)+'",  ')
   else
  mmoGenPrgr.Lines.Add(' Bit'+IntToStr(i)+' := "_FALSE", ');
  end;
  mmoGenPrgr.Lines.Add(' HowMuch := "dt'+sName+'".NumberDev);');

//------------------------------------------------------------------------------
  mmoGenPrgr.Lines.Add('NETWORK                                                  ');
  mmoGenPrgr.Lines.Add('TITLE =��������� ��������� ������� ��������');
  mmoGenPrgr.Lines.Add(' ');
  for i:=1 to NumDev do
  begin
  mmoGenPrgr.Lines.Add('      A     "dt'+sName+'".WorkDev'+IntToStr(i)+';    ');
  mmoGenPrgr.Lines.Add('      FP    #priTimeDev'+IntToStr(i)+';       ');
  mmoGenPrgr.Lines.Add('      JCN   T00'+IntToStr(i)+';               ');
  mmoGenPrgr.Lines.Add('      L     T#0MS;              ');
  mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeDevStop'+IntToStr(i)+';');
  mmoGenPrgr.Lines.Add('T00'+IntToStr(i)+': NOP   0; ');
  mmoGenPrgr.Lines.Add('');
  end;
  mmoGenPrgr.Lines.Add('');
//------------------------------------------------------------------------------
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('END_FUNCTION_BLOCK                                          ');
  mmoGenPrgr.Lines.Add('                        ');
//------ ���� ������ -----------------------------------------------------------
  mmoGenPrgr.Lines.Add('DATA_BLOCK "db4'+sName+'DevSel"');
  mmoGenPrgr.Lines.Add('TITLE =                 ');
  mmoGenPrgr.Lines.Add('AUTHOR : daf            ');
  mmoGenPrgr.Lines.Add('VERSION : 0.0           ');
  mmoGenPrgr.Lines.Add('                        ');
  mmoGenPrgr.Lines.Add('"'+sName+'DevSel" ');
  mmoGenPrgr.Lines.Add('BEGIN                   ');
  mmoGenPrgr.Lines.Add('END_DATA_BLOCK          ');
  mmoGenPrgr.Lines.Add('                        ');
  end;
end;

//______________________________________________________________________________
// ���������� FB "<��� ����������>AutoCntrl" ��� ��������������� ������
procedure GenBlAutoCntrl(NumSubSyst:Integer);
begin
  with fMain do
  begin
  mmoGenPrgr.Lines.Add('FUNCTION_BLOCK "'+ListOfSubSystem[NumSubSyst].Name+'AutoCntrl" ');
  mmoGenPrgr.Lines.Add('TITLE ='+ListOfSubSystem[NumSubSyst].Rem+': �������������� ����� ������ ');
  mmoGenPrgr.Lines.Add('AUTHOR : daf                                                ');
  mmoGenPrgr.Lines.Add('NAME : '+ListOfSubSystem[NumSubSyst].Name+'ACntr');
  mmoGenPrgr.Lines.Add('VERSION : 0.1                                               ');
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('                                                            ');
//  mmoGenPrgr.Lines.Add('VAR                                                         ');
//  mmoGenPrgr.Lines.Add('tBool : BOOL; //��������� ����������');
//  mmoGenPrgr.Lines.Add('END_VAR                                                     ');

  mmoGenPrgr.Lines.Add('BEGIN                                                       ');
  mmoGenPrgr.Lines.Add('NETWORK                                                     ');
  mmoGenPrgr.Lines.Add('TITLE =������ �������� ����������                           ');
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('END_FUNCTION_BLOCK                                          ');
  mmoGenPrgr.Lines.Add('                        ');

//------ ���� ������ -----------------------------------------------------------
  mmoGenPrgr.Lines.Add('DATA_BLOCK "db4'+ListOfSubSystem[NumSubSyst].Name+'AutoCntrl"');
  mmoGenPrgr.Lines.Add('TITLE =                 ');
  mmoGenPrgr.Lines.Add('AUTHOR : daf            ');
  mmoGenPrgr.Lines.Add('VERSION : 0.0           ');
  mmoGenPrgr.Lines.Add('                        ');
  mmoGenPrgr.Lines.Add('"'+ListOfSubSystem[NumSubSyst].Name+'AutoCntrl" ');
  mmoGenPrgr.Lines.Add('BEGIN                   ');
  mmoGenPrgr.Lines.Add('END_DATA_BLOCK          ');
  mmoGenPrgr.Lines.Add('                        ');
  end;
end;

//______________________________________________________________________________
// ���������� FB "<��� ����������>ShiftStackDev" ��� ��������������� ������
procedure GenBlShiftStackDev(NumSubSyst:Integer);
var
  i,j, NumDev:Integer;
  sName:string;
begin
  NumDev:=ListOfSubSystem[NumSubSyst].NumOfDev;
  if NumDev<=1 then Exit;
  sName:=ListOfSubSystem[NumSubSyst].Name;
  with fMain do
  begin
  mmoGenPrgr.Lines.Add('FUNCTION "'+sName+'ShiftStackDev" : VOID ');
  mmoGenPrgr.Lines.Add('TITLE ='+sName+': ����� ����� �����, � ��������� ������-����');
  mmoGenPrgr.Lines.Add('AUTHOR : daf                                                ');
  mmoGenPrgr.Lines.Add('NAME : '+sName+'ShSt');
  mmoGenPrgr.Lines.Add('VERSION : 0.2                                               ');
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('VAR_INPUT                                                   ');
  mmoGenPrgr.Lines.Add('   Device : BYTE ;	//����� ������');
  mmoGenPrgr.Lines.Add('END_VAR                                                     ');
  mmoGenPrgr.Lines.Add('BEGIN                                                       ');
  mmoGenPrgr.Lines.Add('NETWORK                                                     ');
  mmoGenPrgr.Lines.Add('TITLE =���������� ������ �����                           ');
  mmoGenPrgr.Lines.Add(' NOP 0;                                                      ');
  for i:=1 to NumDev-1 do
  begin
  mmoGenPrgr.Lines.Add('// ���� ������ � ����� � ������� ����� '+IntToStr(i));
  mmoGenPrgr.Lines.Add('L     #Device;');
  mmoGenPrgr.Lines.Add('L     "dt'+sName+'".DevStack'+IntToStr(i)+';');
  mmoGenPrgr.Lines.Add('==I;');
  mmoGenPrgr.Lines.Add('JCN   _00'+IntToStr(i)+';');
   for j:=i to NumDev-1 do
   begin
  mmoGenPrgr.Lines.Add('L     "dt'+sName+'".DevStack'+IntToStr(j+1)+';');
  mmoGenPrgr.Lines.Add('T     "dt'+sName+'".DevStack'+IntToStr(j)+';');
   end;
  mmoGenPrgr.Lines.Add('L     #Device;');
  mmoGenPrgr.Lines.Add('T     "dt'+sName+'".DevStack'+IntToStr(NumDev)+';');

  mmoGenPrgr.Lines.Add('JU    _end;');
  mmoGenPrgr.Lines.Add('_00'+IntToStr(i)+': NOP 0;');
  mmoGenPrgr.Lines.Add('                                                            ');
  end;
  mmoGenPrgr.Lines.Add('_end: NOP   0; ');
  mmoGenPrgr.Lines.Add('END_FUNCTION                                          ');
  mmoGenPrgr.Lines.Add('                        ');
  end;
end;

//______________________________________________________________________________
// ���������� FB "<��� ����������>DownStackHand" ��� ��������������� ������
procedure GenBlDownStackHand(NumSubSyst:Integer);
var
  i, NumDev:Integer;
  sName, sHex, sType:string;
  st:Int64;
begin
  NumDev:=ListOfSubSystem[NumSubSyst].NumOfDev;
  if NumDev<=1 then Exit;
  sName:=ListOfSubSystem[NumSubSyst].Name;
  with fMain do
  begin
  mmoGenPrgr.Lines.Add('FUNCTION "'+sName+'DownStackHand" : VOID ');
  mmoGenPrgr.Lines.Add('TITLE ='+sName+': �������� ���� ����� ������ (� ����, ������, ������ � �.�)');
  mmoGenPrgr.Lines.Add('AUTHOR : daf                                                ');
  mmoGenPrgr.Lines.Add('NAME : '+sName+'DSH');
  mmoGenPrgr.Lines.Add('VERSION : 0.2                                               ');
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('                                                            ');
  mmoGenPrgr.Lines.Add('BEGIN                                                       ');
  mmoGenPrgr.Lines.Add('NETWORK                                                     ');
  mmoGenPrgr.Lines.Add('TITLE =');
  mmoGenPrgr.Lines.Add(' NOP 0;                                                      ');
  for i:=1 to NumDev do
  begin

  if i <= 8 then sType:='B'
    else if i <= 16 then sType:='W'
      else sType:='DW';
  st:=Round(Exp((i-1)*Ln(2)));
  sHex:=IntToHex(st,1);

  mmoGenPrgr.Lines.Add('// ������ ����� '+IntToStr(i));
  mmoGenPrgr.Lines.Add('ON    "dt'+sName+'".Mode'+IntToStr(i)+';');
  mmoGenPrgr.Lines.Add('O     "dt'+sName+'".cmNeedStopDev'+IntToStr(i)+';');
  mmoGenPrgr.Lines.Add('O     "dt'+sName+'".Err4StopDev'+IntToStr(i)+';');
  if ListOfSubSystem[NumSubSyst].MemberOfSystem = 1 then
  begin
  mmoGenPrgr.Lines.Add('O     "pri'+sName+'BWDev'+IntToStr(i)+'";');
  mmoGenPrgr.Lines.Add('O     "pri'+sName+'CEB1Dev'+IntToStr(i)+'";');
  mmoGenPrgr.Lines.Add('O     "pri'+sName+'CEB2Dev'+IntToStr(i)+'";');
  end;
  mmoGenPrgr.Lines.Add('JCN   DS0'+IntToStr(i)+';');
  mmoGenPrgr.Lines.Add('CALL "'+sName+'ShiftStackDev" (');
  mmoGenPrgr.Lines.Add('   Device                   := '+sType+'#16#'+sHex+');');
  mmoGenPrgr.Lines.Add('DS0'+IntToStr(i)+': NOP 0 ;');
  mmoGenPrgr.Lines.Add('                        ');
  end;
  mmoGenPrgr.Lines.Add('END_FUNCTION                                          ');
  mmoGenPrgr.Lines.Add('                        ');
  end;
end;

//______________________________________________________________________________
// ���������� NetWork � ����������� � ������� ��������� � LAD
procedure GenDevNetworkLAD(NumDev:Integer);
var
  sDev:string;
begin
  with fMain do
  begin
   mmoGenPrgr.Lines.Add('NETWORK                                                     ');
   mmoGenPrgr.Lines.Add('TITLE ='+FB20[NumDev].Name+'                                     ');
   mmoGenPrgr.Lines.Add('//'+FB20[NumDev].Rem+'                                           ');
   mmoGenPrgr.Lines.Add('                                                            ');

  if FB20[NumDev].MsgAV then sDev:='Ex' else sDev:='';
 // ���������� ���� (��� ��������� ��. ��������� � �����������)
  if FB20[NumDev].MsgAV then
  begin
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".DevEx.EnMsg_Gr; ');
   mmoGenPrgr.Lines.Add('=     L      1.6                       ;  ');
   mmoGenPrgr.Lines.Add('BLD   103                               ; ');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Tm;  ');
   mmoGenPrgr.Lines.Add('=     L      1.7                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_On;  ');
   mmoGenPrgr.Lines.Add('=     L      2.0                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Ds;  ');
   mmoGenPrgr.Lines.Add('=     L      2.1                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".DevEx.EnMsg_Se1 ;');
   mmoGenPrgr.Lines.Add('=     L      2.2                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".DevEx.EnMsg_Se2 ;');
   mmoGenPrgr.Lines.Add('=     L      2.3                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Ke1 ;');
   mmoGenPrgr.Lines.Add('=     L      2.4                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Ke2; ');
   mmoGenPrgr.Lines.Add('=     L      2.5                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_QFe; ');
   mmoGenPrgr.Lines.Add('=     L      2.6                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Ext; ');
   mmoGenPrgr.Lines.Add('=     L      2.7                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
  end
 // ������� ���� (��� �������� � ��. ��������� ��� ����������)
  else
  begin
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Tm;  ');
   mmoGenPrgr.Lines.Add('=     L      1.6                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_On;  ');
   mmoGenPrgr.Lines.Add('=     L      1.7                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Ds;  ');
   mmoGenPrgr.Lines.Add('=     L      2.0                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Ke1 ;');
   mmoGenPrgr.Lines.Add('=     L      2.1                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Ke2; ');
   mmoGenPrgr.Lines.Add('=     L      2.2                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_QFe; ');
   mmoGenPrgr.Lines.Add('=     L      2.3                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
   mmoGenPrgr.Lines.Add('A     "db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Ext; ');
   mmoGenPrgr.Lines.Add('=     L      2.4                         ;');
   mmoGenPrgr.Lines.Add('BLD   103                                ;');
  end;

   if NeedMsgDev and FB20[NumDev].NeedMsg then
   mmoGenPrgr.Lines.Add('      A(    ;  ');

   if NoBlank(FB20[NumDev].Kx1) then
   begin
   mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].Kx1+';                                ');
   mmoGenPrgr.Lines.Add('      =     L      0.0;                                     ');
   mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
   end;

   if NoBlank(FB20[NumDev].SQ1) then
   begin
   mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].SQ1+';                                ');
   mmoGenPrgr.Lines.Add('      =     L      0.1;                                     ');
   mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
   end;

   if NoBlank(FB20[NumDev].SB1) then
   begin
   mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].SB1+';                                ');
   mmoGenPrgr.Lines.Add('      =     L      0.2;                                     ');
   mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
   end;

   if NoBlank(FB20[NumDev].SU1) then
   begin
   mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].SU1+';                                ');
   mmoGenPrgr.Lines.Add('      =     L      0.3;                                     ');
   mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
   end;

   if NoBlank(FB20[NumDev].Kx2) then
   begin
   mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].Kx2+';                                ');
   mmoGenPrgr.Lines.Add('      =     L      0.4;                                     ');
   mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
   end;

   if NoBlank(FB20[NumDev].SQ2) then
   begin
   mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].SQ2+';                                ');
   mmoGenPrgr.Lines.Add('      =     L      0.5;                                     ');
   mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
   end;

   if NoBlank(FB20[NumDev].SB2) then
    begin
    mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].SB2+';                                ');
    mmoGenPrgr.Lines.Add('      =     L      0.6;                                     ');
    mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
    end;

    if NoBlank(FB20[NumDev].SU2) then
    begin
    mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].SU2+';                                ');
    mmoGenPrgr.Lines.Add('      =     L      0.7;                                     ');
    mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
    end;

    if NoBlank(FB20[NumDev].OFF) then
    begin
    mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].OFF+';                                ');
    mmoGenPrgr.Lines.Add('      =     L      1.0;                                     ');
    mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
    end;

    if NoBlank(FB20[NumDev].Dis) then
    begin
    mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].Dis+';                                ');
    mmoGenPrgr.Lines.Add('      =     L      1.1;                                     ');
    mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
    end;

    if NoBlank(FB20[NumDev].QFx) then
    begin
    mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].QFx+';                                ');
    mmoGenPrgr.Lines.Add('      =     L      1.2;                                     ');
    mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
    end;

    if NoBlank(FB20[NumDev].Ack) then
    begin
    mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].Ack+';                                ');
    mmoGenPrgr.Lines.Add('      =     L      1.3;                                     ');
    mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
    end;

    if NoBlank(FB20[NumDev].Mdt) then
    begin
    mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].Mdt+';                                ');
    mmoGenPrgr.Lines.Add('      =     L      1.4;                                     ');
    mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
    end;

    if NoBlank(FB20[NumDev].Mdx) then
    begin
    mmoGenPrgr.Lines.Add('      A     '+FB20[NumDev].Mdx+';                                ');
    mmoGenPrgr.Lines.Add('      =     L      1.5;                                     ');
    mmoGenPrgr.Lines.Add('      BLD   103;                                            ');
    end;

    mmoGenPrgr.Lines.Add('      CALL #'+FB20[NumDev].Name+' (                                          ');

    if NoBlank(FB20[NumDev].Kx1) then mmoGenPrgr.Lines.Add(' Kx1 := L 0.0, ');
    if NoBlank(FB20[NumDev].SQ1) then mmoGenPrgr.Lines.Add(' SQ1 := L 0.1, ');
    if NoBlank(FB20[NumDev].SB1) then mmoGenPrgr.Lines.Add(' SB1 := L 0.2, ');
    if NoBlank(FB20[NumDev].SU1) then mmoGenPrgr.Lines.Add(' SU1 := L 0.3, ');
    if NoBlank(FB20[NumDev].Kx2) then mmoGenPrgr.Lines.Add(' Kx2 := L 0.4, ');
    if NoBlank(FB20[NumDev].SQ2) then mmoGenPrgr.Lines.Add(' SQ2 := L 0.5, ');
    if NoBlank(FB20[NumDev].SB2) then mmoGenPrgr.Lines.Add(' SB2 := L 0.6, ');
    if NoBlank(FB20[NumDev].SU2) then mmoGenPrgr.Lines.Add(' SU2 := L 0.7, ');
    if NoBlank(FB20[NumDev].OFF) then mmoGenPrgr.Lines.Add(' OFF := L 1.0, ');
    if NoBlank(FB20[NumDev].Dis) then mmoGenPrgr.Lines.Add(' Dis := L 1.1, ');
    if NoBlank(FB20[NumDev].QFx) then mmoGenPrgr.Lines.Add(' QFx := L 1.2, ');
    if NoBlank(FB20[NumDev].Ack) then mmoGenPrgr.Lines.Add(' Ack := L 1.3, ');
    if NoBlank(FB20[NumDev].Mdt) then mmoGenPrgr.Lines.Add(' Mdt := L 1.4, ');
    if NoBlank(FB20[NumDev].Mdx) then mmoGenPrgr.Lines.Add(' Mdx := L 1.5, ');

    if NoBlank(FB20[NumDev].Mdw) then mmoGenPrgr.Lines.Add(' Mdw := '+FB20[NumDev].Mdw+', ');
    if NoBlank(FB20[NumDev].Mdu) then mmoGenPrgr.Lines.Add(' Mdu := '+FB20[NumDev].Mdu+', ');
    if NoBlank(FB20[NumDev].Tm1) then mmoGenPrgr.Lines.Add(' Tm1 := '+FB20[NumDev].Tm1+', ');
    if NoBlank(FB20[NumDev].Tm2) then mmoGenPrgr.Lines.Add(' Tm2 := '+FB20[NumDev].Tm2+', ');
    if NoBlank(FB20[NumDev].TmX) then mmoGenPrgr.Lines.Add(' TmX := '+FB20[NumDev].TmX+', ');
    if NoBlank(FB20[NumDev].Km1) then mmoGenPrgr.Lines.Add(' Km1 := '+FB20[NumDev].Km1+', ');
    if NoBlank(FB20[NumDev].Lr1) then mmoGenPrgr.Lines.Add(' Lr1 := '+FB20[NumDev].Lr1+', ');
    if NoBlank(FB20[NumDev].Lg1) then mmoGenPrgr.Lines.Add(' Lg1 := '+FB20[NumDev].Lg1+', ');
    if NoBlank(FB20[NumDev].Km2) then mmoGenPrgr.Lines.Add(' Km2 := '+FB20[NumDev].Km2+', ');
    if NoBlank(FB20[NumDev].Lr2) then mmoGenPrgr.Lines.Add(' Lr2 := '+FB20[NumDev].Lr2+', ');
    if NoBlank(FB20[NumDev].Lg2) then mmoGenPrgr.Lines.Add(' Lg2 := '+FB20[NumDev].Lg2+', ');
    if NoBlank(FB20[NumDev].Ste) then mmoGenPrgr.Lines.Add(' Ste := '+FB20[NumDev].Ste+'); ');

    if NeedMsgDev and FB20[NumDev].NeedMsg then
    begin
      mmoGenPrgr.Lines.Add('      A     BR;                                             ');
      mmoGenPrgr.Lines.Add('      )     ;                                               ');
      mmoGenPrgr.Lines.Add('      JNB   '+Num2Lbl(NumDev)+';                                           ');

      mmoGenPrgr.Lines.Add('      CALL "MsgDev'+sDev+'" , "msg'+FB20[NumDev].Name+'" (                             ');
      mmoGenPrgr.Lines.Add('           Ms                       := #'+FB20[NumDev].Name+'.Ms, ');
     if FB20[NumDev].MsgAV then
     begin
      mmoGenPrgr.Lines.Add('EnMsg_Gr :=L1.6,');
      mmoGenPrgr.Lines.Add('EnMsg_Tm :=L1.7,');
      mmoGenPrgr.Lines.Add('EnMsg_On :=L2.0,');
      mmoGenPrgr.Lines.Add('EnMsg_Ds :=L2.1,');
      mmoGenPrgr.Lines.Add('EnMsg_Se1:=L2.2,');
      mmoGenPrgr.Lines.Add('EnMsg_Se2:=L2.3,');
      mmoGenPrgr.Lines.Add('EnMsg_Ke1:=L2.4,');
      mmoGenPrgr.Lines.Add('EnMsg_Ke2:=L2.5,');
      mmoGenPrgr.Lines.Add('EnMsg_QFe:=L2.6,');
      mmoGenPrgr.Lines.Add('EnMsg_Ext:=L2.7);');
     end
     else
     begin
      mmoGenPrgr.Lines.Add('EnMsg_Tm :=L1.6,');
      mmoGenPrgr.Lines.Add('EnMsg_On :=L1.7,');
      mmoGenPrgr.Lines.Add('EnMsg_Ds :=L2.0,');
      mmoGenPrgr.Lines.Add('EnMsg_Ke1:=L2.1,');
      mmoGenPrgr.Lines.Add('EnMsg_Ke2:=L2.2,');
      mmoGenPrgr.Lines.Add('EnMsg_QFe:=L2.3,');
      mmoGenPrgr.Lines.Add('EnMsg_Ext:=L2.4);');
     end;
    end;
    mmoGenPrgr.Lines.Add(Num2Lbl(NumDev)+': NOP   0;                                              ');
  end;
end;

//______________________________________________________________________________
// ���������� NetWork � ����������� � ������� ��������� � STL
procedure GenDevNetworkSTL(NumDev:Integer);
var
  sDev:string;
begin
  with fMain do
  begin
   mmoGenPrgr.Lines.Add('NETWORK ');
   mmoGenPrgr.Lines.Add('TITLE ='+FB20[NumDev].Name+' ');
   mmoGenPrgr.Lines.Add('//'+FB20[NumDev].Rem+' ');
   mmoGenPrgr.Lines.Add('                                                            ');
   mmoGenPrgr.Lines.Add('NOP 0; ');
   mmoGenPrgr.Lines.Add('// ���������� �����������                                  ');
 // ���������� ���� (��� ��������� ��. ��������� � �����������)
  if FB20[NumDev].MsgAV then sDev:='Ex' else sDev:='';

    mmoGenPrgr.Lines.Add('      CALL #'+FB20[NumDev].Name+' ( ');
    if NoBlank(FB20[NumDev].Kx1) then mmoGenPrgr.Lines.Add(' Kx1 := '+FB20[NumDev].Kx1+', ');
    if NoBlank(FB20[NumDev].SQ1) then mmoGenPrgr.Lines.Add(' SQ1 := '+FB20[NumDev].SQ1+', ');
    if NoBlank(FB20[NumDev].SB1) then mmoGenPrgr.Lines.Add(' SB1 := '+FB20[NumDev].SB1+', ');
    if NoBlank(FB20[NumDev].SU1) then mmoGenPrgr.Lines.Add(' SU1 := '+FB20[NumDev].SU1+', ');
    if NoBlank(FB20[NumDev].Kx2) then mmoGenPrgr.Lines.Add(' Kx2 := '+FB20[NumDev].Kx1+', ');
    if NoBlank(FB20[NumDev].SQ2) then mmoGenPrgr.Lines.Add(' SQ2 := '+FB20[NumDev].SQ2+', ');
    if NoBlank(FB20[NumDev].SB2) then mmoGenPrgr.Lines.Add(' SB2 := '+FB20[NumDev].SB2+', ');
    if NoBlank(FB20[NumDev].SU2) then mmoGenPrgr.Lines.Add(' SU2 := '+FB20[NumDev].SU2+', ');
    if NoBlank(FB20[NumDev].OFF) then mmoGenPrgr.Lines.Add(' OFF := '+FB20[NumDev].OFF+', ');
    if NoBlank(FB20[NumDev].Dis) then mmoGenPrgr.Lines.Add(' Dis := '+FB20[NumDev].Dis+', ');
    if NoBlank(FB20[NumDev].QFx) then mmoGenPrgr.Lines.Add(' QFx := '+FB20[NumDev].QFx+', ');
    if NoBlank(FB20[NumDev].Ack) then mmoGenPrgr.Lines.Add(' Ack := '+FB20[NumDev].Ack+', ');
    if NoBlank(FB20[NumDev].Mdt) then mmoGenPrgr.Lines.Add(' Mdt := '+FB20[NumDev].Mdt+', ');
    if NoBlank(FB20[NumDev].Mdx) then mmoGenPrgr.Lines.Add(' Mdx := '+FB20[NumDev].Mdx+', ');
    if NoBlank(FB20[NumDev].Mdw) then mmoGenPrgr.Lines.Add(' Mdw := '+FB20[NumDev].Mdw+', ');
    if NoBlank(FB20[NumDev].Mdu) then mmoGenPrgr.Lines.Add(' Mdu := '+FB20[NumDev].Mdu+', ');
    if NoBlank(FB20[NumDev].Tm1) then mmoGenPrgr.Lines.Add(' Tm1 := '+FB20[NumDev].Tm1+', ');
    if NoBlank(FB20[NumDev].Tm2) then mmoGenPrgr.Lines.Add(' Tm2 := '+FB20[NumDev].Tm2+', ');
    if NoBlank(FB20[NumDev].TmX) then mmoGenPrgr.Lines.Add(' TmX := '+FB20[NumDev].TmX+', ');
    if NoBlank(FB20[NumDev].Km1) then mmoGenPrgr.Lines.Add(' Km1 := '+FB20[NumDev].Km1+', ');
    if NoBlank(FB20[NumDev].Lr1) then mmoGenPrgr.Lines.Add(' Lr1 := '+FB20[NumDev].Lr1+', ');
    if NoBlank(FB20[NumDev].Lg1) then mmoGenPrgr.Lines.Add(' Lg1 := '+FB20[NumDev].Lg1+', ');
    if NoBlank(FB20[NumDev].Km2) then mmoGenPrgr.Lines.Add(' Km2 := '+FB20[NumDev].Km2+', ');
    if NoBlank(FB20[NumDev].Lr2) then mmoGenPrgr.Lines.Add(' Lr2 := '+FB20[NumDev].Lr2+', ');
    if NoBlank(FB20[NumDev].Lg2) then mmoGenPrgr.Lines.Add(' Lg2 := '+FB20[NumDev].Lg2+', ');
    if NoBlank(FB20[NumDev].Ste) then mmoGenPrgr.Lines.Add(' Ste := '+FB20[NumDev].Ste+'); ');
    mmoGenPrgr.Lines.Add(' ');
    mmoGenPrgr.Lines.Add('// ��������� ���������');
    if NeedMsgDev and FB20[NumDev].NeedMsg then
    begin
      mmoGenPrgr.Lines.Add('      CALL "MsgDev'+sDev+'" , "msg'+FB20[NumDev].Name+'" ( ');
      mmoGenPrgr.Lines.Add('           Ms                       := #'+FB20[NumDev].Name+'.Ms, ');

      if FB20[NumDev].MsgAV then
      mmoGenPrgr.Lines.Add('EnMsg_Gr :="db4EnPLCMsgCntrl".DevEx.EnMsg_Gr,');
      mmoGenPrgr.Lines.Add('EnMsg_Tm :="db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Tm,');
      mmoGenPrgr.Lines.Add('EnMsg_On :="db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_On,');
      mmoGenPrgr.Lines.Add('EnMsg_Ds :="db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Ds,');
      if FB20[NumDev].MsgAV then
      mmoGenPrgr.Lines.Add('EnMsg_Se1:="db4EnPLCMsgCntrl".DevEx.EnMsg_Se1,');
      if FB20[NumDev].MsgAV then
      mmoGenPrgr.Lines.Add('EnMsg_Se2:="db4EnPLCMsgCntrl".DevEx.EnMsg_Se2,');
      mmoGenPrgr.Lines.Add('EnMsg_Ke1:="db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Ke1,');
      mmoGenPrgr.Lines.Add('EnMsg_Ke2:="db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Ke2,');
      mmoGenPrgr.Lines.Add('EnMsg_QFe:="db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_QFe,');
      mmoGenPrgr.Lines.Add('EnMsg_Ext:="db4EnPLCMsgCntrl".Dev'+sDev+'.EnMsg_Ext);');
    end;
    mmoGenPrgr.Lines.Add(' ');
  end;
end;

//______________________________________________________________________________
// ���������� OB32
procedure GenOB32();
begin
  with fMain do
  begin
  mmoGenPrgr.Lines.Add('ORGANIZATION_BLOCK "CYC_INT2"');
  mmoGenPrgr.Lines.Add('TITLE = "Cyclic Interrupt"');
  mmoGenPrgr.Lines.Add('VERSION : 0.1');
  mmoGenPrgr.Lines.Add('');
  mmoGenPrgr.Lines.Add('');
  mmoGenPrgr.Lines.Add('VAR_TEMP');
  mmoGenPrgr.Lines.Add('  OB32_EV_CLASS : BYTE ;	//Bits 0-3 = 1 (Coming event), Bits 4-7 = 1 (Event class 1)');
  mmoGenPrgr.Lines.Add('  OB32_STRT_INF : BYTE ;	//16#33 (OB 32 has started)');
  mmoGenPrgr.Lines.Add('  OB32_PRIORITY : BYTE ;	//Priority of OB Execution');
  mmoGenPrgr.Lines.Add('  OB32_OB_NUMBR : BYTE ;	//32 (Organization block 32, OB32)');
  mmoGenPrgr.Lines.Add('  OB32_RESERVED_1 : BYTE ;	//Reserved for system');
  mmoGenPrgr.Lines.Add('  OB32_RESERVED_2 : BYTE ;	//Reserved for system');
  mmoGenPrgr.Lines.Add('  OB32_PHS_OFFSET : INT ;	//Phase offset (integer, milliseconds)');
  mmoGenPrgr.Lines.Add('  OB32_RESERVED_3 : INT ;	//Reserved for system');
  mmoGenPrgr.Lines.Add('  OB32_EXC_FREQ : INT ;	//Frequency of execution (msec)');
  mmoGenPrgr.Lines.Add('  OB32_DATE_TIME : DATE_AND_TIME ;	//Date and time OB32 started');
  mmoGenPrgr.Lines.Add('END_VAR');
  mmoGenPrgr.Lines.Add('BEGIN');
  mmoGenPrgr.Lines.Add('');
  if OB32IsPresent then
  begin
   GenTimeToSwitch;
   GenTimeConvertCall;
   GenTimeCountCall;
  end;
  mmoGenPrgr.Lines.Add('END_ORGANIZATION_BLOCK');
  end;
end;

//______________________________________________________________________________
// ���������� OB35
procedure GenOB35();
begin
  with fMain do
  begin
  GenDBForOB3x;
  mmoGenPrgr.Lines.Add('ORGANIZATION_BLOCK "CYC_INT5"');
  mmoGenPrgr.Lines.Add('TITLE = "Cyclic Interrupt"');
  mmoGenPrgr.Lines.Add('VERSION : 0.1');
  mmoGenPrgr.Lines.Add('');
  mmoGenPrgr.Lines.Add('');
  mmoGenPrgr.Lines.Add('VAR_TEMP');
  mmoGenPrgr.Lines.Add('  OB35_EV_CLASS : BYTE ;	//Bits 0-3 = 1 (Coming event), Bits 4-7 = 1 (Event class 1)');
  mmoGenPrgr.Lines.Add('  OB35_STRT_INF : BYTE ;	//16#36 (OB 35 has started)');
  mmoGenPrgr.Lines.Add('  OB35_PRIORITY : BYTE ;	//Priority of OB Execution');
  mmoGenPrgr.Lines.Add('  OB35_OB_NUMBR : BYTE ;	//35 (Organization block 35, OB35)');
  mmoGenPrgr.Lines.Add('  OB35_RESERVED_1 : BYTE ;	//Reserved for system');
  mmoGenPrgr.Lines.Add('  OB35_RESERVED_2 : BYTE ;	//Reserved for system');
  mmoGenPrgr.Lines.Add('  OB35_PHASE_OFFSET : WORD ;	//Phase offset (msec)');
  mmoGenPrgr.Lines.Add('  OB35_RESERVED_3 : INT ;	//Reserved for system');
  mmoGenPrgr.Lines.Add('  OB35_EXC_FREQ : INT ;	//Frequency of execution (msec)');
  mmoGenPrgr.Lines.Add('  OB35_DATE_TIME : DATE_AND_TIME ;	//Date and time OB35 started');
  mmoGenPrgr.Lines.Add('END_VAR');
  mmoGenPrgr.Lines.Add('BEGIN');
  mmoGenPrgr.Lines.Add('');
  if not OB32IsPresent then
  begin
   GenTimeToSwitch;
   GenTimeConvertCall;
   GenTimeCountCall;
  end;
  mmoGenPrgr.Lines.Add('END_ORGANIZATION_BLOCK');
  end;
end;

//______________________________________________________________________________
// ���������� NetWork ��� ������ TimeToSwitch
procedure GenTimeToSwitch();
var
  i,j:Integer;
  sName:string;
begin
  for i:=1 to HMSubSystem do
  begin
    with fMain do
    begin
    if (NeedExtraData)
     and
     (
      ((ListOfSubSystem[i].MemberOfSystem =1) and (NeedAutoModeUF))
      or
      ((ListOfSubSystem[i].MemberOfSystem =2) and (NeedAutoModeRO))
      or
      ((ListOfSubSystem[i].MemberOfSystem =3) and (NeedAutoModeEDI))
     )
    then
    begin
      sName:=ListOfSubSystem[i].Name;
      mmoGenPrgr.Lines.Add('NETWORK');
      mmoGenPrgr.Lines.Add('TITLE =������ ������� �� ���������� ������������ '+sName+' ');
      mmoGenPrgr.Lines.Add('');
      mmoGenPrgr.Lines.Add('      CALL "TimeToSwitch" , "db4'+sName+'TimeToSw" (');
      mmoGenPrgr.Lines.Add('           TimeChangeStup           := "dt'+sName+'".TimeChangeStup,');
      for j:=1 to ListOfSubSystem[i].NumOfDev do
      mmoGenPrgr.Lines.Add('           TimeDevWork'+IntToStr(j)+'             := "dt'+sName+'".TimeDevWork'+IntToStr(j)+',');
      mmoGenPrgr.Lines.Add('           Time2SwitchHour          := "dt'+sName+'".Time2SwitchHour);');
      mmoGenPrgr.Lines.Add('      NOP   0; ');
      mmoGenPrgr.Lines.Add('');
    end;
    end;
  end;
end;

//______________________________________________________________________________
// ���������� DB ��� ������ FB � OB3x
procedure GenDBForOB3x();
var
  i:Integer;
  sName:string;
begin
  for i:=1 to HMSubSystem do
  begin
    with fMain do
    begin
      if (NeedExtraData)
       and
       (
        ((ListOfSubSystem[i].MemberOfSystem =1) and (NeedAutoModeUF))
        or
        ((ListOfSubSystem[i].MemberOfSystem =2) and (NeedAutoModeRO))
        or
        ((ListOfSubSystem[i].MemberOfSystem =3) and (NeedAutoModeEDI))
       )
      then
      begin
        sName:=ListOfSubSystem[i].Name;
  //------ ���� ������ -----------------------------------------------------------
        mmoGenPrgr.Lines.Add('DATA_BLOCK "db4'+sName+'TimeToSw"');
        mmoGenPrgr.Lines.Add('TITLE =                 ');
        mmoGenPrgr.Lines.Add('AUTHOR : daf            ');
        mmoGenPrgr.Lines.Add('VERSION : 0.0           ');
        mmoGenPrgr.Lines.Add('                        ');
        mmoGenPrgr.Lines.Add('"TimeToSwitch" ');
        mmoGenPrgr.Lines.Add('BEGIN                   ');
        mmoGenPrgr.Lines.Add('END_DATA_BLOCK          ');
        mmoGenPrgr.Lines.Add('                        ');
      end;
    end;
  end;
end;

//______________________________________________________________________________
// ���������� �-��� ��� ����������� ��������/��������� ����� TimeConvert
procedure GenTimeConvert();
var
  i, NumDev:Integer;
  sName:string;
begin
 for i:=1 to HMSubSystem do
 begin
  NumDev:=ListOfSubSystem[i].NumOfDev;
  if NumDev<=1 then Exit;
  sName:=ListOfSubSystem[i].Name;
  with fMain do
  begin
  if (NeedExtraData)
   and
   (
    ((ListOfSubSystem[i].MemberOfSystem =1) and (NeedAutoModeUF))
    or
    ((ListOfSubSystem[i].MemberOfSystem =2) and (NeedAutoModeRO))
    or
    ((ListOfSubSystem[i].MemberOfSystem =3) and (NeedAutoModeEDI))
   )
  then
  begin
    mmoGenPrgr.Lines.Add('FUNCTION "'+sName+'TimeConvert" : VOID');
    mmoGenPrgr.Lines.Add('TITLE =�������������� �������� �����');
    mmoGenPrgr.Lines.Add('AUTHOR : daf');
    mmoGenPrgr.Lines.Add('NAME : '+sName+'TmCnv');
    mmoGenPrgr.Lines.Add('VERSION : 0.2');
    mmoGenPrgr.Lines.Add('');
    mmoGenPrgr.Lines.Add('BEGIN');
    mmoGenPrgr.Lines.Add('NETWORK');
    mmoGenPrgr.Lines.Add('TITLE =������ �� ����� ������� ��������');
    mmoGenPrgr.Lines.Add('');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeHourChangeStup; ');
    mmoGenPrgr.Lines.Add('      L     2; ');
    mmoGenPrgr.Lines.Add('      <=D   ; ');
    mmoGenPrgr.Lines.Add('      JCN   _001; ');
    mmoGenPrgr.Lines.Add('      L     24; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeHourChangeStup; ');
    mmoGenPrgr.Lines.Add('_001: NOP   0; ');
    mmoGenPrgr.Lines.Add('');
  if (ListOfSubSystem[i].MemberOfSystem = 1) or (ListOfSubSystem[i].MemberOfSystem = 2) then
   begin
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeSecLenPurge; ');
    mmoGenPrgr.Lines.Add('      L     10; ');
    mmoGenPrgr.Lines.Add('      <=D   ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeSecLenPurge; ');
    mmoGenPrgr.Lines.Add('      L     120; ');
    mmoGenPrgr.Lines.Add('      >=D   ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      JCN   _002; ');
    mmoGenPrgr.Lines.Add('      L     15; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeSecLenPurge; ');
    mmoGenPrgr.Lines.Add('_002: NOP   0; ');
    mmoGenPrgr.Lines.Add('');
   end;
  if ListOfSubSystem[i].MemberOfSystem = 1 then
   begin
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeMinBW; ');
    mmoGenPrgr.Lines.Add('      L     10; ');
    mmoGenPrgr.Lines.Add('      <D    ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeMinBW; ');
    mmoGenPrgr.Lines.Add('      L     240; ');
    mmoGenPrgr.Lines.Add('      >D    ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      JCN   _003; ');
    mmoGenPrgr.Lines.Add('      L     30; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeMinBW; ');
    mmoGenPrgr.Lines.Add('_003: NOP   0; ');
    mmoGenPrgr.Lines.Add('');
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeSecWshDwn; ');
    mmoGenPrgr.Lines.Add('      L     20; ');
    mmoGenPrgr.Lines.Add('      <D    ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeSecWshDwn; ');
    mmoGenPrgr.Lines.Add('      L     180; ');
    mmoGenPrgr.Lines.Add('      >D    ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      JCN   _004; ');
    mmoGenPrgr.Lines.Add('      L     20; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeSecWshDwn; ');
    mmoGenPrgr.Lines.Add('_004: NOP   0; ');
    mmoGenPrgr.Lines.Add('');
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeSecWshUp; ');
    mmoGenPrgr.Lines.Add('      L     20; ');
    mmoGenPrgr.Lines.Add('      <D    ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeSecWshUp; ');
    mmoGenPrgr.Lines.Add('      L     180; ');
    mmoGenPrgr.Lines.Add('      >D    ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      JCN   _005; ');
    mmoGenPrgr.Lines.Add('      L     20; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeSecWshUp; ');
    mmoGenPrgr.Lines.Add('_005: NOP   0; ');
    mmoGenPrgr.Lines.Add('');
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeHourCEB1; ');
    mmoGenPrgr.Lines.Add('      L     1; ');
    mmoGenPrgr.Lines.Add('      <D    ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeHourCEB1; ');
    mmoGenPrgr.Lines.Add('      L     24; ');
    mmoGenPrgr.Lines.Add('      >D    ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      JCN   _006; ');
    mmoGenPrgr.Lines.Add('      L     6; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeHourCEB1; ');
    mmoGenPrgr.Lines.Add('_006: NOP   0; ');
    mmoGenPrgr.Lines.Add('');
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeHourCEB2; ');
    mmoGenPrgr.Lines.Add('      L     1; ');
    mmoGenPrgr.Lines.Add('      <D    ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeHourCEB2; ');
    mmoGenPrgr.Lines.Add('      L     96; ');
    mmoGenPrgr.Lines.Add('      >D    ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      JCN   _007; ');
    mmoGenPrgr.Lines.Add('      L     24; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeHourCEB2; ');
    mmoGenPrgr.Lines.Add('_007: NOP   0; ');
    mmoGenPrgr.Lines.Add('');
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeMinZamach; ');
    mmoGenPrgr.Lines.Add('      L     1; ');
    mmoGenPrgr.Lines.Add('      <D    ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      O(    ; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeMinZamach; ');
    mmoGenPrgr.Lines.Add('      L     60; ');
    mmoGenPrgr.Lines.Add('      >D    ; ');
    mmoGenPrgr.Lines.Add('      )     ; ');
    mmoGenPrgr.Lines.Add('      JCN   _008; ');
    mmoGenPrgr.Lines.Add('      L     1; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeMinZamach; ');
    mmoGenPrgr.Lines.Add('_008: NOP   0; ');
   end;
    mmoGenPrgr.Lines.Add('NETWORK');
    mmoGenPrgr.Lines.Add('TITLE =������� �������� �����');
    mmoGenPrgr.Lines.Add('');
    mmoGenPrgr.Lines.Add('      NOP   0; ');
    mmoGenPrgr.Lines.Add('//--------------- �� ����� -------------');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeHourChangeStup; ');
    mmoGenPrgr.Lines.Add('      L     L#3600000; ');
    mmoGenPrgr.Lines.Add('      *D    ; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeChangeStup; ');
  if (ListOfSubSystem[i].MemberOfSystem = 1) or (ListOfSubSystem[i].MemberOfSystem = 2) then
   begin
    mmoGenPrgr.Lines.Add('//--------------- �� ������ ------------');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeSecLenPurge; ');
    mmoGenPrgr.Lines.Add('      L     L#1000; ');
    mmoGenPrgr.Lines.Add('      *D    ; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeLenPurge; ');
   end;
  if ListOfSubSystem[i].MemberOfSystem = 1 then
   begin
    mmoGenPrgr.Lines.Add('//--------------- �� ����� -------------');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeMinBW; ');
    mmoGenPrgr.Lines.Add('      L     L#60000; ');
    mmoGenPrgr.Lines.Add('      *D    ; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeBW; ');
    mmoGenPrgr.Lines.Add('//--------------- �� ������ ------------');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeSecWshDwn; ');
    mmoGenPrgr.Lines.Add('      L     L#1000; ');
    mmoGenPrgr.Lines.Add('      *D    ; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeSecWshDwn; ');
    mmoGenPrgr.Lines.Add('//--------------- �� ������ ------------');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeSecWshUp; ');
    mmoGenPrgr.Lines.Add('      L     L#1000; ');
    mmoGenPrgr.Lines.Add('      *D    ; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeSecWshUp; ');
    mmoGenPrgr.Lines.Add('//--------------- �� ����� -------------');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeHourCEB1; ');
    mmoGenPrgr.Lines.Add('      L     L#3600000; ');
    mmoGenPrgr.Lines.Add('      *D    ; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeCEB1; ');
    mmoGenPrgr.Lines.Add('//--------------- �� ����� -------------');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeHourCEB2; ');
    mmoGenPrgr.Lines.Add('      L     L#3600000; ');
    mmoGenPrgr.Lines.Add('      *D    ; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeCEB2; ');
    mmoGenPrgr.Lines.Add('//--------------- �� ����� -------------');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeMinZamach; ');
    mmoGenPrgr.Lines.Add('      L     L#60000; ');
    mmoGenPrgr.Lines.Add('      *D    ; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeZamach; ');
   end;
    mmoGenPrgr.Lines.Add('END_FUNCTION');
    mmoGenPrgr.Lines.Add('');
  end;
  end;
 end;
end;

//______________________________________________________________________________
// ���������� ����� F� TimeConvert
procedure GenTimeConvertCall();
var
  i:Integer;
  sName:string;
begin
 for i:=1 to HMSubSystem do
 begin
  sName:=ListOfSubSystem[i].Name;
  with fMain do
  begin
    if (NeedExtraData)
     and
     (
      ((ListOfSubSystem[i].MemberOfSystem =1) and (NeedAutoModeUF))
      or
      ((ListOfSubSystem[i].MemberOfSystem =2) and (NeedAutoModeRO))
      or
      ((ListOfSubSystem[i].MemberOfSystem =3) and (NeedAutoModeEDI))
     )
    then
    begin
      mmoGenPrgr.Lines.Add('NETWORK');
      mmoGenPrgr.Lines.Add('TITLE ='+sName+': �������������� �������� �����');
      mmoGenPrgr.Lines.Add('');
      mmoGenPrgr.Lines.Add('      CALL "'+sName+'TimeConvert" ;');
      mmoGenPrgr.Lines.Add('      NOP   0; ');
      mmoGenPrgr.Lines.Add('');
    end;
  end;
 end;
end;

//______________________________________________________________________________
// ���������� ����� F� TimeCount
procedure GenTimeCountCall();
var
  i:Integer;
  sName:string;
  dTime:string;
begin
 if OB32IsPresent then dTime:='T#1S' else dTime:='T#100MS';
 for i:=1 to HMSubSystem do
 begin
  sName:=ListOfSubSystem[i].Name;
  with fMain do
  begin
    if (NeedExtraData)
     and
     (
      ((ListOfSubSystem[i].MemberOfSystem =1) and (NeedAutoModeUF))
      or
      ((ListOfSubSystem[i].MemberOfSystem =2) and (NeedAutoModeRO))
      or
      ((ListOfSubSystem[i].MemberOfSystem =3) and (NeedAutoModeEDI))
     )
    then
    begin
      mmoGenPrgr.Lines.Add('NETWORK');
      mmoGenPrgr.Lines.Add('TITLE ='+sName+': ������� �����');
      mmoGenPrgr.Lines.Add('');
      mmoGenPrgr.Lines.Add('      CALL "'+sName+'TimeCount" (');
      mmoGenPrgr.Lines.Add('      DeltaTime                := '+dTime+');');
      mmoGenPrgr.Lines.Add('      NOP   0; ');
      mmoGenPrgr.Lines.Add('');
    end;
  end;
 end;
end;

//______________________________________________________________________________
// ���������� �-��� ��� �������� ����� TimeCount
procedure GenTimeCount();
var
  i, j,NumDev:Integer;
  sName:string;
begin
 for i:=1 to HMSubSystem do
 begin
  NumDev:=ListOfSubSystem[i].NumOfDev;
  if NumDev<=1 then Exit;
  sName:=ListOfSubSystem[i].Name;
  with fMain do
  begin
  if (NeedExtraData)
   and
   (
    ((ListOfSubSystem[i].MemberOfSystem =1) and (NeedAutoModeUF))
    or
    ((ListOfSubSystem[i].MemberOfSystem =2) and (NeedAutoModeRO))
    or
    ((ListOfSubSystem[i].MemberOfSystem =3) and (NeedAutoModeEDI))
   )
  then
  begin
    mmoGenPrgr.Lines.Add('FUNCTION "'+sName+'TimeCount" : VOID');
    mmoGenPrgr.Lines.Add('TITLE =������� �����');
    mmoGenPrgr.Lines.Add('AUTHOR : daf');
    mmoGenPrgr.Lines.Add('NAME : '+sName+'TmCnt');
    mmoGenPrgr.Lines.Add('VERSION : 0.2');
    mmoGenPrgr.Lines.Add('');
    mmoGenPrgr.Lines.Add('VAR_INPUT');
    mmoGenPrgr.Lines.Add('DeltaTime : TIME ;	//����� ���������� ��� ������ ������');
    mmoGenPrgr.Lines.Add('END_VAR');

    mmoGenPrgr.Lines.Add('BEGIN');
    mmoGenPrgr.Lines.Add('');

    mmoGenPrgr.Lines.Add('NETWORK');
    mmoGenPrgr.Lines.Add('TITLE ='+sName+': ������� �����');
    mmoGenPrgr.Lines.Add('      NOP   0; ');
   for j:=1 to NumDev do
   begin
    mmoGenPrgr.Lines.Add('// ������ '+IntToStr(j)+' --------------------------');
    mmoGenPrgr.Lines.Add('      A     "dt'+sName+'".WorkDev'+IntToStr(j)+'; ');
    mmoGenPrgr.Lines.Add('      JCN   _0'+IntToStr(j)+'0; ');
    mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeDevWork'+IntToStr(j)+'; ');
    mmoGenPrgr.Lines.Add('      L     #DeltaTime; ');
    mmoGenPrgr.Lines.Add('      +D    ; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeDevWork'+IntToStr(j)+'; ');
    mmoGenPrgr.Lines.Add('      JU    _0'+IntToStr(j)+'1; ');
    mmoGenPrgr.Lines.Add('_0'+IntToStr(j)+'0: L     "dt'+sName+'".TimeDevStop'+IntToStr(j)+'; ');
    mmoGenPrgr.Lines.Add('      L     #DeltaTime; ');
    mmoGenPrgr.Lines.Add('      +D    ; ');
    mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeDevStop'+IntToStr(j)+'; ');
    mmoGenPrgr.Lines.Add('_0'+IntToStr(j)+'1: NOP   0;');
    mmoGenPrgr.Lines.Add('');
   end;

   if ListOfSubSystem[i].MemberOfSystem = 1 then
   begin
    mmoGenPrgr.Lines.Add('NETWORK');
    mmoGenPrgr.Lines.Add('TITLE = ������� ����� ����� �������� - BW');
    mmoGenPrgr.Lines.Add('');
    mmoGenPrgr.Lines.Add('      NOP   0; ');
    for j:=1 to NumDev do
     begin
      mmoGenPrgr.Lines.Add('// ������ '+IntToStr(j)+' --------------------------');
      mmoGenPrgr.Lines.Add('      A     "pri'+sName+'WorkDev'+IntToStr(j)+'"; ');
      mmoGenPrgr.Lines.Add('      JCN   B0'+IntToStr(j)+'1; ');
      mmoGenPrgr.Lines.Add('      L     "dt'+sName+'".TimeAfterBWDev'+IntToStr(j)+'; ');
      mmoGenPrgr.Lines.Add('      L     #DeltaTime; ');
      mmoGenPrgr.Lines.Add('      +D    ; ');
      mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeAfterBWDev'+IntToStr(j)+'; ');
      mmoGenPrgr.Lines.Add('      JU    B0'+IntToStr(j)+'2; ');
      mmoGenPrgr.Lines.Add('B0'+IntToStr(j)+'1: NOP   0; ');
      mmoGenPrgr.Lines.Add('      O(    ; ');
      mmoGenPrgr.Lines.Add('      A     "pri'+sName+'BWDev'+IntToStr(j)+'"; ');
      mmoGenPrgr.Lines.Add('//      A     "BWSccsUFDev'+IntToStr(j)+'"; ');
      mmoGenPrgr.Lines.Add('      )     ; ');
      mmoGenPrgr.Lines.Add('      O     "pri'+sName+'CEB1Dev'+IntToStr(j)+'"; ');
      mmoGenPrgr.Lines.Add('      O     "pri'+sName+'CEB2Dev'+IntToStr(j)+'"; ');
      mmoGenPrgr.Lines.Add('      JCN   B0'+IntToStr(j)+'2; ');
      mmoGenPrgr.Lines.Add('      L     T#0MS; ');
      mmoGenPrgr.Lines.Add('      T     "dt'+sName+'".TimeAfterBWDev'+IntToStr(j)+'; ');
      mmoGenPrgr.Lines.Add('      SET ;');
      mmoGenPrgr.Lines.Add('      R     "dt'+sName+'".cmNeedBWDev'+IntToStr(j)+'; ');
      mmoGenPrgr.Lines.Add('B0'+IntToStr(j)+'2: NOP   0; ');
      mmoGenPrgr.Lines.Add('');
     end;
   end;
    mmoGenPrgr.Lines.Add('END_FUNCTION');
    mmoGenPrgr.Lines.Add('');
  end;
  end;
 end;
end;

// ���������� ��� ��� ������������� �������� � WinCC
// TypeDev: =1-Cpump, =2-Dpump, =3-AV, =4-�����������, =0-���������
procedure GenWinCCObj(NumDev:Integer; TypeDev:Byte);
const
  x0=40;
  y0=20;
var
  sName, sNameDB: string;
  x, y:Integer;
  CorrTypeDev:Byte;
  priSQ:Boolean;
begin
  sName:=FB20[NumDev].Name;
  sNameDB:=StringReplace(FB20[NumDev].NameDB, '"', '',[rfReplaceAll]);
  x:=x0+130*(CountWinCCObj mod 15);
  y:=y0+140*(CountWinCCObj div 15);
  if FB20[NumDev].SQ1 <> '' then priSQ:=True else priSQ:=False;

  // ���� ���� ������� ���������, �� ���������� "����������" � �������
  case TypeDev of   // �����(1), �����-�������(2), ������(3), �����������(4) � ��������� (0)
  0:if not priSQ then CorrTypeDev:=TypeDev else CorrTypeDev:=3;
  1:if not priSQ then CorrTypeDev:=TypeDev else CorrTypeDev:=3;
  2:if not priSQ then CorrTypeDev:=TypeDev else CorrTypeDev:=3;
  3:CorrTypeDev:=TypeDev;
  4:if not priSQ then CorrTypeDev:=TypeDev else CorrTypeDev:=3;
  end;

  with fMain do
  begin
//  mmoGenWinCCObj.Lines.Add(IntToStr(NumDev));
//  mmoGenWinCCObj.Lines.Add(IntToStr(x));
//  mmoGenWinCCObj.Lines.Add(IntToStr(y));
//  mmoGenPrgr.Lines.Add(' Kx1 := '+FB20[NumDev].Kx1+', ');
(*mmoGenWinCCObj.Lines.Add('VERSION 1.0 CLASS');
mmoGenWinCCObj.Lines.Add('BEGIN');
mmoGenWinCCObj.Lines.Add('  MultiUse = -1  '+#39+'True');
mmoGenWinCCObj.Lines.Add('END');
mmoGenWinCCObj.Lines.Add('Attribute VB_Name = "ProjectTemplateDocument"');
mmoGenWinCCObj.Lines.Add('Attribute VB_GlobalNameSpace = False');
mmoGenWinCCObj.Lines.Add('Attribute VB_Creatable = False');
mmoGenWinCCObj.Lines.Add('Attribute VB_PredeclaredId = True');
mmoGenWinCCObj.Lines.Add('Attribute VB_Exposed = True');
mmoGenWinCCObj.Lines.Add('');
*)

mmoGenWinCCObj.Lines.Add('Sub GenWinCCObj'+sName+'()');
mmoGenWinCCObj.Lines.Add('Dim objGlobalLib As HMISymbolLibrary');
mmoGenWinCCObj.Lines.Add('Dim objHMIObject As HMIObject');
mmoGenWinCCObj.Lines.Add('Dim iLastObject As Integer');
mmoGenWinCCObj.Lines.Add('Dim colSearchResults As HMICollection');
mmoGenWinCCObj.Lines.Add('Dim iResult As Integer');
mmoGenWinCCObj.Lines.Add('Dim strName As String');
mmoGenWinCCObj.Lines.Add('Dim objDynDialog As HMIDynamicDialog');
mmoGenWinCCObj.Lines.Add('Dim objStaticText As HMIStaticText');
mmoGenWinCCObj.Lines.Add('Dim objButton As HMIButton');
mmoGenWinCCObj.Lines.Add('Dim objDConnection As HMIDirectConnection');
mmoGenWinCCObj.Lines.Add('');
(**)
//����� ������� \Folder1\Folder44\Object17
//objGlobalLib.FolderItems("Folder1").Folder("Folder44").Folder.Item("Object17").CopyToClipboard
mmoGenWinCCObj.Lines.Add(''+#39+'__________________________________________________________________________________________________');
mmoGenWinCCObj.Lines.Add('');
mmoGenWinCCObj.Lines.Add(''+#39+'===������� '+sName+' ===========================================================================');
mmoGenWinCCObj.Lines.Add(''+#39+'__________________________________________________________________________________________________');
mmoGenWinCCObj.Lines.Add('Set objGlobalLib = Application.SymbolLibraries(1)');
mmoGenWinCCObj.Lines.Add(''+#39+'Copy object "PC" from "Global Library" to clipboard');
mmoGenWinCCObj.Lines.Add(''+#39+' ---��� ����������� ������------------------');
mmoGenWinCCObj.Lines.Add(''+#39+'\Folder1\Folder44\Object69');
case CorrTypeDev of   // ��� �������
//\Folder1\Folder52\Object26 - ���������
0:mmoGenWinCCObj.Lines.Add('objGlobalLib.FolderItems("Folder1").Folder("Folder52").Folder.Item("Object26").CopyToClipboard');
1:mmoGenWinCCObj.Lines.Add('objGlobalLib.FolderItems("Folder1").Folder("Folder44").Folder.Item("Object69").CopyToClipboard');
2:mmoGenWinCCObj.Lines.Add('objGlobalLib.FolderItems("Folder1").Folder("Folder44").Folder.Item("Object17").CopyToClipboard');
3:mmoGenWinCCObj.Lines.Add('objGlobalLib.FolderItems("Folder1").Folder("Folder51").Folder.Item("Object49").CopyToClipboard');
// ����������� \Folder1\Folder43\Object12
4:mmoGenWinCCObj.Lines.Add('objGlobalLib.FolderItems("Folder1").Folder("Folder43").Folder.Item("Object12").CopyToClipboard');
end;
mmoGenWinCCObj.Lines.Add(''+#39+'Get object from clipboard and add it to active document');
mmoGenWinCCObj.Lines.Add('ActiveDocument.PasteClipboard');
mmoGenWinCCObj.Lines.Add(''+#39+'Get last inserted object');
mmoGenWinCCObj.Lines.Add('iLastObject = ActiveDocument.HMIObjects.Count');
mmoGenWinCCObj.Lines.Add('Set objHMIObject = ActiveDocument.HMIObjects(iLastObject)');
mmoGenWinCCObj.Lines.Add(''+#39+' ---������������� ����������� ��� ��������---------------');
mmoGenWinCCObj.Lines.Add('With objHMIObject');
mmoGenWinCCObj.Lines.Add('.ObjectName = "'+sName+'"');
mmoGenWinCCObj.Lines.Add('.Properties("SymbolAppearance") = "2"');
mmoGenWinCCObj.Lines.Add('.Properties("ForeColor") = RGB(255, 255, 255)');
case CorrTypeDev of   // ���������� � �������
//0:
0,1,4: // �����(1), �����������(4) � ��������� (0)
 begin
mmoGenWinCCObj.Lines.Add('.Left = '+IntToStr(x));
mmoGenWinCCObj.Lines.Add('.Top = '+IntToStr(y));
mmoGenWinCCObj.Lines.Add('.Width = 60');
mmoGenWinCCObj.Lines.Add('.Height = 50');
mmoGenWinCCObj.Lines.Add('.Properties("Rotation") = "270"');
 end;
2: // �����-�������
 begin
mmoGenWinCCObj.Lines.Add('.Left = '+IntToStr(x));
mmoGenWinCCObj.Lines.Add('.Top = '+IntToStr(y+10));
mmoGenWinCCObj.Lines.Add('.Width = 40');
mmoGenWinCCObj.Lines.Add('.Height = 75');
mmoGenWinCCObj.Lines.Add('.Properties("Rotation") = "90"');
 end;
3: // ������
 begin
mmoGenWinCCObj.Lines.Add('.Left = '+IntToStr(x+5));
mmoGenWinCCObj.Lines.Add('.Top = '+IntToStr(y+10));
mmoGenWinCCObj.Lines.Add('.Width = 50');
mmoGenWinCCObj.Lines.Add('.Height = 30');
mmoGenWinCCObj.Lines.Add('.Properties("Rotation") = "0"');
 end;
end;
mmoGenWinCCObj.Lines.Add('End With');

mmoGenWinCCObj.Lines.Add(''+#39+' ---������ �������------------------------');
mmoGenWinCCObj.Lines.Add('Set objStaticText = ActiveDocument.HMIObjects.AddHMIObject("Static_Text1", "HMIStaticText")');
mmoGenWinCCObj.Lines.Add('With objStaticText');
mmoGenWinCCObj.Lines.Add('.Text = "'+sName+'"');
mmoGenWinCCObj.Lines.Add('.Left = '+IntToStr(x-30));
mmoGenWinCCObj.Lines.Add('.Top = '+IntToStr(y-10));
mmoGenWinCCObj.Lines.Add('.Width = 120');
mmoGenWinCCObj.Lines.Add('.Height = 16');
mmoGenWinCCObj.Lines.Add('.AlignmentLeft = 1');
mmoGenWinCCObj.Lines.Add('.AdaptBorder = "False"');
mmoGenWinCCObj.Lines.Add('.FONTNAME = "Arial"');
mmoGenWinCCObj.Lines.Add('.FONTSIZE = 14');
mmoGenWinCCObj.Lines.Add('.FONTBOLD = "True"');
mmoGenWinCCObj.Lines.Add('.BorderWidth = 0');
mmoGenWinCCObj.Lines.Add('.GlobalColorScheme = False');
mmoGenWinCCObj.Lines.Add('.FillStyle = 65536 '+#39+' ������ ��� ����������');
mmoGenWinCCObj.Lines.Add('End With');
mmoGenWinCCObj.Lines.Add('WinAPI_EmptyClipboard');

mmoGenWinCCObj.Lines.Add(''+#39+' ---������ ������ ����������------------------------');
mmoGenWinCCObj.Lines.Add('Set objButton = ActiveDocument.HMIObjects.AddHMIObject("myButton", "HMIButton")');
mmoGenWinCCObj.Lines.Add('With objButton');
mmoGenWinCCObj.Lines.Add('.ObjectName = "bOn'+sName+'"');
mmoGenWinCCObj.Lines.Add('.FONTNAME = "Arial"');
mmoGenWinCCObj.Lines.Add('.FONTSIZE = 14');
mmoGenWinCCObj.Lines.Add('.FONTBOLD = True');
mmoGenWinCCObj.Lines.Add('.GlobalColorScheme = False');
mmoGenWinCCObj.Lines.Add('.WindowsStyle = No');
mmoGenWinCCObj.Lines.Add('.BackColor = RGB(212, 208, 200)');
mmoGenWinCCObj.Lines.Add('.Visible = No');
case CorrTypeDev of   // ����������
0,1: // �����(1) � ��������� (0)
 begin
mmoGenWinCCObj.Lines.Add('.Text = "����"');
mmoGenWinCCObj.Lines.Add('.Left = '+IntToStr(x-30));
mmoGenWinCCObj.Lines.Add('.Top = '+IntToStr(y+50));
mmoGenWinCCObj.Lines.Add('.Width = 55');
mmoGenWinCCObj.Lines.Add('.Height = 30');
 end;
2: // �����-�������
 begin
mmoGenWinCCObj.Lines.Add('.Text = "����"');
mmoGenWinCCObj.Lines.Add('.Left = '+IntToStr(x-30));
mmoGenWinCCObj.Lines.Add('.Top = '+IntToStr(y+50+40));
mmoGenWinCCObj.Lines.Add('.Width = 55');
mmoGenWinCCObj.Lines.Add('.Height = 30');
 end;
3: // ������
 begin
mmoGenWinCCObj.Lines.Add('.Text = "�"');
mmoGenWinCCObj.Lines.Add('.Left = '+IntToStr(x-30+25));
mmoGenWinCCObj.Lines.Add('.Top = '+IntToStr(y+50-10));
mmoGenWinCCObj.Lines.Add('.Width = 30');
mmoGenWinCCObj.Lines.Add('.Height = 30');
 end;

4: // �����������
 begin
mmoGenWinCCObj.Lines.Add('.Text = "���"');
mmoGenWinCCObj.Lines.Add('.Left = '+IntToStr(x-30));
mmoGenWinCCObj.Lines.Add('.Top = '+IntToStr(y+50));
mmoGenWinCCObj.Lines.Add('.Width = 55');
mmoGenWinCCObj.Lines.Add('.Height = 30');
 end;

end;
mmoGenWinCCObj.Lines.Add('End With');

mmoGenWinCCObj.Lines.Add('Set objButton = ActiveDocument.HMIObjects.AddHMIObject("myButton", "HMIButton")');
mmoGenWinCCObj.Lines.Add('With objButton');
mmoGenWinCCObj.Lines.Add('.ObjectName = "bOff'+sName+'"');
mmoGenWinCCObj.Lines.Add('.FONTNAME = "Arial"');
mmoGenWinCCObj.Lines.Add('.FONTSIZE = 14');
mmoGenWinCCObj.Lines.Add('.FONTBOLD = True');
mmoGenWinCCObj.Lines.Add('.GlobalColorScheme = False');
mmoGenWinCCObj.Lines.Add('.WindowsStyle = No');
mmoGenWinCCObj.Lines.Add('.BackColor = RGB(212, 208, 200)');
mmoGenWinCCObj.Lines.Add('.Visible = No');
case CorrTypeDev of   // ���������� � �������
//0:
0,1: // �����(1) � ��������� (0)
 begin
mmoGenWinCCObj.Lines.Add('.Text = "����"');
mmoGenWinCCObj.Lines.Add('.Left = '+IntToStr(x+35));
mmoGenWinCCObj.Lines.Add('.Top = '+IntToStr(y+50));
mmoGenWinCCObj.Lines.Add('.Width = 55');
mmoGenWinCCObj.Lines.Add('.Height = 30');
 end;
2: // �����-�������
 begin
mmoGenWinCCObj.Lines.Add('.Text = "����"');
mmoGenWinCCObj.Lines.Add('.Left = '+IntToStr(x+35));
mmoGenWinCCObj.Lines.Add('.Top = '+IntToStr(y+50+40));
mmoGenWinCCObj.Lines.Add('.Width = 55');
mmoGenWinCCObj.Lines.Add('.Height = 30');
 end;
3: // ������
 begin
mmoGenWinCCObj.Lines.Add('.Text = "�"');
mmoGenWinCCObj.Lines.Add('.Left = '+IntToStr(x-30+65));
mmoGenWinCCObj.Lines.Add('.Top = '+IntToStr(y+50-10));
mmoGenWinCCObj.Lines.Add('.Width = 30');
mmoGenWinCCObj.Lines.Add('.Height = 30');
 end;
4: // �����������
 begin
mmoGenWinCCObj.Lines.Add('.Text = "����"');
mmoGenWinCCObj.Lines.Add('.Left = '+IntToStr(x+35));
mmoGenWinCCObj.Lines.Add('.Top = '+IntToStr(y+50));
mmoGenWinCCObj.Lines.Add('.Width = 55');
mmoGenWinCCObj.Lines.Add('.Height = 30');
 end;
end;

mmoGenWinCCObj.Lines.Add('End With');

mmoGenWinCCObj.Lines.Add('End Sub');
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^

//----------------------------------------------------------------
mmoGenWinCCObj.Lines.Add('Sub GenWinCCObjDyn'+sName+'()');
mmoGenWinCCObj.Lines.Add('Dim objGlobalLib As HMISymbolLibrary');
mmoGenWinCCObj.Lines.Add('Dim objHMIObject As HMIObject');
mmoGenWinCCObj.Lines.Add('Dim iLastObject As Integer');
mmoGenWinCCObj.Lines.Add('Dim colSearchResults As HMICollection');
mmoGenWinCCObj.Lines.Add('Dim iResult As Integer');
mmoGenWinCCObj.Lines.Add('Dim strName As String');
mmoGenWinCCObj.Lines.Add('Dim objDynDialog As HMIDynamicDialog');
mmoGenWinCCObj.Lines.Add('Dim objStaticText As HMIStaticText');
mmoGenWinCCObj.Lines.Add('Dim objButton As HMIButton');
mmoGenWinCCObj.Lines.Add('Dim objDConnection As HMIDirectConnection');
mmoGenWinCCObj.Lines.Add('');
(**)
mmoGenWinCCObj.Lines.Add('Set colSearchResults = ActiveDocument.HMIObjects.Find(ObjectName:="'+sName+'")');
mmoGenWinCCObj.Lines.Add('For Each objMember In colSearchResults');

mmoGenWinCCObj.Lines.Add(''+#39+' ---������ ������������ �������� ����������---------------');

 if priSQ then
 mmoGenWinCCObj.Lines.Add('Set objDynDialog = objMember.Properties("ForeColor").CreateDynamicDialog("FB20_SQ ('+#39+NameS7P+'/'+sNameDB+'.st'+sName+#39+')", 1)')
 else
 mmoGenWinCCObj.Lines.Add('Set objDynDialog = objMember.Properties("ForeColor").CreateDynamicDialog("FB20_Cmd ('+#39+NameS7P+'/'+sNameDB+'.st'+sName+#39+')", 1)');

mmoGenWinCCObj.Lines.Add('With objDynDialog');
mmoGenWinCCObj.Lines.Add('.Trigger.VariableTriggers(1).CycleType = hmiVariableCycleTypeUserCycle1');
mmoGenWinCCObj.Lines.Add('.ResultType = hmiResultTypeAnalog');

 if priSQ then
 mmoGenWinCCObj.Lines.Add('.AnalogResultInfos.Add 0, RGB(0, 181, 0)')
 else
 mmoGenWinCCObj.Lines.Add('.AnalogResultInfos.Add 0, RGB(128, 128, 128)');

mmoGenWinCCObj.Lines.Add('.AnalogResultInfos.Add 1, RGB(0, 128, 0)');
mmoGenWinCCObj.Lines.Add('.AnalogResultInfos.Add 2, RGB(128, 128, 128)');
mmoGenWinCCObj.Lines.Add('.AnalogResultInfos.Add 3, RGB(255, 0, 0)');
mmoGenWinCCObj.Lines.Add('.AnalogResultInfos.ElseCase = RGB(255, 0, 0)');
mmoGenWinCCObj.Lines.Add('End With');
mmoGenWinCCObj.Lines.Add('Next objMember');
(**)
mmoGenWinCCObj.Lines.Add(''+#39+' ---������ ������������ �������� ������ ����---------------');
mmoGenWinCCObj.Lines.Add('Set colSearchResults = ActiveDocument.HMIObjects.Find(ObjectName:="bOn'+sName+'")');
mmoGenWinCCObj.Lines.Add('For Each objMember In colSearchResults');

mmoGenWinCCObj.Lines.Add('Set objDynDialog = objMember.Visible.CreateDynamicDialog("'+#39+NameS7P+'/'+sNameDB+'.Mode'+sName+#39+'", 2)');
mmoGenWinCCObj.Lines.Add('With objDynDialog');
mmoGenWinCCObj.Lines.Add('.Trigger.VariableTriggers(1).CycleType = hmiVariableCycleTypeUserCycle1');
mmoGenWinCCObj.Lines.Add('.ResultType = hmiResultTypeBool');
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.PositiveValue = 0');
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.NegativeValue = 1');
mmoGenWinCCObj.Lines.Add('End With');
mmoGenWinCCObj.Lines.Add('Set objDynDialog = objMember.BackColor.CreateDynamicDialog("'+#39+NameS7P+'/'+sNameDB+'.cm'+sName+'HandOn'+#39+'", 2)');
mmoGenWinCCObj.Lines.Add('With objDynDialog');
mmoGenWinCCObj.Lines.Add('.Trigger.VariableTriggers(1).CycleType = hmiVariableCycleTypeUserCycle1');
mmoGenWinCCObj.Lines.Add('.ResultType = hmiResultTypeBool');
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.PositiveValue = RGB(0, 128, 255)');
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.NegativeValue = RGB(212, 208, 200)');
mmoGenWinCCObj.Lines.Add('End With');
mmoGenWinCCObj.Lines.Add('Set objDynDialog = objMember.ForeColor.CreateDynamicDialog("'+#39+NameS7P+'/'+sNameDB+'.cm'+sName+'HandOn'+#39+'", 2)');
mmoGenWinCCObj.Lines.Add('With objDynDialog');
mmoGenWinCCObj.Lines.Add('.Trigger.VariableTriggers(1).CycleType = hmiVariableCycleTypeUserCycle1');
mmoGenWinCCObj.Lines.Add('.ResultType = hmiResultTypeBool');
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.PositiveValue = RGB(255, 255, 255)');
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.NegativeValue = RGB(0, 0, 0)');
mmoGenWinCCObj.Lines.Add('End With');
mmoGenWinCCObj.Lines.Add(''+#39+' �������� �� ������� �� ������');
mmoGenWinCCObj.Lines.Add('Set objDConnection = objMember.Events(1).Actions.AddAction(hmiActionCreationTypeDirectConnection)');
mmoGenWinCCObj.Lines.Add('With objDConnection');
mmoGenWinCCObj.Lines.Add('.SourceLink.Type = hmiSourceTypeConstant');
mmoGenWinCCObj.Lines.Add('.SourceLink.ObjectName = 1');
mmoGenWinCCObj.Lines.Add('.DestinationLink.Type = hmiDestTypeVariableDirect');
mmoGenWinCCObj.Lines.Add('.DestinationLink.ObjectName = "'+NameS7P+'/'+sNameDB+'.cm'+sName+'HandOn'+'"');
mmoGenWinCCObj.Lines.Add('End With');
mmoGenWinCCObj.Lines.Add('');


mmoGenWinCCObj.Lines.Add('Next objMember');
(**)
mmoGenWinCCObj.Lines.Add(''+#39+' ---������ ������������ �������� ������ ����---------------');
mmoGenWinCCObj.Lines.Add('Set colSearchResults = ActiveDocument.HMIObjects.Find(ObjectName:="bOff'+sName+'")');
mmoGenWinCCObj.Lines.Add('For Each objMember In colSearchResults');

mmoGenWinCCObj.Lines.Add('Set objDynDialog = objMember.Visible.CreateDynamicDialog("'+#39+NameS7P+'/'+sNameDB+'.Mode'+sName+#39+'", 2)');
mmoGenWinCCObj.Lines.Add('With objDynDialog');
mmoGenWinCCObj.Lines.Add('.Trigger.VariableTriggers(1).CycleType = hmiVariableCycleTypeUserCycle1');
mmoGenWinCCObj.Lines.Add('.ResultType = hmiResultTypeBool');
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.PositiveValue = 0');
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.NegativeValue = 1');
mmoGenWinCCObj.Lines.Add('End With');

if not FB20[NumDev].SB2_S7mc then
mmoGenWinCCObj.Lines.Add('Set objDynDialog = objMember.BackColor.CreateDynamicDialog("'+#39+NameS7P+'/'+sNameDB+'.cm'+sName+'HandOn'+#39+'", 2)')
else
mmoGenWinCCObj.Lines.Add('Set objDynDialog = objMember.BackColor.CreateDynamicDialog("'+#39+NameS7P+'/'+sNameDB+'.cm'+sName+'HandOff'+#39+'", 2)');

mmoGenWinCCObj.Lines.Add('With objDynDialog');
mmoGenWinCCObj.Lines.Add('.Trigger.VariableTriggers(1).CycleType = hmiVariableCycleTypeUserCycle1');
mmoGenWinCCObj.Lines.Add('.ResultType = hmiResultTypeBool');

if not FB20[NumDev].SB2_S7mc then
begin
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.PositiveValue = RGB(212, 208, 200)');
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.NegativeValue = RGB(0, 128, 255)');
end
else
begin
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.PositiveValue = RGB(0, 128, 255)');
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.NegativeValue = RGB(212, 208, 200)');
end;

mmoGenWinCCObj.Lines.Add('End With');

if not FB20[NumDev].SB2_S7mc then
mmoGenWinCCObj.Lines.Add('Set objDynDialog = objMember.ForeColor.CreateDynamicDialog("'+#39+NameS7P+'/'+sNameDB+'.cm'+sName+'HandOn'+#39+'", 2)')
else
mmoGenWinCCObj.Lines.Add('Set objDynDialog = objMember.ForeColor.CreateDynamicDialog("'+#39+NameS7P+'/'+sNameDB+'.cm'+sName+'HandOff'+#39+'", 2)');

mmoGenWinCCObj.Lines.Add('With objDynDialog');
mmoGenWinCCObj.Lines.Add('.Trigger.VariableTriggers(1).CycleType = hmiVariableCycleTypeUserCycle1');
mmoGenWinCCObj.Lines.Add('.ResultType = hmiResultTypeBool');

if not FB20[NumDev].SB2_S7mc then
begin
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.PositiveValue = RGB(0, 0, 0)');
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.NegativeValue = RGB(255, 255, 255)');
end
else
begin
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.PositiveValue = RGB(255, 255, 255)');
mmoGenWinCCObj.Lines.Add('.BinaryResultInfo.NegativeValue = RGB(0, 0, 0)');
end;

mmoGenWinCCObj.Lines.Add('End With');
mmoGenWinCCObj.Lines.Add(''+#39+' �������� �� ������� �� ������');
mmoGenWinCCObj.Lines.Add('Set objDConnection = objMember.Events(1).Actions.AddAction(hmiActionCreationTypeDirectConnection)');
mmoGenWinCCObj.Lines.Add('With objDConnection');
mmoGenWinCCObj.Lines.Add('.SourceLink.Type = hmiSourceTypeConstant');
mmoGenWinCCObj.Lines.Add('.SourceLink.ObjectName = 0');
mmoGenWinCCObj.Lines.Add('.DestinationLink.Type = hmiDestTypeVariableDirect');

if not FB20[NumDev].SB2_S7mc then
mmoGenWinCCObj.Lines.Add('.DestinationLink.ObjectName = "'+NameS7P+'/'+sNameDB+'.cm'+sName+'HandOn'+'"')
else
mmoGenWinCCObj.Lines.Add('.DestinationLink.ObjectName = "'+NameS7P+'/'+sNameDB+'.cm'+sName+'HandOff'+'"');

mmoGenWinCCObj.Lines.Add('End With');
mmoGenWinCCObj.Lines.Add('Next objMember');
(**)
mmoGenWinCCObj.Lines.Add('End Sub');
end;
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
Inc(CountWinCCObj);
end;

// ���������� ��� ��� ������������� �������� � WinCC (����� VBA ��������)
procedure GenWinCCObjTop();
var
  i, i0, k:Integer;
begin
 i0:=25-9;
 i:=i0;
 with fMain do
 begin
(*  mmoGenWinCCObj.Lines.Add('VERSION 1.0 CLASS');
  mmoGenWinCCObj.Lines.Add('BEGIN');
  mmoGenWinCCObj.Lines.Add('  MultiUse = -1  '+#39+'True');
  mmoGenWinCCObj.Lines.Add('END');
  mmoGenWinCCObj.Lines.Add('Attribute VB_Name = "ProjectTemplateDocument"');
  mmoGenWinCCObj.Lines.Add('Attribute VB_GlobalNameSpace = False');
  mmoGenWinCCObj.Lines.Add('Attribute VB_Creatable = False');
  mmoGenWinCCObj.Lines.Add('Attribute VB_PredeclaredId = True');
  mmoGenWinCCObj.Lines.Add('Attribute VB_Exposed = True');
*)  
  mmoGenWinCCObj.Lines.Add('Private Declare Function CountClipboardFormats Lib "user32.dll" () As Long');
  mmoGenWinCCObj.Lines.Add('Private Declare Function OpenClipboard Lib "user32.dll" (ByVal hWnd As Long) As Long');
  mmoGenWinCCObj.Lines.Add('Private Declare Function EmptyClipboard Lib "user32.dll" () As Long');
  mmoGenWinCCObj.Lines.Add('Private Declare Function CloseClipboard Lib "user32.dll" () As Long');
  mmoGenWinCCObj.Lines.Add('Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)');
  mmoGenWinCCObj.Lines.Add('');
  mmoGenWinCCObj.Lines.Add('Private Sub WinAPI_EmptyClipboard()');
  mmoGenWinCCObj.Lines.Add('    If CountClipboardFormats > 0 Then');
  mmoGenWinCCObj.Lines.Add('       OpenClipboard 0&: EmptyClipboard: CloseClipboard');
  mmoGenWinCCObj.Lines.Add('    Else');
  mmoGenWinCCObj.Lines.Add('       '+#39+'MsgBox "����� ������ �� �������� ������", vbInformation, ""');
  mmoGenWinCCObj.Lines.Add('    End If');
  mmoGenWinCCObj.Lines.Add('End Sub');
  mmoGenWinCCObj.Lines.Add('');

  mmoGenWinCCObj.Lines.Add('Sub CallAllDev()');
  for k:=0 to CntDev-1 do
  begin
    if (FB20[k].Device) (*and
    ((FindFromTemplate(TemplCP, FB20[k].Name))
    or
    (FindFromTemplate(TemplDP, FB20[k].Name))
    or
    (FindFromTemplate(TemplAV, FB20[k].Name)))
    *)
    then
    begin

//  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
      mmoGenWinCCObj.Lines.Insert(i,'GenWinCCObj'+FB20[k].Name);
      mmoGenWinCCObj.Lines.Insert(i+1,'GenWinCCObjDyn'+FB20[k].Name);
  fWinGenPrgr.pbPercGenPrgr.StepIt;   //^^^^^^^^^^^^^^^^^^^^^^^
      Inc(i);
    end;
  end;
  mmoGenWinCCObj.Lines.Insert(i0+(i-i0)*2-0,'  MsgBox "�������� �������� ���������", vbInformation, ""');
  mmoGenWinCCObj.Lines.Insert(i0+(i-i0)*2+1,'End Sub');

 end;
end;

procedure TfMain.chkPrSaveClick(Sender: TObject);
begin
  FB20PropSave:=chkPrSave.Checked;
  if FB20PropSave then begin
    FB20Prop:=FB20[CurrFB20];
  end;
  bPrPaste.Enabled:=FB20PropSave;
end;

procedure TfMain.bPrPasteClick(Sender: TObject);
begin
  if FB20PropSave then begin
    FB20[CurrFB20].Mdw:=FB20Prop.Mdw;
    FB20[CurrFB20].Mdu:=FB20Prop.Mdu;
    FB20[CurrFB20].Tm1:=FB20Prop.Tm1;
    FB20[CurrFB20].Tm2:=FB20Prop.Tm2;
    FB20[CurrFB20].TmX:=FB20Prop.TmX;
    ShowFieldDev(CurrFB20);
  end;
end;

// ����� ������������ �������� � ��������� ����������
function SearchCyrSmb(s: string): boolean;
var
  i:Integer;
begin
  for i := 1 to Length(s) do
  if s[i] in ['�'..'�', '�', '�'] then
  begin
    MessageDlg('��� ������� � ����� ����� ���������� ("'+ s+'") ���������� ������������ �������.'#13#10'�� ��������� ���������� ������ ������������� ��������� ����� ����������.'#13#10'��� �������� �������, � �������,������� �������� FixCyrSmb.exe', mtError, [mbOk], 0);
    SearchCyrSmb:=True;
    Exit;
  end;
  SearchCyrSmb:=False;
end;

// ������� ���� ��������� WinCC ("*_cex.csv")
function OpenWinCC_cex(): boolean;
var s:string;
  n,i:Integer;
begin
with fMain do
begin
// ��������� ���������� ����� � Memo
 if OpenDialogWinCC.Execute then
 begin
 MemoWinCC_cex.Lines.LoadFromFile(OpenDialogWinCC.FileName);
// ���������� ��� �������� (��� ��������� PLC)
 n:=MemoWinCC_cex.Lines.Count;
 nNameDrvWinCC:=n-2;
 for i:=2 to n-1 do
 begin
  s:=MemoWinCC_cex.Lines[i];
  NameDrvWinCCArr[i-2]:=copy(s,1,Pos(SepWinCC, s)-1);
 end;
 if n<=3 then NameDrvWinCC:=NameDrvWinCCArr[0]
 else begin
   fSelNameOSWinCC.ShowModal;
 end;
  NameS7P:=NameDrvWinCC;
 // ���������� ����� ������ �������� � ���������� WinCC
 s:=ExtractFileName(OpenDialogWinCC.FileName);
 NameOSWinCC:=Copy(s,1,Pos('_cex.csv',s)-1);
// MemoWinCC_cex.Lines.Add(s);
// MemoWinCC_dex.Lines.LoadFromFile(NameOSWinCC+'_dex.csv');
// MemoWinCC_vex.Lines.LoadFromFile(NameOSWinCC+'_vex.csv');
// bGenTxt.Enabled:=True;
 end;

  OpenWinCC_cex:=False;

end;
end;

procedure TfMain.bTest2Click(Sender: TObject);
var
  sArr: array [0..100] of string;
  s:string;
  n, i:Integer;
begin
//  s:=fSetting.eTemplAV.Text;
  s:=fSetting.eTemplCP.Text;

  SeparateString(s, n, sArr);
  for i:=0 to n-1 do mmoOut.Lines.Add(sArr[i]);
//   av,yv,pk
end;



end.
