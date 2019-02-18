--PROCEDURES added To MileStone 2 Code

CREATE PROCEDURE Website_Original_Content_Search
    @typename  VARCHAR(64),
    @categoryname VARCHAR(64)
AS
    IF @typename IS NULL
        SELECT C.link AS 'Link', C.uploaded_at AS 'Uploaded At', O.rating AS 'rate',
        C.category_type AS 'Category', C.subcategory_name AS 'Subcategory', C.[type] AS 'Type',
        CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) 
        AS 'Contributer Name', U.email AS 'Contributer Email',
        CONCAT(U1.first_name, ' ', U1.middle_name, ' ', U1.last_name) 
        AS 'Reviewer Name', U1.email AS 'Reviewer Email',
        CONCAT(U2.first_name, ' ', U2.middle_name, ' ', U2.last_name) 
        AS 'Content Manager Name', U2.email AS 'Content Manager Email'
        FROM content C 
        INNER JOIN original_content O ON C.id = O.id
        INNER JOIN [user] U ON C.contributer_id = U.id
        INNER JOIN [user] U1 ON O.reviewer_id = U1.id
        INNER JOIN [user] U2 ON O.content_manager_id = U2.id
        WHERE C.category_type = @categoryname
        AND O.filter_status = 1
        AND O.review_status = 1
    ELSE IF @categoryname IS NULL
        SELECT C.link AS 'Link', C.uploaded_at AS 'Uploaded At', O.rating AS 'rate',
        C.category_type AS 'Category', C.subcategory_name AS 'Subcategory', C.[type] AS 'Type',
        CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) 
        AS 'Contributer Name', U.email AS 'Contributer Email',
        CONCAT(U1.first_name, ' ', U1.middle_name, ' ', U1.last_name) 
        AS 'Reviewer Name', U1.email AS 'Reviewer Email',
        CONCAT(U2.first_name, ' ', U2.middle_name, ' ', U2.last_name) 
        AS 'Content Manager Name', U2.email AS 'Content Manager Email'
        FROM content C 
        INNER JOIN original_content O ON C.id = O.id
        INNER JOIN [user] U ON C.contributer_id = U.id
        INNER JOIN [user] U1 ON O.reviewer_id = U1.id
        INNER JOIN [user] U2 ON O.content_manager_id = U2.id
        WHERE C.type = @typename
        AND O.filter_status = 1
        AND O.review_status = 1
    ELSE
        SELECT C.link AS 'Link', C.uploaded_at AS 'Uploaded At', O.rating AS 'rate',
        C.category_type AS 'Category', C.subcategory_name AS 'Subcategory', C.[type] AS 'Type',
        CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) 
        AS 'Contributer Name', U.email AS 'Contributer Email',
        CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) 
        AS 'Reviewer Name', U1.email AS 'Reviewer Email',
        CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) 
        AS 'Content Manager Name', U2.email AS 'Content Manager Email'
        FROM content C 
        INNER JOIN original_content O ON C.id = O.id
        INNER JOIN [user] U ON C.contributer_id = U.id
        INNER JOIN [user] U1 ON O.reviewer_id = U1.id
        INNER JOIN [user] U2 ON O.content_manager_id = U2.id
        WHERE (C.type = @typename
        OR C.category_type = @categoryname)
        AND O.filter_status = 1
        AND O.review_status = 1
GO

CREATE PROCEDURE Website_Contributor_Search
    @fullname VARCHAR(192)
AS
    SELECT first_name AS 'First Name', middle_name AS 'Middle Name', 
    last_name AS 'Last Name', email As 'Email', birth_date AS 'Birth Date', 
    last_login As 'Last Login', age As 'Age', years_of_experience As 'Years Of Experience', 
    specialization AS 'Specialization', portfolio_link AS 'Portfolio Link'
    FROM [user] U INNER JOIN contributor C ON U.id = C.id
    WHERE CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) = @fullname
GO

CREATE PROCEDURE Website_Register_User
    @usertype VARCHAR(64),
    @email VARCHAR(64),
    @password VARCHAR(64),
    @firstname VARCHAR(64),
    @middlename VARCHAR(64),
    @lastname VARCHAR(64),
    @birth_date DATETIME,
    @working_place_name VARCHAR(64),
    @working_place_type VARCHAR(64),
    @wokring_place_description TEXT,
    @specilization VARCHAR(64),
    @portofolio_link VARCHAR(64),
    @years_experience INT,
    @hire_date DATETIME,
    @working_hours INT,
    @payment_rate REAL,
    @user_id INT OUTPUT
