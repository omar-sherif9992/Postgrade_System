


USE GUC_POSTGRADE_SYSTEM
GO

create procedure viewAllPublications
as
select *
from Publication


go
create procedure ViewMyPhone
@Sid int
as
(select phone
from NonGUCStudentPhoneNumber
where id=@sid
)
union 
(select phone
from GUCStudentPhoneNumber
where id=@sid)

go
--New Added Procedures
--omar fixed
create PROCEDURE STUDENTVIEWTHESIS
@SID INT
AS
if(exists
(SELECT t.serialNumber as 'serialNumber',field,type,title,startDate,endDate,defenceDate,years,grade,noExtension
from thesis t inner join GUCianStudentRegisterThesis  g on  g.serial_no=t.serialNumber
where g.sid=@SID))

SELECT t.serialNumber as 'serialNumber',field,type,title,startDate,endDate,defenceDate,years,grade,noExtension
from thesis t inner join GUCianStudentRegisterThesis  g on  g.serial_no=t.serialNumber
where g.sid=@SID

else if(exists
(SELECT t.serialNumber as 'serialNumber',field,type,title,startDate,endDate,defenceDate,years,grade,noExtension
from thesis t inner join NonGUCianStudentRegisterThesis  g on  g.serial_no=t.serialNumber
where  g.sid=@SID))
SELECT t.serialNumber as 'serialNumber',field,type,title,startDate,endDate,defenceDate,years,grade,noExtension
from thesis t inner join NonGUCianStudentRegisterThesis  g on  g.serial_no=t.serialNumber
where  g.sid=@SID
GO

--husseinYasser
create procedure addExaminerSystem 
@email varchar(50),@password varchar(20),@name varchar(20),@fieldofwork varchar(40),@isNational bit
AS
insert into PostGradUser values (@email,@password)
declare @ExaminerID int
select @ExaminerID=id from PostGradUser where id = (select max(id) from PostGradUser)
insert into Examiner values(@ExaminerID,@name,@fieldofwork,@isNational)

go








--husseinyasser
create procedure findThesisInSup
@SupID int,@ThesisSerialNumber int,@Success bit out
AS
if(not exists(select * from GUCianStudentRegisterThesis where serial_no=@ThesisSerialNumber and supid=@SupID) and not exists(select * from NonGUCianStudentRegisterThesis where serial_no=@ThesisSerialNumber and supid = @SupID)) set @Success = 0;
else set @Success=1

go

-- 1a.1 Registering Student in the System
create PROCEDURE StudentRegister 
@first_name VARCHAR(20), @last_name VARCHAR(20), @password VARCHAR(20),
@faculty VARCHAR(20), @Gucian BIT, @email VARCHAR(50), @address VARCHAR(50)
AS
IF(@first_name is null or @last_name is null or @password is null or @faculty is null or @Gucian is null or @email is null or @address is null)
PRINT('Error Missing Input Data in StudentRegister');
ELSE
BEGIN
INSERT INTO PostGradUser (email,password) VALUES(@email,@password);
DECLARE @lastID INT;
SELECT @lastID = max(id) 
FROM PostGradUser  
IF(@Gucian = '1')
INSERT INTO GucianStudent (id,firstName,lastName,type,faculty,address,GPA,undergradID)
VALUES (@lastID,@first_name,@last_name,null,@faculty,@address,null,null);
ELSE INSERT INTO NonGucianStudent (id,firstName,lastName,type,faculty,address,GPA)
VALUES (@lastID,@first_name,@last_name,null,@faculty,@address,null);
END
GO

--1a.2 Registering a new Supervisor to the System
create PROCEDURE SupervisorRegister
@first_name VARCHAR(20),@last_name VARCHAR(20),@password VARCHAR(20),@faculty VARCHAR(20),
@email VARCHAR(50)
AS
IF(@first_name IS NULL OR @last_name IS NULL OR @password IS NULL OR @faculty IS NULL OR @email IS NULL)
PRINT('Error Missing Input Data in SupervisorRegister');
ELSE
BEGIN
INSERT INTO PostGradUser (email,password) VALUES(@email,@password);
DECLARE @lastID INT;
SELECT @lastID = max(id) 
FROM PostGradUser
INSERT INTO Supervisor (id,name,faculty) VALUES(@lastID,@first_name+' '+@last_name,@faculty);
END
GO

--2a Login the User into the System
create PROCEDURE userLogin
@email VARCHAR(50),
@password VARCHAR(20),
@Success_bit BIT OUTPUT,
@TYPE VARCHAR(40) OUTPUT,
@id int OUTPUT
AS
DECLARE @TEMP_ID INT
IF( EXISTS(
SELECT *
FROM PostGradUser
WHERE email=@email AND password=@password))
BEGIN
SELECT @TEMP_ID=id
FROM PostGradUser
WHERE email=@email AND password=@password
SET @Success_bit = '1';
SET @id=@TEMP_ID;
IF(EXISTS(
SELECT *
FROM GucianStudent
WHERE id=@TEMP_ID))
SET @TYPE='GucianStudent'
ELSE IF(EXISTS(
SELECT *
FROM Admin
WHERE id=@TEMP_ID ))
SET @TYPE='Admin'
ELSE IF(EXISTS(
SELECT *
FROM NonGucianStudent
WHERE id=@TEMP_ID ))
SET @TYPE='NonGucianStudent'
ELSE IF(EXISTS(
SELECT *
FROM Supervisor
WHERE id=@TEMP_ID ))
SET @TYPE='Supervisor'
ELSE IF(EXISTS(
SELECT *
FROM Examiner
WHERE id=@TEMP_ID ))
SET @TYPE='Examiner'
END
ELSE
begin
SET @TYPE=null;
SET @Success_bit =  '0';
SET @id=null;
end
go

