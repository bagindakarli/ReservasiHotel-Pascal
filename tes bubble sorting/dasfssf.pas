Program Ahay;
uses crt;
type tabel=array[1..10] of integer;
var
        t:tabel;
        i,j,tmp:integer;
begin
clrscr;
        for i:=1 to 10 do
                begin
                        write('Masukkan Angka ke-',i,' : ');readln(t[i]);
                end;
        writeln;
        writeln;
        for i:=1 to 10 do
                begin
                        writeln('Angka ke-',i,' : ',t[i]);
                end;
        readln;
        writeln;
        for i:=10 downto 2 do
                begin
                        for j:=2 to i do
                                begin
                                        if (t[j-1] < t[j]) then
                                                begin
                                                        tmp:=t[j-1];
                                                        t[j-1]:=t[j];
                                                        t[j]:=tmp;
                                                end;
                                end;
                end;
        writeln;
        writeln;
        writeln('Data Setelah Diurutkan : ');readln;
        for i:=1 to 10 do
                begin
                        writeln('Angka ke-',i,' : ',t[i]);
                end;
        readln;
end.