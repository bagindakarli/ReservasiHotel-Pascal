program login;
uses crt;
type user = record
        tnama:string;
        tuser:string;
        tpass:string;
end;
var
        arruser:array[1..10] of user;
        jumlahuser:integer;

procedure pengguna;forward;

procedure login;
var
        akun:string;
        nama,user,pass:string;
        i:integer;
begin
        clrscr;
        repeat
                begin
                        clrscr;
                        write('Sudah Punya Akun? [y/n] : ');readln(akun);
                end
        until (akun='y') or (akun='n');
        if akun='y' then
                begin
                        write('Username : ');readln(user);
                        write('Password : ');readln(pass);
                        for i:=1 to 10 do
                                begin
                                        if user=arruser[i].tuser then
                                                begin
                                                        if pass=arruser[i].tpass then
                                                                begin
                                                                        writeln('Selamat Datang ',arruser[i].tnama);
                                                                        readln;
                                                                        login;
                                                                end
                                                        else
                                                                begin
                                                                        writeln('Password Salah');readln;
                                                                        login;
                                                                end;
                                                end
                                        else
                                                begin
                                                        writeln('Username belum terdaftar');readln;
                                                        login;
                                                end;
                                end;

                end
        else if akun='n' then
                begin
                        writeln('DAFTAR');
                        writeln;
                        write('Nama     : ');readln(nama);
                        write('Username : ');readln(user);
                        write('Password : ');readln(pass);
                        arruser[jumlahuser+1].tnama:=nama;
                        arruser[jumlahuser+1].tuser:=user;
                        arruser[jumlahuser+1].tpass:=pass;
                        jumlahuser:=jumlahuser+1;
                        pengguna;
                end;
end;

procedure pengguna;
begin
        writeln('Jumlah User Sekarang : ',jumlahuser);readln;
        login;
end;

begin
clrscr;
pengguna;
end.
