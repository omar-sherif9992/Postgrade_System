
USE GUC_POSTGRADE_SYSTEM
go

insert into PostGradUser values('omar.elmeteny@gmail.com','1234')
declare @uid1 int
set @uid1 = SCOPE_IDENTITY()
insert into Admin values(@uid1)



insert into PostGradUser values('omar.sherif@gmail.com','1234')
declare @uid2 int
set @uid2 = SCOPE_IDENTITY()
insert into Admin values(@uid2)



insert into PostGradUser values('ziad.tamer@gmail.com','12345')
declare @uid3 int
set @uid3 = SCOPE_IDENTITY()
insert into Supervisor values(@uid3,'ziad tamer','MET')
declare @supid3 int
select @supid3 = max(id) from Supervisor




insert into PostGradUser values('hussein.yasser@gmail.com','01234')
declare @uid4 int
set @uid4 = SCOPE_IDENTITY()
insert into Supervisor values(@uid4,'hussein yasser','EMS')
declare @supid4 int
select @supid4 = max(id) from Supervisor



insert into PostGradUser values('omar.kamal@gmail.com','123456')
declare @uid5 int
set @uid5 = SCOPE_IDENTITY()
insert into Supervisor values(@uid5,'omar kamal','IET')
declare @supid5 int
select @supid5 = max(id) from Supervisor




insert into PostGradUser values('omar.ali@gmail.com','123400')
declare @uid6 int
set @uid6 = SCOPE_IDENTITY()
insert into Supervisor values(@uid6,'omar ali','Management')
declare @supid6 int
select @supid6 = max(id) from Supervisor



insert into PostGradUser values('hussein.ebrahim@gmail.com','0123467')
declare @uid7 int
set @uid7 = SCOPE_IDENTITY()
insert into Supervisor values(@uid7,'hussein ebrahim','Law and Legal Studies')
declare @supid7 int
select @supid7 = max(id) from Supervisor



insert into PostGradUser values('ziad.ziad@gmail.com','12334')
declare @uid8 int
set @uid8 = SCOPE_IDENTITY()
insert into GucianStudent values(@uid8,'ziad','ziad',null,'Computer Engineering','Maadi',1.7,null)
declare @sid8 int
select @sid8 = max(id) from GucianStudent



insert into PostGradUser values('guc','guc')
declare @uid9 int
set @uid9 = SCOPE_IDENTITY()
insert into GucianStudent values(@uid9,'hussein','hussein','master','Media Engineering','Helwan',2.3,'49-3344')
declare @sid9 int
select @sid9 = max(id) from GucianStudent



insert into PostGradUser values('hussein.sarnagawy@gmail.com','123004')
declare @uid10 int
set @uid10 = SCOPE_IDENTITY()
print (@uid10)
insert into GucianStudent values(@uid10,'hussein','sarnagawy',null,'Mechatronics Engineering','Heliopolis',2,null) 
declare @sid10 int
select @sid10 = max(id) from GucianStudent




insert into PostGradUser values('k','1')
declare @uid11 int
set @uid11 = SCOPE_IDENTITY()
insert into NonGucianStudent values(@uid11,'ziad','elmeteny',null,'Networks Engineering','Maadi',1.3)
declare @sid11 int
select @sid11 = max(id) from NonGucianStudent


insert into PostGradUser values('omar.yasser@gmail.com','1234281')
declare @uid12 int
set @uid12 = SCOPE_IDENTITY()
insert into NonGucianStudent values(@uid12,'omar','yasser',null,'Management','El-Sheikh Zayed',2) 
declare @sid12 int
select @sid12 = max(id) from NonGucianStudent



insert into PostGradUser values('nonguc','nonguc')
declare @uid13 int
set @uid13 = SCOPE_IDENTITY()
insert into NonGucianStudent values(@uid13,'ali','elmeteny',null,'Law and Legal studies','Zamalek',2)
declare @sid13 int
select @sid13 = max(id) from NonGucianStudent



insert into PostGradUser values('omar.ziad@gmail.com','1234281')
declare @uid14 int
set @uid14 = SCOPE_IDENTITY()
insert into Examiner values(@uid14,'omar','Computer Engineering','1')
declare @exid14 int
select @exid14 = max(id) from Examiner



insert into PostGradUser values('omar.sayed@gmail.com','1234281')
declare @uid15 int
set @uid15 = SCOPE_IDENTITY()
insert into Examiner values(@uid15,'omar','Mechanics Engineering','1')
declare @exid15 int
select @exid15 = max(id) from Examiner



