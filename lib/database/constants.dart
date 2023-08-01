const DATABASE_NAME = "bd_cc";
/*const CREATE_TABLES_SCRIPT = """
CREATE TABLE IF NOT EXISTS annotation (
  idAnnotation INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  annotation VARCHAR(200) NOT NULL,
  date DATE NOT NULL,
  reminder VARCHAR(45) NULL
);
""";*/

const CREATE_TABLE_WEIGHT = """
CREATE TABLE IF NOT EXISTS weight (
  idWeight INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  weight DECIMAL(4,2) NOT NULL,
  date DATE NOT NULL
);""";

const CREATE_TABLE_IMAGE = """
CREATE TABLE IF NOT EXISTS image (
  idImage INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  image BLOB NOT NULL
);""";

const CREATE_TABLE_ANNOTATION = """
CREATE TABLE IF NOT EXISTS annotation (
  idAnnotation INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  annotation VARCHAR(200) NOT NULL,
  date DATE NOT NULL,
  reminder VARCHAR(45) NULL
);""";

const CREATE_TABLE_ADDRES = """
CREATE TABLE IF NOT EXISTS address (
  idAddress INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  state VARCHAR(2) NOT NULL,
  city VARCHAR(45) NOT NULL
);""";

const CREATE_TABLE_USER = """
CREATE TABLE IF NOT EXISTS user (
  cpf VARCHAR(11) NOT NULL PRIMARY KEY,
  name VARCHAR(45) NOT NULL,
  password VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  phone VARCHAR(45) NULL,
  address_idAddress INTEGER NOT NULL,
  CONSTRAINT fk_usuario_endereco1
    FOREIGN KEY (address_idAddress)
    REFERENCES address (idAddress)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);""";

const CREATE_TABLE_CATTLE = """
CREATE TABLE IF NOT EXISTS cattle (
  idCattle INTEGER NOT NULL PRIMARY KEY,
  breed VARCHAR(45) NOT NULL,
  birthDate DATE NOT NULL,
  cattle_idCattle_sire INTEGER NOT NULL,
  cattle_idCattle_dam INTEGER NOT NULL,
  weight_idWeight INTEGER NOT NULL,
  image_idImage INTEGER NOT NULL,
  annotation_idAnnotation INTEGER NOT NULL,
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
  CONSTRAINT fk_gado_pesagem1
    FOREIGN KEY (weight_idWeight)
    REFERENCES weight (idWeight)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_gado_foto1
    FOREIGN KEY (image_idImage)
    REFERENCES image (idImage)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_gado_anotacao1
    FOREIGN KEY (annotation_idAnnotation)
    REFERENCES annotation (idAnnotation)
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
  type DECIMAL(4,2) NOT NULL
);""";

const CREATE_TABLE_EXPENSE = """
CREATE TABLE IF NOT EXISTS expense (
  idExpense INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  amount DECIMAL(5,2) NOT NULL,
  date DATE NOT NULL,
  type_idType INTEGER NOT NULL,
  CONSTRAINT fk_gasto_tipo
    FOREIGN KEY (type_idType)
    REFERENCES type (idType)
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