--2b add mobile numbers to the student according 
GO
create PROCEDURE addMobile
@ID INT ,
@mobile_number VARCHAR(20),
@Success_bit int output
AS
IF(EXISTS(SELECT *
FROM NonGUCStudentPhoneNumber 
WHERE id=@ID AND phone=@mobile_number ) OR EXISTS(
SELECT *
FROM GUCStudentPhoneNumber 
WHERE id=@ID AND phone=@mobile_number) )

begin
PRINT ('The Phone Number already exists')
set @Success_bit = 0
end

ELSE IF(EXISTS(
		SELECT *
		FROM NonGucianStudent
		WHERE id=@ID))

begin
INSERT INTO NonGUCStudentPhoneNumber (id,phone) VALUES (@ID,@mobile_number)
set @Success_bit = 1
end

ELSE IF(EXISTS(
		SELECT *
		FROM GucianStudent
		WHERE id=@ID))

begin
INSERT INTO GUCStudentPhoneNumber (id,phone) VALUES (@ID,@mobile_number)
set @Success_bit = 1
end

ELSE
begin
PRINT('Error the ID is not registered as a Student addMobile')
set @Success_bit = 2
end

go


--3a List all SuperVisors in The System
CREATE PROCEDURE AdminListSup
AS
SELECT *
FROM Supervisor


go

--missing admin id  to check if he have the privilage
--3b Admin views the Supervisor Profile
CREATE PROCEDURE AdminViewSupervisorProfile
@supId INT
AS
SELECT *
FROM Supervisor
WHERE id=@supId

go
--3c Viewing All Thesis in The System
CREATE PROCEDURE AdminViewAllTheses
AS
SELECT *
FROM  Thesis

GO
--3d Listing the the number of ongoing Thesis in CurrentDate
CREATE PROCEDURE AdminViewOnGoingTheses 
@thesesCount int out
AS
SELECT @thesesCount = COUNT(*)
FROM THESIS
WHERE CURRENT_TIMESTAMP < endDate AND CURRENT_TIMESTAMP >startDate

GO

--3e Getting Supervisors supervising specific student in an ongoing Thesis(currently Thesis) 
CREATE PROCEDURE AdminViewStudentThesisBySupervisor
AS
(SELECT S.name AS 'SuperVisor Name',T.title as 'Thesis Title',NonGUC.firstName+' '+NonGUC.lastName AS 'Student name'
FROM Supervisor S INNER JOIN NonGUCianStudentRegisterThesis NonGUCTHESIS ON S.id = NonGUCTHESIS.supid
INNER JOIN NonGucianStudent NonGUC on NonGUC.id = NonGUCTHESIS.sid 
INNER JOIN Thesis T ON T.serialNumber = NonGUCTHESIS.serial_no
where 
CURRENT_TIMESTAMP > T.startDate AND CURRENT_TIMESTAMP < T.endDate)
UNION
(SELECT S.name AS 'SuperVisor Name',T.title as 'Thesis Title',GUC.firstName+' '+GUC.lastName AS 'Student name'
FROM Supervisor S INNER JOIN GUCianStudentRegisterThesis GUCTHESIS ON S.id = GUCTHESIS.supid
INNER JOIN GucianStudent GUC on GUC.id = GUCTHESIS.sid 
INNER JOIN Thesis T ON T.serialNumber = GUCTHESIS.serial_no
where 
CURRENT_TIMESTAMP > T.startDate AND CURRENT_TIMESTAMP < T.endDate);

GO

--3f List nonGucians names, course code, and respective grade
CREATE PROCEDURE AdminListNonGucianCourse
@courseID int
AS
SELECT NonGUC.firstName + ' ' + NonGUC.lastName AS 'NonGUCIAN Student Name',COR.code AS 'Course Code',
C.grade AS 'Course Grade'
FROM NonGucianStudent NonGUC INNER JOIN NonGucianStudentTakeCourse C ON C.sid = NonGUC.id
INNER JOIN Course COR ON COR.id = C.cid
WHERE COR.code IS NOT NULL and COR.id = @courseID

GO

--3g ADMIN UPDATES THE EXTENSION BY THESIS SERIAL NUMBER
CREATE PROCEDURE AdminUpdateExtension
@ThesisSerialNo INT,
@success bit output
AS
if(exists(select *
from Thesis 
where serialNumber = @ThesisSerialNo))
begin
UPDATE Thesis SET noExtension=noExtension+1 WHERE serialNumber=@ThesisSerialNo
set @success = '1'
end
else set @success = '0'


GO

--3h Issue a thesis payment
CREATE PROCEDURE AdminIssueThesisPayment
@ThesisSerialNo INT ,
@amount DECIMAL,
@noOfInstallments INT ,
@fundPercentage DECIMAL,
@Success_bit BIT OUTPUT
AS
if(exists(SELECT *
FROM Thesis 
WHERE serialNumber=@ThesisSerialNo))
BEGIN
INSERT INTO PAYMENT(amount,no_Installments,fundPercentage) values(@amount,@noOfInstallments,@fundPercentage);
DECLARE @PAY_ID INT

SELECT @PAY_ID=MAX(id) FROM Payment
UPDATE Thesis SET payment_id=@PAY_ID WHERE serialNumber=@ThesisSerialNo

SET @Success_bit = '1'
END
ELSE SET @Success_bit = '0'

GO

