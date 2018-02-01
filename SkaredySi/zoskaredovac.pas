program zoskaredovac;
uses crt, sysutils;

const
  _n = sLineBreak;

var
  input : unicodestring;
begin
  writeln('--- Oskaredovac ---');
  write('Meno : ');
  readln(input);
  writeln(_n + input + ' nema ziadnu nadej. :(');
  readkey;
end.

