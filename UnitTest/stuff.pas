unit stuff;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  helloer = class
    public
      procedure greet();
  end;

  adder = class
    public
      class function add(a, b : integer) : integer;
  end;

implementation

{ --- class helloer --- }

procedure helloer.greet();
begin
  writeln('HENLO FRIEMD');
end;

{ end }

{ class adder :}

class function adder.add(a, b : integer ) : integer;
begin
  exit(a + b);
end;

{ end }

end.

