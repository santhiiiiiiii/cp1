set serveroutput on
declare 
    par number := 0;
    impar number := 0;
begin
    for x in 1..485 loop
    if mod(x, 2) = 0 then
        par := par+1;
    else
        impar := impar+1;
    end if;
    end loop;
    dbms_output.put_line('A qtd de numeros pares são: '|| par);
    dbms_output.put_line('A qtd de numeros ímpares são: '|| impar);
end;
