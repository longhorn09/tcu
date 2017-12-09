create database department;
use department;

CREATE TABLE QITEM (
    itemname VARCHAR(30) PRIMARY KEY,
    itemtype VARCHAR(30),
    itemcolor VARCHAR(30)
);

CREATE TABLE QSPL (
    splno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    splname VARCHAR(30),
    UNIQUE (splno)
);

create table QEMP(
  empno int not null AUTO_INCREMENT primary key,
  empfname varchar(30),
  empsalary DECIMAL(9, 2),
  deptname varchar(30) references QDEPT(empno), # remember to add FK constraint later
  bossno int references QEMP(empno)  ,
  foreign key (bossno) references QEMP(empno),
  UNIQUE (empno)
);

create table QDEPT(
  deptname varchar(30) not null primary key,
  deptfloor int,
  deptphone varchar(15),
  empno int references QEMP(empno),
  foreign key (empno) references QEMP(empno),
  UNIQUE (empno)
);

ALTER TABLE QEMP
ADD FOREIGN KEY (deptname) references QDEPT(deptname);

create table QDEL(
    delno int not null AUTO_INCREMENT primary key ,
    delqty int,
    itemname varchar(30) not null references QITEM(itemname),
    deptname varchar(30) not null references QDEPT(deptname),
    splno int not null references QSPL(splno),
    foreign key (splno) references QSPL(splno),
    foreign key (deptname)  references QDEPT(deptname),
    foreign key (itemname) references QITEM(itemname),
    UNIQUE (delno)
);

create table QSALE(
    saleno int not null AUTO_INCREMENT primary key,
    saleqty int,
    deptname varchar(30) not null references QDEPT(deptname),
    itemname varchar(30) not null references QITEM(itemname),
    FOREIGN KEY (itemname) references QITEM(itemname),
    FOREIGN KEY (deptname) references QDEPT(deptname)
);


# populate the QSPL table with values
INSERT INTO QSPL(splname)
VALUES('Nike');
INSERT INTO QSPL(splname)
VALUES('Reebok');
INSERT INTO QSPL(splname)
VALUES('Converse');
INSERT INTO QSPL(splname)
VALUES('IKEA');
INSERT INTO QSPL(splname)
VALUES('Cantoni');
INSERT INTO QSPL(splname)
VALUES('Eurway');
INSERT INTO QSPL(splname)
VALUES('Calvin Klein');
INSERT INTO QSPL(splname)
VALUES('Kate Spade');
INSERT INTO QSPL(splname)
VALUES('Gucci');
insert into QSPL(splname)
values('Banana Republic');
insert into QSPL(splname)
values('Old Navy');
insert into QSPL(splname)
values('Hasbro');
insert into QSPL(splname)
values('Mattel');

INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('Air Force Ones','sneakers','red');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('Jordan I','sneakers','white');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('Jordan XII','sneakers','black');


INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('sofa','furniture','black');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('chair','furniture','white');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('chaise','furniture','white');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('stool','furniture','black');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('bench','furniture','brown');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('desk','furniture','white');

INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('blouse','bottoms','white');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('dress','bottoms','white');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('skirt','bottoms','black');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('GI Joe','toy','white');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('Transformers','toy','white');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('Lego','toy','black');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('Barbie','toy','white');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('My Little Pony','toy','white');
INSERT INTO QITEM(itemname,itemtype,itemcolor)
VALUES('He-man','toy','white');


SET FOREIGN_KEY_CHECKS = 0; # temporarily disable foreign-key checks

insert into QDEPT(deptname,deptfloor,deptphone,empno)
values('Furniture',1,'972-111-2222',1);
insert into QDEPT(deptname,deptfloor,deptphone,empno)
values('Toys',2,'972-333-4444',2);
insert into QDEPT(deptname,deptfloor,deptphone,empno)
values('Womens',3,'972-333-4444',3);
insert into QDEPT(deptname,deptfloor,deptphone,empno)
values('Shoes',4,'972-333-4444',4);

SET FOREIGN_KEY_CHECKS = 1; # re-enable foreign key checks

# bosses
insert into QEMP(empfname, empsalary,deptname,bossno)
values('John',85000,'Furniture',1);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Raphael',84500,'Toys',2);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Hilary',86500,'Womens',3);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Michael',87000,'Shoes',4);


