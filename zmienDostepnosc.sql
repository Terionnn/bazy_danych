create or replace procedure zmienDostepnosc(n in number)
as
type wiersz is record (liczba number, imie varchar2(50), nazwisko varchar2(50), data DATE, doswiadczenie varchar2(50), wyksztalcenie varchar2(50), dost varchar2(50));
w wiersz;
i number;
d varchar2(5);
cursor kur is select * from pracownicy where id_pracownika=n;

begin

open kur;
fetch kur into w;
d := w.dost;
if d='nie' then
update pracownicy
SET dostepnosc = 'tak' where id_pracownika = n;
else
update pracownicy
SET dostepnosc = 'nie' where id_pracownika = n;
end if;
dbms_output.put_line('Zmieniono dostepnosc pracownika o id: '||n);
close kur;

end;
