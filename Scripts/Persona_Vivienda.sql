CREATE DEFINER = CURRENT_USER TRIGGER `Catastro_db`.`Persona_Vivienda_BEFORE_INSERT` BEFORE INSERT ON `Persona_Vivienda` FOR EACH ROW
BEGIN
    IF (NEW.DNI IN (SELECT DNI
    FROM Persona_Piso)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Persona viviendo en un piso';
    END IF;
END