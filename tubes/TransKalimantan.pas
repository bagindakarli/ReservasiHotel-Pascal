Program TugasBesar_TransKalimantan;
uses crt,sysutils;
type user=record
        email:string;
        password:string;
end;

var
        arruser:array of user;
        jumlahuser:integer;
        email,password:string;

procedure login;forward;

procedure menu_user;
begin
        clrscr;
        writeln('Jumlah User : ',jumlahuser);
        readln;
        login;
end;

procedure menu_admin;
var
        i:integer;
begin
        clrscr;
        writeln('Ini menu admin.');
        readln;
        login;
end;

procedure login;
var
        i:integer;
        search:integer;
begin
        clrscr;
        gotoxy(45,5);write('================================');
        gotoxy(45,6);write(' T R A N S  K A L I M A N T A N ');
        gotoxy(45,7);write('================================');
        gotoxy(20,10);write('Jika Belum Daftar, E-mail dan Password Akan Otomatis Terdaftar Setelah Anda Login.');
        gotoxy(50,13);write('Email    : ');readln(email);
        gotoxy(50,14);write('Password : ');readln(password);
        if (email='') or (password='') then
                begin
                        gotoxy(35,16);
                        writeln('Username atau Password Tidak Boleh Kosong.');readln;
                        login;
                end
        else
                begin
                        if ((email='Admin') and (password='Admin')) or ((email='admin') and (password='admin')) then
                                begin
                                        menu_admin;
                                end;

                        {for i:=0 to length(arruser) do
                                begin
                                        if (email<>arruser[i].email) then
                                                begin
                                                        arruser[i].email:=email;
                                                        arruser[i].password:=password;
                                                        jumlahuser:=jumlahuser+1;
                                                        menu_user;
                                                end
                                        else
                                                begin
                                                        menu_user;
                                                end;
                                end;}

                        {for i:=0 to length(arruser) do
                                begin
                                if (email=arruser[i].email) and (password=arruser[i].password) then
                                        begin
                                                menu_user;
                                        end
                                else
                                        begin
                                                arruser[i].email:=email;
                                                arruser[i].password:=password;
                                                jumlahuser:=jumlahuser+1;
                                                menu_user;
                                        end;
                                end;}
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
setlength(arruser,length(arruser)+1);
awal;
end.
















