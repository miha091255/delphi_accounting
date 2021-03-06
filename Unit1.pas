unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.CheckLst, Vcl.ComCtrls, Vcl.Menus, Generics.Collections, ClipBrd,
  RecordUnit, AccessConnectUnit;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    FIOEdit: TLabeledEdit;
    dtpTime: TDateTimePicker;
    CheckListBox1: TCheckListBox;
    PassportScan1: TCheckBox;
    PassportScan2: TCheckBox;
    AttestatScan1: TCheckBox;
    AttestatScan2: TCheckBox;
    Registration: TCheckBox;
    Family: TCheckBox;
    Agreement: TCheckBox;
    Label1: TLabel;
    NoteEdit: TLabeledEdit;
    Panel2: TPanel;
    AddButton: TBitBtn;
    MainMenu1: TMainMenu;
    miFile: TMenuItem;
    miConnect: TMenuItem;
    miDisconnect: TMenuItem;
    dtpDate: TDateTimePicker;
    Timer1: TTimer;
    DefaultConnect: TMenuItem;
    SelectConnect: TMenuItem;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    Memo2: TMemo;
    lCount: TLabel;
    lRegCount: TLabel;
    leQuestAddress: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DefaultConnectClick(Sender: TObject);
    procedure SelectConnectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miDisconnectClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RenewRecordsList;
    procedure FIOEditEnter(Sender: TObject);
    procedure leQuestAddressEnter(Sender: TObject);
    procedure FIOEditExit(Sender: TObject);
    procedure leQuestAddressExit(Sender: TObject);
  private
    FConnected: Boolean;
    FTotalCount: Integer;
    FRegCount: Integer;
    FQuestAddress: String;
    FEditMode: Boolean;
    procedure SetConnected(const Value: Boolean; PathToFile: string);overload;
    procedure SetConnected(const Value: Boolean);overload;
    procedure generateAnswer;
    function getSpaceCount(s: string): integer;
    procedure SetTotalCount(const Value: Integer);
    procedure SetRegCount(const Value: Integer);
    procedure SetQuestAddress(const Value: String);
    procedure SetEditMode(const Value: Boolean);
    { Private declarations }
  public
    property Connected: Boolean read FConnected write SetConnected;
    property TotalCount: Integer read FTotalCount write SetTotalCount;
    property RegCount: Integer read FRegCount write SetRegCount;
    property QuestAddress: String read FQuestAddress write SetQuestAddress;
    property EditMode: Boolean read FEditMode write SetEditMode;
    { Public declarations }
  end;

var
  Form1: TForm1;
  today : TDateTime;
  connect : TAccessConnect;
  records : TList<TRecord>;

const
  cpt = '????';
  ID = WM_USER + 1;

implementation

{$R *.dfm}

procedure TForm1.AddButtonClick(Sender: TObject);
var rec: TRecord;
  fio : string;
begin
  fio :=  Trim(FIOEdit.Text);
  if fio <> '' then
  try
    rec := TRecord.create(fio, dtpTime.Time, dtpDate.Date,
    PassportScan1.Checked, PassportScan2.Checked, AttestatScan1.Checked,
    AttestatScan2.Checked, Registration.Checked, Family.Checked,
    Agreement.Checked, Trim(NoteEdit.Text));
    connect.insert(rec);
    generateAnswer;
    renewRecordsList;
    TotalCount := FTotalCount + 1;
    if Registration.Checked then
      RegCount := FRegCount + 1;
  except
    showMessage('??? ??????? ?????????? ?????? ? ???? ?????? ????????? ??????');
  end
  else
    showMessage('??? ?????????? ?????? ? ???? ?????? ????????? ???? ???');
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Clipboard.AsText := Memo1.Text;
end;

procedure TForm1.DefaultConnectClick(Sender: TObject);
begin
  SetConnected(True);
end;

procedure TForm1.FIOEditEnter(Sender: TObject);
begin
  EditMode := true;
end;

procedure TForm1.FIOEditExit(Sender: TObject);
begin
  EditMode := False;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetConnected(False);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  self.Width := 783;
  Self.Caption := cpt;
  records := TList<TRecord>.Create;
  TotalCount := 0;
  RegCount := 0;
  Timer1.Enabled := true;
  QuestAddress := '?? ????? eek18@tpu.ru';
end;

