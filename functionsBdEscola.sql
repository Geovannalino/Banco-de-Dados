--BD ESCOLA

--1 - Crie uma função que informa uma data da matrícula, retorne o dia da semana
--USE bdEscola

CREATE FUNCTION dbo.DiaDaSemana(@dataMatricula DATE)
RETURNS VARCHAR(20)
BEGIN
    DECLARE @diaDaSemana VARCHAR(20)
    
    SET @diaDaSemana = DATENAME(WEEKDAY, @dataMatricula)
    
    RETURN @diaDaSemana
END

SELECT dbo.DiaDaSemana(dataMatricula) AS DiaDaSemana
FROM tbMatricula
WHERE codmatricula = 1;


-- 2- Crie uma função que de acordo com a carga horária do curso exiba curso rápido ou curso extenso. (rápido menos de 1000 horas)
--USE bdEscola


CREATE FUNCTION dbo.CargaHoraria(@codCurso INT)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @valorCurso MONEY;
    DECLARE @tipoCurso VARCHAR(20);

  
    SELECT @valorCurso = valorCurso
    FROM tbCurso
    WHERE codCurso = @codCurso;

    
    IF (@valorCurso < 1000.00)
    BEGIN
        SET @tipoCurso = 'Curso Rápido';
    END
    ELSE
    BEGIN
        SET @tipoCurso = 'Curso Extenso';
    END

    
    RETURN @tipoCurso;
END;
GO

SELECT 
    nomeCurso, 
    dbo.CargaHoraria(codCurso) AS 'tipoCurso'
FROM 
    tbCurso;


--3 - Crie uma função que de acordo com o valor do curso exiba curso caro ou barato (curso acima de 400)
--USE bdEscola

CREATE FUNCTION dbo.ValorCurso(@valorCurso MONEY)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @resultado VARCHAR(20)
    
   
    IF @valorCurso > 400
        SET @resultado = 'Curso Caro'
    ELSE
        SET @resultado = 'Curso Barato'
    
    
    RETURN @resultado
END

SELECT nomeCurso, valorCurso, dbo.ValorCurso(valorCurso) AS TipoDeCurso
FROM tbCurso;

-- 4- criar uma função que informada a data da matrícula converta-a no formato dd/mm/aaaa 
--USE bdEscola

CREATE FUNCTION dbo.fn_FormatarDataMatricula(@dataMatricula DATE)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @dataFormatada VARCHAR(10)
    
   
    SET @dataFormatada = CONVERT(VARCHAR(10), @dataMatricula, 103)
    
    RETURN @dataFormatada
END

SELECT codmatricula, dbo.fn_FormatarDataMatricula(dataMatricula) AS DataMatriculaFormatada
FROM tbMatricula;






