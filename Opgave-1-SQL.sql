-- Øvelse 1

CREATE TABLE PET_OWNER(
	OwnerID				Int				NOT NULL,
	OwnerLastName		Nvarchar		NOT NULL,
	OwnerFirstName		Nvarchar		NOT NULL,
	OwnerPhone			Int				NULL UNIQUE,
	OwnerEmail			VarChar(100)	NOT NULL UNIQUE,
	CONSTRAINT			PET_OWNER_PK	PRIMARY KEY(OwnerID)
	);
	/********* PET OWNER DATA ************************/
	INSERT INTO PET_OWNER VALUES(
	'1','Downs','Marsha','555 537 8765','Marsha.Downs@somewhere.com');
	INSERT INTO PET_OWNER VALUES(
	'2','James','Richard','555 537 7654','Richard.James@somewhere.com');
	INSERT INTO PET_OWNER VALUES(
	'3','Frier','Liz','555 537 6543','Liz.Frier@somewhere.com');
	INSERT INTO PET_OWNER VALUES(
	'4','Trent','Miles',NULL,'Miles.Trent@somewhere.com');

CREATE TABLE PET(
	PetID				Int				NOT NULL,
	PetName				Nvarchar		NOT NULL,
	PetType				Nvarchar		NOT NULL,
	PetBreed			Nvarchar		NOT NULL,
	PetDOB				Date			NULL,
	PetWeight			Int				NOT NULL,
	OwnerID				Int				NOT NULL
	CONSTRAINT			PET_PK			PRIMARY KEY(PetID)
	CONSTRAINT			PET_FK			FOREIGN KEY(OwnerID)
											REFERENCES PET_OWNER(OwnerID)
												ON UPDATE CASCADE
	);
	/*********** PET DATA ******************/
	INSERT INTO PET VALUES(
	'1','King','Dog','STD.Poodle','21.02.2011','25.5','1');
	INSERT INTO PET VALUES(
	'2','Teddy','Cat','Cashmere','01.02.2012','10.5','2');
	INSERT INTO PET VALUES(
	'3','Fido','Dog','STD.Poodle','17.07.2010','28.5','1');
	INSERT INTO PET VALUES(
	'4','AJ','Dog','Collie Mix','05.05.2011','20.0','3');
	INSERT INTO PET VALUES(
	'5','Cedro','Cat',NULL,'06.06.2009','9.5','2');
	INSERT INTO PET VALUES(
	'6','Wooley','Cat',NULL,NULL,'9.5','2');
	INSERT INTO PET VALUES(
	'7','Buster','Dog','Border Collie','11.12.2008','25.0','4');


	-- Øvelse 3

CREATE TABLE INVOICE(
	InvoiceNumber		Int				NOT NULL,
	InvoiceDate			Date			NOT NULL,
	SubTotal			Money			NOT NULL,
	TaxPct				Float			NOT NULL,
	Total				Money			NOT NULL,
	CONSTRAINT			INVOICE_PK		PRIMARY KEY(InvoiceNumber)
	);

	CREATE TABLE PRODUCT(
	ProductNumber		Int				NOT NULL,
	ProductType			Nvarchar		NOT NULL,
	ProductDescription	Nvarchar		NULL,
	UnitPrice			Money			NOT NULL,
	CONSTRAINT			PRODUCT_PK		PRIMARY KEY(ProductNumber)	
	);

CREATE TABLE LINE_ITEM(
	InvoiceNumber		Int				NOT NULL,
	LineNumber			Int				NOT NULL,
	ProductNumber		Int				NOT NULL,
	Quantity			Int				NOT NULL,
	Unitprice			Money			NOT NULL,
	Total				Money			NOT NULL,
	CONSTRAINT			LINE_ITEM_PK	PRIMARY KEY(InvoiceNumber, LineNumber),
	CONSTRAINT			INVOICE_FK		FOREIGN KEY(InvoiceNumber)
											REFERENCES INVOICE(InvoiceNumber)
												ON UPDATE CASCADE,
	CONSTRAINT			PRODUCT_FK		FOREIGN KEY(ProductNumber)
											REFERENCES PRODUCT(ProductNumber)
												ON UPDATE CASCADE
	);

-- Øvelse 4

CREATE TABLE SEMINAR(
	SeminarID			Int				NOT NULL,
	SeminarDate			Date			NOT NULL,
	Location			Char(40)		NOT NULL,
	SeminarTitle		Char(40)		NOT NULL,
	CONSTRAINT			SEMINAR_PK		PRIMARY KEY(SeminarID)
	);

	CREATE TABLE ZIP_CITY(
	Zip					Int				NOT NULL,
	City				Nvarchar		NOT NULL,
	CONSTRAINT			ZIP_CITY_PK		PRIMARY KEY(Zip)
	);

	CREATE TABLE CUSTOMER(
	CustomerID			Int				NOT NULL,
	FirstName			Nvarchar		NOT NULL,
	LastName			Nvarchar		NOT NULL,	
	Street				Nvarchar		NOT NULL,
	Zip					Int				NOT NULL,
	CONSTRAINT			CUSTOMER_PK		PRIMARY KEY(CustomerID),
	CONSTRAINT			CUSTOMER_FK		FOREIGN KEY(Zip)
											REFERENCES ZIP_CITY(Zip)
												ON UPDATE CASCADE
	);

CREATE TABLE SEMINAR_CUSTOMER(
	SeminarID			Int						NOT NULL,
	CustomerID			Int						NOT NULL,
	CONSTRAINT			SEMINAR_CUSTOMER_PK		PRIMARY KEY(SeminarID, CustomerID),
	CONSTRAINT			SEMINARID_FK			FOREIGN KEY(SeminarID)
													REFERENCES SEMINAR(SeminarID)
														ON UPDATE CASCADE,
	CONSTRAINT			CUSTOMER_FK				FOREIGN KEY(CustomerID)
													REFERENCES CUSTOMER(CustomerID)
														ON UPDATE CASCADE
	);

	/* Øvelse 5

	Data types converted from SQL to C#

	Nvarchar	=	String
	Int			=	Int
	Float		=	Double
	Money		=	Decimal

	*/