procedure TForm1.generateAnswer;
var s: string;
begin
  s := '????????????, '+Trim(FIOEdit.Text)+'!'+#13;
  if (not PassportScan1.Checked)or(not PassportScan2.Checked)or
  (not AttestatScan1.Checked)or(not AttestatScan2.Checked)or
  (Family.Checked)or(Agreement.Checked) then
    s := s+' ? ????? ????????? ?? ??????? '+#13;
  if not PassportScan1.Checked then
    s := s + ' - ????? ???????? ???????(??? 1-2);'+#13;
  if not PassportScan2.Checked then
    s := s + ' - ????? ???????? ?? ????????;'+#13;
  if not AttestatScan1.Checked then
    s := s + ' - ????? ?????????;'+#13;
  if not AttestatScan2.Checked then
    s := s + ' - ????? ?????????? ? ?????????;'+#13;
  if Family.Checked then
    s := s + ' - ???????? ? ?????????/ ???????? ??????????????;'+#13;
  if Agreement.Checked then
    s := s + ' - ????????? ?? ????????? ? ???????? ?? ????????? ????? ???????????? ??????;'+#13;
  s := s + ' ??????? ?? ?????????? ?????? ?? ?????? ?????? '+questAddress;
  memo1.Text := s;
end;

function TForm1.getSpaceCount(s: string): integer;
var i, count: integer;
begin
  count := 0;
  for i:= 0 to length(s) do
    if s[i]=' ' then
      inc(count);
  result := count;
end;

procedure TForm1.leQuestAddressEnter(Sender: TObject);
begin
  EditMode:= true;
end;

procedure TForm1.leQuestAddressExit(Sender: TObject);
begin
  EditMode := False;
end;

procedure TForm1.miDisconnectClick(Sender: TObject);
begin
  SetConnected(False);
end;

procedure TForm1.RenewRecordsList;
var i: integer;
  rec: TRecord;
begin
  memo2.Lines.Clear;
  records.Free;
  records := connect.getRecords(10);
  if records.count > 0 then
    for rec in records do
      memo2.Lines.Add(rec.UserFIO)
end;

procedure TForm1.SelectConnectClick(Sender: TObject);
begin
  openDialog1.Execute();
  if OpenDialog1.FileName <>'' then
    SetConnected(True, OpenDialog1.FileName)
end;

procedure TForm1.SetConnected(const Value: Boolean);
begin
  if FConnected then
  try
    connect.Destroy;
  finally
    FConnected:= Value;
  end;
  if Value then
  begin
    connect := TAccessConnect.Create();
    Self.Caption := cpt+': Connection (Default)';
  end
  else
    Self.Caption := cpt + ': Disconnected';
end;

procedure TForm1.SetEditMode(const Value: Boolean);
begin
  FEditMode := Value;
  if FEditMode then
    Timer1.Enabled:= False
  else
    Timer1.Enabled:= True;
end;

procedure TForm1.SetQuestAddress(const Value: String);
begin
  if FQuestAddress <> Value then
    FQuestAddress := Value;
  leQuestAddress.Text := FQuestAddress;
end;

procedure TForm1.SetRegCount(const Value: Integer);
begin
  FRegCount := Value;
  lRegCount.Caption := '????????????????? ????????????: '+IntToStr(FRegCount);
end;

procedure TForm1.SetTotalCount(const Value: Integer);
begin
  FTotalCount := Value;
  lCount.Caption := '?? ????? ?????? ????????? '+IntToStr(FTotalCount)+' ???????';
end;

procedure TForm1.SetConnected(const Value: Boolean; PathToFile: String);
begin
  if FConnected then
  try
    connect.Destroy;
  finally
    FConnected:= Value;
  end;
  if Value then
  begin
    connect := TAccessConnect.Create(PathToFile);
    Self.Caption := cpt+': Connection (' + PathToFile+')';
  end
  else
    Self.Caption := cpt + ': Disconnected';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var buff: string;
  addr: String;
begin
  today := Now;
  dtpTime.Time := today;
  dtpDate.Date := today;
  try
    buff := Trim(Clipboard.AsText);
  except
    //
  end;
  if (getSpaceCount(buff)<=4) and (ActiveControl<>FIOEdit)and
    (Trim(FIOEdit.Text)<>buff) then
    FIOEdit.Text := buff;
  if (addr <> Trim(leQuestAddress.Text))and(Trim(leQuestAddress.Text)<>'') then
    addr := Trim(leQuestAddress.Text);
  if FQuestAddress <> addr then
    QuestAddress := addr;
end;

end.
