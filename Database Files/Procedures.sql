/*
Chapter 1 : As a registered/unregistered user, I should be able to...
*/

/*
Story 1
Search for original content by its type OR its category using a procedure called ’Original_Content_Search
@typename, @categoryname’. Make sure that you display only the approved original content by
both a authorized reviewer and a content manager.
*/

CREATE PROCEDURE Original_Content_Search
    @typename  VARCHAR(64),
    @categoryname VARCHAR(64)
AS
    IF @typename IS NULL
        SELECT * 
        FROM content C INNER JOIN original_content O ON C.id = O.id
        WHERE C.category_type = @categoryname
        AND O.filter_status = 1
        AND O.review_status = 1
    ELSE IF @categoryname IS NULL
        SELECT * 
        FROM content C INNER JOIN original_content O ON C.id = O.id
        WHERE C.type = @typename
        AND O.filter_status = 1
        AND O.review_status = 1
    ELSE
        SELECT * 
        FROM content C INNER JOIN original_content O ON C.id = O.id
        WHERE (C.type = @typename
        OR C.category_type = @categoryname)
        AND O.filter_status = 1
        AND O.review_status = 1
GO

/*
Stroy 2
Search for any contributor by his/her name using a procedure called ’Contributor_Search @fullname’
Note: The full name should be separated by a space.
*/

CREATE PROCEDURE Contributor_Search
    @fullname VARCHAR(192)
AS
    SELECT * 
    FROM [user] U INNER JOIN contributor C ON U.id = C.id
    WHERE CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) = @fullname
GO

/* 
Story 3
Register to the website. Any user has to register on the website with a unique email and a password,
along with the needed information ’Register_User @usertype, @email, @password, @firstname,
@middlename, @lastname, @birth_date, @working_place_name, @working_place_type,
@wokring_place_description, @specilization, @portofolio_link, @years_experience, @hire_date,
@working_hours, @payment_rate, @user_id OUTPUT’. Choose which type of user theyâll be
using @usertype (Viewer, Contributor, Authorized Reviewer or Content Manager).
*/

CREATE PROCEDURE Register_User
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
GO

/*
Story 4
When a content manager registers on the website they should be able to specify which type (image,
logo, video...etc.) is he/she professional in. Indicating which type of content he/she will be able to
filter using a procedure called ’Check_Type @typename @content_manager_id’. This procedure
should map the type with this name to the content manager. If there is no type with this name,
you should first create a type.
*/

CREATE PROCEDURE Check_Type
    @typename VARCHAR(64),
    @content_manager_id INT
AS
    IF NOT EXISTS (SELECT * FROM content_type WHERE content_type.type = @typename)
        INSERT INTO content_type([type]) VALUES (@typename);
    UPDATE content_manager 
    SET type = @typename 
    WHERE content_manager.id = @content_manager_id; 
GO

/*
Story 5
Show the contributors in the order of the highest years of experience using a procedure called
’Order_Contributor’.
*/

CREATE PROCEDURE Order_Contributor
AS
	SELECT * 
	FROM contributor
	ORDER BY years_of_experience DESC
GO

/*
Story 6
Show the approved original content along with all the information of the contributor who uploaded
it. If the contributor id is specified then only the original content of that contributor will be shown
else all the original content will be shown. Using a procedure called ’Show_Original_Content
@contributor_id’.
*/

CREATE PROCEDURE Show_Original_Content 
	@contributor_id INT 
AS
	IF(@contributor_id IS NOT NULL)
		SELECT *
		FROM (Original_Content OC 
        INNER JOIN Content C ON OC.id = C.id AND C.contributer_id = @contributor_id)
        INNER JOIN contributor CO ON CO.id = C.contributer_id
		WHERE OC.review_status = 1 AND OC.filter_status = 1
	ELSE
		SELECT *
		FROM (Original_Content OC 
        INNER JOIN Content C ON OC.id = C.id)
        INNER JOIN contributor CO ON CO.id = C.contributer_id
		WHERE OC.review_status = 1 AND OC.filter_status = 1
GO

/*
Chapter 2 : As a registered user, I should be able to ...
*/

