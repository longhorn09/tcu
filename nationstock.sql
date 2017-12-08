create database NationStock;
use NationStock;

CREATE TABLE nation (
    natcode VARCHAR(3) NOT NULL PRIMARY KEY,
    natname VARCHAR(20),
    exchrate FLOAT
);

insert into nation (natcode,natname,exchrate)
values('UK','United Kingdom',1.00);
insert into nation (natcode,natname,exchrate)
values('USA','United Kingdom',0.67);
insert into nation (natcode,natname,exchrate)
values('AUS','United Kingdom',0.46);
insert into nation (natcode,natname,exchrate)
values('IND','India',0.0228);
insert into nation (natcode,natname,exchrate)
values('JPN','Japan',132.09);

CREATE TABLE stock (
    stkcode VARCHAR(3),
    stkfirm VARCHAR(30),
    stkprice FLOAT,
    stkqty LONG,
    stkdiv FLOAT,
    stkpe INTEGER,
    natcode VARCHAR(3),
    FOREIGN KEY (natcode)
        REFERENCES nation (natcode)
);



insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('FC','Freedonia Copper',27.50,10529,1.84,16,'UK');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('PT','Patagonian Tea',55.25,12635,2.5,10,'UK');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('AR','Abyssinian Ruby',31.82,22010,1.32,13,'UK');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('SLG','Sri Lankan Gold',50.37,32868,2.68,16,'UK');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('ILZ','Indian Lead & Zinc',37.75,6390,3.00,12,'UK');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('BE','Burmese Elephant',.07,154713,0.01,3,'UK');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('BS','Bolivian Sheep',12.75,231678,1.78,11,'UK');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('NG','Nigerian Geese',35,12323,1.68,10,'UK');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('CS','Canadian Sugar',52.78,4716,2.5,15,'UK');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('ROF','Royal Ostrich Farms',33.75,1234923,3,6,'UK');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('MG','Minnesota Gold',53.87,816122,1,25,'USA');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('GP','Georgia Peach',2.35,387333,0.2,5,'USA');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('NE','Narembeen Emu',12.34,45619,1.0,8,'AUS');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('QD','Queensland Diamond',6.73,89251,0.5,7,'AUS');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('IR','Indooroopilly Ruby',15.92,56147,0.5,20,'AUS');
insert into stock(stkcode,stkfirm,stkprice,stkqty,stkdiv,stkpe,natcode)
values('BD','Bombay Duck',25.55,167382,1,12,'IND');
