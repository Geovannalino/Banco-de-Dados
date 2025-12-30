Use bdRecursosHumanos

--a) Criar uma view para exibir a quantidade de funcionários por nome de departamento;
CREATE view vwquantidade_Funcionario AS
SELECT nomeDepartamento,COUNT (codFuncionario) AS quantidade_Funcionarios
FROM tbDepartamento
INNER JOIN tbFuncionario ON tbDepartamento.codDepartamento=tbFuncionario.codDepartamento
GROUP BY nomeDepartamento;
SELECT * FROM vwquantidade_Funcionario


--b) Usando a view anterior, exibir somente o nome do departamento que possui o menor número de funcionários
select * from vwquantidade_Funcionario
WHERE quantidade_Funcionarios=(SELECT MIN(quantidade_Funcionarios)FROM vwquantidade_Funcionario);


--C)Criar uma view para exibir a soma dos salários por nome de departamento
CREATE VIEW vwsoma_salario AS
SELECT nomeDepartamento,SUM (salarioFuncionario) AS soma_salario
FROM tbDepartamento
INNER JOIN tbFuncionario ON  tbDepartamento.codDepartamento=tbFuncionario.codDepartamento
GROUP BY nomeDepartamento;
SELECT * FROM vwsoma_salario


-- d) Utilizando a view do exercício anterior, mostrar somente a maior soma dentre os departamentos
SELECT * FROM vwsoma_salario 
WHERE soma_salario=(SELECT MAX(soma_salario)FROM vwsoma_salario);  


--E)Criar uma view para exibir somente o nome dos funcionários e o nome dos departamentos daqueles  funcionários que não possuem dependentes


--F)Criar uma view que exiba a quantidade de dependentes por nome de funcionário 
CREATE View vwquant_dependentes AS 
SELECT nomeFuncionario,COUNT (codDependente) AS quant_dependentes
FROM tbFuncionario
INNER JOIN tbDependente ON tbFuncionario.codFuncionario=tbDependente.codFuncionario
GROUP BY nomeFuncionario
SELECT * FROM vwquant_dependentes

--G)Utilizando a view anterior, mostrar somente o nome do funcionário que possui mais dependentes
SELECT * FROM vwquant_dependentes
WHERE quant_dependentes=(SELECT MAX(quant_dependentes)FROM vwquant_dependentes);

--H)Criar uma view para exibir a quantidade de dependentes por departamento
SELECT codDepartamento,COUNT (codDependente) AS quant_depen
FROM tbDepartamento
INNER JOIN tbDependente ON tbDepartamento.codDepartamento=tbDependente.codDependente
GROUP BY codDepartamento