--3i view the profile of any student that contains all his/her information
GO
CREATE PROCEDURE AdminViewStudentProfile
@sid int
AS
if (exists(
SELECT *
FROM GucianStudent S
WHERE S.id = @sid))
select *
from GucianStudent S
where id = @sid                                      
else if(exists(
SELECT *
FROM NonGucianStudent S
WHERE S.id = @sid))
SELECT *
FROM NonGucianStudent
where id = @sid
else
print ('This is not a student ID')
GO

--3j Issue installments as per the number of installments for a certain payment every six months starting from the entered date.
create procedure AdminIssueInstallPayment
@paymentID int,@InstallStartDate datetime,
@success bit output
AS
declare @counter int
set @counter = 1
declare @num int
select @num = no_Installments
from Payment
where @paymentID = id
declare @val decimal
declare @amnt decimal
select @amnt = amount
from Payment
where @paymentID = id
if(@amnt is not null and @num is not null)
begin
delete from Installment where paymentId=@paymentID
set @val = @amnt/@num
while(@counter <= @num)
BEGIN
insert into Installment (date,paymentId,amount,done)
values (@InstallStartDate,@paymentID,@val,0)
set @counter = @counter+1
select @InstallStartDate = DATEADD(month,6,@InstallStartDate) 
END
set @success = '1'
end
else
begin
set @success = '0'
end

declare @succ bit
execute AdminIssueInstallPayment 1,'2019-08-09',@succ output
print @succ



GO

--3k List the title(s) of accepted publication(s) per thesis
create PROCEDURE AdminListAcceptPublication
AS
SELECT TP.serialNo AS 'thesisNo', P.title AS 'Accepted title'
FROM ThesisHasPublication TP
INNER JOIN
Publication P ON TP.pubid=P.id
WHERE  P.accepted = '1'
ORDER BY TP.serialNo ASC

go

--3l.1 Add Course to the System
create procedure AddCourse
@courseCode varchar(10),@creditHrs int,@fees decimal
AS
if(exists(select *
          from Course C
		  where C.code = @courseCode and C.creditHours = @creditHrs and C.fees = @fees))
		  print ('You cant Add Duplicate Courses')
else insert into Course(fees,creditHours,code) values(@fees,@creditHrs,@courseCode);

GO

--3l.2 Link a Course with a Student
create procedure linkCourseStudent
@courseId int , @studentID int
AS
insert into NonGucianStudentTakeCourse(sid,cid,grade) values(@studentID,@courseId,null)
GO

--3l.3 add student course grade 
create procedure addStudentCourseGrade
@courseID int,@studentID int,@grade decimal
AS
update NonGucianStudentTakeCourse SET grade = @grade where sid = @studentID and cid = @courseID
GO


--3m View examiners and supervisor(s) names attending a thesis defense taking place on a certain date
CREATE PROCEDURE ViewExamSupDefense
@defenseDate datetime
AS
SELECT DISTINCT E.name as 'Examiner name',S.name AS 'Supervisor name'
FROM thesis T 
LEFT OUTER JOIN ExaminerEvaluateDefense EED on EED.serialNo=T.serialNumber
LEFT OUTER JOIN Examiner E on EED.examinerId=E.id
LEFT OUTER JOIN GUCianStudentRegisterThesis GSRT ON T.serialNumber=GSRT.serial_no
LEFT OUTER JOIN NonGUCianStudentRegisterThesis NGSRT ON T.serialNumber=NGSRT.serial_no
LEFT OUTER JOIN SUPERVISOR S on (S.id=GSRT.supid OR S.id=NGSRT.supid)
WHERE T.defenceDate=@defenseDate AND (E.NAME IS NOT NULL OR S.NAME IS NOT NULL )

go

--Part 4 a evaluationg a progress report
create PROCEDURE EvaluateProgressReport
@supervisorID int,
@thesisSerialNo int,
@progressReportNo int,
@evaluation int, --give evaluation value 0 to 3.
@Success bit out
AS
IF(exists(select * from GUCianProgressReport where no = @progressReportNo and thesisSerialNumber=@thesisSerialNo) or
exists(select * from NonGUCianProgressReport where no = @progressReportNo and thesisSerialNumber=@thesisSerialNo))
BEGIN
set @Success = 1
UPDATE NonGUCianProgressReport SET eval = @evaluation
WHERE supid=@supervisorID 
AND thesisSerialNumber = @thesisSerialNo AND no = @progressReportNo
UPDATE GUCianProgressReport SET eval = @evaluation
WHERE supid=@supervisorID
AND thesisSerialNumber = @thesisSerialNo AND no = @progressReportNo
END
ELSE set @Success = 0
GO

go
--4b View all my students’s names and years spent in the thesis.
create procedure ViewSupStudentsYears
@supervisorID int
AS
select GUC.firstName + ' ' + GUC.lastName AS 'Student Name',T.years AS 'years spent'
from GUCianStudentRegisterThesis GUCTHESIS INNER JOIN GucianStudent GUC
ON GUCTHESIS.sid = GUC.id
INNER JOIN Thesis T ON T.serialNumber = GUCTHESIS.serial_no
WHERE GUCTHESIS.supid = @supervisorID
Union
select NONGUC.firstName + ' ' + NONGUC.lastName AS 'Student Name',T.years
from NonGUCianStudentRegisterThesis NONGUCTHESIS INNER JOIN NonGucianStudent NONGUC
ON NONGUCTHESIS.sid = NONGUC.id
INNER JOIN Thesis T ON T.serialNumber = NONGUCTHESIS.serial_no
WHERE NONGUCTHESIS.supid = @supervisorID

GO
select * from PostGradUser U Inner Join Supervisor S on U.id = S.id
go
--4c.1 View Supervisor profile
CREATE PROCEDURE SupViewProfile
@supervisorID int
AS
SELECT *
FROM Supervisor S
WHERE S.id = @supervisorID
GO

