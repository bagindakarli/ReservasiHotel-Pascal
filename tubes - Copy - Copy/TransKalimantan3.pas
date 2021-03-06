Program TugasBesar_TransKalimantan;
uses crt,sysutils;
type pesanpesawat=record
        tnama:string;
        tasal:string;
        ttujuan:string;
        tpulangpergi:string;
        ttglberangkat:string;
        ttglpulang:string;
        tjumlahpenumpang:integer;
        tharga:integer;
        ttotal:integer;
end;
type pesantravel=record
        tnama:string;
        tasal:string;
        ttujuan:string;
        ttglberangkat:string;
        tjumlahpenumpang:integer;
        tharga:integer;
        ttotal:integer;
end;
type user=record
        tnama:string;
        tuser:string;
        tpass:string;
        tpesanpesawat:array[1..50] of pesanpesawat;
        tpesantravel:array[1..50] of pesantravel;
        ttotalpesan:integer;
end;
type pesawatadmin=record
        tnomor:integer;
        tnama:string;
        tharga:longint;
        tsisatiket:longint;
end;
type traveladmin=record
        tnomor:integer;
        tnama:string;
        tplat:string;
        tharga:longint;
        tsisatiket:longint;
end;
var
        arruser:array[1..50] of user;
        arrpesawat:array[1..50] of pesawatadmin;
        arrtravel:array[1..50] of traveladmin;
        jumlahuser:integer;
        i,j:integer;
        pesan:string;
        sisapesawat1,sisapesawat2,sisapesawat3,sisatravel1,sisatravel2,sisatravel3:integer;
        totpesawat,tottravel:integer;

procedure pesawat_admin;
label
        pesawatadmin;
var
        menu:integer;
        y,i,j,x,z:integer;
        nama:string;
        harga,sisa:longint;
        nomor:integer;

        edit:integer;
        nmedit:string;
        nmredit:integer;
        hedit,sedit:longint;
begin
        pesawatadmin:
        clrscr;
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(10,9);write('Selamat Datang, Admin :)');
        gotoxy(53,9);write ('+--------------+');
        gotoxy(53,10);write('| DATA PESAWAT |');
        gotoxy(53,11);write('+--------------+');
        gotoxy(53,13);write('[1] JUMLAH PESAWAT');
        gotoxy(53,14);write('[2] INPUT DATA PESAWAT');
        gotoxy(53,15);write('[3] EDIT DATA PESAWAT');
        gotoxy(53,17);write('[0] KEMBALI');
        gotoxy(53,19);write('Silakan pilih menu : ');readln(menu);
        while (menu<>1) and (menu<>2) and (menu<>3) and (menu<>0) do
                begin
                        goto pesawatadmin;
                end;
        case menu of
                1:begin
                        gotoxy(45,21);write('Jumlah Pesawat : ',totpesawat);
                        y:=2;
                        for i:=1 to totpesawat do
                                begin
                                        gotoxy(45,21+y);write('Nomor Pesawat : ',arrpesawat[i].tnomor);
                                        gotoxy(45,22+y);write('Nama Pesawat  : ',arrpesawat[i].tnama);
                                        gotoxy(45,23+y);write('Harga Tiket   : ',arrpesawat[i].tharga);
                                        gotoxy(45,24+y);write('Sisa Tiket    : ',arrpesawat[i].tsisatiket);
                                        y:=y+5;
                                end;
                        readln;
                        goto pesawatadmin;

                end;
                2:begin
                        gotoxy(45,21);write('Nomor Pesawat : ');readln(nomor);
                        z:=1;
                        while (z<=totpesawat) and (nomor<>arrpesawat[z].tnomor) do
                                begin
                                        z:=z+1;
                                end;
                        if nomor=arrpesawat[z].tnomor then
                                begin
                                        gotoxy(45,23);write('Nomor Pesawat Sudah Terdaftar, Nomor Tidak Boleh Sama');readln;
                                        goto pesawatadmin;
                                end
                        else
                                begin
                                        gotoxy(45,22);write('Nama Pesawat  : ');readln(nama);
                                        if nama='' then
                                                begin
                                                        gotoxy(45,24);write('Nama pesawat tidak boleh kosong.');readln;
                                                        goto pesawatadmin;
                                                end;
                                        gotoxy(45,23);write('Harga Tiket   : ');readln(harga);
                                        gotoxy(45,24);write('Sisa Tiket    : ');readln(sisa);
                                        arrpesawat[totpesawat+ 1].tnomor:=nomor;
                                        arrpesawat[totpesawat+1].tnama:=nama;
                                        arrpesawat[totpesawat+1].tharga:=harga;
                                        arrpesawat[totpesawat+1].tsisatiket:=sisa;
                                        totpesawat:=totpesawat+1;
                                        gotoxy(45,26);write('Data Pesawat sudah disimpan.');readln;
                                end;
                        goto pesawatadmin;
                end;
                3:begin
                        gotoxy(45,21);write('Masukkan Nomor Pesawat : ');readln(nmredit);
                        x:=1;
                        while (x<=totpesawat) and (nmredit<>arrpesawat[x].tnomor) do
                                begin
                                        x:=x+1;
                                end;
                        if nmredit=arrpesawat[x].tnomor then
                                begin
                                        gotoxy(45,22);write('[1] Nama Pesawat : ',arrpesawat[x].tnama);
                                        gotoxy(45,23);write('[2] Harga Tiket  : ',arrpesawat[x].tharga);
                                        gotoxy(45,24);write('[3] Sisa Tiket   : ',arrpesawat[x].tsisatiket);
                                        gotoxy(45,26);write('Pilih nomor yang ingin di-edit : ');readln(edit);
                                        case edit of
                                                1:begin
                                                        gotoxy(46,28);write('Nama Pesawat Baru : ');readln(nmedit);
                                                        arrpesawat[x].tnama:=nmedit;
                                                        gotoxy(46,30);write('Data baru sudah disimpan.');readln;
                                                        x:=0;
                                                end;
                                                2:begin
                                                        gotoxy(46,28);write('Harga Tiket Pesawat Baru : ');readln(hedit);
                                                        arrpesawat[x].tharga:=hedit;
                                                        gotoxy(46,30);write('Data baru sudah disimpan.');readln;
                                                        x:=0;
                                                end;
                                                3:begin
                                                        gotoxy(46,28);write('Sisa Tiket Pesawat : ');readln(sedit);
                                                        arrpesawat[x].tsisatiket:=sedit;
                                                        gotoxy(46,30);write('Data baru sudah disimpan.');readln;
                                                        x:=0;
                                                end;
                                        end;
                                end
                        else
                                begin
                                        gotoxy(45,23);write('Nomor Pesawat Tidak Ditemukan.');readln;
                                        goto pesawatadmin;
                                end;
                        goto pesawatadmin;
                end;
                0:begin
                        exit;
                end;
        end;

        readln;
        exit;
