--Chapter 1:

--Story 1:
EXEC Original_Content_Search 'video', 'educational';
EXEC Original_Content_Search 'video', NULL;
EXEC Original_Content_Search NULL, 'educational';
EXEC Original_Content_Search NULL, NULL;
GO

--Story 2:
EXEC Contributor_Search 'smira hazem mahmoud';
EXEC Contributor_Search 'harry mosaad potter';
EXEC Contributor_Search 'Weird named person';
GO

--Story 3:
DECLARE @user_id INT;
EXEC Register_User 'Viewer', 'dragonslayer@hotmail.com', 'ABC123', 
'Hossam', 'Wael', 'Zoghaby', '1997-12-12', 'GUC', 'University', 'The German University in Cairo',
NULL, NULL, NULL, NULL, NULL, NULL, @user_id OUTPUT;
PRINT @user_id;
GO

DECLARE @user_id INT;
EXEC Register_User 'contributor', 'hatem.hatem.abuhatem@hotmail.com', 'ABC123', 
'Hatem', 'Hatem', 'Abuhatem', '2000-10-12', NULL, NULL, NULL,
'graphic designers', 'www.hatemart.com', 2, NULL, NULL, NULL, @user_id OUTPUT;
PRINT @user_id;
GO

DECLARE @user_id INT;
EXEC Register_User 'Authorized Reviewer', 'officalman@hotmail.com', '12345', 
'Wael', 'Hossam', 'Mohsen', '1988-7-12', 'GUC', 'University', 'The German University in Cairo',
NULL, NULL, NULL, '2010-1-15', 40, 12.5, @user_id OUTPUT;
PRINT @user_id;
GO

DECLARE @user_id INT;
EXEC Register_User 'Content Manager', 'anotherofficalman@hotmail.com', '12345', 
'Adel', 'Ibrahim', 'Adel', '1982-7-12', 'GUC', 'University', 'The German University in Cairo',
NULL, NULL, NULL, '2012-1-31', 30, 10, @user_id OUTPUT;
PRINT @user_id;
GO

--Story 4:
EXEC Check_Type 'video', 10;
EXEC Check_Type 'design', 10;
GO

--Story 5:
EXEC Order_Contributor;
GO

--Story 6:
EXEC Show_Original_Content NULL;
EXEC Show_Original_Content 6;
GO

--Chapter 2:

--Story 1:
DECLARE @user_id INT;
EXEC User_login 'ahmed.mohamed@hotmail.com', '12345', @user_id OUTPUT;
PRINT @user_id;
GO

--Story 2:
DECLARE @email VARCHAR(64);
DECLARE @password VARCHAR(64);
DECLARE @first_name VARCHAR(64);
DECLARE @middle_name VARCHAR(64);
DECLARE @last_name VARCHAR(64);
DECLARE @birth_date DATETIME;
DECLARE @working_place_name VARCHAR(64);
DECLARE @working_place_type VARCHAR(64);
DECLARE @working_place_description VARCHAR(8000);
DECLARE @specialization VARCHAR(64);
DECLARE @portfolio_link VARCHAR(64);
DECLARE @years_of_experience INT;
DECLARE @hire_date DATETIME;
DECLARE @working_hours INT;
DECLARE @payment_rate REAL;
EXEC Show_Profile 2, @email OUTPUT, @password OUTPUT, @first_name OUTPUT, @middle_name OUTPUT, @last_name OUTPUT,
@birth_date OUTPUT, @working_place_name OUTPUT, @working_place_type OUTPUT, @working_place_description OUTPUT, @specialization OUTPUT, 
@portfolio_link OUTPUT, @years_of_experience OUTPUT, @hire_date OUTPUT, @working_hours OUTPUT, @payment_rate OUTPUT;
PRINT @email;
PRINT @password;
PRINT @first_name;
PRINT @middle_name;
PRINT @last_name;
PRINT @birth_date;
PRINT @working_place_name;
PRINT @working_place_type;
PRINT @working_place_description;
PRINT @specialization;
PRINT @portfolio_link;
PRINT @years_of_experience; 
PRINT @hire_date;
PRINT @working_hours;
PRINT @payment_rate;
GO

--Story 3:
EXEC Edit_Profile 2, NULL, '987654321', NULL, NULL, NULL,
NULL, NULL, NULL, NULL, NULL, 
NULL, NULL, NULL, NULL, NULL;
SELECT * FROM [user];
GO

--Story 4:
EXEC Deactivate_Profile 1;
GO

--Story 5:
EXEC Show_Event 4;
EXEC Show_Event NULL;
GO

--Story 6:
EXEC Show_Notification 5;
EXEC Show_Notification 10;
GO

