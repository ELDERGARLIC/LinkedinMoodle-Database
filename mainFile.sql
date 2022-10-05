Drop database LinkedinMoodle;
create database LinkedinMoodle;

use LinkedinMoodle;

CREATE TABLE User(
user_id int NOT NULL,
username varchar(50) NOT NULL,
gender varchar(50),
password varchar(50) NOT NULL,
phone_number varchar(50) NOT NULL,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
city varchar(50) NOT NULL,
country varchar(50) NOT NULL,
birth_date date,
last_access date NOT NULL,
profile_photo varchar(50),
join_date date NOT NULL,
UNIQUE(username),
PRIMARY KEY(user_id));

CREATE TABLE Course(
course_id int NOT NULL,
create_date date NOT NULL,
duration_minutes int,
course_title varchar(50) NOT NULL,
course_level varchar(20) NOT NULL,
rate double,
given_by int NOT NULL,
CONSTRAINT user_id_fk_course FOREIGN KEY (given_by) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(course_id));

CREATE TABLE Post(
post_id int NOT NULL,
entry_body varchar(100) NOT NULL,
publish_title varchar(50) NOT NULL,
published_by int NOT NULL,
CONSTRAINT  user_id_fk_post FOREIGN KEY(published_by) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(post_id));

CREATE TABLE Community(
community_id int NOT NULL,
description varchar(50),
community_name varchar(50) NOT NULL,
create_date DATE NOT NULL,
created_by int NOT NULL,
CONSTRAINT user_id_fk_community FOREIGN KEY(created_by) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (community_id));

CREATE TABLE Message(
message_id int NOT NULL,
content varchar(50) NOT NULL,
send_date DATE NOT NULL,
sent_by int NOT NULL,
sent_to int NOT NULL,
CONSTRAINT sender_id_fk_message FOREIGN KEY(sent_by) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT reciever_id_fk_message FOREIGN KEY(sent_to) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (message_id));

CREATE TABLE Event(
event_id int NOT NULL,
create_date DATE NOT NULL,
time DATETIME NOT NULL,
organizer_id int NOT NULL,
location varchar(50) NOT NULL,
event_name varchar(50) NOT NULL,
CONSTRAINT chk_EventDate CHECK (time > create_date),
PRIMARY KEY (event_id)
);

CREATE TABLE Job_Ad(
job_ad_id int NOT NULL,
title varchar(50) NOT NULL,
location varchar(50) NOT NULL,
salary double,
description varchar(50) NOT NULL,
page_id int NOT NULL,
PRIMARY KEY (job_ad_id));


CREATE TABLE University(
university_id int NOT NULL,
create_date DATE NOT NULL,
university_name varchar(50) NOT NULL,
PRIMARY KEY (university_id));

