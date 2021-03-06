unit AccessConnectUnit;

interface

uses SysUtils {StrToInt} ,
  Data.DB, Data.Win.ADODB,Generics.Collections,  Vcl.Dialogs,
  RecordUnit;

type
  TAccessConnect = class
    ADOConnection: TADOConnection;
    function getRecords(FIO: String): TList<TRecord>; overload;
    function getRecords: TList<TRecord>; overload;
    function getRecords(FIO: String; Date:Tdate): TList<TRecord>; overload;
    function getRecords(count: integer): TList<TRecord>; overload;
    procedure insert(rec:TRecord);
    constructor create(DBName:String); overload;
    destructor delete;
    constructor create; overload;
    function BTS(b:Boolean):String;
  end;

implementation

{ AccessConnect }

function TAccessConnect.BTS(b: Boolean): String;
begin
  if b then
    result:= 'TRUE'
  else
    result:= 'FALSE'
end;

constructor TAccessConnect.create;
begin
  ADOConnection := TADOConnection.Create(nil);
  with (ADOConnection) do
  begin
    Provider := 'Microsoft.ACE.OLEDB.12.0';
    Mode := cmShareDenyNone;
    LoginPrompt := False;
    ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;' +
      'Data source=DataBase.accdb;' + 'Persist Security Info=False';
    Connected := true;
  end;
end;

constructor TAccessConnect.create(DBName: String);
begin
  ADOConnection := TADOConnection.Create(nil);
  with (ADOConnection) do
  begin
    Provider := 'Microsoft.ACE.OLEDB.12.0';
    Mode := cmShareDenyNone;
    LoginPrompt := False;
    ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;' +
      'Data source='+DBName+ '; Persist Security Info=False';
    Connected := true;
  end;
end;

destructor TAccessConnect.delete;
begin
  ADOConnection.Destroy;
end;

function TAccessConnect.getRecords: TList<TRecord>;
var ADOQuery: TADOQuery;
  fio, note: string;
  time: TTime;
  date: TDate;
  ps1,ps2,as1,as2,r,f,a: boolean;
begin
  result := TList<TRecord>.Create;
    ADOQuery := TADOQuery.create(nil);
    with (ADOQuery) do
    begin
      Connection := ADOConnection;
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM records');
      Open;
      Active := true;
    end;
    ADOQuery.First;
    while (not ADOQuery.Eof) do
    begin
      fio := ADOQuery.FieldByName('FIO').AsString;
      time := ADOQuery.FieldByName('TIME').AsDateTime;
      date := ADOQuery.FieldByName('DATE').AsDateTime;
      ps1 := ADOQuery.FieldByName('PassportScan1').AsBoolean;
      ps2 := ADOQuery.FieldByName('PassportScan2').AsBoolean;
      as1 := ADOQuery.FieldByName('AttestatScan1').AsBoolean;
      as2 := ADOQuery.FieldByName('AttestatScan2').AsBoolean;
      r := ADOQuery.FieldByName('Registrate').AsBoolean;
      f := ADOQuery.FieldByName('Family').AsBoolean;
      a := ADOQuery.FieldByName('Agreement').AsBoolean;
      note := ADOQuery.FieldByName('Note').AsString;
      result.Add(TRecord.create(fio, time, date, ps1,ps2,as1,as2,r,f,a,note));
      ADOQuery.Next;
    end;
    ADOQuery.Free;
end;

function TAccessConnect.getRecords(FIO: String; Date: Tdate): TList<TRecord>;
begin
  //
end;

procedure TAccessConnect.insert(rec: TRecord);
var ADOQuery: TADOQuery;
  sTime, sDate,sqlString: String;