end;

procedure travel_admin;
label
        traveladmin;
var
        menu:integer;
        y,i,j,x,z:integer;
        nama,plat:string;
        harga,sisa:longint;
        nomor:integer;

        edit:integer;
        nmedit,pedit:string;
        nmredit:integer;
        hedit,sedit:longint;

begin
        traveladmin:
        clrscr;
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(10,9);write('Selamat Datang, Admin :)');
        gotoxy(53,9);write ('+-------------+');
        gotoxy(53,10);write('| DATA TRAVEL |');
        gotoxy(53,11);write('+-------------+');
        gotoxy(53,13);write('[1] JUMLAH TRAVEL');
        gotoxy(53,14);write('[2] INPUT DATA TRAVEL');
        gotoxy(53,15);write('[3] EDIT DATA TRAVEL');
        gotoxy(53,17);write('[0] KEMBALI');
        gotoxy(53,19);write('Silakan pilih menu : ');readln(menu);
        while (menu<>1) and (menu<>2) and (menu<>3) and (menu<>0) do
                begin
                        goto traveladmin;
                end;
        case menu of
                1:begin
                        gotoxy(45,21);write('Jumlah Travel : ',tottravel);
                        y:=2;
                        for i:=1 to tottravel do
                                begin
                                        gotoxy(45,21+y);write('Nomor Travel : ',arrtravel[i].tnomor);
                                        gotoxy(45,22+y);write('Nama Travel  : ',arrtravel[i].tnama);
                                        gotoxy(45,23+y);write('Plat Travel  : ',arrtravel[i].tplat);
                                        gotoxy(45,24+y);write('Harga Tiket  : ',arrtravel[i].tharga);
                                        gotoxy(45,25+y);write('Sisa Tiket   : ',arrtravel[i].tsisatiket);
                                        y:=y+7;
                                end;
                        readln;
                        goto traveladmin;

                end;
                2:begin
                        gotoxy(45,21);write('Nomor Travel : ');readln(nomor);
                        z:=1;
                        while (z<=tottravel) and (nomor<>arrtravel[z].tnomor) do
                                begin
                                        z:=z+1;
                                end;
                        if nomor=arrtravel[z].tnomor then
                                begin
                                        gotoxy(45,23);write('Nomor Travel Sudah Terdaftar, Nomor Tidak Boleh Sama.');readln;
                                        goto traveladmin;
                                end
                        else
                                begin
                                        gotoxy(45,22);write('Nama Travel  : ');readln(nama);
                                        if nama='' then
                                                begin
                                                        gotoxy(45,24);write('Nama travel tidak boleh kosong.');readln;
                                                        goto traveladmin;
                                                end;
                                        gotoxy(45,23);write('Plat Travel  : ');readln(plat);
                                        if plat='' then
                                                begin
                                                        gotoxy(45,25);write('Plat travel tidak boleh kosong.');readln;
                                                        goto traveladmin;
                                                end;
                                        gotoxy(45,24);write('Harga Tiket  : ');readln(harga);
                                        gotoxy(45,25);write('Sisa Tiket   : ');readln(sisa);
                                        arrtravel[tottravel+1].tnomor:=nomor;
                                        arrtravel[tottravel+1].tnama:=nama;
                                        arrtravel[tottravel+1].tplat:=plat;
                                        arrtravel[tottravel+1].tharga:=harga;
                                        arrtravel[tottravel+1].tsisatiket:=sisa;
                                        tottravel:=tottravel+1;
                                        gotoxy(45,27);write('Data Travel sudah disimpan.');readln;
                                end;
                        goto traveladmin;
                end;
                3:begin
                        gotoxy(45,21);write('Masukkan Nomor Travel : ');readln(nmredit);
                        x:=1;
                        while (x<=tottravel) and (nmredit<>arrtravel[x].tnomor) do
                                begin
                                        x:=x+1;
                                end;
                        if nmredit=arrtravel[x].tnomor then
                                begin
                                        gotoxy(45,22);write('[1] Nama Travel  : ',arrtravel[x].tnama);
                                        gotoxy(45,23);write('[2] Plat Travel  : ',arrtravel[x].tplat);
                                        gotoxy(45,24);write('[3] Harga Tiket  : ',arrtravel[x].tharga);
                                        gotoxy(45,25);write('[4] Sisa Tiket   : ',arrtravel[x].tsisatiket);
                                        gotoxy(45,27);write('Pilih nomor yang ingin di-edit : ');readln(edit);
                                        case edit of
                                                1:begin
                                                        gotoxy(46,29);write('Nama Travel Baru : ');readln(nmedit);
                                                        arrtravel[x].tnama:=nmedit;
                                                        gotoxy(46,31);write('Data baru sudah disimpan.');readln;
                                                        x:=0;
                                                end;
                                                2:begin
                                                        gotoxy(46,29);write('Plat Travel Baru : ');readln(pedit);
                                                        arrtravel[x].tplat:=pedit;
                                                        gotoxy(46,31);write('Data baru sudah disimpan.');readln;
                                                        x:=0;
                                                end;
                                                3:begin
                                                        gotoxy(46,29);write('Harga Tiket Travel Baru : ');readln(hedit);
                                                        arrtravel[x].tharga:=hedit;
                                                        gotoxy(46,31);write('Data baru sudah disimpan.');readln;
                                                        x:=0;
                                                end;
                                                4:begin
                                                        gotoxy(46,29);write('Sisa Tiket Travel : ');readln(sedit);
                                                        arrtravel[x].tsisatiket:=sedit;
                                                        gotoxy(46,31);write('Data baru sudah disimpan.');readln;
                                                        x:=0;
                                                end;
                                        end;
                                end
                        else
                                begin
                                        gotoxy(45,23);write('Nomor Travel Tidak Ditemukan.');readln;
                                        goto traveladmin;
                                end;
                        goto traveladmin;
                end;
                0:begin
                        exit;
                end;
        end;
        readln;
        exit;
