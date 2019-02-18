INSERT INTO [user](first_name,middle_name,last_name,email,birth_date,[password],last_login)
VALUES ('ahemd','mohamed','elsalamoni','ahmed.mohamed@hotmail.com','11-11-1967','12345','2012-1-1 12:10:05.123'),
('medhat','sameh','katkot','medhat.katkot@hotmail.com','1988-2-1','23456','2013-1-1 12:10:05.123'),
('smir','mohsen','aboelneel','smir.mohsen@hotmail.com','1998-6-24','moh7aaa','2018-1-1 12:10:05.123'),
('smira','hazem','mahmoud','smira.mahmoud@hotmail.com','1989-9-24','smirAA','2008-1-1 12:10:05.123'),
('faten','ahmed','hmama','faten.hmama@hotmail.com','1968-8-15','fatooon','2012-9-2 12:10:05.123'),
('tamer','fawzy','hosny','tamer.hosny@hotmail.com','1978-2-1','timooo','2012-1-2 12:10:05.123'),
('amr','fathi','diab','amr.diab@hotmail.com','1959-7-19','hadabaa','2012-1-17 12:10:05.123'),
('harry','mosaad','potter','harry.potter@hotmail.com','1978-2-16','fayooz','2002-1-1 12:10:05.123'),
('fayez','tamer','hesham','fayez.hesham@hotmail.com','1978-7-29','fayooz','2018-1-8 12:10:05.123'),
('youssef','hisham','maged','youssed.maged@hotmail.com','1975-3-9','mogaa','2012-11-18 12:10:05.123'),
('mark','mohsen','samy','mark.samy@hotmail.com','1999-2-19','samoyaa','2012-11-11 12:10:05.123'),
('samer','shady','haitham','samer.haitham@hotmail.com','1969-6-8','haithoma','2017-1-1 12:10:05.123'),
('noha','samy','ibrahim','noha.ibrahim@hotmail.com','1978-9-29','hemaaa','2018-10-20 9:10:05.123');

INSERT INTO viewer(id,working_place,working_place_type,working_place_description)
VALUES (1,'GUC','university','educational place'),
(2,'AUC','university','educational place'),
(3,'Nestle','food production','factory');

INSERT INTO notified_Person DEFAULT VALUES;
INSERT INTO notified_Person DEFAULT VALUES;
INSERT INTO notified_Person DEFAULT VALUES;
INSERT INTO notified_Person DEFAULT VALUES;
INSERT INTO notified_Person DEFAULT VALUES;
INSERT INTO notified_Person DEFAULT VALUES;
INSERT INTO notified_Person DEFAULT VALUES;
INSERT INTO notified_Person DEFAULT VALUES;
INSERT INTO notified_Person DEFAULT VALUES;
INSERT INTO notified_Person DEFAULT VALUES;

INSERT INTO contributor(id,years_of_experience,portfolio_link,specialization,notified_id)
VALUES (4,5,'www.dog.com','graphic designers',1),
(5,10,'www.cat.com','video editors',2),
(6,15,'www.monkey.com','graphic designers',3),
(7,25,'www.lion.com','video editors',4),
(8,20,'www.tiger.com','photographers',5);

INSERT INTO staff (id,hire_date,working_hours,payment_rate,notified_id)
VALUES (9,'2010-3-9',38,5.32,6),
(10,'2011-9-20',40,6.20,7),
(11,'2017-5-5',18,7.78,8),
(12,'2015-2-2',20,9.20,9),
(13,'2013-6-7',25,3.12,10);

INSERT INTO content_type ([type])
VALUES('video'), ('logos'), ('photos');

INSERT INTO content_manager (id,[type])
VALUES (9,'video'),
(10,'logos'),
(11,'photos');

INSERT INTO reviewer(id)
VALUES (12), (13);

INSERT INTO [message] (sent_at,contributer_id,viewer_id,sender_type,read_at,[text],read_status)
VALUES('2012-1-1 12:10:05.123',4,1,1,'2012-1-1 12:10:06.123','HI',1),
('2013-12-24 1:20:05.145',6,2,0,NULL,'BYE',0),
('2015-3-4 12:10:05.123',5,3,0,'2015-3-5 12:10:06.123','BRO',1);

INSERT INTO category ([type],[description])
VALUES('educational','learning things'),
('invesment','Different types of businesses'),
('tourism','traveling to see the world');

INSERT INTO sub_category (category_type,[name])
VALUES('educational','High school'),
('educational','middle school'),
('invesment','real state'),
('invesment','stock'),
('tourism','medical'),
('tourism','cultural');

INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;
INSERT INTO notification_object DEFAULT VALUES;

