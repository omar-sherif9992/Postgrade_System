create database GUC_POSTGRADE_SYSTEM



go
USE GUC_POSTGRADE_SYSTEM
GO
create table PostGradUser (
id int primary key identity,
email varchar(50), 
password varchar(20)
)

go

create table Admin (
id int,
primary key(id),
foreign key(id) references PostGradUser on delete cascade on update cascade
)

go

create table GucianStudent (
id int primary key,
firstName varchar(20) not null,
lastName varchar(20) not null,
type varchar(10) default null,
faculty varchar(50) not null,
address varchar(50) not null,
GPA decimal(3,2), 
undergradID varchar(10) default null, 
foreign key(id) references PostGradUser on delete cascade on update cascade
)

go

create table NonGucianStudent (
id int primary key,
firstName varchar(20) not null,
lastName varchar(20) not null,
type varchar(10) default null,
faculty varchar(50) not null,
address varchar(50) not null,
GPA decimal(3,2) default null, 
foreign key(id) references PostGradUser on delete cascade on update cascade
)

go 

create table GUCStudentPhoneNumber (
id int,
phone varchar(20),
primary key(id,phone),
foreign key(id) references GucianStudent on delete cascade on update cascade
)

go

create table NonGUCStudentPhoneNumber (
id int,
phone varchar(20),
primary key(id,phone),
foreign key(id) references NonGucianStudent on delete cascade on update cascade
)

go

create table Course (
id int primary key identity,
fees decimal not null,
creditHours int not null,
code varchar(10) not null)

go

create table Supervisor (
id int primary key,
name varchar(41) not null, --firstName and lastName will be concatenated with a space between them
faculty varchar(50) not null,
foreign key(id) references PostGradUser on delete cascade on update cascade
)

go

create table Publication (
id int primary key identity,
title varchar(50) not null,
date datetime not null, 
place varchar(50) not null,
accepted bit not null,
host varchar(50) not null
)

go

create table Payment (
id int primary key identity,
amount decimal not null,
no_Installments int not null,
fundPercentage decimal not null,
)

go

create table Thesis (
serialNumber int primary key identity,
field varchar(50) not null,
type varchar(10) not null,
title varchar(50) not null,
startDate datetime not null default current_timestamp,
endDate datetime not null,
defenceDate datetime default null,
years as (year(endDate) - year(startDate)),
grade decimal default null,
payment_id int unique references Payment on delete cascade on update cascade,
noExtension int default 0 check (noExtension>= 0)
)




go 

create table Examiner (
id int primary key,
name varchar(20) not null,
fieldOfWork varchar(50) not null,
isNational bit not null,
foreign key(id) references PostGradUser on delete cascade on update cascade
)

go

create table Defense (
serialNumber int,
date datetime,
location varchar(15) not null,
grade decimal default null,  
primary key(serialNumber,date),
foreign key(serialNumber) references Thesis on delete cascade on update cascade
)

go

create table GUCianProgressReport (
sid int, 
no int, 
date datetime not null,
eval int check(eval between 0 and 3), --user stories evaluate progressreport
state int default null, 
thesisSerialNumber int,
supid int,
description varchar(200) default null,
primary key(sid,no),
foreign key(sid) references GucianStudent on delete cascade on update cascade,
foreign key(thesisSerialNumber) references Thesis on delete cascade on update cascade,
foreign key(supid) references Supervisor on delete no action on update no action
)

--ProgressReport has a missing attribute description varchar(200)
go

create table NonGUCianProgressReport (
sid int, 
no int, 
date datetime not null,
eval int check(eval between 0 and 3),
state int default null, 
thesisSerialNumber int,
supid int,
description varchar(200) default null,
primary key(sid,no),
foreign key(sid) references NonGucianStudent on delete cascade on update cascade,
foreign key(thesisSerialNumber) references Thesis on delete cascade on update cascade,
foreign key(supid) references Supervisor on delete no action on update no action
)

go

create table Installment (
date datetime,
paymentId int,
amount real not null,
done bit not null,
primary key(date,paymentId),
foreign key(paymentId) references Payment on delete cascade on update cascade
)

go

create table NonGucianStudentPayForCourse(
sid int ,
paymentNo int, 
cid int,
primary key(sid,paymentNo,cid),
foreign key(sid) references NonGucianStudent on delete cascade on update cascade,
foreign key(paymentNo) references Payment on delete cascade on update cascade,
foreign key(cid) references Course on delete cascade on update cascade
)

go

create table NonGucianStudentTakeCourse (
sid int,
cid int,
grade decimal default null, 
primary key (sid,cid),
foreign key(sid) references NonGucianStudent on delete cascade on update cascade,
foreign key(cid) references Course on delete cascade on update cascade,
)

go

create table GUCianStudentRegisterThesis(
sid int,
supid int,
serial_no int,
primary key(sid,supid,serial_no),
foreign key(sid) references GucianStudent on delete cascade on update cascade,
foreign key(supid) references Supervisor on delete no action on update no action,
foreign key (serial_no) references Thesis on delete cascade on update cascade
)

go

create table NonGUCianStudentRegisterThesis(
sid int,
supid int,
serial_no int,
primary key(sid,supid,serial_no),
foreign key(sid) references NonGucianStudent on delete cascade on update cascade,
foreign key(supid) references Supervisor on delete no action on update no action,
foreign key (serial_no) references Thesis on delete cascade on update cascade
)

go

create table ExaminerEvaluateDefense (
date datetime default null,
serialNo int ,
examinerId int , 
comment varchar(300) default null, 
primary key(date,serialNo,examinerId),
foreign key(serialNo,date) references Defense on delete cascade on update cascade,
foreign key(examinerId) references Examiner on delete cascade on update cascade
)

go

create table ThesisHasPublication (
serialNo int,
pubid int,
primary key(serialNo,pubid),
foreign key(serialNo) references Thesis on delete cascade on update cascade,
foreign key(pubid) references Publication on delete cascade on update cascade
)