end;

procedure pesawat_user(idx:integer;a:string);
begin
        clrscr;
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(10,9);write('Selamat Datang, ',a);
        gotoxy(53,9);write ('+---------------+');
        gotoxy(53,10);write('| TIKET PESAWAT |');
        gotoxy(53,11);write('+---------------+');
        readln;
        exit;
end;

procedure travel_user(idx:integer;a:string);
begin
        clrscr;
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(10,9);write('Selamat Datang, ',a);
        gotoxy(53,9);write ('+--------------+');
        gotoxy(53,10);write('| TIKET TRAVEL |');
        gotoxy(53,11);write('+--------------+');
        readln;
        exit;
end;

procedure riwayat_user(idx:integer;a:string);
begin
        clrscr;
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(10,9);write('Selamat Datang, ',a);
        gotoxy(55,9);write ('+---------+');
        gotoxy(55,10);write('| RIWAYAT |');
        gotoxy(55,11);write('+---------+');
        readln;
        exit;
end;

procedure login;forward;
procedure awal;forward;

procedure menu_user(user:integer);
label
        menuuser;
var
        menu:integer;
        logout:string;
begin
        menuuser:
        clrscr;
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(10,9);write('Selamat Datang, ',arruser[user].tnama,' :)');
        gotoxy(54,9);write ('+-------------+');
        gotoxy(54,10);write('|  MENU USER  |');
        gotoxy(54,11);write('+-------------+');
        gotoxy(50,13);write('[1] TIKET PESAWAT');
        gotoxy(50,14);write('[2] TIKET TRAVEL');
        gotoxy(50,15);write('[3] RIWAYAT');
        gotoxy(50,17);write('[0] LOGOUT');
        gotoxy(50,19);write('Silakan Pilih Menu : ');readln(menu);
        while (menu<>1) and (menu<>2) and (menu<>3) and (menu<>0) do
                begin
                        goto menuuser;
                end;
        case menu of
                1:begin
                        pesawat_user(user,arruser[user].tnama);
                        goto menuuser;
                end;
                2:begin
                        travel_user(user,arruser[user].tnama);
                        goto menuuser;
                end;
                3:begin
                        riwayat_user(user,arruser[user].tnama);
                        goto menuuser;
                end;
                0:begin
                        gotoxy(45,21);write('Apakah Anda Ingin Logout? (Y/N) : ');readln(logout);
                        if (logout='Y') or (logout='y') then
                                begin
                                        awal;
                                        exit;
                                end
                        else if (logout='N') or (logout='n') then
                                begin
                                        goto menuuser;
                                end
                        else
                                begin
                                        gotoxy(55,23);write('Inputan Salah.');readln;
                                        goto menuuser;
                                end;
                end;
        end;