/*
Story 1
Login to the website using my email and password which checks that I am an existing user and
whether I am a Viewer, Contributor, Authorized Reviewer or Content manager using a procedure
called ’User_login @email, @password, @user_id OUTPUT’ if the user is not registered or not
allowed to login (deleted account) the @user_id value will be (-1). I will be able to reactivate my
profile by logging in on the website. If more than 2 weeks passed without logging in, then I wonât
be able to login on the website. Note: The account will not be deleted.
*/

CREATE PROCEDURE User_login
    @email VARCHAR(64),
    @password VARCHAR(64),
    @user_id INT OUTPUT
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

            UPDATE [user]
            SET deactivate = 0, last_login = CURRENT_TIMESTAMP
            WHERE email = @email AND [password] = @password
        END
GO

/*
Story 2
Show my profile that contains all my possible information using a procedure called ’Show_Profile
@user_id, @email OUTPUT, @password OUTPUT, @firstname OUTPUT, @middlename OUTPUT,
@lastname OUTPUT, @birth_date OUTPUT, @working_place_name OUTPUT, @working_place_type
OUTPUT, @wokring_place_description OUTPUT, @specilization OUTPUT,
@portofolio_link OUTPUT, @years_experience OUTPUT, @hire_date OUTPUT, @working_hours
OUTPUT, @payment_rate OUTPUT’. If the account is deleted then the returned values are null.
*/

CREATE PROCEDURE Show_Profile
    @user_id INT,
    @email VARCHAR(64) OUTPUT,
    @password VARCHAR(64) OUTPUT,
    @first_name VARCHAR(64) OUTPUT,
    @middle_name VARCHAR(64) OUTPUT,
    @last_name VARCHAR(64) OUTPUT,
    @birth_date DATETIME OUTPUT,
    @working_place_name VARCHAR(64) OUTPUT,
    @working_place_type VARCHAR(64) OUTPUT,
    @working_place_description VARCHAR(8000) OUTPUT,
    @specialization VARCHAR(64) OUTPUT,
    @portfolio_link VARCHAR(64) OUTPUT,
    @years_of_experience INT OUTPUT,
    @hire_date DATETIME OUTPUT,
    @working_hours INT OUTPUT,
    @payment_rate REAL OUTPUT
AS
    SET @email = NULL;
    SET @password = NULL;
    SET @first_name = NULL;
    SET @middle_name = NULL;
    SET @last_name = NULL;
    SET @birth_date = NULL;
    SET @working_place_name = NULL;
    SET @working_place_type = NULL;
    SET @working_place_description = NULL;
    SET @specialization = NULL;
    SET @portfolio_link = NULL;
    SET @years_of_experience = NULL;
    SET @hire_date = NULL;
    SET @working_hours = NULL;
    SET @payment_rate = NULL;

    IF EXISTS(SELECT * FROM [user] WHERE @user_id = id)
        SELECT @email = email, @password = [password], @first_name = first_name, @middle_name = middle_name, @last_name = last_name, @birth_date = birth_date
        FROM [user]
        WHERE @user_id = id 
    IF EXISTS(SELECT * FROM viewer WHERE @user_id = viewer.id)
        SELECT @working_place_name = working_place, @working_place_type = working_place_type, @working_place_description = working_place_description
        FROM viewer
        WHERE @user_id = id
    ELSE IF EXISTS(SELECT * FROM contributor WHERE @user_id = contributor.id)
        SELECT @specialization = specialization, @portfolio_link = portfolio_link, @years_of_experience = years_of_experience
        FROM contributor
        WHERE  @user_id = id
    ELSE IF EXISTS(SELECT * FROM staff WHERE @user_id = staff.id)
        SELECT @hire_date = hire_date, @working_hours = working_hours, @payment_rate = payment_rate
        FROM staff
        WHERE @user_id = id
GO

/*
Story 3
Edit all my personal information using a procedure called ’Edit_Profile @user_id, @email, @password,
@firstname, @middlename, @lastname, @birth_date, @working_place_name, @working_place_type,
@wokring_place_description, @specilization, @portofolio_link, @years_experience, @hire_date,
@working_hours, @payment_rate’.
*/

CREATE PROCEDURE Edit_Profile
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

/*
Story 4
Deactivate my profile using a procedure called ’Deactivate_Profile @user_id
*/

CREATE PROCEDURE Deactivate_Profile
    @user_id INT 
