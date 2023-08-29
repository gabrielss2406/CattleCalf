const DATABASE_NAME = "bd_cc";
/*const CREATE_TABLES_SCRIPT = """
CREATE TABLE IF NOT EXISTS annotation (
  idAnnotation INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  annotation VARCHAR(200) NOT NULL,
  date DATE NOT NULL,
  reminder VARCHAR(45) NULL
);
""";*/

const CREATE_TABLE_WEIGHING = """
CREATE TABLE IF NOT EXISTS weighing (
  idWeighing INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  weight FLOAT NOT NULL,
  date DATE NOT NULL,
  cattle_idCattle INTEGER NOT NULL,
  CONSTRAINT fk_cattle_weighing1
    FOREIGN KEY (cattle_idCattle)
    REFERENCES cattle (idCattle)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);""";

const CREATE_TABLE_IMAGE = """
CREATE TABLE IF NOT EXISTS image (
  idImage INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  image BLOB NOT NULL,
  cattle_idCattle INT NOT NULL,
  CONSTRAINT fk_image_cattle1
    FOREIGN KEY (cattle_idCattle)
    REFERENCES cattle (idCattle)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);""";

const CREATE_TABLE_ANNOTATION = """
CREATE TABLE IF NOT EXISTS annotation (
  idAnnotation INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  annotation VARCHAR(200) NOT NULL,
  date DATE NOT NULL,
  reminder VARCHAR(45) NULL,
  cattle_idCattle INTEGER NOT NULL,
  CONSTRAINT fk_annotation_cattle1
    FOREIGN KEY (cattle_idCattle)
    REFERENCES cattle (idCattle)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);""";

const CREATE_TABLE_ADDRESS = """
CREATE TABLE IF NOT EXISTS address (
  idAddress INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  state VARCHAR(2) NOT NULL,
  city VARCHAR(45) NOT NULL,
  user_cpf VARCHAR(11) NOT NULL,
  CONSTRAINT fk_address_user1
    FOREIGN KEY (user_cpf)
    REFERENCES user (cpf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);""";

const CREATE_TABLE_USER = """
CREATE TABLE IF NOT EXISTS user (
  cpf VARCHAR(11) NOT NULL PRIMARY KEY,
  name VARCHAR(45) NOT NULL,
  password VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  phone VARCHAR(45) NULL
);""";

const CREATE_TABLE_CATTLE = """
CREATE TABLE IF NOT EXISTS cattle (
  idCattle INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  breed VARCHAR(45) NOT NULL,
  birthDate DATE NULL,
  cattle_idCattle_sire INTEGER,
  cattle_idCattle_dam INTEGER,
  user_cpf VARCHAR(11) NOT NULL,
  CONSTRAINT fk_gado_gado1
    FOREIGN KEY (cattle_idCattle_sire)
    REFERENCES cattle (idCattle)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_gado_gado2
    FOREIGN KEY (cattle_idCattle_dam)
    REFERENCES cattle (idCattle)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_gado_usuario1
    FOREIGN KEY (user_cpf)
    REFERENCES user (cpf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);""";

const CREATE_TABLE_TYPE = """
CREATE TABLE IF NOT EXISTS type (
  idType INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(45) NOT NULL
);""";

const CREATE_TABLE_EXPENSE = """
CREATE TABLE IF NOT EXISTS expense (
  idExpense INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  amount FLOAT NOT NULL,
  date DATE NOT NULL,
  type_idType INTEGER NOT NULL,
  user_cpf VARCHAR(11) NOT NULL,
  CONSTRAINT fk_gasto_tipo
    FOREIGN KEY (type_idType)
    REFERENCES type (idType)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_gado_usuario1
    FOREIGN KEY (user_cpf)
    REFERENCES user (cpf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);""";

const CREATE_TABLE_EXPENSE_HAS_CATTLE = """
CREATE TABLE IF NOT EXISTS expense_has_cattle (
  expense_idExpense INTEGER NOT NULL,
  cattle_idCattle INTEGER NOT NULL,
  PRIMARY KEY (expense_idExpense, cattle_idCattle),
  CONSTRAINT fk_expense_has_cattle_expense1
    FOREIGN KEY (expense_idExpense)
    REFERENCES expense (idExpense)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_expense_has_cattle_cattle1
    FOREIGN KEY (cattle_idCattle)
    REFERENCES cattle (idCattle)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
""";

const CREATE_TYPES_REGISTERS = """
INSERT INTO type(name) VALUES('vacina'),('materiais'),('comida');
""";