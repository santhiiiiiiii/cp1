DECLARE
    v_percent NUMBER(5,2);
BEGIN
    FOR rec IN (SELECT codigo, categoria, valor FROM PRODUTO) LOOP
        -- Definir o percentual de reajuste baseado na categoria
        CASE rec.categoria
            WHEN 'A' THEN v_percent := 1.05;  -- 5% de aumento
            WHEN 'B' THEN v_percent := 1.10;  -- 10% de aumento
            WHEN 'C' THEN v_percent := 1.15;  -- 15% de aumento
            ELSE v_percent := 1.00;  -- Sem alteração se for outra categoria
        END CASE;
        
        -- Atualizar o valor do produto
        UPDATE PRODUTO 
        SET VALOR = rec.VALOR * v_percent
        WHERE CODIGO = rec.CODIGO;
    END LOOP;
    
    COMMIT;
END;
/

DECLARE
    v_codigo   NUMBER(4);
    v_categoria CHAR(1);
    v_valor    NUMBER(4,2);
BEGIN
    FOR i IN 1..4 LOOP
        -- Solicita os valores ao usuário
        v_codigo := '&CODIGO';
        v_categoria := '&CATEGORIA';
        v_valor := '&VALOR';

        -- Inserir os dados na tabela
        INSERT INTO PRODUTO (CODIGO, CATEGORIA, VALOR)
        VALUES (v_codigo, v_categoria, v_valor);
    END LOOP;
    
    COMMIT;
END;
/

SELECT table_name AS tabela, 
       TO_NUMBER(EXTRACTVALUE(XMLTYPE(DBMS_XMLGEN.GETXML(
       'SELECT COUNT(*) AS c FROM ' || owner || '.' || table_name)), 
       'ROWSET/ROW/C')) AS qtd_linhas
FROM all_tables
WHERE owner = 'RMXXXXX' -- SUBSTITUIR PELO SEU RM
ORDER BY qtd_linhas DESC;

DECLARE
    v_codigo_cliente NUMBER(10);
    v_numero_pedido  NUMBER(10);
BEGIN
    -- Solicitar código do cliente
    v_codigo_cliente := &CODIGO_CLIENTE;

    -- Buscar o último pedido do cliente
    SELECT MAX(numero_pedido)
    INTO v_numero_pedido
    FROM PEDIDOS
    WHERE codigo_cliente = v_codigo_cliente;

    -- Verificar se encontrou um pedido
    IF v_numero_pedido IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Último pedido do cliente: ' || v_numero_pedido);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Nenhum pedido encontrado para o cliente informado.');
    END IF;
END;
/

1
DECLARE
    v_ano NUMBER;
    v_msg VARCHAR2(50);
BEGIN
    -- Solicita o ano ao usuário
    v_ano := &Ano;

    -- Verifica se o ano é bissexto
    IF (MOD(v_ano, 400) = 0) OR (MOD(v_ano, 4) = 0 AND MOD(v_ano, 100) <> 0) THEN
        v_msg := 'O ano ' || v_ano || ' é bissexto.';
    ELSE
        v_msg := 'O ano ' || v_ano || ' não é bissexto.';
    END IF;

    -- Exibe a mensagem
    DBMS_OUTPUT.PUT_LINE(v_msg);
END;
/

2
DECLARE
    v_valor1 NUMBER;
    v_valor2 NUMBER;
    v_maior NUMBER;
    v_menor NUMBER;
    v_diferenca NUMBER;
BEGIN
    -- Recebe os valores via substituição
    v_valor1 := &Valor1;
    v_valor2 := &Valor2;

    -- Determina o maior e o menor valor
    IF v_valor1 > v_valor2 THEN
        v_maior := v_valor1;
        v_menor := v_valor2;
    ELSE
        v_maior := v_valor2;
        v_menor := v_valor1;
    END IF;

    -- Calcula a diferença
    v_diferenca := v_maior - v_menor;

    -- Exibe o resultado
    DBMS_OUTPUT.PUT_LINE('A diferença entre os valores é: ' || v_diferenca);
END;
/


3
DECLARE
    v_salario NUMBER;
    v_bonus NUMBER;
    v_salario_anual NUMBER;
BEGIN
    -- Recebe os valores via substituição
    v_salario := &Salario;
    v_bonus := &Bonus;

    -- Tratamento para valores nulos
    IF v_salario IS NULL THEN
        v_salario := 0;
    END IF;
    IF v_bonus IS NULL THEN
        v_bonus := 0;
    END IF;

    -- Calcula o salário anual com bônus
    v_salario_anual := (v_salario * 12) + v_bonus;

    -- Exibe o resultado
    DBMS_OUTPUT.PUT_LINE('O salário anual com bônus é: ' || v_salario_anual);
END;
/


