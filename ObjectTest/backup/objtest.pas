program objtest;

uses crt, sysutils;

{ --- class XD --- }

type XD = class
  private
    val : Integer;
  public
    //constructor create(_val : Integer);
    function getVal() : integer;
    procedure setVal(_val : Integer);
    procedure increment();
    procedure dump();
end;

{
constructor XD.create(_val : Integer);
begin
  val := _val;
end;
}

function XD.getVal() : integer;
begin
     exit(val);
end;

procedure XD.setVal(_val : integer);
begin
     val := _val;
end;

procedure XD.increment();
var
   i : Integer = 1;
begin
     val := val + i;
end;

procedure XD.dump();
begin
     writeln('val = ' + inttostr(val));
end;

{ --- end class --- }

var
   x : XD;
begin
     x := XD.create();
     x.dump();
     x.increment();
     x.dump();
     readkey;
end.