AS
    UPDATE [user] SET deactivate = 1 WHERE id = @user_id;
GO

/*
Story 5
Show events with all its’ information and the viewer’s first name, second name, and last name who
created the event (do not include Advertisement) ’Show_Event @event_id’. If the event is null,
you should show all the coming events. Otherwise, show the specified event.
*/

CREATE PROCEDURE Show_Event
    @event_id INT 
AS 
    IF @event_id IS NULL 
        SELECT E.*, U.first_name, U.middle_name, U.last_name
        FROM [event] E INNER JOIN [user] U
        ON E.viewer_id = U.id
        WHERE E.[time] > CURRENT_TIMESTAMP
    ELSE 
        SELECT E.*, U.first_name, U.middle_name, U.last_name
        FROM [event] E INNER JOIN [user] U
        ON E.viewer_id = U.id
        WHERE E.id = @event_id;
GO

/*
Story 6
Show my notifications if I am either a staff member or contributor using a procedure called
’Show_Notification @user_id’.
*/

CREATE PROCEDURE Show_Notification
    @user_id INT 
AS 
   IF EXISTS (SELECT * FROM contributor WHERE id = @user_id)
        SELECT A.*
        FROM contributor C INNER JOIN announcement A ON C.notified_id = A.notified_person_id
        WHERE C.id = @user_id
    ELSE IF EXISTS (SELECT * FROM staff WHERE id = @user_id)
        SELECT A.* 
        FROM staff S INNER JOIN announcement A ON S.notified_id = A.notified_person_id
        WHERE S.id = @user_id
GO

/*
Story 7
Search for the new content that I ordered showed along with the name and id of the contributor
who uploaded them using a procedure called ’Show_New_Content @viewer_id, @content_id’. If
the user does not specify a new content, all new content should be shown.
*/

CREATE PROCEDURE Show_New_Content
    @viewer_id INT,
    @content_id INT
AS 
   IF @content_id IS NULL
        SELECT NC.id, NC.new_request_id, U.id, CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) AS 'Contributer Full Name'
        FROM ((new_content NC 
        INNER JOIN new_request NR ON NC.new_request_id = NR.id) 
        INNER JOIN [user] U ON U.id = NR.contributer_id)
        WHERE NR.viewer_id = @viewer_id
   ELSE 
        SELECT NC.id, NC.new_request_id, U.id, CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) AS 'Contributer Full Name'
        FROM ((new_content NC 
        INNER JOIN new_request NR ON NC.new_request_id = NR.id) 
        INNER JOIN [user] U ON U.id = NR.contributer_id)
        WHERE NR.viewer_id = @viewer_id AND @content_id = NC.id
GO

/*
Chapter 3 : As a Viewer (registered user), I should be able to ...
*/

/*
Story 1
Create an event with all itâs possible information using a procedure called ’Viewer_Create_Event
@city, @event_date_time, @description, @entartainer, @viewer_id, @location, @event_id OUTPUT’
*/

CREATE PROC Viewer_Create_Event
	@city varchar(64),
	@description varchar(64),
	@event_date_time datetime,
	@entartainer varchar(64),
	@viewer_id int,
    @location VARCHAR(64),
	@event_id int OUTPUT
AS
    INSERT INTO notification_object DEFAULT VALUES;
    DECLARE @notif_id INT;
    SET @notif_id = (SELECT max(id) FROM notification_object)
    INSERT INTO [event]([description],[location] ,city, [time], entertainer, notification_object_id, viewer_id)
    VALUES (@description, @location, @city, @event_date_time, @entartainer, @notif_id, @viewer_id)
    SET @event_id = (SELECT max(id) FROM [event])
    DECLARE @i int
	SET @i = (SELECT min(id) FROM notified_Person)
	WHILE (@i IS NOT NULL)
		BEGIN
		    INSERT INTO announcement (sent_at, notified_person_id, notification_object_id)
		    VALUES (current_timestamp, @i, @notif_id)
		    SELECT @i = min(id)
            FROM notified_Person
            WHERE id > @i
	    END
GO

/*
Story 2
Insert link for a photo or video to be used in the event using two procedures called ’Viewer_
Upload_Event_Photo @event_id, @link’ and ’Viewer_Upload_Event_Video @event_id, @link’.
*/

