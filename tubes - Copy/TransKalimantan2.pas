Program TugasBesar_TransKalimantan;
uses crt,sysutils;
type user=record
        tnama:string;
        tuser:string;
        tpass:string;
end;
var
        arruser:array[1..50] of user;
        jumlahuser:integer;
        i,j,cari,daftar:integer;

procedure login;forward;
procedure awal;forward;

procedure menu_user;
begin
        clrscr;
        writeln('Jumlah User : ',jumlahuser);
        readln;
        awal;
end;

procedure menu_admin;
var
        i:integer;
begin
        clrscr;
        writeln('Ini menu admin.');
        for i:=1 to jumlahuser do
                begin
                        writeln('Nama     : ',arruser[i].tnama);
                        writeln('Username : ',arruser[i].tuser);
                end;
        readln;
        awal;
end;

procedure login;
label
        ulang1,ulang2;
var
        akun:string;
        nama,user,pass:string;
begin
        clrscr;
        daftar:=0;
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        repeat
                begin
                        gotoxy(45,9);write('Sudah Punya Akun? [y/n] : ');readln(akun);
                end
        until (akun='y') or (akun='n');
        if akun='y' then
                begin
                        ulang1:
                        gotoxy(45,11);write('Username : ');readln(user);
                        gotoxy(45,12);write('Password : ');readln(pass);
                        if (((user='') or (pass='')) or ((user='') and (pass=''))) then
                                begin
                                        gotoxy(45,14);write('Username atau Password tidak boleh kosong.');readln;
                                        login;
                                end
                        else if ((user='admin') and (pass='admin')) or ((user='Admin') and (pass='Admin')) then
                                begin
                                        menu_admin;
                                end
                        else
                                begin
                                        {cari:=0;
                                        i:=1;}
                                        repeat
                                                begin
                                                        {x:=1;
                                                        repeat
                                                                begin}
                                                                        if user=arruser[i+1].tuser then
                                                                                begin
                                                                                        cari:=1;
                                                                                end
                                                                        else if user<>arruser[i+1].tuser then
                                                                                begin
                                                                                        cari:=0;
                                                                                        gotoxy(45,14);write('Username belum terdaftar.');readln;
                                                                                        i:=i+1;
                                                                                        login;
                                                                                end;
                                                                       { x:=x+1;
                                                                end;
                                                        until cari=1;}
                                                end
                                        until cari=1;
                                        if user=arruser[i+1].tuser then
                                                begin
                                                        if pass=arruser[i+1].tpass then
                                                                begin
                                                                        writeln('Selamat Datang ',arruser[i+1].tnama);readln;
                                                                        menu_user;
                                                                end
                                                        else
                                                                begin
                                                                        gotoxy(45,14);write('Password Salah');readln;
                                                                        login;
                                                                end;
                                                end;
                                        {else if user<>arruser[i].tuser then
                                                begin
                                                        gotoxy(45,14);write('Username belum terdaftar.');readln;
                                                        login;
                                                end;}
                                        {for i:=1 to 50 do
                                                begin
                                                        if user=arruser[i].tuser then
                                                                begin
                                                                        if pass=arruser[i].tpass then
                                                                                begin
                                                                                        writeln('Selamat Datang ',arruser[i].tnama);readln;
                                                                                        menu_user;
                                                                                end
                                                                        else
                                                                                begin
                                                                                        gotoxy(45,14);write('Password Salah');readln;
                                                                                        login;
                                                                                end;
                                                                end
                                                        else if user<>arruser[i].tuser then
                                                                begin
                                                                        gotoxy(45,14);write('Username belum Terdaftar');readln;
                                                                        login;
                                                                end;
                                                end;}
                                end;
                end
        else if akun='n' then
                begin
                        gotoxy(45,11);write('================');
                        gotoxy(45,12);write('DAFTAR AKUN BARU');
                        gotoxy(45,13);write('================');
                        gotoxy(45,15);write('Nama     : ');readln(nama);
                        gotoxy(45,16);write('Username : ');readln(user);
                        if user='' then
                                begin
                                        gotoxy(45,18);write('Username tidak boleh kosong.');readln;
                                        login;
                                end
                        else
                                begin
                                        repeat
                                                begin
                                                        if user=arruser[j+1].tuser then
                                                                begin
                                                                        gotoxy(45,19);write('Username telah digunakan, silakan gunakan username lain.');readln;
                                                                        j:=j+1;
                                                                        login;
                                                                end
                                                        else if user<>arruser[j+1].tuser then
                                                                begin
                                                                        gotoxy(45,17);write('Password : ');readln(pass);
                                                                        if pass='' then
                                                                                begin
                                                                                        gotoxy(45,19);write('Password tidak boleh kosong.');readln;
                                                                                        login;
                                                                                end
                                                                        else
                                                                                begin
                                                                                        arruser[jumlahuser+1].tnama:=nama;
                                                                                        arruser[jumlahuser+1].tuser:=user;
                                                                                        arruser[jumlahuser+1].tpass:=pass;
                                                                                        jumlahuser:=jumlahuser+1;
                                                                                        daftar:=1;
                                                                                        menu_user;
                                                                                end;
                                                                end;
                                                end;
                                        until daftar=1;
                                        daftar:=0;
                                end;
                end;

end;

procedure awal;
var
        menu:longint;
begin
        clrscr;
        repeat
                begin
                        gotoxy(45,5);write('================================');
                        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
                        gotoxy(45,7);write('================================');
                        gotoxy(50,13);write('[1] LOGIN');
                        gotoxy(50,14);write('[0] EXIT');
                        gotoxy(50,17);write('Silakan Pilih Menu [1/0]: ');readln(menu);
                        if menu=1 then
                                begin
                                        login;
                                end
                        else if menu=0 then
                                begin
                                        exit;
                                end
                        else
                                 begin
                                        gotoxy(50,19);write('(Pilih Menu Dengan Benar)');readln;
                                        awal;
                                end;
                end;
        until (menu=1) or (menu=0);

end;

begin
clrscr;
awal;
end.
















