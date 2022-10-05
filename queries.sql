SELECT DISTINCT content
FROM Message
WHERE content LIKE '%selam%';

SELECT * 
FROM Message 
WHERE sent_by > 2 
ORDER BY sent_by;

SELECT post_id, COUNT(*) as Likes
FROM Post_Like
GROUP BY post_id;

SELECT user_id, first_name, last_name, entry_body 
FROM Post, User 
WHERE user_id = published_by;

SELECT first_name, last_name
FROM User, Course
WHERE given_by = user_id;

-- Job_Ad oluşturan Business_Page'lerin bilgileri getirilir
SELECT page_name, Job_Ad.title, description
FROM Business_Page, Job_Ad
WHERE Business_Page.page_id = Job_Ad.page_id AND Job_Ad.page_id = 6; 
 
SELECT first_name, last_name, gpa
FROM User, Student
WHERE student_id = user_id;

-- İstenen kullanıcın eğitim enstitüsü bilgilerini listeliyor
SELECT first_name, last_name, page_name
FROM User, Edu_Experience AS edu_ex, Business_Page AS bp
Where bp.page_id = edu_ex.page_id AND User.user_id = 102 AND User.user_id = edu_ex.user_id;

-- farklı açıklamalara sahip ödevlerin ders bilgileri listeleniyor
SELECT DISTINCT Assignment.description ,lesson_name, User.first_name, User.last_name
FROM Assignment, Lesson, User
WHERE Assignment.lesson_id = Lesson.lesson_id AND User.user_id = Lesson.instructor_id;

-- Post'a yapılan yorum ve kullanıcı bilgileri
SELECT Post.post_id, Comment.content, User.username
FROM Post, Comment, User
WHERE Post.post_id = Comment.post_id AND Comment.user_id = User.user_id;

-- bir kullanıcının bütün tecrübeleri (work + educational)
SELECT DISTINCT first_name, last_name, page_name AS Experience_at
FROM User, Edu_Experience, Business_Page
Where Business_Page.page_id = Edu_Experience.page_id AND User.user_id = 102 AND User.user_id = Edu_Experience.user_id
UNION
SELECT DISTINCT first_name, last_name, page_name AS Experience_at
FROM User, Work_Experience, Business_Page
Where Business_Page.page_id = Work_Experience.page_id AND User.user_id = 102 AND User.user_id = Work_Experience.user_id;

-- belirlenen aralıklardaki maaş için iş ve sektör bilgileri
SELECT ja1.title, ja1.salary, bp.industry
FROM Business_Page AS bp, Job_Ad AS ja1
WHERE bp.page_id = ja1.page_id AND ja1.page_id IN (
	SELECT ja2.page_id
	FROM Job_Ad AS ja2
	WHERE salary BETWEEN 30000 AND 90000);


-- organizer_id iki farklı tablodan (User&Company) toplanıyor
-- trigger kullanılmadığı durumda şart
WITH Mix as (
SELECT * FROM User
JOIN Company
UNION
SELECT * FROM Company
JOIN User)
SELECT DISTINCT user_id AS organizer_id from Mix;

-- İşyerlerinin 4 tablodan detaylarının görüntülenmesi
SELECT Company.page_id as ID, Business_Page.page_name as BusinessName, Business_Page.user_id as CreatorID, User.first_name as FirstName, User.last_name as LastName, Business_Page.title, Business_Page.industry
FROM User, Company JOIN Business_Page ON Company.page_id = Business_Page.page_id
WHERE User.user_id = Business_Page.user_id
UNION
SELECT Edu_Institute.page_id as ID, Business_Page.page_name as BusinessName, Business_Page.user_id as CreatorID, User.first_name as FirstName, User.last_name as LasttName, Business_Page.title, Business_Page.industry
FROM User, Edu_Institute JOIN Business_Page ON Edu_Institute.page_id = Business_Page.page_id
WHERE User.user_id = Business_Page.user_id;

-- Her eğitmenin verdiği ödev sayısı
SELECT instructor_id, User.first_name, User.last_name, COUNT(assignment_id) AS NumOfAssignments
FROM Ins_Assigns, User
WHERE instructor_id = user_id
GROUP BY instructor_id;