CREATE PROC Viewer_Upload_Event_Photo
	@event_id int,
	@link varchar(64)
AS
    IF NOT EXISTS(SELECT * FROM Event_Photos_link WHERE event_id = @event_id AND link = @link)
        insert into Event_Photos_link
        values(@event_id, @link);
GO

CREATE PROC Viewer_Upload_Event_Video
	@event_id int,
	@link varchar(64)
AS
    IF NOT EXISTS(SELECT * FROM event_videos_link WHERE event_id = @event_id AND link = @link)
        insert into event_videos_link
        values(@event_id, @link);
GO

/*
Story 3
Create an advertisement with the information of an event using a procedure called
’Viewer_Create_Ad_From_Event @event_id’
*/

CREATE PROC Viewer_Create_Ad_From_Event
	@event_id int
AS
    declare @description varchar(64)
    declare @location varchar(64)
    declare @viewer_id int
    select @description=e.description, @location=e.location, @viewer_id=viewer_id
    from [event] e
    where e.id=@event_id;
    insert into Advertisement
    values(@description, @location, @event_id, @viewer_id);
GO

/*
Story 4
Apply for an existing request to buy a specified original content(s). ONLY allowed original content
to be bought has a rating of 4 or 5 stars using a procedure called ’Apply_Existing_Request
@viewer_id,@original_content_id’.
*/

CREATE PROC Apply_Existing_Request
	@viewer_id int,
	@original_content_id int
AS
    declare @rating int
    select @rating=o.rating
    from original_content o
    where o.id=@original_content_id
    if(@rating=4 or @rating=5)
	    insert into existing_request
        values(@original_content_id, @viewer_id);
GO

/*
Stroy 5
Apply for a new request along with the information of the needed new content using a procedure
called ’Apply_New_Request @information, @contributor_id’. @contributor_id can be null if the
contributor is not specified. After the new request is created it should send a notification to the
contributor (one or many).
*/

CREATE PROC Apply_New_Request
	@information TEXT,
	@contributor_id INT,
	@viewer_id INT
AS
    DECLARE @specified BIT
    DECLARE @notif_obj_id INT
    IF @contributor_id IS NULL 
        SET @specified = 0
    ELSE
        SET @specified = 1
    DECLARE @notified_person_id INT
    DECLARE @curnoti_object INT

    INSERT INTO notification_object default VALUES
    SET @curnoti_object = (SELECT max(id) FROM notification_object)
    INSERT INTO new_request (accept_status, specified, information, viewer_id, notif_obj_id,contributer_id)
    VALUES(NULL, @specified, @information, @viewer_id, (SELECT max(id)
	FROM notification_object), @contributor_id)

    IF @specified = 1
        BEGIN
	        SET @notified_person_id = (SELECT c.notified_id
	        FROM contributor c
	        WHERE c.id = @contributor_id)
	        INSERT INTO announcement 
            (sent_at, notified_person_id, notification_object_id)
	        VALUES 
            (current_timestamp, @notified_person_id , @curnoti_object)
        END
    ELSE
	    BEGIN
	        DECLARE @i INT
            DECLARE @c_id INT
	        SET @i = (SELECT min(id) FROM contributor)
	        WHILE (@i IS NOT NULL)
		        BEGIN
		            SET @notified_person_id = (SELECT c.notified_id
		            FROM contributor c
		            WHERE c.id = @i)
		            INSERT INTO announcement (sent_at, notified_person_id, notification_object_id)
		            VALUES (current_timestamp, @notified_person_id , @curnoti_object)
		            SELECT @i = min(id)
                    FROM contributor
                    WHERE id > @i
	            END
        END
GO

/*
Stroy 6
Delete any new request I applied for as long as itâs not in process. Note: As long as the contributor
did NOT accept the new request. Using a procedure called ’Delete_New_Request @request_id’
*/

CREATE PROC Delete_New_Request
	@request_id int
as
    if((select r.accept_status
    from new_request r
    where r.id=@request_id) <> 1)
        DELETE from new_request  where id = @request_id
GO

/*
Story 7
Review any original content by rating it using a procedure called ’Rating_Original_Content @orignal_
content_id, @rating_value, @viewer_id’
*/

CREATE PROC Rating_Original_Content
	@orignal_content_id INT,
	@rating_value INT,
	@viewer_id INT
