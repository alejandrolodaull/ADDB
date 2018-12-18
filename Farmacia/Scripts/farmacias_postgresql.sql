-----------------------------------------------------
-- Table "farmacia"."Laboratorio"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "Laboratorio" (
  "idLaboratorio" INT NOT NULL,
  "Contacto" VARCHAR(45) NOT NULL,
  "Fax" INT NULL,
  "Nombre" VARCHAR(45) NULL,
  "Telefono" VARCHAR(45) NULL,
  "Ubicacion" VARCHAR(45) NULL,
  PRIMARY KEY ("idLaboratorio"));

-- -----------------------------------------------------
-- Table "farmacia"."Medicamentos"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "Medicamentos" (
  "idMedicamentos" INT NULL,
  "Nombre" VARCHAR(45) NULL,
  "Tipo" VARCHAR(45) NULL,
  "Creacion" INT NULL,
  "U_stock" INT NULL,
  "U_vendidas" INT NULL,
  "Familia" VARCHAR(45) NULL,
  "Precio" DECIMAL(12,5) NULL,
  "Tipo_venta" VARCHAR(45) NULL,
  PRIMARY KEY ("idMedicamentos"),
  CONSTRAINT "fk_lab"
    FOREIGN KEY ("Creacion")
    REFERENCES "Laboratorio" ("idLaboratorio")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



CREATE INDEX "fk_lab_idx" ON "Medicamentos"  ("Creacion" ASC);

-- -----------------------------------------------------
-- Table "farmacia"."Cliente"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "Cliente" (
  "DNI" INT NOT NULL,
  "Nombre" VARCHAR(45) NULL,
  "Fecha_Pago" INT NULL,
  PRIMARY KEY ("DNI"));

-- -----------------------------------------------------
-- Table "farmacia"."Ticket"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "Ticket" (
  "Instante_compra" timestamp NOT NULL,
  "Tipo_usuario" VARCHAR(45) NULL,
  "Precio_Compra" INT NULL,
  PRIMARY KEY ("Instante_compra"));

-- -----------------------------------------------------
-- Table "farmacia"."Registro_Compras"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "Registro_Compras" (
  "DNI" INT NOT NULL,
  "Id_cuenta" timestamp NOT NULL,
  PRIMARY KEY ("DNI", "Id_cuenta"),
  CONSTRAINT "fk_dni"
    FOREIGN KEY ("DNI")
    REFERENCES "Cliente" ("DNI")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_id_compra"
    FOREIGN KEY ("Id_cuenta")
    REFERENCES "Ticket" ("Instante_compra")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "fk_id_compra_idx" ON "Registro_Compras" ("Id_cuenta" ASC);

-- -----------------------------------------------------
-- Table "farmacia"."Entrada Ticket"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "Entrada Ticket" (
  "Unidades" INT NULL,
  "id_medicamento" INT NOT NULL,
  "id_cuenta" timestamp NOT NULL,
  "Precio" DECIMAL(12,5) NULL,
  PRIMARY KEY ("id_medicamento", "id_cuenta"),
  CONSTRAINT "fk_medica"
    FOREIGN KEY ("id_medicamento")
    REFERENCES "Medicamentos" ("idMedicamentos")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_id_cuenta"
    FOREIGN KEY ("id_cuenta")
    REFERENCES "Ticket" ("Instante_compra")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

  CREATE INDEX "fk_id_cuenta_idx" ON "Entrada Ticket" ("id_cuenta" ASC);







-- -----------------------------------------------------
-- Entradas BD
-- -----------------------------------------------------
INSERT INTO "Laboratorio" VALUES(1,'Isa',555666777,'Laboratorios Sanchez',666777555,'Calle ETSII 1.2');
INSERT INTO "Laboratorio" VALUES(2,'Jose',577889955,'Laboratorios Gonzalez',677889966,'Calle ETSII 2.2');
INSERT INTO "Laboratorio" VALUES(3,'Vicente',556677889,'Laboratorios Blanco',667788995,'Calle ETSII 2.3');

INSERT INTO "Medicamentos" VALUES(1,'Comprimido','sin_receta',2,40,356,'Analgésicos',2.5,'Paracetamol');
INSERT INTO "Medicamentos" VALUES(2,'Comprimido','sin_receta',1,30,254,'Analgésicos',2.7,'Ibuprofeno');
INSERT INTO "Medicamentos" VALUES(3,'Comprimido','con_receta',NULL,5,67,'Analgésicos',6.98,'Metamizol');

INSERT INTO "Cliente" VALUES(111111, 'Bea', 12);
INSERT INTO "Cliente" VALUES(222222, 'Ale', 2);
INSERT INTO "Cliente" VALUES(333333, 'Mireia', 28);

INSERT INTO "Ticket" VALUES('07:38, 11 December 2012', 111111, 15.4);
INSERT INTO "Ticket" VALUES('19:00, 16 February 2013', NULL, 1.95);
INSERT INTO "Ticket" VALUES('07:30, 1 December 2014', 222222, 185.4);

INSERT INTO "Entrada Ticket" VALUES(1,1,'07:38, 11 December 2012',2.5);
INSERT INTO "Entrada Ticket" VALUES(3,2,'07:38, 11 December 2012',5.4);
INSERT INTO "Entrada Ticket" VALUES(2,1,'19:00, 16 February 2013',5);