AS
    IF NOT EXISTS (SELECT * FROM [user] WHERE email = @email)
    BEGIN
        DECLARE @new_notif_id INT;
        INSERT INTO [user](first_name, middle_name, last_name, email, birth_date, [password], last_login)
        VALUES (@firstname, @middlename, @lastname, @email, @birth_date, @password, CURRENT_TIMESTAMP);
        SELECT @user_id = max(id) FROM [user];

        IF @usertype = 'Viewer'
            BEGIN
                INSERT INTO viewer(id, working_place, working_place_type, working_place_description)
                VALUES (@user_id, @working_place_name, @working_place_type, @wokring_place_description)
            END
        ELSE IF @usertype = 'Contributor'
            BEGIN
                INSERT notified_Person DEFAULT VALUES;
                SELECT @new_notif_id = max(id) FROM notified_Person;

                INSERT INTO contributor(id, years_of_experience, specialization, portfolio_link, notified_id)
                VALUES (@user_id, @years_experience, @specilization, @portofolio_link, @new_notif_id);
            END
        ELSE IF @usertype = 'Authorized Reviewer'
            BEGIN
                INSERT notified_Person DEFAULT VALUES;
                SELECT @new_notif_id = max(id) FROM notified_Person;

                INSERT INTO staff(id, hire_date, working_hours, payment_rate, notified_id) 
                VALUES (@user_id, @hire_date, @working_hours, @payment_rate, @new_notif_id);

                INSERT INTO reviewer(id)
                VALUES (@user_id);
            END
        ELSE IF @usertype = 'Content Manager'
            BEGIN
                INSERT notified_Person DEFAULT VALUES;
                SELECT @new_notif_id = max(id) FROM notified_Person;

                INSERT INTO staff(id, hire_date, working_hours, payment_rate, notified_id) 
                VALUES (@user_id, @hire_date, @working_hours, @payment_rate, @new_notif_id);

                INSERT INTO content_manager(id)
                VALUES (@user_id);
            END
    END
    ELSE
        SET @user_id = -1;
GO

CREATE PROCEDURE Website_User_login
    @email VARCHAR(64),
    @password VARCHAR(64),
    @user_id INT OUTPUT,
    @userType VARCHAR(64) OUTPUT
AS
    IF NOT EXISTS (SELECT id FROM [user] 
    WHERE email = @email AND [password] = @password 
    AND (DATEDIFF(day, last_login, CURRENT_TIMESTAMP) <= 14 OR deactivate = 0))
        SET @user_id = -1;
    ELSE
        BEGIN
            SELECT @user_id = id 
            FROM [user] 
            WHERE email = @email AND [password] = @password

            IF EXISTS (SELECT * FROM viewer WHERE id = @user_id)
                SET @userType = 'Viewer';
            

            IF EXISTS (SELECT * FROM contributor WHERE id = @user_id)
                SET @userType = 'Contributor';


            IF EXISTS (SELECT * FROM reviewer WHERE id = @user_id)
                SET @userType = 'Authorized Reviewer';


            IF EXISTS (SELECT * FROM content_manager WHERE id = @user_id)
                SET @userType = 'Content Manager';

            UPDATE [user]
            SET deactivate = 0, last_login = CURRENT_TIMESTAMP
            WHERE email = @email AND [password] = @password
        END
GO

CREATE PROCEDURE Website_Order_Contributor
AS
	SELECT first_name AS 'First Name', middle_name AS 'Middle Name', 
    last_name AS 'Last Name', email As 'Email', birth_date AS 'Birth Date', 
    last_login As 'Last Login', age As 'Age', years_of_experience As 'Years Of Experience', 
    specialization AS 'Specialization', portfolio_link AS 'Portfolio Link'
    FROM [user] U INNER JOIN contributor C ON U.id = C.id
	ORDER BY years_of_experience DESC
GO

CREATE PROCEDURE Website_Show_Original_Content 
	@contributor_email VARCHAR(64) 
