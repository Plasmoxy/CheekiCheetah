{$codepage utf8}
{ by Plasmoxy }

program quadratic;

uses crt, sysutils, math, ucomplex;

{ ---- OBJ ---- }

type SolveQuadratic = class
    private
      a,b,c,d : double;
      complexRoots : array of Complex;
      retarded : boolean;
      procedure addRoot(_root : double);
      procedure addComplexRoot(_croot : Complex);
    public
      roots : array of double;
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

    if a=0 then begin
      if (b=0) then retarded := true
      else addRoot( -c/b );
    end
    else begin
      if d<0 then begin
        addComplexRoot( (-b+csqrt( cinit(d, 0)) ) / (2*a) );
        addComplexRoot( (-b-csqrt( cinit(d, 0)) ) / (2*a) );
      end
      else if d=0 then addRoot( -b/(2*a) )
      else if d>0 then begin
        addRoot( (-b+sqrt(d))/(2*a) );
        addRoot( (-b-sqrt(d))/(2*a) );
      end;
    end;

  end;

  procedure SolveQuadratic.addRoot(_root : double);
  begin
    setlength(roots, length(roots)+1);
    roots[length(roots)-1] := _root;
  end;

  procedure SolveQuadratic.addComplexRoot(_croot : Complex);
  begin
    setlength(complexRoots, length(complexRoots)+1);
    complexRoots[length(complexRoots)-1] := _croot;
  end;

  procedure SolveQuadratic.printRoots();
  var
    it, len : integer; // iterator, length of array
  begin
    writeln('===[ '+dtos2(a)+'x^2 + '+dtos2(b)+'x + '+dtos2(c)+' = 0 ]===');
    writeln;
    
    if retarded then begin
      writeln('=== NAPISALI STE RETARDOVANY VYRAZ PROSIM PEKNE :)))) ===');
      exit();
    end;

    writeln(' === REALNE KORENE ===');
    len := length(roots);
    
    write('K(R) = {');
    if len>0 then writeln; // cosmetic
    for it:=1 to len do begin
      write('  ' + dtos(roots[it-1]));
      if it<len then write(',');
      writeln;
    end;
    writeln('}');
    
    writeln(' === KOMPLEXNE KORENE ===');
    len := length(complexRoots);
    
    write('K(C) = {');
    if len>0 then writeln; // cosmetic
    for it:=1 to len do begin
      write('  ' + cstr(complexRoots[it-1], 6, 6));
      if it<len then write(',');
      writeln;
    end;
    writeln('}');

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

{ ------- PROGRAM -------- }

const
  nl = slinebreak;
  
var
  active : boolean;
  a,b,c : double;

begin
  
  DefaultFormatSettings.DecimalSeparator := '.'; // nemam rad ciarku :(
  
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
        writeln('BTW desatinna ciarka je bodka = "." ( to kvoli citatelnosti )');
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

