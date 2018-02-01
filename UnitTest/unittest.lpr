program unittest;

uses crt, sysutils, stuff;
var
  h : helloer;
begin
  h := helloer.create();
  h.greet();

  writeln(adder.add(3, 4));

  readkey();
end.

