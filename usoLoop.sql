//usando while//
set serveroutput on
declare
    v_contador number(2) := 1;
begin
    while v_contador <= 20 loop dbms_output.put_line(v_contador);
    v_contador := v_contador + 1;
    end loop;
end;

// ---------------------------------------------------------------------------//
//usando for//
set serveroutput on
declare
    v_contador number(2) := 1;
begin
    for v_contador in 1..20 loop dbms_output.put_line(v_contador);
    end loop;
end;

// ---------------------------------------------------------------------------//
//calculadora//
set serveroutput on 
begin 
    for x in 1..10 loop
        dbms_output.put_line(x * 150);
    end loop;
end;

// ---------------------------------------------------------------------------//