insert into PostGradUser values('omar.adham@gmail.com','1234281')
declare @uid16 int
set @uid16 = SCOPE_IDENTITY()
insert into Examiner values(@uid16,'omar','Networks and Communications Engineering','0')
declare @exid16 int
select @exid16 = max(id) from Examiner



insert into PostGradUser values('omar.gamal@gmail.com','1234281')
declare @uid17 int
set @uid17 = SCOPE_IDENTITY()
insert into Examiner values(@uid17,'omar','Bussiness','0')
declare @exid17 int
select @exid17 = max(id) from Examiner



insert into PostGradUser values('omar.rayan@gmail.com','1234281')
declare @uid18 int
set @uid18 = SCOPE_IDENTITY()
insert into Examiner values(@uid18,'omar','Law','1')
declare @exid18 int
select @exid18 = max(id) from Examiner



insert into PostGradUser values('ali.gamal@gmail.com','1234281')
declare @uid19 int
set @uid19 = SCOPE_IDENTITY()
insert into NonGucianStudent values(@uid19,'ali','gamal',null,'Law and Legal studies','Zamalek',2)
declare @sid19 int
select @sid19 = max(id) from NonGucianStudent



insert into PostGradUser values('ahmed.gamal@gmail.com','1234281')
declare @uid20 int
set @uid20 = SCOPE_IDENTITY()
insert into GucianStudent values(@uid20,'ahmed','gamal',null,'Computer Engineering','Maadi',2,null)
declare @sid20 int
select @sid20 = max(id) from GucianStudent




insert into PostGradUser values('amr.ziad@gmail.com','1234281')
declare @uid21 int
set @uid21 = SCOPE_IDENTITY()
insert into Examiner values(@uid21,'amr','Computer Engineering','0')
declare @exid21 int
select @exid21 = max(id) from Examiner



insert into GUCStudentPhoneNumber values(@sid8,'01012062866')
insert into GUCStudentPhoneNumber values(@sid8,'01006625353')
insert into GUCStudentPhoneNumber values(@sid9,'01008877651')
insert into GUCStudentPhoneNumber values(@sid10,'01220400050')




insert into NonGUCStudentPhoneNumber values(@sid11,'01220108273')
insert into NonGUCStudentPhoneNumber values(@sid12,'01012024433')
insert into NonGUCStudentPhoneNumber values(@sid12,'01222659012')
insert into NonGUCStudentPhoneNumber values(@sid12,'01100220111')
insert into NonGUCStudentPhoneNumber values(@sid13,'01006625354')



insert into Course values(1000,4,'CSEN1001')
declare @cid1 int
set @cid1 = SCOPE_IDENTITY()



insert into Course values(1500,6,'DMET1002')
declare @cid2 int
set @cid2 = SCOPE_IDENTITY()



insert into Course values(900,4,'NETW1003')
declare @cid3 int
set @cid3 = SCOPE_IDENTITY()



insert into Course values(2000,3,'COMM1006')
declare @cid4 int
set @cid4 = SCOPE_IDENTITY()



insert into Course values(1200,5,'MCTR1002')
declare @cid5 int
set @cid5 = SCOPE_IDENTITY()



insert into Course values(1300,8,'MGMT1004')
declare @cid6 int
set @cid6 = SCOPE_IDENTITY()



insert into Course values(1400,4,'LAW1001')
declare @cid7 int
set @cid7 = SCOPE_IDENTITY()



insert into Course values(1000,4,'MCTR1003')
declare @cid8 int
set @cid8 = SCOPE_IDENTITY()





insert into Payment values(2313,2,25)
declare @pid1 int
set @pid1 = SCOPE_IDENTITY()
insert into Installment values('2019-08-09',@pid1,1555,'1')
insert into Installment values('2020-09-09',@pid1,758,'1')
insert into Thesis(field,type,title,startDate,endDate,defenceDate,payment_id) values('Computer Engineering','Masters','A','2016-09-23','2018-09-04','2018-10-22',@pid1)
declare @serNum1 int
set @serNum1 = SCOPE_IDENTITY()