INSERT INTO content (link,uploaded_at, contributer_id, category_type, subcategory_name , [type])
VALUES ('www.car.com','2012-1-1 12:10:05.123',4,'educational','High school','video'),
('www.bike.com','2012-1-1 12:10:05.123',5,'invesment','real state','logos'),
('www.airplane.com','2012-1-1 12:10:05.123',6,'tourism','medical','video'),
('www.train.com','2012-1-1 12:10:05.123',7,'tourism','cultural','logos'),
('www.truck.com','2012-1-1 12:10:05.123',8,'tourism','medical','photos'),
('www.car.com','2012-1-1 12:10:05.123',8,'educational','High school','video'),
('www.bike.com','2012-1-1 12:10:05.123',5,'invesment','real state','logos'),
('www.airplane.com','2012-1-1 12:10:05.123',6,'tourism','medical','video'),
('www.bike.com','2012-1-1 12:10:05.123',7,'invesment','real state','logos'),
('www.airplane.com','2012-1-1 12:10:05.123',7,'tourism','medical','video'),
('www.far.com','2015-1-1 12:10:05.123',5,'educational','High school','video'),
('www.bike.com','2019-1-1 12:10:05.123',5,'invesment','real state','logos'),
('www.airplane.com','2017-1-1 12:10:05.123',5,'tourism','medical','video'),
('www.boat.com','2010-1-1 12:10:05.123',7,'tourism','cultural','logos'),
('www.truck.com','2011-1-1 12:10:05.123',8,'tourism','medical','photos'),
('www.1.com','2013-1-1 12:10:05.123',4,'educational','High school','video'),
('www.2.com','2014-1-1 12:10:05.123',4,'educational','High school','video'),
('www.3.com','2015-1-1 12:10:05.123',4,'educational','High school','video');

INSERT INTO original_content (id,content_manager_id,reviewer_id,review_status,filter_status,rating)
VALUES(1,9,12,0,0,1),
(2,10,13,1,0,2),
(3,11,12,1,1,3),
(4,9,12,0,0,4),
(5,10,12,1,0,5),
(6,11,13,1,1,1),
(7,9,13,0,0,2),
(8,10,12,1,0,3),
(9,11,13,1,1,4),
(10,9,12,0,0,5),
(16,NULL,12,1,NULL,3),
(17,9,NULL,NULL,NULL,5),
(18,NULL,12,0,NULL,1);

INSERT INTO existing_request(original_content_id,viewer_id)
VALUES(1,3), (2,2), (3,1), (3,3), (3,2), (3,1), (2,1), (1,2), (1,1);

INSERT INTO new_request (accept_status, specified, information, viewer_id, notif_obj_id,contributer_id,accept_date)
VALUES(1,0,'bola',1,1,4,'2013-1-15 1:10:05.123'),
(1,1,'ola',2,2,4,'2014-1-15 1:10:05.123'),
(1,0,'mola',3,3,5,'2013-1-15 1:10:05.123'),
(1,1,'kola',1,4,5,'2014-2-16 2:10:05.123'),
(1,0,'aola',2,5,5,'2015-3-17 5:10:05.123'),
(1,1,'wola',3,6,6,'2016-4-11 8:10:05.123'),
(1,0,'oola',2,7,5,'2015-3-17 5:10:05.123'),
(1,0,'bolk',1,8,7,'2016-3-17 5:10:05.123'),
(NULL,0,'bolf',3,9,NULL,NULL),
(NULL,0,'sola',2,10,NULL,NULL),
(NULL,0,'nola',1,11,NULL,NULL);

INSERT INTO new_content(id, new_request_id)
VALUES(11,3), (12,4), (13,5);

INSERT INTO rate(viewer_id, original_content_id , [date], rate)
VALUES(1,1,'2013-1-15',1),
(2,2,'2010-1-15',2),
(3,3,'2011-2-16',3),
(1,4,'2012-3-17',4),
(2,5,'2013-4-18',5),
(3,6,'2014-5-19',1),
(1,7,'2015-6-20',2),
(2,8,'2016-7-21',3),
(3,9,'2017-8-22',4),
(1,10,'2018-9-23',5);

INSERT INTO comment (Viewer_id, original_content_id, [date] , [text])
VALUES(1,1,'2013-1-15 1:10:05.123','aa'),
(2,2,'2014-2-16 2:10:05.123','bb'),
(3,3,'2016-4-11 8:10:05.123','Roses are red. Violets are blue');

INSERT INTO [event] ([description], [location], city, [time], entertainer, notification_object_id, viewer_id)
VALUES('big','cfc','cairo','2016-4-11 8:10:05.123','clown',12,3),
('small','point 90','alex','2014-2-16 2:10:05.123','singer',13,2),
('medium','down town','helwan','2013-1-15 1:10:05.123','dancer',14,1),
('very small','mazareta','gharbya','2013-1-15 1:10:05.123','dancer',15,1);

INSERT INTO event_photos_link (event_id , link)
VALUES(1,'www.party.com'),
(3,'www.concert.com');

INSERT INTO event_videos_link (event_id , link)
VALUES(2,'www.festival.com');

INSERT INTO advertisement ([description], [location], event_id, viewer_id)
VALUES('gym','zamalek',1,1),
('cafe','new cairo',2,1),
('restaurant','new egypt',3,2),
('cafe','Kif kif', NULL, 1);


INSERT INTO ads_Photos_Link (advertisement_id, link)
VALUES(1,'www.party.com'),
(3,'www.concert.com');

INSERT INTO ads_Video_Link (advertisement_id, link)
VALUES(2,'www.gym.com'),
(4,'www.cafe.com');

--Total number of Announcements is (no. of notified persons * no. of notified objects)
--The below insertions do not include all combinations
INSERT INTO announcement(seen_at, sent_at, notified_person_id, notification_object_id)
VALUES('2014-7-16 2:10:05.123','2014-2-16 2:10:05.123',2,1),
('2014-2-16 5:10:05.123','2014-2-16 2:10:05.123',5,2),
('2015-2-16 2:10:05.123','2014-2-16 2:10:05.123',7,3);
GO
