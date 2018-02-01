program tfpglisttest;

uses crt, sysutils, classes, fgl;

type
  henlo = class
    public
      val : integer;
  end;

  intlist = specialize TFPGObjectList<henlo>;

var
  a:intlist;
  temph : henlo;
begin
  a := intlist.create();

  temph := henlo.create();
  temph.val := 4;
  a.add(temph);
  temph := nil;

  writeln(a.first.val);

  readkey;
end.

