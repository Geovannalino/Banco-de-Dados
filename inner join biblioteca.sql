use bdLivrariaBrasileira

--a)O total de livros que começam com a letra P
Select COUNT(*) AS total_livros
From tbl_livro
Where nomelivro like 'P%';

--b)O maior número de páginas entre todos os livros 
Select MAX(numpaginas) AS maiornum_paginas
From tbl_livro;

--c)O menor número de páginas entre todos os livros 
Select MIN(numpaginas) AS menornum_paginas
From tbl_livro;

--d)A média de páginas entre todos os livros 
Select AVG(numpaginas) AS Mediapaginas
From tbl_livro;

--e)A soma do número de páginas dos livros de editora código 01 
Select SUM(numpaginas) AS somapag_editora01
From tbl_livro
Where codeditora=01;

--f)A soma dos números de páginas dos livros que começam com a letra A 
Select sum(numpaginas) AS numpag_A
From tbl_livro
Where nomelivro like 'A%';

--g)A média dos números de páginas dos livros que sejam do autor código 03 
Select AVG(numpaginas) AS mediapag_03
From tbl_livro
Where codeditora=03;

--h)A quantidade de livros da editora de código 04
Select COUNT(*) AS quantidade_04
From tbl_livro
Where codeditora=04;

--i) A média do número de páginas dos livros que tenham a palavra “estrela” em seu nome
Select AVG(numpaginas) AS mediapag_estrela
From tbl_livro
Where nomelivro like'%estrela%';

--j) A quantidade de livros que tenham a palavra “poema” em seu nome
Select COUNT(*) AS quant_poema
From tbl_livro
Where nomelivro like'%poema%';

--k) A quantidade de livros agrupado pelo nome do gênero 
Select g.nomegenero, COUNT(l.codlivro) AS quant_livros
From tbl_livro l
INNER JOIN tbl_genero g on l.codgenero=g.codgenero
Group by g.nomegenero;

--l)A soma das páginas agrupada pelo nome do autor 
Select a.nomeautor, SUM(l.numpaginas) AS somaPag_autor
From tbl_livro l
INNER JOIN tbl_autor a on l.codautor = a.codautor
Group by a.nomeautor;

--m) A média de páginas agrupada pelo nome do autor em ordem alfabética (de A a Z)
Select a.nomeautor, AVG(l.numpaginas) AS mediapag_autorAz
From tbl_livro l
INNER JOIN tbl_autor a ON l.codautor = a.codautor
Group by a.nomeautor
order by a.nomeautor ASC;

--n) A quantidade de livros agrupada pelo nome da editora em ordem alfabética inversa (de Z a A) 
Select e.nomeeditora, COUNT(l.codlivro) AS quantlivros_editoZa
From tbl_livro l
INNER JOIN tbl_editora e ON l.codeditora = e.codeditora
Group by e.nomeeditora
order by e.nomeeditora desc;

--o) A soma de páginas dos livros agrupados pelo nome do autor que sejam de autores cujo nome comece com a letra “C” 
Select a.nomeautor, SUM(l.numpaginas) AS somapag_autorC
From tbl_livro l
INNER JOIN tbl_autor a ON l.codautor = a.codautor
Where a.nomeautor LIKE 'C%'
Group by a.nomeautor;

--p) A quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja “Machado de Assis” ou “Cora Coralina” ou “Graciliano Ramos” ou “Clarice Lispector” 
Select a.nomeautor, COUNT(l.codlivro) AS quantlivros_nomeautor
From tbl_livro l
INNER JOIN tbl_autor a ON l.codautor = a.codautor
Where a.nomeautor IN ('Machado de Assis', 'Cora Coralina', 'Graciliano Ramos', 'Clarice Lispector')
Group by a.nomeautor;

--q)A soma das páginas dos livros agrupadas pelo nome da editora cujo número de páginas esteja entre 200 e 500 (inclusive) 
Select e.nomeeditora, SUM(l.numpaginas) AS Soma_paginas_editora
From tbl_livro l
INNER JOIN tbl_editora e on l.codeditora = e.codeditora
where l.numpaginas >= 200 AND l.numpaginas <= 500
Group by e.nomeeditora;

--r) O nome dos livros ao lado do nome das editoras e do nome dos autores 
Select nomelivro, nomeautor, nomeeditora
From tbl_livro
JOIN tbl_autor on tbl_livro.codautor = tbl_autor.codautor
JOIN tbl_editora on tbl_livro.codeditora = tbl_editora.codeditora;

--s)O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for “Cia das Letras” 
Select nomelivro, nomeautor
From tbl_livro
JOIN tbl_autor on tbl_livro.codautor = tbl_autor.codautor
JOIN tbl_editora on tbl_livro.codeditora = tbl_editora.codeditora
Where tbl_editora.nomeeditora = 'Cia das Letras';

--t) O nome dos livros ao lado dos nomes dos autores, somente dos livros que não forem do autor “Érico Veríssimo”
Select nomelivro, nomeautor
From tbl_livro
JOIN tbl_autor on tbl_livro.codautor=tbl_autor.codautor
Where tbl_autor.nomeautor !='Érico Veríssimo';








