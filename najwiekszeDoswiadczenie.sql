set serveroutput on;

create or replace procedure najwiekszeDoswiadczenie(n in number)
as
type wiersz is record (liczba number, imie varchar2(50), nazwisko varchar2(50), data DATE, doswiadczenie varchar2(50), wyksztalcenie varchar2(50), dost varchar2(50));
w wiersz;
i number;
cursor kur is select * from pracownicy order by doswiadczenie desc;

begin

i:=0;
open kur;
loop
i:=i+1;
exit when i>n;
fetch kur into w;
dbms_output.put_line(to_char(i)||': '||w.imie||' '||w.nazwisko||' '||w.doswiadczenie); 
end loop;
close kur;

end;

/