GO

--4c.2 supervisor updates his/her profile
CREATE PROCEDURE UpdateSupProfile
@supervisorID int,
@name varchar(20),
@faculty varchar(20)
AS
UPDATE SUPERVISOR SET name=@name ,faculty=@faculty  WHERE id = @supervisorID


GO

--4d supervisor views all the publications of a student
--Modified by se7so
create PROCEDURE ViewAStudentPublications
@StudentID INT,@SupID INT,@Success bit output
AS
if(not exists(select * from GUCianStudentRegisterThesis where sid = @StudentID and supid = @SupID) and not exists(select * from NonGUCianStudentRegisterThesis where sid = @StudentID and supid = @SupID)) 
set @Success=0;
else
begin
set @Success=1;
SELECT P.*
FROM ThesisHasPublication TP INNER JOIN Publication P  ON TP.pubid=P.id
INNER JOIN NonGUCianStudentRegisterThesis S ON  S.serial_no=TP.serialNo
WHERE S.SID = @StudentID and S.supid = @SupID
UNION
SELECT P.*
FROM ThesisHasPublication TP INNER JOIN Publication P  ON TP.pubid=P.id
INNER JOIN GUCianStudentRegisterThesis S ON  S.serial_no=TP.serialNo
WHERE S.SID = @StudentID and S.supid = @SupID;
end
GO

--4e1 Add defense for a thesis for gucian students
create procedure AddDefenseGucian
@ThesisSerialNo int,
@DefenseDate datetime,
@DefenseLocation varchar(15),
@Success bit out
AS
if (not exists(
	select * 
	from Thesis inner join GUCianStudentRegisterThesis on serialNumber = serial_no
	where serialNumber = @ThesisSerialNo))
	begin
print 'This serial number number is not found';
set @Success = 0;
end
else
begin
insert into Defense values(@ThesisSerialNo,@DefenseDate,@DefenseLocation,null)
Set @Success=1
end
GO
--4e2 Add defense for a thesis, for nonGucian students all courses’ grades should be greater than 50 percent.
--Change se7so
create procedure AddDefenseNonGucian
@ThesisSerialNo int,
@DefenseDate datetime,
@DefenseLocation varchar(15),
@Success bit out,
@Success50 bit out
as
if (not exists(
	select * 
	from Thesis inner join NonGUCianStudentRegisterThesis on serialNumber = serial_no
	where serialNumber = @ThesisSerialNo))
	begin
print ('This serial number number is not found')
set @Success=0;
set @Success50 = 1;
end
else if(50 < (select NGSTC.grade
from Thesis T inner join NonGUCianStudentRegisterThesis NGSRT on T.serialNumber = NGSRT.serial_no
inner join NonGucianStudentTakeCourse NGSTC on NGSRT.sid = NGSTC.sid))
begin
insert into Defense values(@ThesisSerialNo,@DefenseDate,@DefenseLocation,null)
set @Success=1
set @Success50 = 1;
end
else
begin
print ('The grade must be greater than 50')
Set @Success50 = 0;
end
go


--4f the examiner password and email is missing in the inputs so we inserted null
--it is supposed to have the examiner id as an input becuase it is treated as a postgrad user
--so this is clarification why the procedure looks like this
--Add examiner(s) for a defense.
--change Hussein

--create proc AddExaminer
--@ThesisSerialNo int,
--@DefenseDate Datetime,
--@ExaminerName varchar(20),
--@National bit,
--@fieldOfWork varchar(20)
--AS
--declare @xD int
--if(exists(select * from Examiner where name = @ExaminerName and isNational = @National
--and fieldOfWork = @fieldOfWork))
--BEGIN 
--select @xD = id from Examiner where name = @ExaminerName and isNational = @National
--and fieldOfWork = @fieldOfWork
--insert into ExaminerEvaluateDefense (date,serialNo,examinerId,comment)
--values(@DefenseDate,@ThesisSerialNo,@xD,NULL)
--END
--ELSE
--BEGIN
--insert into PostGradUser(email,password) values(null,null) --i inserted the email and the password with null values
--select @xD =max(id)
--from PostGradUser
--insert into Examiner (id,name,fieldOfWork,isNational)
--values(@xD,@ExaminerName,@fieldOfWork,@National)
--insert into ExaminerEvaluateDefense values(@DefenseDate,@ThesisSerialNo,@xD,NULL) 
--END */

create proc AddExaminerDefense
@ThesisSerialNo int , @DefenseDate Datetime,@ExaminerID int,@SupID int,
@SuccessThesis bit output,@SuccessDate bit output,@Success bit output
AS
if(not exists(select * From Examiner where id = @ExaminerID)) set @Success = 0
else
begin
    set @Success = 1
	exec findThesisInSup @SupID,@ThesisSerialNo,@SuccessThesis out
	if(@SuccessThesis = 1)
	begin
	     if(exists(select date from Defense where serialNumber=@ThesisSerialNo and date=@DefenseDate))
		 begin
		      set @SuccessDate = 1
			  insert into ExaminerEvaluateDefense values(@DefenseDate,@ThesisSerialNo,@ExaminerID,null)
		 end
		 else set @SuccessDate=0;
	end
	else set @SuccessDate=0
end
GO 

--4 G
--Cancel a Thesis if the evaluation of the last progress report is zero.
create PROCEDURE CancelThesis
@ThesisSerialNo int
AS
DECLARE @RESULT DECIMAL
IF(EXISTS(
	SELECT *
	FROM GUCianProgressReport
	WHERE thesisSerialNumber=@ThesisSerialNo))
BEGIN 

