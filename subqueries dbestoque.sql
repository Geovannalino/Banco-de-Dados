USE bdEstoque

--a)Criar uma consulta que retorne o código do produto, o nome do produto e o nome do fabricante somente daqueles produtos que custam igual ao valor mais alto;
SELECT tbProduto.codProduto, tbProduto.descricaoProduto,TbFabricante.nomeFabricante
from tbProduto
inner join tbFabricante ON TbFabricante.nomeFabricante=TbFabricante.nomeFabricante
WHERE valorProduto=(Select Max(valorProduto) FROM tbProduto);

--b)Criar uma consulta que retorne o nome do produto e o nome do fabricante e o valor somente dos produtos que custem acima do valor médio dos produtos em estoque
SELECT tbProduto.descricaoProduto,tbProduto.valorProduto ,TbFabricante.nomeFabricante
from tbProduto
inner join tbFabricante ON TbFabricante.nomeFabricante=TbFabricante.nomeFabricante
WHERE valorProduto>(select AVG(valorProduto) FROM tbProduto);

--c)Criar uma consulta que retorne o nome dos clientes que tiveram vendas com valor acima do valor médio das vendas
SELECT nomeCliente FROM tbCliente
inner join  tbVenda on tbCliente.codCliente=tbVenda.codCliente 
where valorTotalVenda>=(SELECT AVG(valorTotalVenda) FROM tbVenda)

--d)Criar uma consulta que retorno o nome e o preço dos produtos mais caros
SELECT descricaoProduto,valorProduto FROM tbProduto
WHERE valorProduto=(Select Max(valorProduto) FROM tbProduto);

--e)Criar uma consulta que retorne o nome e o preço do produto mais barato
SELECT descricaoProduto,valorProduto  FROM tbProduto
WHERE valorProduto=(Select Min(valorProduto) FROM tbProduto);