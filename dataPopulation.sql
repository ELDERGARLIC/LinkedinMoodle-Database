use LinkedinMoodle;

INSERT INTO User values (101, 'burakylmz', 'male', 'password', '065605606', 'Burak','Yılmaz','Eskişehir','Turkey','1978-11-17', '2020-02-01', '/user.jpg', '2022-02-02');
INSERT INTO User values (102, 'eldergarlic', 'male', 'password-1', '05467981379', 'Mahdi','Sarhangi','Tehran','Iran','2000-02-07', '2021-01-22', '/user.jpg', '2022-01-01');
INSERT INTO User values (103, 'cece', 'female', 'password-2', '05350643899', 'Ece','Tek','Mersin','Turkey','1999-10-26', '2022-01-22', '/user.jpg', '2022-01-01');
INSERT INTO User values (104, 'velicious', 'male', 'password-3', '05316672404', 'Veli','Yasar','Manisa','Turkey','1997-05-29', '2022-01-22', '/user.jpg', '2022-01-08');
INSERT INTO User values (105, 'selinpaksoy35', 'female', 'password-4', '0511605606', 'Selin','Paksoy','Izmir','Turkey','2001-03-30', '2022-01-22', '/user.jpg', '2022-01-27');
INSERT INTO User values (106, 'murat.osma.unalir', 'male', 'password-5', '05325843535', 'Murat Osman','Unalir','Aydin','Turkey','1975-01-01', '2022-01-22', '/user.jpg', '2022-01-22');
INSERT INTO User values (107, 'seliamaksoy', 'male', 'password-6', '0511601106', 'Selim','Aksoy','Manisa','Turkey','1987-03-30', '2022-01-22', '/user.jpg', '2022-01-29');
INSERT INTO User values (108, 'emineplt', 'female', 'password-7', '05325843789', 'Emine','Polat','Aydin','Turkey','2000-06-06', '2022-01-22', '/user.jpg', '2022-01-29');

INSERT INTO Course values (1, '2022-01-22', 100, 'Mathematics', 'Easy', 7.2, 101);
INSERT INTO Course values (2, '2020-01-22', 120, 'Data Structors', 'Hard', 9.0, 105);
INSERT INTO Course values (3, '2019-01-22', 150, 'Database Management', 'Hard', 8.6, 106);
INSERT INTO Course values (4, '2022-01-25', 110, 'Statistics', 'Medium', 6.6, 107);
INSERT INTO Course values (5, '2022-01-27', 110, 'Digital Computer Design', 'Medium', 3.2, 108);

INSERT INTO Post values (1, 'Welcome to new semester!', 'Greeting Message!', 102);
INSERT INTO Post values (2, 'It is raining today!', 'Weather Information', 102);
INSERT INTO Post values (3, 'The homework is due tomorrow!', 'Homework Information', 106);
INSERT INTO Post values (4, 'Your exam is postponed!', 'Exam Information', 107);
INSERT INTO Post values (5, 'Looking for internship!', 'Job Info', 103);

INSERT INTO Community values(1, 'Alumni of Ege Univesity gather here!', 'Computer Engineers', '2022-02-22', 106);
INSERT INTO Community values(2, 'Here we talk about tech!', 'Root Tech Community', '2021-12-02', 101);
INSERT INTO Community values(3, 'We are always looking for the best talents!', 'Projects Community', '2022-01-13', 107);
INSERT INTO Community values(4, 'Through engaging learning journeys!', 'Professional Training', '2021-10-14', 108);

INSERT INTO Message values(1,'Selam Mahdi', '2022-01-22', 101,102);
INSERT INTO Message values(2,'Burak selam', '2022-01-22', 102,101);
INSERT INTO Message values(3,'how you doin veli?', '2022-01-22', 104,103);
INSERT INTO Message values(4,'im doin fine and you ece?', '2022-01-22', 103,104);
INSERT INTO Message values(5,'im fine too see you later', '2022-01-22', 104,103);
INSERT INTO Message values(6,'raporu da yazmadik aaaağğğğ!', '2022-01-22', 102,105);

INSERT INTO University values(1,'2022-01-29', 'Ege University');
INSERT INTO University values(2,'2020-02-19', 'Bogazici University');
INSERT INTO University values(3,'2021-03-27', 'Istanbul Technical University');