AS
    IF (NOT EXISTS (SELECT * FROM rate WHERE viewer_id = @viewer_id AND original_content_id = @orignal_content_id)
        AND @rating_value >= 0 AND @rating_value <= 5)

        insert into rate
	    (viewer_id, original_content_id,[date],rate)
        values
	    (@viewer_id, @orignal_content_id, current_timestamp, @rating_value)
        
    DECLARE @avg INT
    SELECT @avg = AVG(rate)
    FROM rate
    WHERE original_content_id = @orignal_content_id

    UPDATE original_content 
    SET rating = @avg
    WHERE id = @orignal_content_id
GO

/*
Story 8
Write a comment on the original content using a procedure called ’Write_Comment @comment_text,
@viewer_id, @original_content_id, @written_time’.
*/

create PROC Write_Comment
	@comment_text TEXT,
	@viewer_id int,
	@original_content_id int,
	@written_time datetime
AS
    IF NOT EXISTS (SELECT * FROM comment 
    WHERE viewer_id = @viewer_id AND original_content_id = @original_content_id AND [date] = @written_time)
        insert into comment
	    (Viewer_id, original_content_id, [date] , [text])
        values
	    (@viewer_id, @original_content_id, @written_time, @comment_text)
GO

/*
Story 9
Edit my comment on any original content using a stored procedure called ’Edit_Comment @comment_
text, @viewer_id, @original_content_id, @last_written_time, @updated_written_time’
*/

CREATE PROC Edit_Comment
	@comment_text TEXT,
	@viewer_id INT,
	@original_content_id INT,
	@last_written_time DATETIME,
	@updated_written_time DATETIME
as
    UPDATE comment 
    SET [text] = @comment_text , [date] = @updated_written_time
    WHERE viewer_id = @viewer_id AND original_content_id = @original_content_id AND [date] = @last_written_time
GO

/*
Story 10
Delete my comment using a procedure called ’Delete_Comment @viewer_id, @original_content_id,
@written_time’.
*/

CREATE PROC Delete_Comment
	@viewer_id INT,
	@original_content_id INT,
	@written_time datetime
AS
    DELETE comment
    where viewer_id = @viewer_id and original_content_id= @original_content_id AND [date] = @written_time
GO

/*
Story 11
Create an advertisement by providing all the needed information for publicity using a procedure
called ’Create_Ads @viewer_id,@description, @location’.
*/

CREATE PROC Create_Ads
	@viewer_id INT,
	@description VARCHAR(64),
	@location VARCHAR(64)
AS
    insert into advertisement
	([description],[location],viewer_id)
    values
	(@description, @location, @viewer_id)
GO

/*
Stroy 12
Edit my advertisement using a procedure called ’Edit_Ad @ad_id,@description, @location’.
*/

CREATE PROC Edit_Ad
	@ad_id INT,
	@description VARCHAR(64),
	@location VARCHAR(64)
AS
    UPDATE advertisement
    SET [description] = @description,[location] = @location
    WHERE id = @ad_id
GO

/*
Stroy 13
Delete my advertisement using a procedure called ’Delete_Ads @ad_id’.
*/

CREATE PROC Delete_Ads
	@ad_id INT
AS
    DELETE FROM advertisement WHERE id = @ad_id
GO

/*
Stroy 14
Send a message to the contributor using a procedure called ’Send_Message @msg_text, @viewer_
id, @contributor_id, @sender_type, @sent_at’. Sender type is boolean. It is one when the
sender is a contributor, zero otherwise.
*/

CREATE PROC Send_Message
	@msg_text TEXT,
	@viewer_id int,
	@contributor_id int,
	@sender_type BIT,
	@sent_at DATETIME
AS
    IF NOT EXISTS (SELECT * FROM [message] 
    WHERE sender_type = @sender_type AND sent_at = @sent_at 
    AND viewer_id = @viewer_id AND contributer_id = @contributor_id)
        insert into [Message]
	    (sent_at,contributer_id, viewer_id, sender_type, [text],read_status)
        values(@sent_at, @contributor_id, @viewer_id, @sender_type, @msg_text, 0)
GO

/*
Story 15
Show all messages to/from a contributor using a procedure called ’Show_Message @contributor_id’.
*/

CREATE PROC Show_Message
	@contributor_id INT
