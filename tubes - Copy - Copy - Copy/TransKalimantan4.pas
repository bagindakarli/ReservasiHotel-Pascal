Program TugasBesar_TransKalimantan;
uses crt,sysutils;
type pesanpesawat=record
        tnamapesawat:string;
        tnamat:string[10];
        tasal:string;
        tasalt:string;
        ttujuan:string;
        ttujuant:string;
        ttglberangkat:string;
        tjamberangkat:string;
        tjumlahpenumpang:integer;
        tharga:longint;
        ttotal:longint;
        ttotpesanpesawat:integer;
end;
type pesantravel=record
        tnamatravel:string;
        tnamat:string[10];
        tasal:string;
        tasalt:string;
        ttujuan:string;
        ttujuant:string;
        ttglberangkat:string;
        tjamberangkat:string;
        tjumlahpenumpang:integer;
        tharga:longint;
        ttotal:longint;
        ttotpesantravel:integer;
end;
type user=record
        tnama:string;
        tnamat:string[15];
        tuser:string;
        tpass:string;
        tpesanpesawat:array[1..50] of pesanpesawat;
        tpesantravel:array[1..50] of pesantravel;
        ttotalpesan:integer;
end;
type pesawatadmin=record
        tnomor:integer;
        tnama:string;
        tnamat:string[15];
        tharga:longint;
        tsisatiket:longint;
end;
type traveladmin=record
        tnomor:integer;
        tnama:string;
        tnamat:string[15];
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
        totpesawat,tottravel:integer;
        totpesanpesawat,totpesantravel:integer;
        yy,mm,dd:word;

function hitungtiket(a:integer;b:longint):longint;
var
        tot:longint;
begin
        tot:=a*b;
        hitungtiket:=tot;
end;

procedure tampilkota(c:integer);
begin
        textcolor(c);
        gotoxy(75,14);write('[1] PKY - PALANGKARAYA');
        gotoxy(75,15);write('    (Bandara Tjilik Riwut)');
        gotoxy(75,16);write('[2] PNK - PONTIANAK');
        gotoxy(75,17);write('    (Bandara Internasional Supadio)');
        gotoxy(75,18);write('[3] TRK - TARAKAN');
        gotoxy(75,19);write('    (Bandara Internasional Juwata)');
        gotoxy(75,20);write('[4] BPN - BALIKPAPAN');
        gotoxy(75,21);write('    (Bandara Sultan Aji Muhammad Sulaiman)');
        gotoxy(75,22);write('[5] BDJ - BANJARBARU');
        gotoxy(75,23);write('    (Bandara Internasional Syamsuddin Noor)');
end;

procedure tampilpesawat(c:integer);
var
        y:integer;
begin
        textcolor(c);
        gotoxy(35,22);write('+=====+==================+=============+============+');
        gotoxy(35,23);write('| NO. |   NAMA PESAWAT   | HARGA TIKET | SISA TIKET |');
        gotoxy(35,24);write('+=====+==================+=============+============+');
        y:=1;
        for i:=1 to totpesawat do
                begin
                        gotoxy(35,24+y);write('|');
                        gotoxy(37,24+y);write(arrpesawat[i].tnomor);
                        gotoxy(41,24+y);write('|');
                        gotoxy(43,24+y);write(arrpesawat[i].tnamat);
                        gotoxy(60,24+y);write('|');
                        gotoxy(62,24+y);write('Rp',arrpesawat[i].tharga,',-');
                        gotoxy(74,24+y);write('|');
                        gotoxy(76,24+y);write(arrpesawat[i].tsisatiket);
                        gotoxy(87,24+y);write('|');
                        y:=y+1;
                end;
        gotoxy(35,24+y);write('+=====+==================+=============+============+');
end;

procedure tampiltravel(c:integer);
var
        y:integer;
begin
        textcolor(c);
        gotoxy(25,22);write('+=====+=================+============+=============+============+');
        gotoxy(25,23);write('| NO. |   NAMA TRAVEL   | PLAT NOMOR | HARGA TIKET | SISA TIKET |');
        gotoxy(25,24);write('+=====+=================+============+=============+============+');
        y:=1;
        for i:=1 to tottravel do
                begin
                        gotoxy(25,24+y);write('|');
                        gotoxy(27,24+y);write(arrtravel[i].tnomor);
                        gotoxy(31,24+y);write('|');
                        gotoxy(33,24+y);write(arrtravel[i].tnamat);
                        gotoxy(49,24+y);write('|');
                        gotoxy(51,24+y);write(arrtravel[i].tplat);
                        gotoxy(62,24+y);write('|');
                        gotoxy(64,24+y);write('Rp',arrtravel[i].tharga,',-');
                        gotoxy(76,24+y);write('|');
                        gotoxy(78,24+y);write(arrtravel[i].tsisatiket);
                        gotoxy(89,24+y);write('|');
                        y:=y+1;
                end;
        gotoxy(25,24+y);write('+=====+=================+============+=============+============+');
end;

procedure menu_admin;forward;

procedure pesawat_admin;
label
        pesawatadmin;
var
        menu:char;
        y,i,j,x,z:integer;
        nama:string;
        harga,sisa:longint;
        nomor:integer;

        edit:char;
        nmedit:string;
        nmredit:integer;
        hedit,sedit:longint;