INSERT INTO Faculty values(1,'2022-01-29', 'Faculty of Engineering ',1);
INSERT INTO Faculty values(2,'2021-03-27', 'Faculty of Medicine',1);
INSERT INTO Faculty values(3,'2020-02-19', 'Faculty Nursing ',1);
INSERT INTO Faculty values(4,'2022-01-29', 'Faculty of Engineering ',2);
INSERT INTO Faculty values(5,'2021-03-27', 'Faculty of Medicine',3);
INSERT INTO Faculty values(6,'2020-02-19', 'Faculty Nursing ',3);

INSERT INTO Department values(1,'2022-01-22', 'Computer Engineering', 1);
INSERT INTO Department values(2,'2022-01-22', 'Chemical Engineering', 1);
INSERT INTO Department values(3,'2022-01-22', 'Electrical Engineering', 1);

INSERT INTO Student values(102,3.6,1);
INSERT INTO Student values(103,3.1,2);
INSERT INTO Student values(104,2.6,3);
INSERT INTO Student values(107,2.1,1);
INSERT INTO Student values(108,2.8,3);

INSERT INTO Instructor values(101, "Computer Science");
INSERT INTO Instructor values(106, "Database Management");
INSERT INTO Instructor values(105, "Statistics");

INSERT INTO Lesson values(1, 4545, "Algorithms","Spring",2022,1,101);
INSERT INTO Lesson values(2, 4546, "Database Management","Fall",2022,1,106);
INSERT INTO Lesson values(3, 4547,"Data Structures","Spring",2022,1,101);
INSERT INTO Lesson values(4, 4548,"Data Structures-2","Fall",2022,1,105);

INSERT INTO Assignment values(1, 'Database Homework', './test1.pdf', '2022-01-29 09:00:00', '2022-01-31 23:30:00', 2);
INSERT INTO Assignment values(2, 'Database Homework', './test2.pdf', '2022-01-20 10:00:00', '2022-01-28 23:59:00', 2);
INSERT INTO Assignment values(3, 'Algo-1 Term Project', './test3.pdf', '2022-01-20 10:00:00', '2022-01-30 23:59:00', 2);

-- farklı zamanlarda aynı kullanıcı aynı yourumu yapabilir
INSERT INTO Comment values(2,102,'Great!','2022-01-29 13:10:01');
INSERT INTO Comment values(2,102,'Great!','2022-01-29 14:41:22');
INSERT INTO Comment values(3,105,'Good news!','2020-01-29 09:11:50');
INSERT INTO Comment values(5,108,'Good Afternoon!','2021-01-29 19:01:12');

INSERT INTO Post_Like values(1,101);
INSERT INTO Post_Like values(1,102);
INSERT INTO Post_Like values(1,103);
INSERT INTO Post_Like values(1,104);
INSERT INTO Post_Like values(2,105);
INSERT INTO Post_Like values(2,102);
INSERT INTO Post_Like values(2,108);
INSERT INTO Post_Like values(3,101);
INSERT INTO Post_Like values(4,102);
INSERT INTO Post_Like values(4,103);
INSERT INTO Post_Like values(4,104);

INSERT INTO Community_Members values(1,102);
INSERT INTO Community_Members values(1,103);
INSERT INTO Community_Members values(1,104);
INSERT INTO Community_Members values(2,102);
INSERT INTO Community_Members values(2,108);
INSERT INTO Community_Members values(3,105);

INSERT INTO User_Recommends values(101,102, 'I think you should check him out!');
INSERT INTO User_Recommends values(102,105, 'I recommend this ambitious student!');
INSERT INTO User_Recommends values(102,103, 'very good programmer!');

INSERT INTO User_Enrolls values(101,1);
INSERT INTO User_Enrolls values(102,1);
INSERT INTO User_Enrolls values(103,2);
INSERT INTO User_Enrolls values(102,2);
INSERT INTO User_Enrolls values(105,2);

INSERT INTO Ins_Assigns values(101,1);
INSERT INTO Ins_Assigns values(106,2);
INSERT INTO Ins_Assigns values(106,1);

INSERT INTO Std_Loads values(102,1,'./file.pdf');
INSERT INTO Std_Loads values(103,1,'./file.pdf');
INSERT INTO Std_Loads values(104,2,'./file.pdf');
INSERT INTO Std_Loads values(103,2,'./file.pdf');

INSERT INTO Taken_Lessons values(102,1);
INSERT INTO Taken_Lessons values(102,2);
INSERT INTO Taken_Lessons values(103,1);

