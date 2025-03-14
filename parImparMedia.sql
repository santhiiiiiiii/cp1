set serveroutput on
declare 
    par number := 0;
    impar number := 0;
    somap number;
    somai number;
begin
    for x in 1..10 loop
    if mod(x, 2) = 0 then
        par := par+1;
        somap := somap+x;
    else
        impar := impar+1;
        somai := somai+x;
    end if;
    end loop;
    dbms_output.put_line('Media dos pares: ' || (somap / par));
    dbms_output.put_line('Media dos impares: ' || (somai / impar));
    dbms_output.put_line('A qtd de numeros pares são: '|| par);
    dbms_output.put_line('A qtd de numeros ímpares são: '|| impar);
end;
