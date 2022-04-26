create or replace procedure zmienStan(n in number)
as
type wiersz is record (id number, id_u number, usluga varchar2(50), czas number, pracownik number, wyksztalcenie varchar2(50), stan varchar2(50));
w wiersz;
d varchar2(20);
cursor kur is select * from zlecenia where id_zlecenia=n;

begin

open kur;
fetch kur into w;
d := w.stan;
if d='w trakcie' then
update zlecenia
SET stan = 'zakonczono' where id_zlecenia= n;
else
update zlecenia
SET stan = 'w trakcie' where id_zlecenia = n;
end if;
dbms_output.put_line('Zmieniono stan zlecenia o identyfikatorze: '||n);
close kur;

end;
/