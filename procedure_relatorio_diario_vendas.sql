
CREATE PROCEDURE RelatorioDiarioVendas(@data DATE)
AS
BEGIN
    SELECT 
        p.nome_produto,
        SUM(v.quantidade) AS total_vendido
    FROM 
        Vendas v
    JOIN 
        Produtos p ON v.id_produto = p.id_produto
    WHERE 
        CAST(v.data_venda AS DATE) = @data
    GROUP BY 
        p.nome_produto
    ORDER BY 
        total_vendido DESC;
END;

-- Para executar a procedure
-- EXEC RelatorioDiarioVendas '2024-10-23';
