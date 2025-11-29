-- wstępne create, zmieni się, aby pasowało do opisów tabel Northwind

drop database if exists pbdprojekt;
create database pbdprojekt;
use pbdprojekt;

create table Categories(
CategoryID int unsigned not null auto_increment,
CategoryName varchar(16) not null,
Description varchar(16),
primary key(CategoryID)
);

create table Products(
ProductID int unsigned not null auto_increment,
ProductName varchar(40) not null,
CategoryID int unsigned not null,
UnitPrice decimal(10,2) not null,
ProductionCost decimal(10,2) not null,
StandardProductionTimeMinutes int not null,
UnitsInStock smallint not null,
UnitsOnOrder smallint not null,
IsDiscontinued bit not null,
primary key(ProductID),
foreign key(CategoryID) references Categories(CategoryID)
);

create table Suppliers(
SupplierID int unsigned not null auto_increment,
CompanyName varchar(40) not null,
ContactName varchar(40) not null,
Phone varchar(24) not null,
primary key(SupplierID)
);

create table Components(
ComponentID int unsigned not null auto_increment,
ComponentName varchar(50) not null,
UnitsInStock int not null,
UnitPrice decimal(10,2) not null,
SupplierID int unsigned not null,
primary key(ComponentID),
foreign key(SupplierID) references Suppliers(SupplierID)
);

create table ProductDetails(
ProductID int unsigned not null,
ComponentID int unsigned not null,
QuantityRequired decimal(10,2) not null,
UnitPrice decimal(10,2) not null,
foreign key(ProductID) references Products(ProductID),
foreign key(ComponentID) references Components(ComponentID)
);

create table ProductionOrders(
ProductionOrderID int unsigned not null auto_increment,
ProductID int unsigned not null,
QuantityToProduce int not null,
StartDate datetime not null,
EndDate datetime not null,
Status varchar(20) not null,
primary key(ProductionOrderID),
foreign key(ProductID) references Products(ProductID)
);