AS
    SELECT *
    FROM [message] M
    WHERE M.contributer_id = @contributor_id
GO

/*
Story 16
Show the original content having the highest rating using a procedure called
’Highest_Rating_Original_content’.
*/

CREATE PROC Highest_Rating_Original_content
AS
    IF EXISTS (SELECT * FROM original_content WHERE rating IS NOT NULL)
        SELECT *
        FROM original_content
        WHERE rating = (SELECT MAX(rating)
        FROM original_content WHERE rating IS NOT NULL)
GO

/*
Story 17
Assign a contributor to a new request. The viewer can NOT re-apply on a rejected new request
even if the contributor is different using a procedure called ’Assign_New_Request @request_id
@contributor_id’. Note that the viewer can not reassign the request to a contributor if the request
is accepted by another one.
*/

CREATE PROC Assign_New_Request
	@request_id INT,
	@contributor_id INT
AS
    IF((SELECT R.accept_status FROM new_request R WHERE R.id = @request_id) IS NULL)
        UPDATE new_request
        SET specified = 1, contributer_id = @contributor_id
        WHERE id = @request_id
        
GO

/*
Chapter 4 : As a contributor, I should be able to ...
*/

/*
Story 1
I should receive new requests that are either created for me or the name of the contributor isn’t
specified (then it will appear to all registered contributors.) using a stored procedure called ’Receive_New_Requests
@request_id, contributor_id.’ @request_id can be null. If the request id is
null, the contributor should receive all his/her new requests.
*/

CREATE PROCEDURE Receive_New_Requests
    @request_id INT,
    @contributor_id INT
AS
    IF @request_id IS NULL
        SELECT *
        FROM new_request
        WHERE accept_status IS NULL AND ((specified = 0) OR (specified = 1 AND contributer_id = @contributor_id))
    ELSE  
        SELECT *
        FROM new_request 
        WHERE id = @request_id AND accept_status IS NULL 
        AND specified = 1 AND contributer_id = @contributor_id
GO

/*
Story 2
I can accept/reject any new request using a procedure called ’Respond_New_Request @contributor_id,
@accept_status, @request_id’.
Note: Once a new request (that is created without a certain contributor) is accepted then it CAN
NOT be accepted by any other contributor.
*/

CREATE PROCEDURE Respond_New_Request
    @contributor_id INT,
    @accept_status BIT,
    @request_id INT
AS 
    IF @accept_status = 0
        IF EXISTS (SELECT * FROM new_request WHERE id = @request_id AND accept_status IS NULL AND specified = 1 AND contributer_id = @contributor_id)
            UPDATE new_request SET accept_status = @accept_status WHERE id = @request_id;
    IF @accept_status = 1 
        IF EXISTS (SELECT * FROM new_request WHERE id = @request_id AND accept_status IS NULL)
            UPDATE new_request SET accept_status = @accept_status, contributer_id = @contributor_id, accept_date = CURRENT_TIMESTAMP WHERE id = @request_id;
GO

/*
Story 3
Upload original content. I should be able to choose the type of the content (logo, image..etc.), which
category/subcategory it belongs in using a procedure called ’Upload_Original_Content @type_id,
@subcategory_name, @category_id, @contributor_id, @link’.
*/

CREATE PROCEDURE Upload_Original_Content
    @type_id VARCHAR(64),
    @subcategory_name VARCHAR(64),
    @category_id VARCHAR(64),
    @contributor_id INT,
    @link VARCHAR(64)
AS 
    INSERT INTO content(link, uploaded_at, contributer_id, category_type, subcategory_name, [type])
    VALUES (@link, CURRENT_TIMESTAMP, @contributor_id, @category_id, @subcategory_name, @type_id);
    DECLARE @c_id INT;
    SELECT @c_id = max(id) FROM content;
    INSERT INTO original_content(id, review_status, filter_status)
    VALUES (@c_id, NULL, NULL);
GO

/*
Story 4
Upload new content. using a procedure called ’Upload_New_Content @new_request_id, @contributor_id,
@subcategory_name, @category_id, @link’.
*/

CREATE PROCEDURE Upload_New_Content
    @new_request_id INT,
    @contributor_id INT,
    @subcategory_name VARCHAR(64),
    @category_id VARCHAR(64),
    @link VARCHAR(64)
