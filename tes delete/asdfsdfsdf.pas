Program Ahay;
uses crt;
var
        ahayy:array[1..5] of integer;
        i:integer;
        nilai:integer;
procedure cuy;
begin
clrscr;
        for i:=1 to 5 do
                begin
                        write('Masukkan Nilai Ke-',i,' : ');readln(ahayy[i]);
                end;
        writeln;
        writeln;
        for i:=1 to 5 do
                begin
                        writeln('Nilai ke-',i,' : ',ahayy[i]);
                end;
        writeln;
        writeln;
        writeln('Pilih Nilai Yang Ingin dihapus : ');readln(nilai);
        for i:=1 to (length(ahayy)-nilai) do
                begin
                     ahayy[nilai]:=ahayy[nilai+1];
                     nilai:=nilai+1;
                end;
        writeln;
        writeln;
        for i:=1 to 4 do
                begin
                        writeln('Nilai ke-',i,' : ',ahayy[i]);
                end;
        readln;
        cuy;
end;

begin
cuy;
end.
