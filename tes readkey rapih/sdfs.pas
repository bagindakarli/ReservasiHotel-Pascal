Program Tes;
uses crt;
var
        a:char;

procedure ihiy;
begin
        gotoxy(50,12);write('Y');
        gotoxy(60,12);write('N');
        repeat
                a:=readkey;
        until (a=#121) or (a=#110);
        case a of
                #121:begin
                        clrscr;
                        gotoxy(70,19);write('YA MANTAP');
                        read;
                        ihiy;

                end;
                #110:begin
                        clrscr;
                        gotoxy(70,20);write('TIDAK MANTAP');
                        read;
                        ihiy;
                end;
        end;
end;

begin
clrscr;
ihiy;
end.