insert into Payment values(6312,1,30)
declare @pid2 int
set @pid2 = SCOPE_IDENTITY()
insert into Installment values('2019-06-06',@pid2,6312,'1')
insert into Thesis(field,type,title,startDate,endDate,defenceDate,payment_id) values('Computer Engineering','PhD','B','2019-07-23','2021-03-04','2021-04-22',@pid2)
declare @serNum2 int
set @serNum2 = SCOPE_IDENTITY()



insert into Payment values(1222,2,35)
declare @pid3 int
set @pid3 = SCOPE_IDENTITY()
insert into Installment values('2020-03-09',@pid3,630,'1')
insert into Installment values('2020-12-09',@pid3,592,'1')
insert into Thesis(field,type,title,startDate,endDate,defenceDate,payment_id) values('Mechatronics Engineering','Masters','C','2018-02-23','2019-09-04','2019-10-22',@pid3)
declare @serNum3 int
set @serNum3 = SCOPE_IDENTITY()



insert into Payment values(1092,2,15)
declare @pid4 int
set @pid4 = SCOPE_IDENTITY()
insert into Installment values('2018-03-20',@pid4,490,'1')
insert into Installment values('2020-05-09',@pid4,602,'1')
insert into Thesis(field,type,title,startDate,endDate,defenceDate,payment_id) values('Mechatronics Engineering','PhD','D','2020-03-03','2023-01-04','2022-02-12',@pid4)
declare @serNum4 int
set @serNum4 = SCOPE_IDENTITY()



insert into Payment values(2342,1,10)
declare @pid5 int
set @pid5 = SCOPE_IDENTITY()
insert into Installment values('2019-03-09',@pid5,2342,'1')
insert into Thesis(field,type,title,startDate,endDate,defenceDate,payment_id) values('Material Engineering','Masters','E','2018-09-23','2020-07-11','2020-09-22',@pid5)
declare @serNum5 int
set @serNum5 = SCOPE_IDENTITY()



insert into Payment values(2342,2,40)
declare @pid6 int
set @pid6 = SCOPE_IDENTITY()
insert into Installment values('2019-03-09',@pid6,1167,'1')
insert into Installment values('2019-09-09',@pid6,1175,'1')
insert into Thesis(field,type,title,startDate,endDate,defenceDate,payment_id) values('Production Engineering','phD','F','2020-10-23','2021-12-04','2021-12-22',@pid6)
declare @serNum6 int
set @serNum6 = SCOPE_IDENTITY()



insert into Payment values(5361,1,15)
declare @pid7 int
set @pid7 = SCOPE_IDENTITY()
insert into Installment values('2020-01-15',@pid7,5361,'1')
insert into Thesis(field,type,title,startDate,endDate,defenceDate,payment_id) values('Networks Engineering','Masters','G','2017-01-15','2018-09-10','2018-10-22',@pid7)
declare @serNum7 int
set @serNum7 = SCOPE_IDENTITY()



insert into Payment values(2828,1,30)
declare @pid8 int
set @pid8 = SCOPE_IDENTITY()
insert into Installment values('2021-11-04',@pid8,2828,'1')
insert into Thesis(field,type,title,startDate,endDate,defenceDate,payment_id) values('Communications Engineering','Phd','H','2019-01-03','2021-02-04','2021-03-29',@pid8)
declare @serNum8 int
set @serNum8 = SCOPE_IDENTITY()



insert into Payment values(5361,2,25)
declare @pid9 int
set @pid9 = SCOPE_IDENTITY()
insert into Installment values('2019-07-09',@pid9,2456,'1')
insert into Installment values('2020-03-19',@pid9,2905,'1')
insert into Thesis(field,type,title,startDate,endDate,defenceDate,payment_id) values('Media Engineering','Masters','I','2019-09-23','2021-11-04','2021-11-20',@pid9)
declare @serNum9 int
set @serNum9 = SCOPE_IDENTITY()



insert into Payment values(1282,1,20)
declare @pid10 int
set @pid10 = SCOPE_IDENTITY()
insert into Installment values('2019-03-09',@pid10,1282,'1')
insert into Thesis(field,type,title,startDate,endDate,defenceDate,payment_id) values('Networks Engineering','Masters','J','2021-03-23','2022-08-10','2022-10-02',@pid10)
declare @serNum10 int
set @serNum10 = SCOPE_IDENTITY()



