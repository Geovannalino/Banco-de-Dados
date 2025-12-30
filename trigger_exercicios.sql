CREATE TRIGGER trg_Multa
ON tbMulta
AFTER INSERT
AS
BEGIN
    UPDATE tbMotorista
    SET tbMotorista.pontuacaoMotorista =tbMotorista.pontuacaoMotorista+inserted.pontos
    FROM tbMotorista 
    INNER JOIN tbVeiculo  ON tbVeiculo.codMotorista = tbMotorista.codMotorista
    INNER JOIN inserted ON inserted.codVeiculo = tbVeiculo.codVeiculo
END;


CREATE TRIGGER trg_atualizarPontuacao
On tbMulta
After Insert 
As 
Begin
 UPDATE tbMotorista
 Set pontuacaoMotorista = pontuacaoMotorista+inserted.pontos
 FROM tbMotorista
 INNER JOIN tbVeiculo On tbVeiculo.codMotorista= tbMotorista.codMotorista
 INNER JOIN inserted On inserted.codVeiculo = tbVeiculo.codVeiculo;

  UPDATE tbMotorista
  SET statusMotorista = CASE
  WHEN pontuacaoMotorista>=21 THEN 'Suspenso'
  ELSE 'Habilitado'
    END
  WHERE codMotorista IN(
  SELECT DISTINCT tbMotorista.codMotorista
  FROM tbMotorista
  INNER JOIN tbVeiculo ON tbVeiculo.codMotorista = tbMotorista.codMotorista
  INNER JOIN inserted ON inserted.codVeiculo = tbVeiculo.codVeiculo
);
END;