SELECT @RESULT=eval
FROM GUCianProgressReport
WHERE thesisSerialNumber = @ThesisSerialNo and no in (
SELECT max(no)
 FROM GUCianProgressReport
WHERE thesisSerialNumber=@ThesisSerialNo );
END
ELSE IF (EXISTS(
	SELECT *
	FROM NonGUCianProgressReport
	WHERE thesisSerialNumber=@ThesisSerialNo))

BEGIN
SELECT @RESULT=eval
FROM NonGUCianProgressReport
WHERE thesisSerialNumber = @ThesisSerialNo and no in (
SELECT max(no)
 FROM NonGUCianProgressReport
WHERE thesisSerialNumber=@ThesisSerialNo );
END
if(@RESULT=0)
DELETE FROM THESIS WHERE serialNumber=@ThesisSerialNo
GO

create proc CancelThesisSol
@ThesisSerialNo int,
@Success bit output
as
if(exists(
select *
from GUCianProgressReport
where thesisSerialNumber = @ThesisSerialNo
))
   begin
         declare @gucianEval int
         set @gucianEval = (
         select top 1 eval
         from GUCianProgressReport
         where thesisSerialNumber = @ThesisSerialNo
         order by no desc
         )
         if(@gucianEval = 0)
             begin
              delete from Thesis where serialNumber = @ThesisSerialNo
             end
         else set @Success=0;
    end
else
  begin
     declare @nonGucianEval int 
     set @nonGucianEval = (
     select top 1 eval
     from NonGUCianProgressReport
     where thesisSerialNumber = @ThesisSerialNo
     order by no desc
     )
     if(@nonGucianEval = 0)
       begin
        delete from Thesis where serialNumber = @ThesisSerialNo
       end
	   else set @Success=0;
    end
	
go


--4.h) Add a grade for a thesis
--we Added a grade input becuase it is not logic to AddGrade without a grade as an input
GO
create proc AddGrade 
@ThesisSerialNo int ,@grade decimal
AS
update Thesis set grade =@grade where serialNumber = @ThesisSerialNo
GO

--5 As an examiner I should be able to:

-- 5a) Add grade for a defense.
CREATE PROCEDURE AddDefenseGrade
@ThesisSerialNo int ,
@DefenseDate Datetime ,
@grade decimal
AS
UPDATE Defense
SET grade=@grade
WHERE serialNumber=@ThesisSerialNo AND date=@DefenseDate
GO

-- 5b) Add comments for a defense.
CREATE PROCEDURE AddCommentsGrade
@ThesisSerialNo int ,
@DefenseDate Datetime ,
@comments varchar(300)
AS
UPDATE ExaminerEvaluateDefense
SET comment = @comments
WHERE serialNo = @ThesisSerialNo AND date = @DefenseDate

GO

--6 As a registered student I should be able to:

--6a) View my profile that contains all my information.
CREATE PROCEDURE viewMyProfile
@studentId int
AS
IF(EXISTS(
	SELECT *
	FROM GucianStudent S 
	WHERE S.id = @studentId
))

SELECT *
FROM PostGradUser U INNER JOIN GucianStudent S ON U.id = S.id
WHERE U.id = @studentId
ELSE IF (
EXISTS(
	SELECT *
	FROM NonGucianStudent S 
	WHERE S.id = @studentId
))
SELECT *
FROM PostGradUser U INNER JOIN NonGucianStudent S ON U.id = S.id
WHERE U.id = @studentId
ELSE
PRINT('Student doesnt exist in the system' )

GO
--6b  Edit my profile (change any of my personal information).
-- I gave him/her the accessbility to just update what is not null
CREATE PROCEDURE editMyProfile
@studentID int ,
@firstName varchar(10), 
@lastName varchar(10), 
@password varchar(10),
@email varchar(10), 
@address varchar(10), 
@type varchar(10)
AS
IF(@password is not null)
UPDATE PostGradUser SET password=@password WHERE id=@studentID
IF(@email is not null)
UPDATE PostGradUser SET email=@email WHERE id=@studentID
IF(@firstName is not null)
BEGIN
UPDATE GucianStudent SET firstName=@firstName WHERE id=@studentID
UPDATE NonGucianStudent SET firstName=@firstName WHERE id=@studentID
END
IF(@address is not null)
BEGIN
UPDATE GucianStudent SET address=@address WHERE id=@studentID
UPDATE NonGucianStudent SET address=@address WHERE id=@studentID
END

IF(@lastName is not null)
BEGIN
UPDATE GucianStudent SET lastName=@lastName WHERE id=@studentID
UPDATE NonGucianStudent SET lastName=@lastName WHERE id=@studentID
END
IF(@type is not null)
BEGIN
UPDATE GucianStudent SET type=@type WHERE id=@studentID
UPDATE NonGucianStudent SET type=@type WHERE id=@studentID
END
GO


--6.c) As a Gucian graduate, add my undergarduate ID.
CREATE PROCEDURE addUndergradID
@studentID int,
@undergradID varchar(10)
AS
UPDATE GucianStudent SET undergradID=@undergradID WHERE id=@studentID
GO

--6d As a nonGucian student, view my courses’ grades
CREATE PROCEDURE ViewCoursesGrades
@studentID int
AS
IF(EXISTS(SELECT *
from NonGucianStudentTakeCourse
WHERE sid=@studentID))
SELECT C.code as 'Course_Code',G.grade as 'Grade', C.creditHours
FROM NonGucianStudentTakeCourse  G INNER JOIN COURSE C ON G.cid=C.id
WHERE sid=@studentID


GO