end;

procedure menu_admin;
var
        duser:integer;
        menu:integer;
        y:integer;
        kata1,kata2,kalimat:string;
        logout:string;
begin
        clrscr;
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(10,9);write('Selamat Datang, Admin :)');
        gotoxy(55,9);write ('+------------+');
        gotoxy(55,10);write('| MENU ADMIN |');
        gotoxy(55,11);write('+------------+');
        gotoxy(50,13);write('[1] DATA USER');
        gotoxy(50,14);write('[2] DATA PESAWAT');
        gotoxy(50,15);write('[3] DATA TRAVEL');
        gotoxy(50,17);write('[0] LOGOUT');
        gotoxy(50,19);write('Silakan Pilih Menu : ');readln(menu);
        while (menu<>1) and (menu<>2) and (menu<>3) and (menu<>0) do
                begin
                        menu_admin;
                end;
        case menu of
                1:begin
                        gotoxy(45,21);write('Jumlah User : ',jumlahuser);
                        y:=2;
                        for duser:=1 to jumlahuser do
                                begin
                                        gotoxy(45,21+y);write('Nama     : ',arruser[duser].tnama);
                                        gotoxy(45,22+y);write('Username : ',arruser[duser].tuser);
                                        y:=y+3;
                                end;
                        readln;
                        menu_admin;
                end;
                2:begin
                        pesawat_admin;
                        menu_admin;
                end;
                3:begin
                        travel_admin;
                        menu_admin;
                end;
                0:begin
                        gotoxy(45,21);write('Apakah Anda Ingin Logout? (Y/N) : ');readln(logout);
                        if (logout='Y') or (logout='y') then
                                begin
                                        awal;
                                        exit;
                                end
                        else if (logout='N') or (logout='n') then
                                begin
                                        menu_admin;
                                end
                        else
                                begin
                                        gotoxy(55,23);write('Inputan Salah.');readln;
                                        menu_admin
                                end;
                end;
        end;
end;

procedure login;
var
        akun:string;
        nama,userbaru,passbaru,user,pass:string;
        i,j:integer;