--Story 7:
EXEC Show_New_Content 2, NULL;
EXEC Show_New_Content 1, 12;
GO

--Chapter 3:

--Story 1:
DECLARE @event_id int
DECLARE @dt datetime
set @dt = '2016-4-11 8:10:05.123'
EXEC Viewer_Create_Event 'mola','cairo',@dt,'clown',1, 'El Haram St.', @event_id OUTPUT
print @event_id;
GO

--Story 2:
Exec Viewer_Upload_Event_Video 1,'www.hamada.com'
Exec Viewer_Upload_Event_Photo 2,'www.hamadas.com'
GO

/*
select *
FROM Event_Photos_link;

select *
from advertisement
*/

--Story 3:
Exec Viewer_Create_Ad_From_Event 4;
GO

--Story 4:
Exec Apply_Existing_Request 1,10;
Exec Apply_Existing_Request 1,9;
Exec Apply_Existing_Request 1,6;
GO

/*
select * from existing_request;
select * from new_request
select * from announcement
select c.notified_id  from contributor c where c.id = 5
*/

--Story 5:
EXEC Apply_New_Request 'mesh 7abibi' , NULL ,3
GO

--Story 6:
EXEC Delete_New_Request 14
EXEC Delete_New_Request 7
GO

/*
select * from rate
*/

--Story 7:
EXEC Rating_Original_Content 5,3,1
GO

/*
select * from comment
*/

--Story 8:
EXEC Write_Comment 'what', 1, 2,'2013-01-15 01:10:05.123'
GO

--Story 9:
EXEC Edit_Comment  'what?', 1, 2,'2013-01-15 01:10:05.123','2014-01-15 01:10:05.123'
GO

--Story 10:
EXEC Delete_Comment 2, 2, '2014-2-16 2:10:05.123'
GO

/*
select * from advertisement
*/

--Story 11:
EXEC Create_Ads 2,'parking','giza'
GO

--Story 12:
EXEC Edit_Ad 7,'parking','zamalk'
GO

--Story 13:
EXEC Delete_Ads 7
GO

/*
select * from message
*/

--Story 14:
EXEC Send_Message '2y haga',1,7,1,'2015-03-04 12:10:05.123'
EXEC Send_Message '3aiz eh',1,7,0,'2015-03-04 12:10:05.123'
GO

--Story 15:
EXEC Show_Message 7
GO

/*
select * from original_content
*/

--Story 16:
EXEC Highest_Rating_Original_content
GO

/*
SELECT * from new_request
*/

--Story 17:
EXEC Assign_New_Request 9, 5
EXEC Assign_New_Request 10, 5
EXEC Assign_New_Request 11, 5
GO

/*
select * from content
select * from original_content
select * from content_type
select * from content_manager
*/

--Chapter 4:

--Story 1:
EXEC Receive_New_Requests NULL, 7;
GO

--Story 2:
EXEC Respond_New_Request 4, 1, 10;
GO

--Story 3:
EXEC Upload_Original_Content 'video', 'High school', 'educational', 7, 'www.sonewcontent.com';
GO

--Story 4:
EXEC Upload_New_Content 1, 7, 'High school', 'educational', 'www.sonewaskedcontent.com';
GO

--Story 5:
EXEC Delete_Content 10;
GO

--Story 6:
DECLARE @can_receive BIT;
EXEC Receive_New_Request 7, @can_receive OUTPUT;
PRINT @can_receive;
GO

--Chapter 5:

--Story 1:
EXEC reviewer_filter_content 13 , 17 ,1 
GO

--Story 2:
EXEC content_manager_filter_content 9, 16 , 1
GO

/*
select * from category
*/

--Story 3
EXEC Staff_Create_Category 'intertain'
GO

/*
select * from sub_category
*/

--Story 4:
EXEC Staff_Create_Subcategory 'intertain','molaa'
GO

/*
select * from content_type
*/
--Story 5:
EXEC Staff_Create_Type 'gifs'
GO

/*
select * from existing_request;
*/

--Story 6:
EXEC Most_Requested_Content;
GO

/*
select count(*) from existing_request
select count(*) from new_request
select count(*) from new_content
*/

--Story 7:
EXEC Workingplace_Category_Relation
GO

--Story 8 repeated in viewer chapter 3 story 10:
/*
EXEC Delete_Comment 1,2,'2014-01-15 01:10:05.123'
GO
*/

/*
select * from original_content
*/

--Story 9:
EXEC Delete_Original_Content 17
GO

/*
select * from new_content
*/

--Story 10:
EXEC Delete_New_Content 14;
GO

/*
select * from new_request
*/

--Story 11:
EXEC Assign_Contributor_Request 5, 19;
GO

--Story 12:
EXEC Show_Possible_Contributors;
GO
