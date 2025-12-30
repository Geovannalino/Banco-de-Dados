--Use bdEstoque
/*1)Criar uma função que retorne o dia de semana da venda (no formato segunda, terça, etc)
ao lado do código da venda, valor total da venda e sua data*/

CREATE FUNCTION fc_DiaSemana(@DATE date)
RETURNS VARCHAR(40)
AS
BEGIN
 DECLARE @diaSemana VARCHAR(10)
 
 SET @diaSemana = 
  CASE DATEPART(WEEKDAY,@DATE)
    WHEN 1 THEN 'Domingo'
    WHEN 2 THEN 'Segunda'
    WHEN 3 THEN 'Terça'
    WHEN 4 THEN 'Quarta'
    WHEN 5 THEN 'Quinta'
    WHEN 6 THEN 'Sexta'
    WHEN 7 THEN 'Sábado'
END
   RETURN @diaSemana
END
GO
SELECT 
    codVenda,dataVenda,dbo.fc_DiaSemana(dataVenda) AS 'Dia da Semana',valorTotalVenda
FROM tbVenda 

/*2)Criar uma função que receba o código do cliente e retorne o total de 
vendas que o cliente já realizou*/

CREATE FUNCTION dbo.fc_TotalVendas(@codCliente int)
RETURNS MONEY
AS
BEGIN
 DECLARE @total MONEY

SELECT @total = SUM(valorTotalVenda)FROM tbVenda 
WHERE codCliente = @codCliente

IF @total IS NULL
SET @total=0

RETURN @total
END
GO
  SELECT 
    codCliente,nomeCliente,dbo.fc_TotalVendas(codCliente) AS 'Total de vendas' 
FROM tbCliente

/*3)Criar uma função que receba o código de um vendedor e o mês e 
informe o total de vendas do vendedor no mês informado*/

CREATE FUNCTION dbo.fc_TotalVendaMes(@codCliente int,@mes int)
RETURNS MONEY
AS
BEGIN
  DECLARE @total MONEY

 SELECT @total = SUM (valorTotalVenda)FROM tbVenda
WHERE codCliente = @codCliente AND MONTH(dataVenda) = @mes

IF @total IS NULL
SET @total = 0

RETURN @total
END
GO

SELECT dbo.fc_TotalVendaMes (4,4) AS 'Total de vendas no mês 4'