insert into Payment values(1728,1,10)
declare @pid11 int
set @pid11 = SCOPE_IDENTITY()
insert into Installment values('2022-06-08',@pid11,1728,'0')
insert into Thesis(field,type,title,startDate,endDate,defenceDate,payment_id) values('Media Engineering','PhD','K','2021-09-24','2023-05-29','2023-06-12',@pid11)
declare @serNum11 int
set @serNum11 = SCOPE_IDENTITY()



insert into Payment values(1281,2,30)
declare @pid12 int
set @pid12 = SCOPE_IDENTITY()
insert into Installment values('2023-02-08',@pid12,700,'0')
insert into Installment values('2023-08-16',@pid12,581,'0')
insert into Thesis(field,type,title,startDate,endDate,defenceDate,payment_id) values('Computer Engineering','PhD','L','2021-11-27','2024-05-27','2024-06-08',@pid12)
declare @serNum12 int
set @serNum12 = SCOPE_IDENTITY()



insert into Payment values(3572,2,45)
declare @pid13 int
set @pid13 = SCOPE_IDENTITY()
insert into Installment values('2022-03-09',@pid13,1555,'0')
insert into Installment values('2022-12-31',@pid13,2017,'0')
insert into Thesis(field,type,title,endDate,defenceDate,payment_id) values('Management','Masters','M','2022-03-30','2022-06-02',@pid13)
declare @serNum13 int
set @serNum13 = SCOPE_IDENTITY()



insert into Payment values(3828,1,5)
declare @pid14 int
set @pid14 = SCOPE_IDENTITY()
insert into Installment values('2022-01-09',@pid14,3828,'0')
insert into Thesis(field,type,title,endDate,defenceDate,payment_id) values('Management','PhD','N','2023-09-04','2023-10-29',@pid14)
declare @serNum14 int
set @serNum14 = SCOPE_IDENTITY()



insert into Payment values(1826,2,20)
declare @pid15 int
set @pid15 = SCOPE_IDENTITY()
insert into Installment values('2022-01-27',@pid15,1000,'0')
insert into Installment values('2022-04-09',@pid15,826,'0')
insert into Thesis(field,type,title,endDate,defenceDate,payment_id) values('Law & Legal Studies','Masters','O','2023-01-04','2023-02-23',@pid15)
declare @serNum15 int
set @serNum15 = SCOPE_IDENTITY()



insert into Payment values(1000,1,20)
declare @pid16 int
set @pid16 = SCOPE_IDENTITY()
insert into Installment values('2019-02-11',@pid16,1000,'1')



insert into Payment values(2000,2,10)
declare @pid17 int
set @pid17 = SCOPE_IDENTITY()
insert into Installment values('2019-02-11',@pid17,750,'1')
insert into Installment values('2019-06-11',@pid17,750,'1')



insert into Payment values(900,1,25)
declare @pid18 int
set @pid18 = SCOPE_IDENTITY()
insert into Installment values('2019-02-11',@pid18,900,'1')



insert into Payment values(1500,1,15)
declare @pid19 int
set @pid19 = SCOPE_IDENTITY()
insert into Installment values('2019-02-11',@pid19,1500,'1')



insert into Payment values(1200,2,20)
declare @pid20 int
set @pid20 = SCOPE_IDENTITY()
insert into Installment values('2019-02-11',@pid20,600,'1')
insert into Installment values('2019-06-11',@pid20,600,'1')



insert into Payment values(1300,1,10)
declare @pid21 int
set @pid21 = SCOPE_IDENTITY()
insert into Installment values('2019-02-11',@pid21,1300,'1')



insert into Payment values(1400,1,30)
declare @pid22 int
set @pid22 = SCOPE_IDENTITY()
insert into Installment values('2019-02-11',@pid22,1400,'1')



insert into Payment values(1000,2,25)
declare @pid23 int
set @pid23 = SCOPE_IDENTITY()
insert into Installment values('2019-02-11',@pid23,500,'1')
insert into Installment values('2019-06-11',@pid23,500,'1')




insert into Defense(serialNumber,date,location) values(@serNum1,'2018-10-22','GUC')
insert into Defense(serialNumber,date,location) values(@serNum2,'2021-04-22','GUC')
insert into Defense(serialNumber,date,location) values(@serNum3,'2019-10-22','GUC')
insert into Defense(serialNumber,date,location) values(@serNum4,'2022-02-12','GUC')
insert into Defense(serialNumber,date,location) values(@serNum5,'2020-09-22','GUC')
insert into Defense(serialNumber,date,location) values(@serNum6,'2021-12-22','GUC')
insert into Defense(serialNumber,date,location) values(@serNum7,'2018-10-22','GUC')