# regular employees of furniture dept
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Jacob',55000,'Furniture',1);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Sal',56000,'Furniture',1);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Neil',61000,'Furniture',1);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Larry',45000,'Furniture',5);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Tom',31000,'Furniture',5);

#   employees of shoes dept
insert into QEMP(empfname, empsalary,deptname,bossno)
values('David',55000,'Shoes',4);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Darren',56000,'Shoes',4);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Doyle',61000,'Shoes',4);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Danny',45000,'Shoes',4);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Donnie',31000,'Shoes',4);


#   employees of womens dept
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Mary',55000,'Womens',3);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Meredith',56000,'Womens',3);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Molly',61000,'Womens',3);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Monique',45000,'Womens',3);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Marissa',31000,'Womens',3);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Mystique',31000,'Womens',3);


#  employees of shoes dept
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Chris',55000,'Toys',2);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Crystal',45000,'Toys',2);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Connor',65000,'Toys',2);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Coloumb',58000,'Toys',2);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Chantelle',58000,'Toys',2);
insert into QEMP(empfname, empsalary,deptname,bossno)
values('Corey',29000,'Toys',2);


# loading QSALE table values
insert into QSALE(saleqty,deptname,itemname)
values(3,'Toys','GI Joe');
insert into QSALE(saleqty,deptname,itemname)
values(10,'Toys','He-man');
insert into QSALE(saleqty,deptname,itemname)
values(12,'Shoes','Jordan I');
insert into QSALE(saleqty,deptname,itemname)
values(40,'Shoes','Jordan XII');
insert into QSALE(saleqty,deptname,itemname)
values(1,'Furniture','desk');
insert into QSALE(saleqty,deptname,itemname)
values(13,'Furniture','stool');
insert into QSALE(saleqty,deptname,itemname)
values(31,'Furniture','chair');
insert into QSALE(saleqty,deptname,itemname)
values(36,'Furniture','chaise');
insert into QSALE(saleqty,deptname,itemname)
values(59,'Womens','dress');
insert into QSALE(saleqty,deptname,itemname)
values(61,'Womens','blouse');
insert into QSALE(saleqty,deptname,itemname)
values(65,'Womens','skirt');
insert into QSALE(saleqty,deptname,itemname)
values(45,'Womens','skirt');
insert into QSALE(saleqty,deptname,itemname)
values(49,'Womens','skirt');
insert into QSALE(saleqty,deptname,itemname)
values(28,'Shoes','Jordan XII');
insert into QSALE(saleqty,deptname,itemname)
values(6,'Shoes','Jordan XII');
insert into QSALE(saleqty,deptname,itemname)
values(9,'Shoes','Jordan XII');


# loading QDEL table VALUES
insert into QDEL(delqty,itemname,deptname,splno)
values(2,'skirt','Womens',9);
insert into QDEL(delqty,itemname,deptname,splno)
values(2,'blouse','Womens',9)  ;
insert into QDEL(delqty,itemname,deptname,splno)
values(2,'dress','Womens',11)  ;
insert into QDEL(delqty,itemname,deptname,splno)
values(21,'blouse','Womens',10)  ;
insert into QDEL(delqty,itemname,deptname,splno)
values(22,'blouse','Womens',11);
insert into QDEL(delqty,itemname,deptname,splno)
values(22,'bench','Furniture',6);
insert into QDEL(delqty,itemname,deptname,splno)
values(22,'desk','Furniture',4);
insert into QDEL(delqty,itemname,deptname,splno)
values(2,'chaise','Furniture',4);
insert into QDEL(delqty,itemname,deptname,splno)
values(23,'chair','Furniture',6);
insert into QDEL(delqty,itemname,deptname,splno)
values(25,'bench','Furniture',5);
insert into QDEL(delqty,itemname,deptname,splno)
values(82,'desk','Furniture',6);

insert into QDEL(delqty,itemname,deptname,splno)
values(32,'Transformers','Toys',12);
insert into QDEL(delqty,itemname,deptname,splno)
values(32,'Lego','Toys',13);

insert into QDEL(delqty,itemname,deptname,splno)
values(62,'My Little Pony','Toys',13);
insert into QDEL(delqty,itemname,deptname,splno)
values(63,'He-man','Toys',13);