--6.e) Student  Views his/her Course payments and installments.
--6e.1 View all my payments and installments.
CREATE PROCEDURE ViewCoursePaymentsInstall
@studentID int
AS
SELECT C.code as "Course_Code" ,P.amount as "Payment_Amount",P.fundPercentage as "Payment_fund_percentage",P.no_installments as "Number_of_installments",I.amount as "Installment_amount",I.date as "Installment_Date",I.done as "Installment_Payed"
FROM Payment P INNER JOIN Installment I ON P.id=I.paymentId
INNER JOIN NonGucianStudentPayForCourse G ON I.paymentId=G.paymentNo 
INNER JOIN Course C ON G.cid=C.id
WHERE sid=@studentID

GO

--6e.2 view Thesis Payment
create proc ViewThesisPaymentsInstall
@studentID int
AS
if(exists(select * from GucianStudent where id = @studentID))
begin
select P.id as 'Payment ID',P.amount AS 'Thesis Payment Amount' , P.fundPercentage as 'Payment Fund Percentage',
P.no_Installments as 'Payment number of Installments',I.paymentId as 'Instalmment belonging to',
I.amount as 'Installment Amount',I.date as 'Installment date', I.done as 'Installment Done or Not'
from GucianStudent GUC Inner Join GUCianStudentRegisterThesis GUCTHESIS 
on GUC.id = GUCTHESIS.sid Inner Join Thesis T on GUCTHESIS.serial_no = T.serialNumber
Inner Join Payment P on T.payment_id = P.id Inner Join Installment I on P.id = I.paymentId
where GUC.id = @studentID
end
else if(exists(select * from NonGucianStudent where id=@studentID) )
begin
select P.id as 'Payment ID',P.amount AS 'Thesis Payment Amount' , P.fundPercentage as 'Payment Fund Percentage',
P.no_Installments as 'Payment number of Installments',I.paymentId as 'Instalmment belonging to',
I.amount as 'Installment Amount',I.date as 'Installment date', I.done as 'Installment Done or Not'
from NonGucianStudent NONGUC Inner Join NonGUCianStudentRegisterThesis NONGUCTHESIS 
on NONGUC.id = NONGUCTHESIS.sid Inner Join Thesis T on NONGUCTHESIS.serial_no = T.serialNumber
Inner Join Payment P on T.payment_id = P.id Inner Join Installment I on P.id = I.paymentId
where NONGUC.id = @studentID
end
else print('You can not view Payments for Non existing ID');

GO

--6e.3 view upcoming installment
create proc ViewUpcomingInstallments
@studentID int
AS
if(exists(select * from GucianStudent where id = @studentID))
begin
select I.*
from GucianStudent GUC Inner Join GUCianStudentRegisterThesis GUCTHESIS 
on GUC.id = GUCTHESIS.sid Inner Join Thesis T on GUCTHESIS.serial_no = T.serialNumber
Inner Join Payment P on T.payment_id = P.id Inner Join Installment I on P.id = I.paymentId
where I.date >= CURRENT_TIMESTAMP and GUC.id = @studentID
order by I.date
end
else if(exists(select * from NonGucianStudent where id = @studentID))
begin
select I.*
from NonGucianStudent NONGUC Inner Join NonGUCianStudentRegisterThesis NONGUCTHESIS 
on NONGUC.id = NONGUCTHESIS.sid Inner Join Thesis T on NONGUCTHESIS.serial_no = T.serialNumber
Inner Join Payment P on T.payment_id = P.id Inner Join Installment I on P.id = I.paymentId
where NONGUC.id = @studentID and I.date >= CURRENT_TIMESTAMP
Union
select I.*
from NonGucianStudentPayForCourse COR Inner Join Payment P on COR.paymentNo = P.id
Inner Join Installment I on P.id = I.paymentId
where COR.sid = @studentID and I.date >= CURRENT_TIMESTAMP
end
else print('You Can not View UpComing Installments for Non Existing StundetID') 

GO
--6e.4 view missed Installments
create proc ViewMissedInstallments
@studentID int
AS
if(exists(select * from GucianStudent where id=@studentID))
begin
select I.*
from GUCianStudentRegisterThesis GUCTHESIS Inner Join Thesis T on GUCTHESIS.serial_no = T.serialNumber
Inner Join Payment P on T.payment_id = P.id Inner Join Installment I on P.id = I.paymentId
where I.done = '0' and GUCTHESIS.sid = @studentID
end
else if(exists(select * from NonGucianStudent where id = @studentID))
begin 
select I.*
from NonGUCianStudentRegisterThesis NONGUCTHESIS Inner Join Thesis T on NONGUCTHESIS.serial_no = T.serialNumber
Inner Join  Payment P on T.payment_id = P.id Inner Join Installment I on P.id = I.paymentId
where NONGUCTHESIS.sid = @studentID and I.done = '0'
end
else print('You Can not Show Non paid installments of wrong Student ID')

GO
--6f.1 Add and fill my progress report(s).