AS 
    INSERT INTO content(link, uploaded_at, contributer_id, category_type, subcategory_name)
    VALUES (@link, CURRENT_TIMESTAMP, @contributor_id, @category_id, @subcategory_name);
    DECLARE @c_id INT;
    SELECT @c_id = max(id) FROM content;
    INSERT INTO new_content(id, new_request_id)
    VALUES (@c_id, @new_request_id);
GO

/*
Story 5
Delete ONLY my content. If my original content started in the filtering process I CAN NOT delete
it. Using a procedure called ’Delete_Content @content_id’
Note: The first filtering process starts when the authorized reviewer starts filtering.
*/

CREATE PROCEDURE Delete_Content
    @content_id INT
AS 
    DELETE FROM content 
    WHERE id = @content_id 
    AND EXISTS (SELECT * FROM original_content 
    WHERE id = @content_id AND review_status IS NULL AND filter_status IS NULL)
GO

/*
Story 6
I Can’t receive new requests as long as I have 3 new requests still in process (3 new content aren’t
yet done/uploaded). Check if the new content related to the new request is uploaded on the website
(you’re NOT allowed to add boolean to check if the request is done). Using a procedure called
’Receive_New_Request @contributor_id @can_receive OUTPUT’
*/

CREATE PROCEDURE Receive_New_Request
    @contributor_id INT,
    @can_receive BIT OUTPUT
AS 
    DECLARE @cnt INT;
    SELECT @cnt = COUNT(*) 
    FROM (contributor C INNER JOIN new_request NR ON C.id = NR.contributer_id) 
    LEFT OUTER JOIN new_content NC ON NC.new_request_id = NR.id
    WHERE NR.accept_status = 1 AND NC.id IS NULL AND C.id = @contributor_id
    IF @cnt >= 3
       SET @can_receive = 0
    ELSE 
       SET @can_receive = 1
GO

/*
Chapter 5 : As a staff member, I should be able to ...
*/

/*
Story 1
The authorized reviewer can filter the original content using a procedure called ’reviewer_filter_content
@reviewer_id @original_content @status’
*/

CREATE PROC reviewer_filter_content
	@reviewer_id INT,
	@original_content INT,
	@status BIT
As
update original_content 
set review_status=@status,reviewer_id=@reviewer_id
where id=@original_content
GO

/*
Story 2
The content manager can filter the original content using a procedure called
’content_manager_filter_content @content_manager_id @original_content @status’.
Note that content managers filter the content that has the same type as their types. After the
second approval, the original content can be displayed to any user
*/

CREATE PROC content_manager_filter_content
	@content_manager_id INT,
	@original_content INT,
	@status  BIT
AS
DECLARE @content_type varchar(64)
SELECT @content_type = c.type
FROM content c
WHERE c.id = @original_content

DECLARE @maneger_type varchar(64)
SELECT @maneger_type = [type]
FROM Content_manager
WHERE id = @content_manager_id


if @content_type = @maneger_type
 Begin
	update original_content 
    set filter_status = @status, content_manager_id = @content_manager_id
    where id = @original_content AND review_status IS NOT NULL
end
GO

/*
Story 3
Create a category using a procedure called ’Staff_Create_Category @category_name’
*/

CREATE PROC Staff_Create_Category
	@category_name varchar(64)
As
    IF NOT EXISTS (SELECT * FROM category WHERE [type] = @category_name)
        INSERT INTO Category([type]) values(@category_name)
GO

/*
Story 4
Create subcategories for each category using a procedure called ’Staff_Create_Subcategory @category_
name, @subcategory_name’
*/

CREATE PROC Staff_Create_Subcategory
	@category_name varchar(64),
	@subcategory_name varchar(64)
AS
    IF NOT EXISTS (SELECT * FROM Sub_category 
    WHERE category_type = @category_name AND [name] = @subcategory_name)
        insert into Sub_category
	    (category_type,[name])
        values(@category_name, @subcategory_name)
GO

/*
Story 5
Create a new type using a procedure called ’Staff_Create_Type @type_name’.
*/

CREATE PROC Staff_Create_Type
	@type_name varchar(64)
AS
    IF NOT EXISTS (SELECT * FROM Content_type WHERE [type] = @type_name)
        insert into  Content_type
	    ([type])
        values(@type_name)