insert into GUCianProgressReport values(@sid8,1,'2017-11-07',2,null,@serNum1,@supid3,null)
insert into GUCianProgressReport values(@sid8,2,'2020-07-07',1,null,@serNum2,@supid3,null)
insert into GUCianProgressReport values(@sid9,1,'2019-11-07',3,null,@serNum9,@supid3,null)
insert into GUCianProgressReport values(@sid9,2,'2020-11-07',0,null,@serNum9,@supid3,null)
insert into GUCianProgressReport values(@sid10,1,'2019-11-07',2,null,@serNum3,@supid4,null)
insert into GUCianProgressReport values(@sid10,2,'2020-11-07',1,null,@serNum3,@supid4,null)



insert into NonGUCianProgressReport values(@sid11,1,'2019-06-07',1,null,@serNum8,@supid5,null)
insert into NonGUCianProgressReport values(@sid11,2,'2020-01-07',3,null,@serNum10,@supid5,null)
insert into NonGUCianProgressReport values(@sid11,3,'2020-06-07',1,null,@serNum13,@supid5,null)
insert into NonGUCianProgressReport values(@sid12,1,'2019-11-07',0,null,@serNum14,@supid6,null)
insert into NonGUCianProgressReport values(@sid19,1,'2020-11-07',2,null,@serNum1,@supid6,null)
insert into NonGUCianProgressReport values(@sid13,1,'2019-11-07',2,null,@serNum15,@supid7,null)
										   								



insert into NonGucianStudentPayForCourse values(@sid11,@pid18,@cid3)
insert into NonGucianStudentPayForCourse values(@sid11,@pid19,@cid4)
insert into NonGucianStudentPayForCourse values(@sid12,@pid21,@cid6)
insert into NonGucianStudentPayForCourse values(@sid13,@pid21,@cid6)
insert into NonGucianStudentPayForCourse values(@sid13,@pid22,@cid7)



insert into NonGucianStudentTakeCourse(sid,cid) values(@sid11,@cid3)
insert into NonGucianStudentTakeCourse(sid,cid) values(@sid11,@cid4)
insert into NonGucianStudentTakeCourse(sid,cid) values(@sid12,@cid6)
insert into NonGucianStudentTakeCourse(sid,cid) values(@sid13,@cid6)
insert into NonGucianStudentTakeCourse(sid,cid) values(@sid13,@cid7)



insert into GUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid8,@supid3,@serNum1)
insert into GUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid8,@supid3,@serNum2)
insert into GUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid9,@supid3,@serNum9)
insert into GUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid10,@supid4,@serNum3)
insert into GUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid10,@supid4,@serNum4)
insert into GUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid8,@supid3,@serNum12)
insert into GUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid9,@supid5,@serNum7)
insert into GUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid9,@supid3,@serNum12)
insert into GUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid10,@supid4,@serNum6)
insert into GUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid20,@supid5,@serNum11)
insert into GUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid20,@supid4,@serNum5)




insert into NonGUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid11,@supid5,@serNum8)
insert into NonGUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid11,@supid6,@serNum13)
insert into NonGUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid11,@supid5,@serNum10)
insert into NonGUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid12,@supid6,@serNum14)
insert into NonGUCianStudentRegisterThesis (sid,supid,serial_no) values(@sid13,@supid7,@serNum15)




insert into ExaminerEvaluateDefense(date,serialNo,examinerId) values('2018-10-22',@serNum1,@exid14)
insert into ExaminerEvaluateDefense(date,serialNo,examinerId) values('2018-10-22',@serNum1,@exid21)
insert into ExaminerEvaluateDefense(date,serialNo,examinerId) values('2021-04-22',@serNum2,@exid14)
insert into ExaminerEvaluateDefense(date,serialNo,examinerId) values('2019-10-22',@serNum3,@exid15)
insert into ExaminerEvaluateDefense(date,serialNo,examinerId) values('2022-02-12',@serNum4,@exid15)
insert into ExaminerEvaluateDefense(date,serialNo,examinerId) values('2020-09-22',@serNum5,@exid15)
insert into ExaminerEvaluateDefense(date,serialNo,examinerId) values('2021-12-22',@serNum6,@exid15)
insert into ExaminerEvaluateDefense(date,serialNo,examinerId) values('2018-10-22',@serNum7,@exid16)