-- ilk 3 eğitim son 3 şirket
INSERT INTO Business_Page values(4,103,"Ece's LTD.", "Carpe diem", "Data Science");
INSERT INTO Business_Page values(5,102,"Mahdi Sube 2 LTD.", "lorem ipsum", "Transportation");
INSERT INTO Business_Page values(6,103,"Mahdi Sube 3 LTD.", "lorem ipsum", "Data Science");
INSERT INTO Business_Page values(1,104,"Mahdi Sube 4 LTD.", "lorem ipsum", "Education");
INSERT INTO Business_Page values(2,104,"University of Veli", "Contemporary solutions!", "Education");
INSERT INTO Business_Page values(3,102,"Mahdi LTD.", "Lorem ipsum", "Self-Improvement");


INSERT INTO Edu_Institute values(1);
INSERT INTO Edu_Institute values(2);
INSERT INTO Edu_Institute values(3);

INSERT INTO Company values(4, 'Charity');
INSERT INTO Company values(5, 'Non Profit');
INSERT INTO Company values(6, 'Charity');

INSERT INTO Edu_Experience values(1,'Masters','2022-01-29','2023-01-29', 102,3);
INSERT INTO Edu_Experience values(2,'Certificate','2022-01-29','2023-01-29', 102,2);
INSERT INTO Edu_Experience values(3,'Bachelors','2022-01-29','2023-01-29', 102,1);
INSERT INTO Edu_Experience values(4,'Masters','2022-01-29','2023-01-29', 104,2);
INSERT INTO Edu_Experience values(5,'Bachelors','2022-01-29','2023-01-29', 105,3);
INSERT INTO Edu_Experience values(6,'Certificate','2022-01-29','2023-01-29', 106,2);

INSERT INTO Work_Experience values(1,'CEO','2021-04-29','2022-01-29', 102,4);
INSERT INTO Work_Experience values(2,'Junior Frontend Developer','2019-01-29','2020-01-29', 102,5);
INSERT INTO Work_Experience values(3,'Software Developer','2019-11-29','2022-01-20', 103,6);
INSERT INTO Work_Experience values(4,'Junior Developer','2020-10-29','2021-03-29', 103,5);
INSERT INTO Work_Experience values(5,'Full Stack Developer','2020-02-29','2022-01-29', 104,5);
INSERT INTO Work_Experience values(6,'Junior Software Developer','2019-05-29','2021-01-29', 105,6);

INSERT INTO Job_Ad values(1,"Front-end developer needed!","İzmir",20000,"Job Descb",6);
INSERT INTO Job_Ad values(2,"Windows developer position is open to hire!","İzmir",40000,"Job Descb",5);
INSERT INTO Job_Ad values(3,"Internship programs are open!","İzmir",3400,"Job Descb",4);
INSERT INTO Job_Ad values(4,"Janitor needed!","İzmir",19000,"Job Descb",3);
INSERT INTO Job_Ad values(5,"Data scientist needed!","İzmir",70000,"Job Descb",2);
INSERT INTO Job_Ad values(6,"New graduates are welcome for master's degree!","İzmir",5000,"Job Descb",1);

INSERT INTO Event values(1,'2021-12-29','2022-01-29 20:30:00',105,"Online","Teatalk");
INSERT INTO Event values(2,'2022-02-01','2022-03-10 11:00:00',4,"İzmir","Tech Week");

INSERT INTO User_Interests values(101 ,4);
INSERT INTO User_Interests values(101 ,6);
INSERT INTO User_Interests values(102 ,4);

INSERT INTO User_Work_Experiences values(4 ,101);
INSERT INTO User_Work_Experiences values(6 ,102);
INSERT INTO User_Work_Experiences values(5 ,102);
INSERT INTO User_Work_Experiences values(5 ,104);

INSERT INTO User_Edu_Experiences values(2 ,101);
INSERT INTO User_Edu_Experiences values(2 ,105);
INSERT INTO User_Edu_Experiences values(1 ,106);

UPDATE User SET username='emineplt'WHERE username='emine_plt';
DELETE FROM Business_Page where page_id = 3;

UPDATE Work_Experience SET user_id=105 WHERE page_id=5;
DELETE FROM Work_Experience WHERE user_id=105 AND page_id=6;  

DELETE FROM Job_Ad WHERE page_id=4; 
UPDATE Job_Ad SET page_id=3 WHERE page_id=7;
