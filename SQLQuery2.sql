create table CLIENTE(
CODCLI char(4) primary key,
NOMCLI varchar(60),
APECLI varchar(80),
EMACLI varchar(80),
CELCLI char(9),
DIRCLI varchar(70),
ESTCLI char(1)
)

select * from CLIENTE

create table VENDEDOR(
CODVEND char(4)primary key,
NOMVEND varchar(80),
APEVEND varchar(80),
EMAVEND varchar(80),
CELVEND char(4),
DIRVEND varchar(80),
ESTVEND char (1)
)
select * from VENDEDOR

create table PRODUCTO(
CODPRO varchar(5)primary key,
DESPRO varchar(80),
CATPRO char(1), 
PREPOR  decimal (8,2),
STOCKPRO int ,
ESTPRO  char(1)
)

select * from PRODUCTO

create table PROVEEDOR(
CODPROV char(5)primary key,
RAZSOCPROV varchar(90),
RUCPROV  varchar(11),
EMAPROV  varchar(70),
ESTPROV  char(1)
)

select * from PROVEEDOR


create table VENTA(
CODVEN  char(5)primary key,
FECVEN  datetime,
ESTVEN  char(1)
)

select * from VENTA

create table VENTADETALLE(
IDVENDET int primary key,
CANTPRO  int
)

select * from VENTADETALLE


create table COMPRA(
CODCOM  char(5) primary key,
FECCOM  datetime,
ESTCOM  char(1)
)

select * from VENTADETALLE

create table COMPRADETALLE(
CODCOM  int primary key,
ESTCOM  int
)

select * from COMPRADETALLE


ALTER TABLE [dbo].[SUBSERVICIO] ADD CONSTRAINT [SUBSERVICIO_pk] PRIMARY KEY CLUSTERED ([IDSUBSER]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SUBPRODUCTO] ADD CONSTRAINT [SUBPRODUCTO_pk] PRIMARY KEY CLUSTERED ([CODSUBPRO]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SUBPRODUCTO] ADD CONSTRAINT [SUBPRODUCTO_PRODUCTO] FOREIGN KEY ([IDFAM]) REFERENCES [dbo].[FAMILIA] ([IDFAM])
GO

create procedure Insertcliente


@CODCLI  char(4),
@NOMCLI  varchar(60),
@APECLI  varchar(80),
@EMACLI  varchar(80),
@CELCLI  char(9),
@DIRCLI  varchar(70),
@ESTCLI  char(1),

Insert into CLIENTE (CODCLI,NOMCLI,APECLI,EMACLI,CELCLI,DIRCLI,ESTCLI)
values
('CL01','Juana','Campos Ortiz', 'juana.campos@gmail.com','987485152','Av.Miraflores','A'),
('CL02','Sofia','Barrios Salcedo', 'sofia.barrios@outlook.com','','Jr.Huallaga','A'),
('CL03','Claudio','Perez Luna', 'claudia.perez@outlook.com','987485152','Av.Libertadores','A'),
('CL04','Marcos','Avila Manco', 'marco.avila@yahoo.com','','Calle Huallaga','A'),
('CL05','Anastasio','Salomon Inti', 'anastasio.salomon@gmail.com','','Jr.San Martin','A');


Insert into VENDEDOR(CODVEND,NOMVEND,APEVEND,EMAVEND,CELVEND,DIRVEND,ESTVEND)
values
('VEN1','Gloria','Carrizales Paredes', 'gloria.carrizales@gmail.com','984574123','Calle Las Begonias','A'),
('VEN2','Gabriel','Lozada Lombardi', 'gabriel.lozada@gmail.com','974512368','Av.Los Girasoles','A'),
('VEN3','Gilberto','Martinez Guerra', 'gilberto.martinez@gmail.com','','Jr.Palomares','A');


Insert into PROVEEDOR(CODPROV,RAZSOCPROV,RUCPROV,EMAPROV,ESTPROV)
values
('PRV01','LG Corportation','87542136951', 'informes@lg.com.pe','A'),
('PRV02','SONY','45213698741', 'informes@sony.com.pe','A'),
('PRV03','SAMSUMG','85321697661', 'informes@samsumg.com.pe','A'),
('PRV04','OSTER SRL','55663214478', 'informes@oster.com.pe','A'),
('PRV05','ASUS','99663325478', 'informes@asus.com.pe','A');



Insert into PRODUCTO(CODPRO,DESPRO,CATPRO,PREPOR,STOCKPRO,ESTPRO)
values
('PRO01','Refrigeradora LG Side By Side','1', '4149','15','A'),
('PRO02','Refrigerado SBS 602L','1', '3599','10','A'),
('PRO03','Refrigeradora Top Mount 500 L','1', '2799','8','A'),
('PRO04','TV SAMSUMG UHD 55','2', '1799','25','A'),
('PRO05','Televisor 65 LG UHD 55','2', '2999','20','A'),
('PRO06','TV CRYSTAL UHD 55','2', '2299','7','A'),
('PRO07','ASUS X415JA Core i3 10a Gen 14','3', '1099','17','A'),
('PRO08','Lenovo IdeaPad 5i Intel Core i3','3', '3099','10','A'),
('PRO09','Laptop HP 15/dw1085la intel core i3','3', '1600','15','A'),
('PRO010','Galaxy A52 128GB','4', '1200','25','A'),
('PRO011','iPhone 11 64GB Morado','4', '2600','30','A'),
('PRO012','Poco x3 GT 5G 256GB 8GB','4', '1450','20','A'),




select 
from 
COMPRA as C inner join
COMPRADETALLE as CD on  CD.CODCOM = C.CODCOM inner join
PROVEEDOR as PROV on 






























ALTER PROCEDURE [dbo].[spInsertCliente]	(		@CODCLI char(6),		@DNICLI char(8),		@NOMCLI nvarchar(60),		@APECLI nvarchar(60),		@CELCLI char(9),		@EMACLI nvarchar(60),		@FECNACCLI date,		@UBICLI char(6)	)ASBEGIN	SET NOCOUNT ON	BEGIN TRAN /* TRANSACCIONES */	BEGIN TRY		IF (SELECT COUNT(*) FROM CLIENTE WHERE CLIENTE.DNICLI = @DNICLI) = 1			ROLLBACK TRAN;		ELSE 			INSERT INTO CLIENTE			(CODCLI, DNICLI, NOMCLI, APECLI, CELCLI, EMACLI, FECNACCLI, UBICLI)			VALUES			(@CODCLI, @DNICLI, UPPER(@NOMCLI), UPPER(@APECLI), @CELCLI, 			LOWER(@EMACLI), @FECNACCLI, @UBICLI)			COMMIT TRAN	END TRY	BEGIN CATCH		SELECT 'Este cliente ya ha sido registrado' AS ERROR		IF @@TRANCOUNT > 0 ROLLBACK TRAN;	END CATCHEND
















































