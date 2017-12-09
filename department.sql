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