GO

/*
Story 6
Show original content id and the number of request for each content ordered by the number of
requests descendingly using a procedure called ’Most_Requested_Content’.
*/

CREATE PROC Most_Requested_Content
AS
    SELECT o.id , count(e.id) as count_of_requests
    into temp
    FROM original_content o
	LEFT OUTER JOIN existing_request e on e.original_content_id = o.id
    GROUP BY o.id

    SELECT temp.id, count_of_requests
    FROM temp
    order by count_of_requests DESC
    DROP TABLE temp;
GO

/* 
Story 7
Show number of requests related to content of each category ordered by each working place type
using a procedure called ’Workingplace_Category_Relation’ – Expected: working place type, category
name, number of requests. Each content belongs to a category and this content is
requested by a viewer that has a working place type. Many viewers can have the same
working place type. The staff can show the number of new/existing request made for
new/original content that belongs to a certain category per working place type.
*/

CREATE PROC Workingplace_Category_Relation

AS

SELECT v.working_place_type as vv , ct.category_type as kk, count(*) as tt
into er
FROM existing_request r
    inner join viewer v on v.id = r.viewer_id
    inner join original_content c on c.id = r.original_content_id
    inner join content ct on c.id = ct.id
group by v.working_place_type , ct.category_type

SELECT v.working_place_type as vv , ct.category_type as kk, count(*) as tt
into ziko
FROM new_request r
    inner join viewer v on v.id = r.viewer_id
    inner join new_content c on c.new_request_id = r.id
    inner join content ct on c.id = ct.id
group by v.working_place_type , ct.category_type

select *
into res
from (select * from ziko union all select * from er ) a

SELECT VV as working_place_type, KK as category, sum(tt) as numberofRequests
FROM res
GROUP BY VV,KK
ORDER BY VV

drop table res
drop table er
drop table ziko
GO

/*
Story 8 repeated in viewer chapter 3 story 10
Delete a comment on the website using a procedure called ’Delete_Comment @viewer_id, @original_
content_id, @comment_time’.
*/

/*
CREATE PROC Delete_Comment
@viewer_id INT,
@original_content_id INT,
@written_time datetime
AS
DELETE comment
where viewer_id = @viewer_id and original_content_id= @original_content_id AND date = @written_time
GO
*/

/*
Story 9
Delete an original content using a procedure called ’Delete_Original_Content @content_id’
*/

CREATE PROC Delete_Original_Content
	@content_id int
AS
Delete original_content
where id=@content_id
GO

/*
Story 10
Delete a new content using a procedure called ’Delete_New_Content @content_id’
*/

CREATE PROC Delete_New_Content
	@content_id int
AS
Delete new_content
where id=@content_id
GO

/*
Story 11
Assign a contributor to a request using a procedure called ’Assign_Contributor_Request @contributor_
id, @new_request_id’
*/

CREATE PROC Assign_Contributor_Request
	@contributor_id INT,
	@new_request_id INT
AS
update new_request
set contributer_id=@contributor_id , specified=1
where id=@new_request_id
GO

/*
Story 12
Show a list of contributors to be able to assign one of them to a request. The contributors have to
be filtered and ordered by the following criteria in order:
• The contributor that uploads the new content faster (the difference in days between the acceptance
of the request and the upload date of the new content). You are not allowed to add
a ’Finished’ boolean attribute in the new content. You will need to add uploaded_at column
in the Content Please add the attributes you need, but not a boolean attribute.
• The number of handled new requests descendingly.
Note: that any contributor cannot handle more than 3 open new requests.
Use a procedure called ’Show_Possible_Contributors’. Expected: contributor_id, the number of
new requests
*/

CREATE proc Show_Possible_Contributors
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

    select cont.contributer_id contributorid, count(*) as numofnewreq
    from temp55
    left outer join content cont on temp55.id = cont.contributer_id
    inner join new_content nc on nc.id = cont.id
    inner join new_request nr on nc.new_request_id = nr.id
    group by cont.contributer_id
    order by AVG(DATEDIFF(DAY,nr.accept_date,cont.uploaded_at)), count(*) DESC

    drop table temp11
    drop table temp22
    drop table temp33
    drop table temp44
    drop table temp55
GO