AS
	IF(@contributor_email IS NOT NULL)
		SELECT C.link AS 'Link', C.uploaded_at AS 'Uploaded At', O.rating AS 'rate',
        C.category_type AS 'Category', C.subcategory_name AS 'Subcategory', C.[type] AS 'Type',
        CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) 
        AS 'Contributer Name', U.email AS 'Contributer Email',
        CONCAT(U1.first_name, ' ', U1.middle_name, ' ', U1.last_name) 
        AS 'Reviewer Name', U1.email AS 'Reviewer Email',
        CONCAT(U2.first_name, ' ', U2.middle_name, ' ', U2.last_name) 
        AS 'Content Manager Name', U2.email AS 'Content Manager Email'
        FROM content C 
        INNER JOIN original_content O ON C.id = O.id
        INNER JOIN [user] U ON C.contributer_id = U.id
        INNER JOIN [user] U1 ON O.reviewer_id = U1.id
        INNER JOIN [user] U2 ON O.content_manager_id = U2.id
        WHERE O.filter_status = 1 AND O.review_status = 1 AND U.email = @contributor_email;
	ELSE
		SELECT C.link AS 'Link', C.uploaded_at AS 'Uploaded At', O.rating AS 'rate',
        C.category_type AS 'Category', C.subcategory_name AS 'Subcategory', C.[type] AS 'Type',
        CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) 
        AS 'Contributer Name', U.email AS 'Contributer Email',
        CONCAT(U1.first_name, ' ', U1.middle_name, ' ', U1.last_name) 
        AS 'Reviewer Name', U1.email AS 'Reviewer Email',
        CONCAT(U2.first_name, ' ', U2.middle_name, ' ', U2.last_name) 
        AS 'Content Manager Name', U2.email AS 'Content Manager Email'
        FROM content C 
        INNER JOIN original_content O ON C.id = O.id
        INNER JOIN [user] U ON C.contributer_id = U.id
        INNER JOIN [user] U1 ON O.reviewer_id = U1.id
        INNER JOIN [user] U2 ON O.content_manager_id = U2.id
        WHERE O.filter_status = 1 AND O.review_status = 1

GO

CREATE PROCEDURE Website_Deactivate_Profile
    @email VARCHAR(64),
    @password INT,
    @verdict BIT OUTPUT
AS
    SET @verdict = 1;
    IF EXISTS (SELECT * FROM [user] WHERE email = @email AND [password] = @password)
        UPDATE [user] SET deactivate = 1 WHERE email = @email;
    ELSE
        SET @verdict = 0;
GO

CREATE PROCEDURE Website_Show_Profile
    @user_id INT
AS
    IF EXISTS(SELECT * FROM viewer WHERE @user_id = viewer.id)
        SELECT email,[password], first_name, middle_name, last_name, birth_date,
        working_place, working_place_type, working_place_description
        FROM [user] U INNER JOIN viewer V ON U.id = V.id
        WHERE @user_id = U.id 
    ELSE IF EXISTS(SELECT * FROM contributor WHERE @user_id = contributor.id)
        SELECT email, [password], first_name, middle_name, last_name, birth_date,
        specialization, portfolio_link, years_of_experience
        FROM [user] U INNER JOIN contributor C ON U.id = C.id
        WHERE @user_id = U.id 
    ELSE IF EXISTS(SELECT * FROM staff WHERE @user_id = staff.id)
        SELECT email, [password], first_name, middle_name, last_name, birth_date,
        hire_date, working_hours, payment_rate
        FROM [user] U INNER JOIN staff S ON U.id = S.id
        WHERE @user_id = U.id
GO

CREATE PROCEDURE Website_Edit_Profile
    @user_id INT,
    @email VARCHAR(64),
    @password VARCHAR(64),
    @first_name VARCHAR(64),
    @middle_name VARCHAR(64),
    @last_name VARCHAR(64),
    @birth_date DATETIME,
    @working_place_name VARCHAR(64),
    @working_place_type VARCHAR(64),
    @working_place_description VARCHAR(8000),
    @specialization VARCHAR(64),
    @portfolio_link VARCHAR(64),
    @years_of_experience INT,
    @hire_date DATETIME,
    @working_hours INT,
    @payment_rate REAL
AS
    IF @email IS NOT NULL
        UPDATE [user] SET email = @email WHERE id = @user_id;
    IF @password IS NOT NULL
        UPDATE [user] SET [password] = @password WHERE id = @user_id;
    IF @first_name IS NOT NULL
        UPDATE [user] SET first_name = @first_name WHERE id = @user_id;
    IF @middle_name IS NOT NULL
        UPDATE [user] SET middle_name = @middle_name WHERE id = @user_id;
    IF @last_name IS NOT NULL
        UPDATE [user] SET last_name = @last_name WHERE id = @user_id;
    IF @birth_date IS NOT NULL
        UPDATE [user] SET birth_date = @birth_date WHERE id = @user_id;
    IF @working_place_name IS NOT NULL
        UPDATE viewer SET working_place = @working_place_name WHERE id = @user_id;
    IF @working_place_type IS NOT NULL
        UPDATE viewer SET working_place_type = @working_place_type WHERE id = @user_id;
    IF @working_place_description IS NOT NULL
        UPDATE viewer SET working_place_description = @working_place_description WHERE id = @user_id;
    IF @specialization IS NOT NULL
        UPDATE contributor SET specialization = @specialization WHERE id = @user_id;
    IF @portfolio_link IS NOT NULL
        UPDATE contributor SET portfolio_link = @portfolio_link WHERE id = @user_id;
    IF @years_of_experience IS NOT NULL
        UPDATE contributor SET years_of_experience = @years_of_experience WHERE id = @user_id;
    IF @hire_date IS NOT NULL
        UPDATE staff SET hire_date = @hire_date WHERE id = @user_id;
    IF @working_hours IS NOT NULL
        UPDATE staff SET working_hours = @working_hours WHERE id = @user_id;
    IF @payment_rate IS NOT NULL
        UPDATE staff SET payment_rate = @payment_rate WHERE id = @user_id;
