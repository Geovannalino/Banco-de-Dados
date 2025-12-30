USE bdEscolaIdiomas;

--a) Criar uma consulta que retorne o nome e o preço dos cursos que custem abaixo do valor médio
SELECT nomeCurso,valorCurso FROM tbCurso
WHERE  valorCurso<( select AVG(valorCurso) FROM tbCurso);

--b)Criar uma consulta que retorne o nome e o rg do aluno mais novo
SELECT nomealuno,rgaluno FROM tbAlunos 
WHERE dataNascimento=(Select Max(dataNascimento) FROM tbAlunos);

--c)Criar uma consulta que retorne o nome do aluno mais velho
SELECT nomealuno FROM tbAlunos 
WHERE dataNascimento=(Select Min(dataNascimento) FROM tbAlunos);

--d)Criar uma consulta que retorne o nome e o valor do curso mais caro
SELECT nomeCurso,valorcurso FROM tbCurso
WHERE valorCurso=(Select Max(valorCurso) FROM tbCurso);

--e)Criar uma consulta que retorne o nome do aluno e o nome do curso, do aluno que fez a última matrícula
SELECT tbAlunos.nomeAluno,tbCurso.nomeCurso from tbMatricula
iNNER JOIN tbAlunos ON tbMatricula.codAluno = tbAlunos.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
WHERE dataMatricula=(SELECT Max(dataMatricula) FROM tbMatricula);

--f)Criar uma consulta que retorne o nome do primeiro aluno a ser matriculado na escola de Idiomas
SELECT tbAlunos.nomeAluno FROM tbMatricula
inner join tbAlunos on tbMatricula.codMatricula=tbAlunos.codAluno
WHERE dataMatricula=(SELECT Min (dataMatricula) from tbMatricula);

--g)Criar uma consulta que retorne o nome, rg e data de nascimento de todos os alunos que estejam matriculados no curso de inglês
SELECT nomeAluno,rgAluno,dataNascimento FROM tbAlunos
INNER JOIN tbMatricula ON tbAlunos.codAluno= tbMatricula.codAluno
INNER JOIN tbTurma ON tbMatricula.codTurma= tbTurma.codTurma
INNER JOIN tbCurso ON tbTurma.codCurso=tbCurso.codCurso
WHERE nomeCurso='Inglês';