--6f.2 Fill the progress Report
--ProgressReport has a missing attribute description varchar(200)
--we added description in the table 
create proc FillProgressReport
@thesisSerialNo int,@progressReportNo int,@state int,@description varchar(200),@sid int,
@Success_bit int output
AS
declare @StdID int
declare @SupID int
if(exists(select * from GUCianProgressReport g inner join thesis t on g.thesisSerialNumber=t.serialNumber
where thesisSerialNumber = @thesisSerialNo and no = @progressReportNo and sid=@sid and t.startDate<=CURRENT_TIMESTAMP and t.endDate>=CURRENT_TIMESTAMP))
begin
update GUCianProgressReport set state = @state, description = @description
where thesisSerialNumber = @thesisSerialNo and sid=@sid and no = @progressReportNo
set @Success_bit=1
end
else if(exists(select * from NonGUCianProgressReport g inner join thesis t on g.thesisSerialNumber=t.serialNumber
where thesisSerialNumber = @thesisSerialNo and no = @progressReportNo and
sid=@sid  and t.startDate<=CURRENT_TIMESTAMP and t.endDate>=CURRENT_TIMESTAMP))
begin
update NonGUCianProgressReport set state = @state, description = @description
where thesisSerialNumber = @thesisSerialNo and no = @progressReportNo and sid=@sid
set @Success_bit=1
end
else
begin
if(exists(select * from NonGUCianProgressReport g inner join thesis t on g.thesisSerialNumber=t.serialNumber
where thesisSerialNumber = @thesisSerialNo and no = @progressReportNo and sid=@sid)
or exists(select * from GUCianProgressReport g inner join thesis t on g.thesisSerialNumber=t.serialNumber
where thesisSerialNumber = @thesisSerialNo and no = @progressReportNo and sid=@sid ))
begin
set @Success_bit=-1
end
else
set @Success_bit=0
end
go

create proc AddProgressReport
@thesisSerialNo int,@progressReportDate date,
@StdID int,
@Success_bit int output,
@progress_num int output
AS
declare @prgNUM int
declare @SupID int
declare @prgNUM1 int
if(exists(select * from GUCianStudentRegisterThesis gst inner join Thesis t 
on t.serialNumber=gst.serial_no 
where serial_no = @thesisSerialNo and gst.sid=@StdID and  CURRENT_TIMESTAMP>=startDate and CURRENT_TIMESTAMP<=endDate))
begin
select @SupID = supid
from GUCianStudentRegisterThesis
where serial_no = @thesisSerialNo

select @prgNUM=max(no)
from GUCianProgressReport gr inner join GUCianStudentRegisterThesis gt
on gr.sid=gt.sid 
where gt.sid = @StdID  

if(@prgNUM is null)
set @prgNum1=1
else
set @prgNUM1 = @prgNUM + 1

insert into GUCianProgressReport (sid,no,date,eval,state,thesisSerialNumber,supid)
values (@StdID,@prgNUM1,@progressReportDate,null,null,@thesisSerialNo,@SupID)
set @Success_bit=1
set @progress_num =@prgNum1
end

else if(exists(select * from NonGUCianStudentRegisterThesis ngst  inner join Thesis t
on t.serialNumber=ngst.serial_no  
where ngst.sid=@StdID and serial_no = @thesisSerialNo and  CURRENT_TIMESTAMP>=startDate and CURRENT_TIMESTAMP<=endDate))
begin
select @SupID = supid
from NonGUCianStudentRegisterThesis
where serial_no = @thesisSerialNo

select @prgNUM = max(no)
from NonGUCianProgressReport gr inner join NonGUCianStudentRegisterThesis gt
on gr.sid=gt.sid
where gt.sid = @StdID  

if(@prgNUM is null)
set @prgNum1=1
else
set @prgNUM1 = @prgNUM + 1
insert into NonGUCianProgressReport (sid,no,date,eval,state,thesisSerialNumber,supid)
values (@StdID,@prgNUM1,@progressReportDate,null,null,@thesisSerialNo,@SupID)
set @Success_bit=1
set @progress_num =@prgNum1
end

else
begin
if(exists(select * from GUCianStudentRegisterThesis gst inner join Thesis t 
on t.serialNumber=gst.serial_no  where serial_no = @thesisSerialNo and gst.sid=@StdID) or
exists(select * from NonGUCianStudentRegisterThesis gst inner join Thesis t 
on t.serialNumber=gst.serial_no  where serial_no = @thesisSerialNo and gst.sid=@StdID) )
begin
set @progress_num =-1
set @Success_bit=0
end
else
begin
set @progress_num =-1
set @Success_bit=-1
end
end

go
--6g  View my progress report(s) evaluations.
create proc ViewEvalProgressReport
@thesisSerialNo int,@progressReportNo int
AS 
if(exists(select * from GUCianProgressReport where no = @progressReportNo and thesisSerialNumber = @thesisSerialNo))
select eval from GUCianProgressReport where no = @progressReportNo and thesisSerialNumber = @thesisSerialNo
else if(exists(select * from NonGUCianProgressReport where thesisSerialNumber = @thesisSerialNo and no = @progressReportNo))
select eval from NonGUCianProgressReport where no = @progressReportNo and thesisSerialNumber = @thesisSerialNo
else print('You can not view evaluation of non existing progress report')

GO
--6h Add publication.

--6h Add publication.
create proc addPublication
@title varchar(50),@pubDate datetime,@host varchar(50),@place varchar(50),@accepted bit,
@Success_bit int output,
@pub_id int output
AS
insert into Publication (title,date,place,accepted,host)
values(@title,@pubDate,@place,@accepted,@host)
set @Success_bit =1
select @pub_id=max(id)
from Publication

go

--modified omar version
--6i Link publication to my thesis.
create proc linkPubThesis
@PubID int,@thesisSerialNo int,@sid int,
@Success_bit int output,
@thesis_title varchar(50) output,
@publication_title varchar(50) output
AS
if(not exists(select * from Publication where id = @PubID) )
begin
set @Success_bit =0
set @publication_title=null
set @thesis_title=null
end
else if(not exists(select * from GUCianStudentRegisterThesis where serial_no=@thesisSerialNo and sid=@sid)and not Exists(select * from NonGUCianStudentRegisterThesis where serial_no=@thesisSerialNo and sid=@sid))
begin
set @Success_bit =100
set @publication_title=null
set @thesis_title=null
end
else if(exists(select * from ThesisHasPublication where serialNo=@thesisSerialNo and pubid=@PubID))
begin
set @Success_bit =200
set @publication_title=null
set @thesis_title=null
end