GO

------------ Jooooooe
CREATE PROCEDURE Receive_New_Requests_foranyone
 @contributor_id INT
AS      
    if( 3 > (SELECT COUNT(*) 
    FROM (contributor C INNER JOIN new_request NR ON C.id = NR.contributer_id) 
    LEFT OUTER JOIN new_content NC ON NC.new_request_id = NR.id
    WHERE NR.accept_status = 1 AND NC.id IS NULL AND C.id = @contributor_id))
		SELECT nr.* , u.email
        FROM new_request nr inner join [user] u on u.id = nr.viewer_id 
        WHERE accept_status IS NULL AND (specified = 0)
	else
	    SELECT *
        FROM new_request
        WHERE accept_status = 4
GO

CREATE PROCEDURE Receive_New_Requests_me
 @contributor_id INT
AS      
    if( 3>(SELECT COUNT(*) 
    FROM (contributor C INNER JOIN new_request NR ON C.id = NR.contributer_id) 
    LEFT OUTER JOIN new_content NC ON NC.new_request_id = NR.id
    WHERE NR.accept_status = 1 AND NC.id IS NULL AND C.id = @contributor_id))
	SELECT nr.* , u.email
    FROM new_request nr inner join [user] u on u.id = nr.viewer_id 
    WHERE  accept_status IS NULL 
    AND specified = 1 AND contributer_id = @contributor_id
	else
	SELECT *
    FROM new_request
    WHERE accept_status = 4
GO


CREATE PROCEDURE Delete_Content_m
    @content_id INT
AS 
    DELETE FROM content 
    WHERE id = @content_id 
 
GO

------------------oudaaaaaaaa

Create Procedure update_date

@id int

As

update 
announcement 
    
SET  seen_at= CURRENT_TIMESTAMP
  
  WHERE id = @id AND seen_at is Null;

GO


CREATE PROC Website_content_manager_filter_content
	@content_manager_id INT,
	@original_content INT,
	@status  BIT,
    @valid BIT OUTPUT
AS
DECLARE @content_type varchar(64)
SELECT @content_type = c.type
FROM content c
WHERE c.id = @original_content

DECLARE @maneger_type varchar(64)
SELECT @maneger_type = [type]
FROM Content_manager
WHERE id = @content_manager_id

SET @valid = 0;
if @content_type = @maneger_type
 Begin
	update original_content 
    set filter_status = @status, content_manager_id = @content_manager_id
    where id = @original_content AND review_status IS NOT NULL
    SET @valid = 1;
end
GO


CREATE proc Website_Show_Possible_Contributors
AS
-- get contributors and new requests which are done
    select c.id contributor, nr.id newrequest
    into temp11
    from contributor c
    inner join new_request nr on nr.contributer_id = c.id
    inner join new_content nc on nc.new_request_id = nr.id


-- get contributors and new requests which are done and not done
    select c.id contributor, nr.id newrequest
    into temp22
    from contributor c
    inner join new_request nr on nr.contributer_id = c.id

--get contributors and new requests which not done
    select contributor, newrequest
    into temp33
    from(select * from temp22 
    except
    select * from temp11) t

-- contributors who cannot take more requests
    select temp33.contributor
    into temp44
    from temp33
    group by temp33.contributor
    having COUNT(*) >= 3

--contributors who can recive requests
    select *
    into temp55
    from(select c.id from contributor c
    except
    select temp44.contributor from temp44) k

    select temp55.id contributorid, count(*) as numofnewreq
    into temp66
    from content cont
    inner join new_content nc on nc.id = cont.id
    inner join new_request nr on nc.new_request_id = nr.id
    right outer join temp55 on temp55.id = cont.contributer_id
    group by temp55.id
    order by AVG(DATEDIFF(DAY,nr.accept_date,cont.uploaded_at)), count(*) DESC

    select CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) 
    AS 'Contributer Name', U.email AS 'Contributer Email', temp66.numofnewreq
    FROM temp66
    INNEr JOIN [user] U ON temp66.contributorid = U.id

    drop table temp11
    drop table temp22
    drop table temp33
    drop table temp44
    drop table temp55
    drop table temp66
GO
