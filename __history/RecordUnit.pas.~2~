unit RecordUnit;

interface

type
  TRecord = class
    UserFIO: String;
    recordTime: TTime;
    recordDate: TDate;
    PassportScan1: Boolean;
    PassportScan2: Boolean;
    AttestatScan1: Boolean;
    AttestatScan2: Boolean;
    Registrate: Boolean;
    Family: Boolean;
    Agreement: Boolean;
    Note: String;
    //constructor create(); overload;
    constructor create(FIO:String; Time:TTime; Date:TDate;
      PassScan1,PassScan2,AttScan1,AttScan2,Reg,Fam,Agr:Boolean;
      Note:String); overload;
    constructor create(FIO:String; Time:TTime; Date: TDate; Note:String); overload;
  end;

implementation

{ TRecord }

{constructor TRecord.create;
begin
  //
end;   }

constructor TRecord.create(FIO: String; Time: TTime; Date: TDate; PassScan1,
  PassScan2, AttScan1, AttScan2, Reg, Fam, Agr: Boolean; Note: String);
begin
  Self.UserFIO:= FIO;
  Self.recordTime:= Time;
  Self.recordDate:= Date;
  Self.PassportScan1:= PassScan1;
  Self.PassportScan2:= PassScan2;
  Self.AttestatScan1:= AttScan1;
  Self.AttestatScan2:= AttScan2;
  Self.Registrate:= Reg;
  Self.Family:= Fam;
  Self.Agreement:= Agr;
  Self.Note:= Note;
end;

constructor TRecord.create(FIO: String; Time: TTime; Date: TDate; Note: String);
begin
  Self.UserFIO:= FIO;
  Self.recordTime:= Time;
  Self.recordDate:= Date;
  Self.PassportScan1:= True;
  Self.PassportScan2:= True;
  Self.AttestatScan1:= True;
  Self.AttestatScan2:= True;
  Self.Registrate:= True;
  Self.Family:= True;
  Self.Agreement:= True;
  Self.Note:= Note;
end;

end.