CREATE TABLE Faculty(
faculty_id int NOT NULL,
create_date DATE NOT NULL,
faculty_name varchar(50) NOT NULL,
university_id int NOT NULL,
CONSTRAINT faculty_uni_fk FOREIGN KEY(university_id) references University(university_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(faculty_id));

CREATE TABLE Department(
department_id int NOT NULL,
create_date DATE NOT NULL,
dep_name varchar(50) NOT NULL,
faculty_id int NOT NULL,
CONSTRAINT dep_fac_fk FOREIGN KEY(faculty_id) references Faculty(faculty_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(department_id));

CREATE TABLE Student(
student_id int NOT NULL,
gpa double,
department_id int NOT NULL,
CONSTRAINT user_id_fk_student FOREIGN KEY(student_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT stud_dep_fk FOREIGN KEY(department_id) references Department(department_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (student_id));

CREATE TABLE Instructor(
instructor_id int NOT NULL,
major varchar(50) NOT NULL,
CONSTRAINT user_id_fk_instructor FOREIGN KEY(instructor_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (instructor_id));

CREATE TABLE Lesson(
lesson_id int NOT NULL,
enrollment_key int,
lesson_name varchar(50) NOT NULL,
semester varchar(50) NOT NULL,
year int NOT NULL,
department_id int NOT NULL,
instructor_id int NOT NULL,
UNIQUE(enrollment_key),
CONSTRAINT lesson_dept_fk FOREIGN KEY(department_id) references DEPARTMENT(department_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT lesson_inst_fk FOREIGN KEY(instructor_id) references Instructor(instructor_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (lesson_id));

CREATE TABLE Assignment(
assignment_id int NOT NULL,
description varchar(50),
attachment varchar(50) NOT NULL,
start_date DATETIME NOT NULL,
end_date DATETIME NOT NULL,
lesson_id int NOT NULL,
CONSTRAINT assignment_lesson_fk FOREIGN KEY(lesson_id) references Lesson(lesson_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT chk_Date CHECK (end_date > start_date),
PRIMARY KEY (assignment_id));

CREATE TABLE Comment(
post_id int NOT NULL,
user_id int NOT NULL,
content varchar(50) NOT NULL,
create_date DATETIME NOT NULL,
CONSTRAINT comment_post_fk FOREIGN KEY(post_id) references Post(post_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT user_id_fk_comment FOREIGN KEY(user_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(user_id, post_id, create_date));

CREATE TABLE Post_Like(
post_id int NOT NULL,
user_id int NOT NULL,
CONSTRAINT postlike_postid_fk FOREIGN KEY(post_id) references Post(post_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT user_id_fk_postlike FOREIGN KEY(user_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(user_id, post_id));

CREATE TABLE Community_Members(
community_id int NOT NULL,
user_id int NOT NULL,
CONSTRAINT commember_commid_fk FOREIGN KEY(community_id) references Community(community_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT user_id_fk_communitymem FOREIGN KEY(user_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(user_id, community_id));

CREATE TABLE User_Recommends(
recommender_id int NOT NULL,
recommended_id int NOT NULL,
recommendation varchar(50),
CONSTRAINT user_id_fk_userrecom_1 FOREIGN KEY(recommended_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT user_id_fk_userrecom_2 FOREIGN KEY(recommender_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(recommended_id,recommender_id));

CREATE TABLE User_Enrolls(
user_id int NOT NULL,
course_id int NOT NULL,
CONSTRAINT user_id_fk_userenroll FOREIGN KEY(user_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT userenroll_courseid_fk FOREIGN KEY(course_id) references Course(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (user_id, course_id));

CREATE TABLE User_Attends(
user_id int NOT NULL,
event_id int NOT NULL,
CONSTRAINT user_id_fk_userattends FOREIGN KEY(user_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT userattend_eventid_fk FOREIGN KEY(event_id) references Event(event_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (user_id, event_id));


CREATE TABLE Ins_Assigns(
instructor_id int NOT NULL,
assignment_id int NOT NULL,
CONSTRAINT insassign_instructor_fk FOREIGN KEY(instructor_id) references Instructor(instructor_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT insass_assid_fk FOREIGN KEY(assignment_id) references Assignment(assignment_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (instructor_id, assignment_id));

CREATE TABLE Std_Loads(
student_id int NOT NULL,
assignment_id int NOT NULL,
attachment varchar(100) NOT NULL,
CONSTRAINT stdloads_studentid_fk FOREIGN KEY(student_id) references Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT stdloads_assid_fk FOREIGN KEY(assignment_id) references Assignment(assignment_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (student_id, assignment_id));

CREATE TABLE Taken_Lessons(
student_id int NOT NULL,
lesson_id int NOT NULL,
CONSTRAINT takenlesson_stdid_fk FOREIGN KEY(student_id) references Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT takenlesson_lessid_fk FOREIGN KEY(lesson_id) references Lesson(lesson_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (student_id, lesson_id));

CREATE TABLE User_Applies(
user_id int NOT NULL,
job_ad_id int NOT NULL,
CONSTRAINT user_id_fk_userapplies FOREIGN KEY(user_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT userapplies_jobid_fk FOREIGN KEY(job_ad_id) references Job_Ad(job_ad_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (user_id, job_ad_id));

CREATE TABLE Business_Page(
page_id int NOT NULL,
user_id int NOT NULL,
page_name varchar(50) NOT NULL,
title varchar(50),
industry varchar(50) NOT NULL,
CONSTRAINT user_id_fk_businesspage FOREIGN KEY(user_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (page_id));

CREATE TABLE Edu_Institute(
page_id int NOT NULL,
CONSTRAINT eduinst_pageid_fk FOREIGN KEY(page_id) references Business_Page(page_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (page_id));

CREATE TABLE Company(
page_id int NOT NULL,
company_type varchar(50) NOT NULL,
CONSTRAINT company_businesspage_fk FOREIGN KEY(page_id) references Business_Page(page_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (page_id));


CREATE TABLE Organizer(
organizer_id int NOT NULL,
PRIMARY KEY (organizer_id));

CREATE TABLE Edu_Experience(
edu_exp_id int NOT NULL,
degree varchar(50) NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
user_id int NOT NULL,
page_id int NOT NULL,
CONSTRAINT user_id_fk_eduexp FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT eduexp_eduinst_fk FOREIGN KEY(page_id) references Edu_Institute(page_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT chk_EduDate CHECK (end_date> start_date),
PRIMARY KEY (edu_exp_id));


CREATE TABLE Work_Experience(
work_exp_id int NOT NULL,
title varchar(50) NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
user_id int NOT NULL,
page_id int NOT NULL,
CONSTRAINT user_id_fk_workexp FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT workexp_compid_fk FOREIGN KEY(page_id) references Company(page_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT chk_WorkDate CHECK (end_date> start_date),
PRIMARY KEY (work_exp_id));

-- Business_Page ve Organizer ancak şimdi oluştuğu için ALTER TABLE ile FOREIGN KEY'ler burada ekleniyor
ALTER TABLE Job_Ad ADD CONSTRAINT jobadd_bussid_fk FOREIGN KEY (page_id) references Business_Page (page_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Event ADD CONSTRAINT event_orgid_fk FOREIGN KEY (organizer_id) references Organizer (organizer_id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE User_Interests(
user_id int NOT NULL,
page_id int NOT NULL,
CONSTRAINT user_id_fk_userinster FOREIGN KEY(user_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT userinterests_companyid_fk FOREIGN KEY(page_id) references Company(page_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (user_id,page_id));


CREATE TABLE User_Work_Experiences(
work_exp_id int NOT NULL,
user_id int NOT NULL,
CONSTRAINT user_id_fk_userworkexp FOREIGN KEY (user_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT userworkexp_workexpid_fk FOREIGN KEY(work_exp_id) references Work_Experience(work_exp_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (user_id,work_exp_id));

CREATE TABLE User_Edu_Experiences(
edu_exp_id int NOT NULL,
user_id int NOT NULL,
CONSTRAINT user_id_fk_usereduexp FOREIGN KEY (user_id) references User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT usereduexp_eduexpid_fk FOREIGN KEY(edu_exp_id) REFERENCES Edu_Experience(edu_exp_id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (user_id,edu_exp_id));

-- Alınan mesajlar INSERT yerine TRIGGER ile dolduruluyor
CREATE TABLE Recieved_Messages(
sender_id int DEFAULT 0,
reciever_id int DEFAULT 0,
content VARCHAR(50) DEFAULT ' ',
PRIMARY KEY (sender_id ,reciever_id , content));

delimiter |
-- User'a yeni tuple eklendiğinde Organizer'e User'ın user_id'si eklenir
CREATE TRIGGER insert_organizer_usr    
    AFTER INSERT  
         ON User 
         FOR EACH ROW BEGIN    
         INSERT INTO Organizer SET organizer_id = NEW.user_id;
        END;     

-- Company'e yeni tuple eklendiğinde Organizer'e Company'nin page_id'si eklenir
CREATE TRIGGER insert_organizer_comp    
    AFTER INSERT  
         ON Company 
         FOR EACH ROW BEGIN    
         INSERT INTO Organizer SET organizer_id = NEW.page_id;
        END;     

-- User'ı UPDATE ettiğimizde güncel User'ın user_id'si Organizer'e eklenir
CREATE TRIGGER update_organizer_usr    
    AFTER UPDATE  
         ON User 
         FOR EACH ROW BEGIN    
         UPDATE Organizer SET organizer_id = NEW.user_id WHERE organizer_id = NEW.user_id;
        END;     

-- Company'ı UPDATE ettiğimizde güncel Company'nin page_id'si Organizer'e eklenir
CREATE TRIGGER update_organizer_comp    
    AFTER UPDATE  
         ON Company 
         FOR EACH ROW BEGIN    
         UPDATE Organizer SET organizer_id = NEW.page_id WHERE organizer_id = NEW.page_id;
        END;     
        
-- User'dan bir tuple silinirse Organizer'dan da aynı tuple silinir
CREATE TRIGGER delete_organizer_usr    
    AFTER DELETE  
         ON User 
         FOR EACH ROW BEGIN    
         DELETE FROM Organizer WHERE organizer_id = user_id;
        END;     
        
-- Company'den bir tuple silinirse Organizer'dan da aynı tuple silinir   
CREATE TRIGGER delete_organizer_comp    
    AFTER DELETE  
         ON Company 
         FOR EACH ROW BEGIN    
         DELETE FROM Organizer WHERE organizer_id = page_id;
        END;     

-- Received_Messages tablosu dolduruluyor
CREATE TRIGGER recieved_messages
    AFTER INSERT  
         ON Message 
         FOR EACH ROW BEGIN    
         INSERT INTO Recieved_Messages SET sender_id = NEW.sent_by, reciever_id = NEW.sent_to, content = NEW.content;
        END;  
        
|
delimiter ;

delimiter |
-- Assertion Triggers

-- SQLSTATE '45000' unhandled user-defined exception
CREATE TRIGGER assertion_communitymember 
	BEFORE INSERT ON Community_Members 
    FOR EACH ROW BEGIN
	IF (NEW.user_id NOT IN(
		SELECT user_id
		FROM User)) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'HATA: Topluluğa eklenmek istenen kullanıcı veritabanında mevcut değil!';
	END IF;
END;


CREATE TRIGGER assertion_instructorstudent
	BEFORE INSERT ON Instructor 
    FOR EACH ROW BEGIN
	IF (NEW.instructor_id IN(
		SELECT student_id
		FROM Student)) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'HATA: Eklenmek isteyen öğrenci eğitmen olamaz!';
	END IF;
END;

CREATE TRIGGER assertion_studentinstructor
	BEFORE INSERT ON Student 
    FOR EACH ROW BEGIN
	IF (NEW.student_id IN(
		SELECT instructor_id
		FROM Instructor)) THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'HATA: Eklenmek isteyen eğitmen öğrenci olamaz!';
	END IF;
END;
  
|
delimiter ;