else 
begin
if(exists(select * from Thesis  where serialNumber=@thesisSerialNo and CURRENT_TIMESTAMP<=endDate and CURRENT_TIMESTAMP>=startDate))
begin

insert into ThesisHasPublication (serialNo,pubid)
values (@thesisSerialNo,@PubID)
set @Success_bit =1

select @thesis_title=title
from Thesis
where serialNumber=@thesisSerialNo

select @publication_title=title
from Publication
where id=@PubID
end 
else
begin
if(exists(select * from Thesis t inner join GUCianStudentRegisterThesis g on g.serial_no=t.serialNumber where sid=@sid and serialNumber=@thesisSerialNo)
or exists(select * from Thesis t inner join NonGUCianStudentRegisterThesis g on g.serial_no=t.serialNumber where sid=@sid and serialNumber=@thesisSerialNo)
)
begin
set @Success_bit =-1
set @publication_title=null
set @thesis_title=null
end
else
begin
set @Success_bit =-2
set @publication_title=null
set @thesis_title=null
end
end
end

go

CREATE PROCEDURE Update_Examiner
@ExaminerID int,
@ExaminerName varchar(20),
@fieldOfWork varchar(20),
@success bit output
AS
if (not exists(Select * from Examiner where id = @ExaminerID
)) begin
       set @success = '0' end

	   else UPDATE Examiner SET name=@ExaminerName , fieldOfWork =@fieldOfWork WHERE id = @ExaminerID
	        set @success = '1'
	  
	  

--                                  (NEW FOR EXAMINER PAGE)
go
CREATE PROCEDURE View_Examiner
@ExaminerID int
as 
select * from Examiner where  id = @ExaminerID

go


create PROCEDURE AddDefenseGrade
@ThesisSerialNo int ,
@DefenseDate Datetime ,
@grade decimal,
@success1 bit output,
@success2 bit output
AS
if( exists(Select * from Defense where serialNumber = @ThesisSerialNo and date=@DefenseDate
)) begin 
        
    UPDATE Defense
    SET grade=@grade
    WHERE serialNumber=@ThesisSerialNo AND date=@DefenseDate
      set @success1='1' 
	  set @success2='1'
	  end
else if(exists(Select * from Defense where serialNumber = @ThesisSerialNo and date <>@DefenseDate
)) begin 
       set @success1='1' 
	   set @success2='0'
	  end
 else if(exists(Select * from Defense where serialNumber <> @ThesisSerialNo and date =@DefenseDate
)) begin 
       set @success1='0' 
	   set @success2='1'
	  end
else set @success1='0' 
	   set @success2='0'


GO

-- 5b) Add comments for a defense. (NEW UPDATES IN THIS  ZIAD)
create PROCEDURE AddCommentsGrade
@ThesisSerialNo int ,
@DefenseDate Datetime ,
@comments varchar(300),
@success1 bit output,
@success2 bit output
AS
if( exists(Select * from Defense where serialNumber = @ThesisSerialNo and date=@DefenseDate
)) begin 
	UPDATE ExaminerEvaluateDefense
	SET comment = @comments
	WHERE serialNo = @ThesisSerialNo AND date = @DefenseDate
	set @success1='1' 
	set @success2='1'
	  end
else if(exists(Select * from Defense where serialNumber = @ThesisSerialNo and date <>@DefenseDate
)) begin 
       set @success1='1' 
	   set @success2='0'
	  end
 else if(exists(Select * from Defense where serialNumber <> @ThesisSerialNo and date =@DefenseDate
)) begin 
       set @success1='0' 
	   set @success2='1'
	  end
else set @success1='0' 
	   set @success2='0'

	   

GO
create procedure ListAll     --(NEW PROCEDURE ZIAD)

@ExaminerID int
as 
select T.title , GS.firstName,GS.lastName,S.name
from Examiner E inner join ExaminerEvaluateDefense Ex on E.id = Ex.examinerId
              inner join GUCianStudentRegisterThesis G on Ex.serialNo=G.serial_no
			  inner join Thesis T on G.serial_no=T.serialNumber
			  inner join Supervisor S on G.supid=S.id
			  inner join GucianStudent GS on G.sid=GS.id
              where E.id=@ExaminerID
			 
Union 
select T.title , GS.firstName,GS.lastName,S.name
from Examiner E inner join ExaminerEvaluateDefense Ex on E.id = Ex.examinerId
              inner join NonGUCianStudentRegisterThesis G on Ex.serialNo=G.serial_no
			  inner join Thesis T on G.serial_no=T.serialNumber
			  inner join Supervisor S on G.supid=S.id
			  inner join NonGucianStudent GS on G.sid=GS.id
			  where E.id=@ExaminerID


			
go




 

 go

 create PROCEDURE SearchThesis   --(NEW PROCEDURE ZIAD)
 @word varchar(40)
As
select *  from Thesis
where title like CONCAT('%',@word,'%')


go
create procedure hasDefense @ThesisSerial int,@success bit out
as
if(exists(select * from Defense where serialNumber = @ThesisSerial)) set @success=0;
else set @success=1

go

create procedure getThesisEnd @serial int,@inDate datetime , @x bit output
as
if @inDate > (select enddate from Thesis where serialNumber = @serial)
set @x = 1
else set @x=0

go

create procedure findEmail @email varchar(80) , @f bit out
as
if(exists(select * from PostGradUser where email = @email)) set @f=0
else set @f=1

go


select date from Defense where serialNumber = 4
select *
from Thesis