begin
        clrscr;
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(45,9);write('Sudah Punya Akun? [y/n] : ');readln(akun);
        while (akun<>'y') and (akun<>'n') and (akun<>'Y') and (akun<>'N') do
                begin
                        login;
                end;
        if akun='y' then
                begin
                        gotoxy(45,11);write('Username : ');readln(user);
                        if user='' then
                                begin
                                        gotoxy(45,13);write('Username Tidak Boleh Kosong.');readln;
                                        login;
                                end
                        else if (user='admin') or (user='Admin') then
                                begin
                                        gotoxy(45,12);write('Password : ');readln(pass);
                                        if (pass='admin') or (pass='Admin') then
                                                begin
                                                        menu_admin;
                                                        exit;
                                                end
                                        else
                                                begin
                                                        gotoxy(45,14);write('Password Admin Salah.');readln;
                                                        login;
                                                end;
                                end
                        else
                                begin
                                        i:=1;
                                        while (i<=jumlahuser) and (user<>arruser[i].tuser) do
                                                begin
                                                        i:=i+1;
                                                end;
                                        if user=arruser[i].tuser then
                                                begin
                                                        gotoxy(45,12);write('Password : ');readln(pass);
                                                        if pass='' then
                                                                begin
                                                                        gotoxy(45,14);write('Password Tidak Boleh Kosong.');readln;
                                                                        login;
                                                                end
                                                        else if pass=arruser[i].tpass then
                                                                begin
                                                                        menu_user(i);
                                                                end
                                                        else
                                                                begin
                                                                        gotoxy(45,14);write('Password Salah.');readln;
                                                                        login;
                                                                end;
                                                end
                                        else
                                                begin
                                                        gotoxy(45,13);write('Username Tidak Terdaftar.');readln;
                                                        login;
                                                end;
                                end;
                end
        else if akun='n' then
                begin
                        gotoxy(45,11);write('================');
                        gotoxy(45,12);write('DAFTAR AKUN BARU');
                        gotoxy(45,13);write('================');
                        gotoxy(45,15);write('Nama     : ');readln(nama);
                        if nama='' then
                                begin
                                        gotoxy(45,17);write('Nama Tidak Boleh Kosong.');readln;
                                        login;
                                end
                        else
                                begin
                                        gotoxy(45,16);write('Username : ');readln(userbaru);
                                        if userbaru='' then
                                                begin
                                                        gotoxy(45,18);write('Username Tidak Boleh Kosong.');readln;
                                                        login;
                                                end
                                        else
                                                begin
                                                j:=1;
                                                while (j<=jumlahuser) and (userbaru<>arruser[j].tuser) do
                                                        begin
                                                                j:=j+1;
                                                        end;
                                                if userbaru=arruser[j].tuser then
                                                        begin
                                                                gotoxy(45,18);write('Username Sudah Digunakan, Gunakan Username Lain.');readln;
                                                                login;
                                                        end
                                                else
                                                        begin
                                                                gotoxy(45,17);write('Password : ');readln(passbaru);
                                                                if passbaru='' then
                                                                        begin
                                                                                gotoxy(45,19);write('Password Tidak Boleh Kosong.');readln;
                                                                                login;
                                                                        end
                                                                else
                                                                        begin
                                                                                arruser[jumlahuser+1].tnama:=nama;
                                                                                arruser[jumlahuser+1].tuser:=userbaru;
                                                                                arruser[jumlahuser+1].tpass:=passbaru;
                                                                                jumlahuser:=jumlahuser+1;
                                                                                gotoxy(45,19);write('Selamat Anda Berhasil Terdaftar, Silakan Login.');readln;
                                                                                login;
                                                                        end;
                                                        end;
                                                end;
                                end;
                end;

end;

procedure awal;
var
        menu:longint;
        keluar:char;
        ch:char;
begin
        clrscr;
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(50,13);write('[L] LOGIN');
        gotoxy(50,15);write('[ESC] EXIT');
        repeat
                ch:=readkey;
        until (ch=#108) or (ch=#027);
        write(ch);
        case ch of
                #108:login;
                #027:begin
                        gotoxy(45,20);write('Anda Yakin Ingin Keluar? (Y/N)');
                        repeat
                                keluar:=readkey;
                        until (keluar=#121) or (keluar=#110);
                        write(keluar);
                        case keluar of
                                #121:halt(1);
                                #110:awal;
                        end;
                end;
        end;
end;

begin
clrscr;
awal;
end.

