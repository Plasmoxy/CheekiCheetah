{$codepage utf8}
{ by Plasmoxy }

program quadratic;

uses crt, sysutils, math;


type SolveQuadratic = class
    private
      a,b,c,d : double;
      roots : array of double;
      procedure addRoot(_root : double);
    public
      constructor create(_a,_b,_c : double);
      procedure printRoots();
      function getDiscriminant() : double;
      function dtos(_value : double) : string; // double to string with 6 decimal points
      function dtos2(_value : double) : string; // 3 decimal points
end;

  constructor SolveQuadratic.create(_a,_b,_c : double);
  begin
    a := _a;
    b := _b;
    c := _c;
    
    d := power(b, 2) - 4*a*c;
    
    if d=0 then addRoot( -b/(2*a) )
    else if d>0 then begin
      addRoot( (-b+sqrt(d))/(2*a) );
      addRoot( (-b-sqrt(d))/(2*a) );
    end;

  end;

  procedure SolveQuadratic.addRoot(_root : double);
  begin
    setlength(roots, length(roots)+1);
    roots[length(roots)-1] := _root;
  end;

  procedure SolveQuadratic.printRoots();
  var
    l : integer;
  begin
    writeln('===[ '+dtos2(a)+'x^2 + '+dtos2(b)+'x + '+dtos2(c)+' = 0 ]===');
    
    l := length(roots);
    if l=0 then writeln('NEMA KOREN V R !')
    else if l=1 then writeln('x = ' + dtos(roots[0]))
    else if l=2 then begin
      writeln('x1 = ' + dtos(roots[0]));
      writeln('x2 = ' + dtos(roots[1]));
    end;
    
    writeln('================');
  end;
  
  function SolveQuadratic.dtos(_value : double) : string;
  begin
    exit(FloatToStrF(_value, ffFixed, 6, 6));
  end;

  function SolveQuadratic.dtos2(_value : double) : string;
  begin
    exit(FloatToStrF(_value, ffFixed, 2, 2));
  end;

  function SolveQuadratic.getDiscriminant() : double;
  begin
    exit(d);
  end;

const
  nl = slinebreak;
  
var
  active : boolean;
  a,b,c : double;

begin
  
  active := true;
  
  while active do begin
    clrscr;
    
    writeln(
      '======= OOP VYPOCET KORENOV KVADRATICKEJ ROVNICE ======' +nl+
      '========= ( napisal Plasmoxy = Seb Petrík ) ===========' +nl
    );
    
    writeln('Zadajte rovnicu podla vzoru ax^2 + bx + c :');
    
    try
      write('a = '); readln(a);
      write('b = '); readln(b);
      write('c = '); readln(c);
    except
      on E: Exception do begin
        writeln('CHYBA VSTUPU, SKUSTE ESTE RAZ ! (stlac klaves)');
        readkey;
        continue;
      end;
    end;

    writeln;

    try SolveQuadratic.create(a,b,c).printRoots();
    except
      on E: Exception do writeln('Fatalna chyba pri vypocte.')
    end;
    
    writeln(nl + ' [ Stlac nejaky klaves pre obnovenie alebo ESC pre koniec] ');
    case readkey of
      #27: active := false; // esc
    end;
    
  end; // end while

end.