begin
  DateTimeToString(sTime, 'hh:mm:ss', rec.recordTime);
  DateTimeToString(sDate, 'dd.mm.yyyy', rec.recordDate);
  sTime:=FormatDateTime('hh:nn:ss',rec.recordTime);
  sDate:=FormatDateTime('dd.mm.yyyy',rec.recordDate);
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.Text := ('INSERT INTO records (fio, Time1, Date1,Passportscan1,');
    SQL.Add('PassportScan2,AttestatScan1,AttestatScan2,Registrate,Family,Agreement,Note1)');
    SQL.Add(' VALUES (:fio, :Time1, :Date1, :Passportscan1,:PassportScan2,');
    SQL.Add(':AttestatScan1,:AttestatScan2,:Registrate,:Family,:Agreement,:Note1)');
    Parameters.ParamByName('fio').Value:= rec.userFIO;
    Parameters.ParamByName('Time1').Value:= sTime;
    Parameters.ParamByName('Date1').Value:= sDate;
    Parameters.ParamByName('Passportscan1').Value:= rec.PassportScan1;
    Parameters.ParamByName('Passportscan2').Value:= rec.PassportScan2;
    Parameters.ParamByName('Attestatscan1').Value:= rec.attestatScan1;
    Parameters.ParamByName('Attestatscan2').Value:= rec.attestatScan2;
    Parameters.ParamByName('Registrate').Value:= rec.Registrate;
    Parameters.ParamByName('Family').Value:= rec.Family;
    Parameters.ParamByName('Agreement').Value:= rec.Agreement;
    Parameters.ParamByName('Note1').Value:= rec.Note;
    try
      ExecSQL;
    except
      showmessage((Parameters.ParamValues['Note']));
    end;
    Close;
  end;
end;

function TAccessConnect.getRecords(FIO: String): TList<TRecord>;
var ADOQuery: TADOQuery;
  note: string;
  time: TTime;
  date: TDate;
  ps1,ps2,as1,as2,r,f,a: boolean;
begin
  result := TList<TRecord>.Create;
    ADOQuery := TADOQuery.create(nil);
    with (ADOQuery) do
    begin
      Connection := ADOConnection;
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM records WHERE FIO = "'+fio+'"');
      Open;
      Active := true;
    end;
    ADOQuery.First;
    while (not ADOQuery.Eof) do
    begin
      fio := ADOQuery.FieldByName('FIO').AsString;
      time := ADOQuery.FieldByName('TIME').AsDateTime;
      date := ADOQuery.FieldByName('DATE').AsDateTime;
      ps1 := ADOQuery.FieldByName('PassportScan1').AsBoolean;
      ps2 := ADOQuery.FieldByName('PassportScan2').AsBoolean;
      as1 := ADOQuery.FieldByName('AttestatScan1').AsBoolean;
      as2 := ADOQuery.FieldByName('AttestatScan2').AsBoolean;
      r := ADOQuery.FieldByName('Registrate').AsBoolean;
      f := ADOQuery.FieldByName('Family').AsBoolean;
      a := ADOQuery.FieldByName('Agreement').AsBoolean;
      note := ADOQuery.FieldByName('Note').AsString;
      result.Add(TRecord.create(fio, time, date, ps1,ps2,as1,as2,r,f,a,note));
      ADOQuery.Next;
    end;
    ADOQuery.Free;
end;

function TAccessConnect.getRecords(count: integer): TList<TRecord>;
var ADOQuery: TADOQuery;
  fio, note: string;
  time: TTime;
  date: TDate;
  ps1,ps2,as1,as2,r,f,a: boolean;
begin
  result := TList<TRecord>.Create;
    ADOQuery := TADOQuery.create(nil);
    with (ADOQuery) do
    begin
      Connection := ADOConnection;
      Close;
      SQL.Clear;
      SQL.Add('SELECT TOP 10 * FROM records ORDER BY id DESC');
      Open;
      Active := true;
    end;
    ADOQuery.First;
    while (not ADOQuery.Eof) do
    begin
      fio := ADOQuery.FieldByName('FIO').AsString;
      time := ADOQuery.FieldByName('TIME1').AsDateTime;
      date := ADOQuery.FieldByName('DATE1').AsDateTime;
      ps1 := ADOQuery.FieldByName('PassportScan1').AsBoolean;
      ps2 := ADOQuery.FieldByName('PassportScan2').AsBoolean;
      as1 := ADOQuery.FieldByName('AttestatScan1').AsBoolean;
      as2 := ADOQuery.FieldByName('AttestatScan2').AsBoolean;
      r := ADOQuery.FieldByName('Registrate').AsBoolean;
      f := ADOQuery.FieldByName('Family').AsBoolean;
      a := ADOQuery.FieldByName('Agreement').AsBoolean;
      note := ADOQuery.FieldByName('Note1').AsString;
      result.Add(TRecord.create(fio, time, date, ps1,ps2,as1,as2,r,f,a,note));
      ADOQuery.Next;
    end;
    ADOQuery.Free;
end;

end.