begin
        pesawatadmin:
        clrscr;
        gotoxy(45,4);write('TransExpress by');
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
        gotoxy(53,17);write('[ESC] KEMBALI');
        gotoxy(53,19);write('Silakan pilih menu.. ');
        repeat
                menu:=readkey;
        until (menu='1') or (menu='2') or (menu='3') or (menu=#027);
        write(menu);
        case menu of
                '1':begin
                        gotoxy(35,22);write('+=====+==================+=============+============+');
                        gotoxy(35,23);write('| NO. |   NAMA PESAWAT   | HARGA TIKET | SISA TIKET |');
                        gotoxy(35,24);write('+=====+==================+=============+============+');
                        y:=1;
                        for i:=1 to totpesawat do
                                begin
                                        gotoxy(35,24+y);write('|');
                                        gotoxy(37,24+y);write(arrpesawat[i].tnomor);
                                        gotoxy(41,24+y);write('|');
                                        gotoxy(43,24+y);write(arrpesawat[i].tnamat);
                                        gotoxy(60,24+y);write('|');
                                        gotoxy(62,24+y);write('Rp',arrpesawat[i].tharga,',-');
                                        gotoxy(74,24+y);write('|');
                                        gotoxy(76,24+y);write(arrpesawat[i].tsisatiket);
                                        gotoxy(87,24+y);write('|');
                                        y:=y+1;
                                end;
                        gotoxy(35,24+y);write('+=====+==================+=============+============+');
                        readln;
                        goto pesawatadmin;
                end;
                '2':begin
                        nomor:=totpesawat+1;
                        if nomor<10 then
                                begin
                                        gotoxy(45,21);write('Nomor Pesawat : 0',nomor);
                                        gotoxy(45,22);write('Nama Pesawat  : ');readln(nama);
                                        if nama='' then
                                                begin
                                                        gotoxy(45,24);write('Nama pesawat tidak boleh kosong.');readln;
                                                        goto pesawatadmin;
                                                end;
                                        gotoxy(45,23);write('Harga Tiket   : ');readln(harga);
                                        if harga<1 then
                                                begin
                                                        gotoxy(45,25);write('Harga Tiket Salah.');readln;
                                                        goto pesawatadmin;
                                                end;
                                        gotoxy(45,24);write('Sisa Tiket    : ');readln(sisa);
                                        if sisa<0 then
                                                begin
                                                        gotoxy(45,26);write('Sisa Tiket Salah.');readln;
                                                        goto pesawatadmin;
                                                end;
                                        arrpesawat[totpesawat+1].tnomor:=nomor;
                                        arrpesawat[totpesawat+1].tnama:=nama;
                                        arrpesawat[totpesawat+1].tnamat:=nama;
                                        arrpesawat[totpesawat+1].tharga:=harga;
                                        arrpesawat[totpesawat+1].tsisatiket:=sisa;
                                        totpesawat:=totpesawat+1;
                                        gotoxy(45,26);write('Data Pesawat sudah disimpan.');readln;

                                end
                        else
                                begin
                                        gotoxy(45,21);write('Nomor Pesawat : ',nomor);
                                        gotoxy(45,22);write('Nama Pesawat  : ');readln(nama);
                                        if nama='' then
                                                begin
                                                        gotoxy(45,24);write('Nama pesawat tidak boleh kosong.');readln;
                                                        goto pesawatadmin;
                                                end;
                                        gotoxy(45,23);write('Harga Tiket   : ');readln(harga);
                                        if harga<1 then
                                                begin
                                                        gotoxy(45,25);write('Harga Tiket Salah.');readln;
                                                        goto pesawatadmin;
                                                end;
                                        gotoxy(45,24);write('Sisa Tiket    : ');readln(sisa);
                                        if sisa<0 then
                                                begin
                                                        gotoxy(45,26);write('Sisa Tiket Salah.');readln;
                                                        goto pesawatadmin;
                                                end;
                                        arrpesawat[totpesawat+ 1].tnomor:=nomor;
                                        arrpesawat[totpesawat+1].tnama:=nama;
                                        arrpesawat[totpesawat+1].tnamat:=nama;
                                        arrpesawat[totpesawat+1].tharga:=harga;
                                        arrpesawat[totpesawat+1].tsisatiket:=sisa;
                                        totpesawat:=totpesawat+1;
                                        gotoxy(45,26);write('Data Pesawat sudah disimpan.');readln;
                                end;
                        goto pesawatadmin;
                end;
                '3':begin
                        gotoxy(45,21);write('Masukkan Nomor Pesawat : ');readln(nmredit);
                        if nmredit<1 then
                                begin
                                        gotoxy(45,23);write('Nomor Pesawat Tidak Ditemukan.');readln;
                                        goto pesawatadmin;
                                end;
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
                                        gotoxy(45,26);write('Pilih nomor yang ingin di-edit [1/2/3]: ');
                                        repeat
                                                edit:=readkey;
                                        until (edit='1') or (edit='2') or (edit='3');
                                        write(edit);
                                        case edit of
                                                '1':begin
                                                        gotoxy(46,28);write('Nama Pesawat Baru : ');readln(nmedit);
                                                        if nmedit='' then
                                                                begin
                                                                        gotoxy(46,30);write('Nama Pesawat Tidak Boleh Kosong.');readln;
                                                                        goto pesawatadmin;
                                                                end;
                                                        arrpesawat[x].tnama:=nmedit;
                                                        arrpesawat[x].tnamat:=nmedit;
                                                        gotoxy(46,30);write('Data baru sudah disimpan.');readln;
                                                        x:=0;
                                                end;
                                                '2':begin
                                                        gotoxy(46,28);write('Harga Tiket Pesawat Baru : ');readln(hedit);
                                                        if hedit<1 then
                                                                begin
                                                                        gotoxy(46,30);write('Inputan Harga Tiket Salah.');readln;
                                                                        goto pesawatadmin;
                                                                end;
                                                        arrpesawat[x].tharga:=hedit;
                                                        gotoxy(46,30);write('Data baru sudah disimpan.');readln;
                                                        x:=0;
                                                end;
                                                '3':begin
                                                        gotoxy(46,28);write('Sisa Tiket Pesawat : ');readln(sedit);
                                                        if sedit<0 then
                                                                begin
                                                                        gotoxy(46,30);write('Inputan Sisa Tiket Salah.');readln;
                                                                        goto pesawatadmin;
                                                                end;
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
                #027:begin
                        menu_admin;
                end;
        end;

        readln;
        exit;
end;

procedure travel_admin;
label
        traveladmin;
var
        menu:char;
        y,i,j,x,z:integer;
        nama,plat:string;
        harga,sisa:longint;
        nomor:integer;

        edit:char;
        nmedit,pedit:string;
        nmredit:integer;
        hedit,sedit:longint;

begin
        traveladmin:
        clrscr;
        gotoxy(45,4);write('TransExpress by');
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
        gotoxy(53,17);write('[ESC] KEMBALI');
        gotoxy(53,19);write('Silakan pilih menu.. ');
        repeat
                menu:=readkey;
        until (menu='1') or (menu='2') or (menu='3') or (menu=#027);
        write(menu);
        case menu of
                '1':begin
                        gotoxy(45,21);write('Jumlah Travel : ',tottravel);
                        gotoxy(25,22);write('+=====+=================+============+=============+============+');
                        gotoxy(25,23);write('| NO. |   NAMA TRAVEL   | PLAT NOMOR | HARGA TIKET | SISA TIKET |');
                        gotoxy(25,24);write('+=====+=================+============+=============+============+');
                        y:=1;
                        for i:=1 to tottravel do
                                begin
                                        gotoxy(25,24+y);write('|');
                                        gotoxy(27,24+y);write(arrtravel[i].tnomor);
                                        gotoxy(31,24+y);write('|');
                                        gotoxy(33,24+y);write(arrtravel[i].tnamat);
                                        gotoxy(49,24+y);write('|');
                                        gotoxy(51,24+y);write(arrtravel[i].tplat);
                                        gotoxy(62,24+y);write('|');
                                        gotoxy(64,24+y);write('Rp',arrtravel[i].tharga,',-');
                                        gotoxy(76,24+y);write('|');
                                        gotoxy(78,24+y);write(arrtravel[i].tsisatiket);
                                        gotoxy(89,24+y);write('|');
                                        y:=y+1;
                                end;
                        gotoxy(25,24+y);write('+=====+=================+============+=============+============+');
                        readln;
                        goto traveladmin;

                end;
                '2':begin
                        nomor:=tottravel+1;
                        if nomor<10 then
                                begin
                                        gotoxy(45,21);write('Nomor Travel : 0',nomor);
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
                                        if harga<1 then
                                                begin
                                                        gotoxy(45,26);write('Harga Tiket Salah.');readln;
                                                        goto traveladmin;
                                                end;
                                        gotoxy(45,25);write('Sisa Tiket   : ');readln(sisa);
                                        if sisa<0 then
                                                begin
                                                        gotoxy(45,27);write('Sisa Tiket Salah.');readln;
                                                        goto traveladmin;
                                                end;
                                        arrtravel[tottravel+1].tnomor:=nomor;
                                        arrtravel[tottravel+1].tnama:=nama;
                                        arrtravel[tottravel+1].tnamat:=nama;
                                        arrtravel[tottravel+1].tplat:=plat;
                                        arrtravel[tottravel+1].tharga:=harga;
                                        arrtravel[tottravel+1].tsisatiket:=sisa;
                                        tottravel:=tottravel+1;
                                        gotoxy(45,27);write('Data Travel sudah disimpan.');readln;
                                end
                        else
                                begin
                                        gotoxy(45,21);write('Nomor Travel : ',nomor);
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
                                        if harga<1 then
                                                begin
                                                        gotoxy(45,26);write('Harga Tiket Salah.');readln;
                                                        goto traveladmin;
                                                end;
                                        gotoxy(45,25);write('Sisa Tiket   : ');readln(sisa);
                                        if sisa<0 then
                                                begin
                                                        gotoxy(45,27);write('Sisa Tiket Salah.');readln;
                                                        goto traveladmin;
                                                end;
                                        arrtravel[tottravel+1].tnomor:=nomor;
                                        arrtravel[tottravel+1].tnama:=nama;
                                        arrtravel[tottravel+1].tnamat:=nama;
                                        arrtravel[tottravel+1].tplat:=plat;
                                        arrtravel[tottravel+1].tharga:=harga;
                                        arrtravel[tottravel+1].tsisatiket:=sisa;
                                        tottravel:=tottravel+1;
                                        gotoxy(45,27);write('Data Travel sudah disimpan.');readln;
                                end;
                        goto traveladmin;
                end;
                '3':begin
                        gotoxy(45,21);write('Masukkan Nomor Travel : ');readln(nmredit);
                        if nmredit<1 then
                                begin
                                        gotoxy(45,23);write('Nomor Travel Tidak Ditemukan.');readln;
                                        goto traveladmin;
                                end;
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
                                        gotoxy(45,27);write('Pilih nomor yang ingin di-edit [1/2/3/4]: ');
                                        repeat
                                                edit:=readkey;
                                        until (edit='1') or (edit='2') or (edit='3') or (edit='4');
                                        write(edit);
                                        case edit of
                                                '1':begin
                                                        gotoxy(46,29);write('Nama Travel Baru : ');readln(nmedit);
                                                        if nmedit='' then
                                                                begin
                                                                        gotoxy(46,30);write('Nama Travel Tidak Boleh Kosong.');readln;
                                                                        goto traveladmin;
                                                                end;
                                                        arrtravel[x].tnama:=nmedit;
                                                        arrtravel[x].tnamat:=nmedit;
                                                        gotoxy(46,31);write('Data baru sudah disimpan.');readln;
                                                        x:=0;
                                                end;
                                                '2':begin
                                                        gotoxy(46,29);write('Plat Travel Baru : ');readln(pedit);
                                                        if pedit='' then
                                                                begin
                                                                        gotoxy(46,30);write('Plat Travel Tidak Boleh Kosong.');readln;
                                                                        goto traveladmin;
                                                                end;
                                                        arrtravel[x].tplat:=pedit;
                                                        gotoxy(46,31);write('Data baru sudah disimpan.');readln;
                                                        x:=0;
                                                end;
                                                '3':begin
                                                        gotoxy(46,29);write('Harga Tiket Travel Baru : ');readln(hedit);
                                                        if hedit<1 then
                                                                begin
                                                                        gotoxy(46,31);write('Inputan Harga Tiket Salah.');readln;
                                                                        goto traveladmin;
                                                                end;
                                                        arrtravel[x].tharga:=hedit;
                                                        gotoxy(46,31);write('Data baru sudah disimpan.');readln;
                                                        x:=0;
                                                end;
                                                '4':begin
                                                        gotoxy(46,29);write('Sisa Tiket Travel : ');readln(sedit);
                                                        if sedit<0 then
                                                                begin
                                                                        gotoxy(46,31);write('Inputan Sisa Tiket Salah.');readln;
                                                                        goto traveladmin;
                                                                end;
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
                #027:begin
                        menu_admin;
                end;
        end;
        readln;
        exit;
end;

procedure pesawat_user(idx:integer;a:string);
label
        pesawatuser;
var
        casal,ctujuan:char; cnomorpesawat:integer;
        asal,tujuan,namapesawat:string;
        tasalt,ttujuant:string;
        tnamat:string[10];
        tgl,jam:string;
        jumlah:integer;
        harga,total:longint;

        i,arr:integer;
begin
        pesawatuser:
        clrscr;
        gotoxy(45,4);write('TransExpress by');
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(10,9);write('Selamat Datang, ',a);
        gotoxy(53,9);write ('+---------------+');
        gotoxy(53,10);write('| TIKET PESAWAT |');
        gotoxy(53,11);write('+---------------+');
        tampilkota(7);
        gotoxy(45,13);write('Asal          : ');
        repeat
                casal:=readkey;
        until (casal='1') or (casal='2') or (casal='3') or (casal='4') or (casal='5');
        write(casal);
        case casal of
                '1':begin
                        gotoxy(61,13);write('Palangkaraya');
                        asal:='Palangkaraya';
                        tasalt:='PLK';
                end;
                '2':begin
                        gotoxy(61,13);write('Pontianak');
                        asal:='Pontianak';
                        tasalt:='PNK';
                end;
                '3':begin
                        gotoxy(61,13);write('Tarakan');
                        asal:='Tarakan';
                        tasalt:='TRK';
                end;
                '4':begin
                        gotoxy(61,13);write('Balikpapan');
                        asal:='Balikpapan';
                        tasalt:='BPN';
                end;
                '5':begin
                        gotoxy(61,13);write('Banjarbaru');
                        asal:='Banjarbaru';
                        tasalt:='BDJ';
                end;
        end;
        tampilkota(7);
        gotoxy(45,14);write('Tujuan        : ');
        repeat
                ctujuan:=readkey;
        until (ctujuan='1') or (ctujuan='2') or (ctujuan='3') or (ctujuan='4') or (ctujuan='5');
        write(ctujuan);
        case ctujuan of
                '1':begin
                        gotoxy(61,14);write('Palangkaraya');
                        tujuan:='Palangkaraya';
                        ttujuant:='PKY';
                end;
                '2':begin
                        gotoxy(61,14);write('Pontianak');
                        tujuan:='Pontianak';
                        ttujuant:='PNK';
                end;
                '3':begin
                        gotoxy(61,14);write('Tarakan');
                        tujuan:='Tarakan';
                        ttujuant:='TRK';
                end;
                '4':begin
                        gotoxy(61,14);write('Balikpapan');
                        tujuan:='Balikpapan';
                        ttujuant:='BPN';
                end;
                '5':begin
                        gotoxy(61,14);write('Banjarbaru');
                        tujuan:='Banjarbaru';
                        ttujuant:='BDJ';
                end;
        end;
        tampilkota(0);
        textcolor(7);
        decodedate(date,yy,mm,dd);
        gotoxy(45,15);write(format('Tgl Berangkat : %d/%d/%d',[dd,mm,yy]));
        tgl:=format('%d/%d/%d',[dd,mm,yy]);
        gotoxy(45,16);write('Jam Berangkat : ',timetostr(time));
        jam:=timetostr(time);
        tampilpesawat(7);
        gotoxy(45,17);write('Nomor Pesawat : ');readln(cnomorpesawat);
        if (cnomorpesawat>totpesawat) or (cnomorpesawat<1) then
                begin
                        gotoxy(45,19);write('Input Nomor Pesawat Salah.');readln;
                        goto pesawatuser;
                end;
        case cnomorpesawat of
                1:begin
                        gotoxy(64,17);write('- ',arrpesawat[1].tnama);
                        namapesawat:=(arrpesawat[1].tnama);
                        tnamat:=(arrpesawat[1].tnama);
                        arr:=1;
                end;
                2:begin
                        gotoxy(64,17);write('- ',arrpesawat[2].tnama);
                        namapesawat:=(arrpesawat[2].tnama);
                        tnamat:=(arrpesawat[2].tnama);
                        arr:=2;
                end;
                3:begin
                        gotoxy(64,17);write('- ',arrpesawat[3].tnama);
                        namapesawat:=(arrpesawat[3].tnama);
                        tnamat:=(arrpesawat[3].tnama);
                        arr:=3;
                end;
                4:begin
                        gotoxy(64,17);write('- ',arrpesawat[4].tnama);
                        namapesawat:=(arrpesawat[4].tnama);
                        tnamat:=(arrpesawat[4].tnama);
                        arr:=4;
                end;
                5:begin
                        gotoxy(64,17);write('- ',arrpesawat[5].tnama);
                        namapesawat:=(arrpesawat[5].tnama);
                        tnamat:=(arrpesawat[5].tnama);
                        arr:=5;
                end;
                6:begin
                        gotoxy(64,17);write('- ',arrpesawat[6].tnama);
                        namapesawat:=(arrpesawat[6].tnama);
                        tnamat:=(arrpesawat[6].tnama);
                        arr:=6;
                end;
                7:begin
                        gotoxy(64,17);write('- ',arrpesawat[7].tnama);
                        namapesawat:=(arrpesawat[7].tnama);
                        tnamat:=(arrpesawat[7].tnama);
                        arr:=7;
                end;
                8:begin
                        gotoxy(64,17);write('- ',arrpesawat[8].tnama);
                        namapesawat:=(arrpesawat[8].tnama);
                        tnamat:=(arrpesawat[8].tnama);
                        arr:=8;
                end;
                9:begin
                        gotoxy(64,17);write('- ',arrpesawat[9].tnama);
                        namapesawat:=(arrpesawat[9].tnama);
                        tnamat:=(arrpesawat[9].tnama);
                        arr:=9;
                end;
        end;
        tampilpesawat(7);
        gotoxy(45,18);write('Jml Penumpang : ');readln(jumlah);
        if jumlah>arrpesawat[arr].tsisatiket then
                begin
                        gotoxy(45,20);write('Jumlah Penumpang Melebihi Sisa Tiket.');readln;
                        goto pesawatuser;
                end
        else if jumlah<1 then
                begin
                        gotoxy(45,20);write('Inputan Jumlah Penumpang Salah.');readln;
                        goto pesawatuser;
                end;
        gotoxy(45,19);write('Harga         : Rp',arrpesawat[arr].tharga,',-');readln;
        harga:=arrpesawat[arr].tharga;
        total:=hitungtiket(jumlah,harga);
        gotoxy(45,20);write('Total         : Rp',total,',-');

        arruser[idx].tpesanpesawat[arruser[idx].ttotalpesan+1].tnamapesawat:=namapesawat;
        arruser[idx].tpesanpesawat[arruser[idx].ttotalpesan+1].tnamat:=tnamat;
        arruser[idx].tpesanpesawat[arruser[idx].ttotalpesan+1].tasal:=asal;
        arruser[idx].tpesanpesawat[arruser[idx].ttotalpesan+1].tasalt:=tasalt;
        arruser[idx].tpesanpesawat[arruser[idx].ttotalpesan+1].ttujuan:=tujuan;
        arruser[idx].tpesanpesawat[arruser[idx].ttotalpesan+1].ttujuant:=ttujuant;
        arruser[idx].tpesanpesawat[arruser[idx].ttotalpesan+1].ttglberangkat:=tgl;
        arruser[idx].tpesanpesawat[arruser[idx].ttotalpesan+1].tjamberangkat:=jam;
        arruser[idx].tpesanpesawat[arruser[idx].ttotalpesan+1].tjumlahpenumpang:=jumlah;
        arruser[idx].tpesanpesawat[arruser[idx].ttotalpesan+1].tharga:=harga;
        arruser[idx].tpesanpesawat[arruser[idx].ttotalpesan+1].ttotal:=total;

        arruser[idx].ttotalpesan:=arruser[idx].ttotalpesan+1;

        arrpesawat[arr].tsisatiket:=arrpesawat[arr].tsisatiket-jumlah;

        totpesanpesawat:=totpesanpesawat+1;

        tampilpesawat(0);
        textcolor(7);
        gotoxy(38,22);write('Selamat Tiket Anda Sudah Berhasil Dibeli.');
        readln;
        exit;
end;

procedure travel_user(idx:integer;a:string);
label
        traveluser;
var
        casal,ctujuan:char; cnomortravel:integer;
        asal,tujuan,namatravel:string;
        tasalt,ttujuant:string;
        tnamat:string[10];
        tgl,jam:string;
        jumlah:integer;
        harga,total:longint;

        i,arr:integer;

begin
        traveluser:
        clrscr;
        gotoxy(45,4);write('TransExpress by');
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(10,9);write('Selamat Datang, ',a);
        gotoxy(53,9);write ('+--------------+');
        gotoxy(53,10);write('| TIKET TRAVEL |');
        gotoxy(53,11);write('+--------------+');
        tampilkota(7);
        gotoxy(45,13);write('Asal          : ');
        repeat
                casal:=readkey;
        until (casal='1') or (casal='2') or (casal='3') or (casal='4') or (casal='5');
        write(casal);
        case casal of
                '1':begin
                        gotoxy(61,13);write('Palangkaraya');
                        asal:='Palangkaraya';
                        tasalt:='PKY';
                end;
                '2':begin
                        gotoxy(61,13);write('Pontianak');
                        asal:='Pontianak';
                        tasalt:='PNK';
                end;
                '3':begin
                        gotoxy(61,13);write('Tarakan');
                        asal:='Tarakan';
                        tasalt:='TRK';
                end;
                '4':begin
                        gotoxy(61,13);write('Balikpapan');
                        asal:='Balikpapan';
                        tasalt:='BPN';
                end;
                '5':begin
                        gotoxy(61,13);write('Banjarbaru');
                        asal:='Banjarbaru';
                        tasalt:='BDJ';
                end;
        end;
        tampilkota(7);
        gotoxy(45,14);write('Tujuan        : ');
        repeat
                ctujuan:=readkey;
        until (ctujuan='1') or (ctujuan='2') or (ctujuan='3') or (ctujuan='4') or (ctujuan='5');
        write(ctujuan);
        case ctujuan of
                '1':begin
                        gotoxy(61,14);write('Palangkaraya');
                        tujuan:='Palangkaraya';
                        ttujuant:='PKY';
                end;
                '2':begin
                        gotoxy(61,14);write('Pontianak');
                        tujuan:='Pontianak';
                        ttujuant:='PNK';
                end;
                '3':begin
                        gotoxy(61,14);write('Tarakan');
                        tujuan:='Tarakan';
                        ttujuant:='TRK';
                end;
                '4':begin
                        gotoxy(61,14);write('Balikpapan');
                        tujuan:='Balikpapan';
                        ttujuant:='BPN';
                end;
                '5':begin
                        gotoxy(61,14);write('Banjarbaru');
                        tujuan:='Banjarbaru';
                        ttujuant:='BDJ';
                end;
        end;
        tampilkota(0);
        textcolor(7);
        decodedate(date,yy,mm,dd);
        gotoxy(45,15);write(format('Tgl Berangkat : %d/%d/%d',[dd,mm,yy]));
        tgl:=format('%d/%d/%d',[dd,mm,yy]);
        gotoxy(45,16);write('Jam Berangkat : ',timetostr(time));
        jam:=timetostr(time);
        tampiltravel(7);
        gotoxy(45,17);write('Nomor Travel  : ');readln(cnomortravel);
        if (cnomortravel>tottravel) or (cnomortravel<1) then
                begin
                        gotoxy(45,19);write('Input Nomor Travel Salah.');readln;
                        goto traveluser;
                end;
        case cnomortravel of
                1:begin
                        gotoxy(64,17);write('- ',arrtravel[1].tnama);
                        namatravel:=(arrtravel[1].tnama);
                        tnamat:=(arrtravel[1].tnama);
                        arr:=1;
                end;
                2:begin
                        gotoxy(64,17);write('- ',arrtravel[2].tnama);
                        namatravel:=(arrtravel[2].tnama);
                        tnamat:=(arrtravel[2].tnama);
                        arr:=2;
                end;
                3:begin
                        gotoxy(64,17);write('- ',arrtravel[3].tnama);
                        namatravel:=(arrtravel[3].tnama);
                        tnamat:=(arrtravel[3].tnama);
                        arr:=3;
                end;
                4:begin
                        gotoxy(64,17);write('- ',arrtravel[4].tnama);
                        namatravel:=(arrtravel[4].tnama);
                        tnamat:=(arrtravel[4].tnama);
                        arr:=4;
                end;
                5:begin
                        gotoxy(64,17);write('- ',arrtravel[5].tnama);
                        namatravel:=(arrtravel[5].tnama);
                        tnamat:=(arrtravel[5].tnama);
                        arr:=5;
                end;
                6:begin
                        gotoxy(64,17);write('- ',arrtravel[6].tnama);
                        namatravel:=(arrtravel[6].tnama);
                        tnamat:=(arrtravel[6].tnama);
                        arr:=6;
                end;
                7:begin
                        gotoxy(64,17);write('- ',arrtravel[7].tnama);
                        namatravel:=(arrtravel[7].tnama);
                        tnamat:=(arrtravel[7].tnama);
                        arr:=7;
                end;
                8:begin
                        gotoxy(64,17);write('- ',arrtravel[8].tnama);
                        namatravel:=(arrtravel[8].tnama);
                        tnamat:=(arrtravel[8].tnama);
                        arr:=8;
                end;
                9:begin
                        gotoxy(64,17);write('- ',arrtravel[9].tnama);
                        namatravel:=(arrtravel[9].tnama);
                        tnamat:=(arrtravel[9].tnama);
                        arr:=9;
                end;
        end;
        tampiltravel(7);
        gotoxy(45,18);write('Jml Penumpang : ');readln(jumlah);
        if jumlah>arrtravel[arr].tsisatiket then
                begin
                        gotoxy(45,20);write('Jumlah Penumpang Melebihi Sisa Tiket.');readln;
                        goto traveluser;
                end
        else if jumlah<1 then
                begin
                        gotoxy(45,20);write('Inputan Jumlah Penumpang Salah.');readln;
                        goto traveluser;
                end;
        gotoxy(45,19);write('Harga         : Rp',arrtravel[arr].tharga,',-');readln;
        harga:=arrtravel[arr].tharga;
        total:=hitungtiket(jumlah,harga);
        gotoxy(45,20);write('Total         : Rp',total,',-');

        arruser[idx].tpesantravel[arruser[idx].ttotalpesan+1].tnamatravel:=namatravel;
        arruser[idx].tpesantravel[arruser[idx].ttotalpesan+1].tnamat:=tnamat;
        arruser[idx].tpesantravel[arruser[idx].ttotalpesan+1].tasal:=asal;
        arruser[idx].tpesantravel[arruser[idx].ttotalpesan+1].tasalt:=tasalt;
        arruser[idx].tpesantravel[arruser[idx].ttotalpesan+1].ttujuan:=tujuan;
        arruser[idx].tpesantravel[arruser[idx].ttotalpesan+1].ttujuant:=ttujuant;
        arruser[idx].tpesantravel[arruser[idx].ttotalpesan+1].ttglberangkat:=tgl;
        arruser[idx].tpesantravel[arruser[idx].ttotalpesan+1].tjamberangkat:=jam;
        arruser[idx].tpesantravel[arruser[idx].ttotalpesan+1].tjumlahpenumpang:=jumlah;
        arruser[idx].tpesantravel[arruser[idx].ttotalpesan+1].tharga:=harga;
        arruser[idx].tpesantravel[arruser[idx].ttotalpesan+1].ttotal:=total;

        arruser[idx].ttotalpesan:=arruser[idx].ttotalpesan+1;

        arrtravel[arr].tsisatiket:=arrtravel[arr].tsisatiket-jumlah;

        totpesantravel:=totpesantravel+1;

        tampiltravel(0);
        textcolor(7);
        gotoxy(38,22);write('Selamat Tiket Anda Sudah Berhasil Dibeli.');
        readln;
        exit;
end;

procedure riwayat_pesawat(idx:integer;c:integer);
var
        i,y:integer;
begin
        textcolor(c);
                        gotoxy(15,15);write('Total Pesan Pesawat : ',totpesanpesawat);
                        gotoxy(15,16);write('+=====+============+=====+=====+============+==========+=====+==============+==============+');
                        gotoxy(15,17);write('| NO. |    NAMA    |  A  |  T  |  TANGGAL   |   JAM    | JML |     HARGA    |     TOTAL    |');
                        gotoxy(15,18);write('+=====+============+=====+=====+============+==========+=====+==============+==============+');
                        y:=1;
                        for i:=1 to totpesanpesawat do
                                begin
                                        gotoxy(15,18+y);write('|');
                                        gotoxy(17,18+y);write(i);
                                        gotoxy(21,18+y);write('|');
                                        gotoxy(23,18+y);write(arruser[idx].tpesanpesawat[i].tnamat);
                                        gotoxy(34,18+y);write('|');
                                        gotoxy(36,18+y);write(arruser[idx].tpesanpesawat[i].tasalt);
                                        gotoxy(40,18+y);write('|');
                                        gotoxy(42,18+y);write(arruser[idx].tpesanpesawat[i].ttujuant);
                                        gotoxy(46,18+y);write('|');
                                        gotoxy(48,18+y);write(arruser[idx].tpesanpesawat[i].ttglberangkat);
                                        gotoxy(59,18+y);write('|');
                                        gotoxy(61,18+y);write(arruser[idx].tpesanpesawat[i].tjamberangkat);
                                        gotoxy(70,18+y);write('|');
                                        gotoxy(72,18+y);write(arruser[idx].tpesanpesawat[i].tjumlahpenumpang);
                                        gotoxy(76,18+y);write('|');
                                        gotoxy(78,18+y);write('Rp',arruser[idx].tpesanpesawat[i].tharga,',-');
                                        gotoxy(91,18+y);write('|');
                                        gotoxy(93,18+y);write('Rp',arruser[idx].tpesanpesawat[i].ttotal,',-');
                                        gotoxy(106,18+y);write('|');
                                        y:=y+1;
                                end;
                        gotoxy(15,18+y);write('+=====+============+=====+=====+============+==========+=====+==============+==============+');
                        readln;
end;

procedure riwayat_travel(idx:integer;c:integer);
var
        o,yy:integer;
begin
        textcolor(c);
                        gotoxy(15,15);write('Total Pesan Travel : ',totpesantravel);
                        gotoxy(15,16);write('+=====+============+=====+=====+============+==========+=====+==============+==============+');
                        gotoxy(15,17);write('| NO. |    NAMA    |  A  |  T  |  TANGGAL   |   JAM    | JML |     HARGA    |     TOTAL    |');
                        gotoxy(15,18);write('+=====+============+=====+=====+============+==========+=====+==============+==============+');
                        yy:=1;
                        for o:=1 to totpesantravel do
                                begin
                                        gotoxy(15,18+yy);write('|');
                                        gotoxy(17,18+yy);write(o);
                                        gotoxy(21,18+yy);write('|');
                                        gotoxy(23,18+yy);write(arruser[idx].tpesantravel[o].tnamat);
                                        gotoxy(34,18+yy);write('|');
                                        gotoxy(36,18+yy);write(arruser[idx].tpesantravel[o].tasalt);
                                        gotoxy(40,18+yy);write('|');
                                        gotoxy(42,18+yy);write(arruser[idx].tpesantravel[o].ttujuant);
                                        gotoxy(46,18+yy);write('|');
                                        gotoxy(48,18+yy);write(arruser[idx].tpesantravel[o].ttglberangkat);
                                        gotoxy(59,18+yy);write('|');
                                        gotoxy(61,18+yy);write(arruser[idx].tpesantravel[o].tjamberangkat);
                                        gotoxy(70,18+yy);write('|');
                                        gotoxy(72,18+yy);write(arruser[idx].tpesantravel[o].tjumlahpenumpang);
                                        gotoxy(76,18+yy);write('|');
                                        gotoxy(78,18+yy);write('Rp',arruser[idx].tpesantravel[o].tharga,',-');
                                        gotoxy(91,18+yy);write('|');
                                        gotoxy(93,18+yy);write('Rp',arruser[idx].tpesantravel[o].ttotal,',-');
                                        gotoxy(106,18+yy);write('|');
                                        yy:=yy+1;
                                end;
                        gotoxy(15,18+yy);write('+=====+============+=====+=====+============+==========+=====+==============+==============+');
                        readln;
end;

procedure riwayat_user(idx:integer;a:string);
var
        pilih:char;
begin
        clrscr;
        gotoxy(45,4);write('TransExpress by');
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(10,9);write('Selamat Datang, ',a);
        gotoxy(55,9);write ('+---------+');
        gotoxy(55,10);write('| RIWAYAT |');
        gotoxy(55,11);write('+---------+');
        gotoxy(35,13);write('  [P] PESAWAT      [T] TRAVEL      [ESC] KEMBALI');
        repeat
                pilih:=readkey;
        until (pilih=#112) or (pilih=#116) or (pilih=#027);
        write(pilih);
        case pilih of
                #112:begin
                        riwayat_pesawat(idx,7);
                end;
                #116:begin
                        riwayat_travel(idx,7);
                end;
                #027:begin
                        exit;
                end;
        end;
        exit;
end;

procedure login;forward;
procedure awal;forward;

procedure menu_user(user:integer);
label
        menuuser;
var
        menu:char;
        logout:char;
begin
        menuuser:
        clrscr;
        gotoxy(45,4);write('TransExpress by');
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
        gotoxy(50,17);write('[ESC] LOGOUT');
        gotoxy(50,19);write('Silakan Pilih Menu.. ');
        repeat
                menu:=readkey;
        until (menu='1') or (menu='2') or (menu='3') or (menu=#027);
        write(menu);
        case menu of
                '1':begin
                        pesawat_user(user,arruser[user].tnama);
                        goto menuuser;
                end;
                '2':begin
                        travel_user(user,arruser[user].tnama);
                        goto menuuser;
                end;
                '3':begin
                        riwayat_user(user,arruser[user].tnama);
                        goto menuuser;
                end;
                #027:begin
                        gotoxy(45,21);write('Apakah Anda Ingin Logout? (Y/N)');
                        repeat
                                logout:=readkey;
                        until (logout=#121) or (logout=#110);
                        write(logout);
                        case logout of
                                #121:awal;
                                #110:goto menuuser;
                        end;
                end;
        end;
end;

procedure menu_admin;
var
        duser:integer;
        menu:char;
        y:integer;
        kata1,kata2,kalimat:string;
        logout:char;
begin
        clrscr;
        gotoxy(45,4);write('TransExpress by');
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
        gotoxy(50,17);write('[ESC] LOGOUT');
        gotoxy(50,19);write('Silakan Pilih Menu.. ');
        repeat
                menu:=readkey;
        until (menu='1') or (menu='2') or (menu='3') or (menu=#027);
        write(menu);
        case menu of
                '1':begin
                        gotoxy(45,21);write('Jumlah User : ',jumlahuser);
                        gotoxy(35,22);write('+==================+================================+');
                        gotoxy(35,23);write('|       NAMA       |            USERNAME            |');
                        gotoxy(35,24);write('+==================+================================+');
                        y:=1;
                        for duser:=1 to jumlahuser do
                                begin
                                        gotoxy(35,24+y);write('|');
                                        gotoxy(38,24+y);write(arruser[duser].tnamat);
                                        gotoxy(54,24+y);write('|');
                                        gotoxy(56,24+y);write(arruser[duser].tuser);
                                        gotoxy(87,24+y);write('|');
                                        y:=y+1;
                                end;
                        gotoxy(35,24+y);write('+==================+================================+');
                        readln;
                        menu_admin;
                end;
                '2':begin
                        pesawat_admin;
                        menu_admin;
                end;
                '3':begin
                        travel_admin;
                        menu_admin;
                end;
                #027:begin
                        gotoxy(45,21);write('Apakah Anda Ingin Logout? (Y/N)');
                        repeat
                                logout:=readkey;
                        until (logout=#121) or (logout=#110);
                        write(logout);
                        case logout of
                                #121:awal;
                                #110:menu_admin;
                        end;
                end;
        end;
end;

procedure login;
var
        akun:char;
        nama,userbaru,passbaru,user:string;
        pass:string='';
        i,j:integer;
        ch:char=#0;
begin
        clrscr;
        gotoxy(45,4);write('TransExpress by');
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(45,9);write('Sudah Punya Akun? (Y/N) ');
        repeat
                akun:=readkey;
        until (akun=#121) or (akun=#110);
        write(akun);
        case akun of
                #121:
                begin
                        gotoxy(45,11);write('Username : ');readln(user);
                        if user='' then
                                begin
                                        gotoxy(45,13);write('Username Tidak Boleh Kosong.');readln;
                                        login;
                                end
                        else if (user='admin') or (user='Admin') then
                                begin
                                        gotoxy(45,12);write('Password : ');
{}while true do
        begin
                ch:=readkey;
                if (ch=#13) then
                        break
                else
                        begin
                                if(ch=#8) then
                                        begin
                                                if (length(pass)=0) then
                                                        continue;
                                                delete(pass,length(pass),1);
                                                write(ch);
                                                clreol;
                                                continue;
                                        end;
                                pass:=pass+ch;
                                write('*');
                        end;
        end;
{}
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
                                                        gotoxy(45,12);write('Password : ');
{}while true do
        begin
                ch:=readkey;
                if (ch=#13) then
                        break
                else
                        begin
                                if(ch=#8) then
                                        begin
                                                if (length(pass)=0) then
                                                        continue;
                                                delete(pass,length(pass),1);
                                                write(ch);
                                                clreol;
                                                continue;
                                        end;
                                pass:=pass+ch;
                                write('*');
                        end;
        end;
{}
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
                end;
                #110:
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
                                                                                arruser[jumlahuser+1].tnamat:=nama;
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
end;

procedure awal;
var
        menu:char;
        keluar:char;
begin
        clrscr;
        gotoxy(45,4);write('TransExpress by');
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(50,13);write('[L] LOGIN');
        gotoxy(50,15);write('[ESC] EXIT');
        repeat
                menu:=readkey;
        until (menu=#108) or (menu=#027);
        write(menu);
        case menu of
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
