CREATE DATABASE IEgypt_5;
USE IEgypt_5;

CREATE TABLE [user] (
    id INT PRIMARY KEY IDENTITY,
    first_name VARCHAR(64),
    middle_name VARCHAR(64),
    last_name VARCHAR(64),
	email VARCHAR(64) UNIQUE,
    birth_date DATETIME NOT NULL,
    deactivate BIT DEFAULT 0,
    last_login DATETIME,
    age AS YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date),
    [password] VARCHAR(64)
);

CREATE TABLE viewer (
    id INT PRIMARY KEY,
    working_place VARCHAR(64),
    working_place_type VARCHAR(64),
    working_place_description TEXT,
    FOREIGN KEY(id) REFERENCES [user] ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE notified_Person (
    id INT PRIMARY KEY IDENTITY
);

CREATE TABLE contributor (
    id INT PRIMARY KEY,
    years_of_experience INT,
    specialization VARCHAR(64),
    portfolio_link VARCHAR(64),
    notified_id INT,
    FOREIGN KEY(id) REFERENCES [user] ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(notified_id) REFERENCES notified_Person ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE staff (
    id INT PRIMARY KEY,
    hire_date DATETIME,
    working_hours INT NOT NULL,
    payment_rate REAL NOT NULL,
    total_salary AS (payment_rate * working_hours),
    notified_id INT,
    FOREIGN KEY(id) REFERENCES [user] ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(notified_id) REFERENCES notified_Person ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE reviewer (
    id INT PRIMARY KEY,
    FOREIGN KEY(id) REFERENCES staff ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [message] (
    sent_at DATETIME NOT NULL,
    contributer_id INT,
    viewer_id INT,
    sender_type BIT,
    read_at DATETIME,
    [text] TEXT,
    read_status BIT,
    PRIMARY KEY(sent_at, contributer_id, viewer_id, sender_type),
    FOREIGN KEY(contributer_id) REFERENCES contributor ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(viewer_id) REFERENCES viewer
);

CREATE TABLE category (
    [type] VARCHAR(64) PRIMARY KEY,
    [description] TEXT,
);

CREATE TABLE sub_category (
    category_type VARCHAR(64),
    [name] VARCHAR(64),
    PRIMARY KEY(category_type, name),
    FOREIGN KEY(category_type) REFERENCES category ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE content_type (
    [type] VARCHAR(64) PRIMARY KEY
);

CREATE TABLE content_manager (
    id INT PRIMARY KEY,
    [type] VARCHAR(64),
    FOREIGN KEY(id) REFERENCES staff ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY([type]) REFERENCES content_type ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE notification_object (
    id INT PRIMARY KEY IDENTITY
);

CREATE TABLE new_request (
    id INT PRIMARY KEY IDENTITY,
    accept_status BIT,
    specified BIT,
    information TEXT,
    viewer_id INT NOT NULL,
    notif_obj_id INT NOt NULL,
    contributer_id INT,
	accept_date DATETIME,
    FOREIGN KEY(viewer_id) REFERENCES viewer ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(notif_obj_id) REFERENCES notification_object ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(contributer_id) REFERENCES contributor
);

CREATE TABLE content (
    id INT PRIMARY KEY IDENTITY,
    link VARCHAR(64),
    uploaded_at DATETIME,
    contributer_id INT,
    category_type VARCHAR(64),
    subcategory_name VARCHAR(64),
    [type] VARCHAR(64),
    FOREIGN KEY(contributer_id) REFERENCES contributor ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY([type]) REFERENCES content_type ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(category_type, subcategory_name) REFERENCES sub_Category ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE original_content (
    id INT PRIMARY KEY,
    content_manager_id INT,
    reviewer_id INT,
    review_status BIT,
    filter_status BIT,
    rating INT,
    FOREIGN KEY(id) REFERENCES content ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(reviewer_id) REFERENCES reviewer,
    FOREIGN KEY(content_manager_id) REFERENCES content_manager
);

CREATE TABLE existing_request (
    id INT PRIMARY KEY IDENTITY,
    original_content_id INT,
    viewer_id INT,
    FOREIGN KEY(original_content_id) REFERENCES original_content ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(viewer_id) REFERENCES viewer
);

CREATE TABLE new_content (
    id INT PRIMARY KEY,
    new_request_id INT,
    FOREIGN KEY(id) REFERENCES content ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(new_request_id) REFERENCES new_request
);

CREATE TABLE comment (
    viewer_id INT,
    original_content_id INT,
    [date] DATETIME,
    [text] TEXT,
    PRIMARY KEY(viewer_id, original_content_id, [date]),
    FOREIGN KEY(viewer_id) REFERENCES viewer,
    FOREIGN KEY(original_content_id) REFERENCES original_content ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE rate (
    viewer_id INT,
    original_content_id INT,
    [date] DATETIME,
    rate INT,
    PRIMARY KEY(viewer_id, original_content_id),
    FOREIGN KEY(viewer_id) REFERENCES viewer,
    FOREIGN KEY(original_content_id) REFERENCES original_content ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [event] (
    id INT PRIMARY KEY IDENTITY,
    [description] TEXT,
    [location] VARCHAR(64),
    city VARCHAR(64),
    [time] DATETIME,
    entertainer VARCHAR(64),
    notification_object_id INT,
    viewer_id INT,
    FOREIGN KEY(notification_object_id) REFERENCES notification_object ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(viewer_id) REFERENCES viewer
);

CREATE TABLE event_photos_link (
    event_id INT,
    link VARCHAR(64),
    PRIMARY KEY(event_id, link),
    FOREIGN KEY(event_id) REFERENCES event ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE event_videos_link (
    event_id INT,
    link VARCHAR(64),
    PRIMARY KEY(event_id, link),
    FOREIGN KEY(event_id) REFERENCES event ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE advertisement (
    id INT PRIMARY KEY IDENTITY,
    [description] TEXT,
    [location] VARCHAR(64),
    event_id INT,
    viewer_id INT,
    FOREIGN KEY(event_id) REFERENCES event ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(viewer_id) REFERENCES viewer
);

CREATE TABLE ads_Video_Link (
    advertisement_id INT,
    link VARCHAR(64),
    PRIMARY KEY(advertisement_id, link),
    FOREIGN KEY(advertisement_id) REFERENCES advertisement ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ads_Photos_Link (
    advertisement_id INT,
    link VARCHAR(64),
    PRIMARY KEY(advertisement_id, link),
    FOREIGN KEY(advertisement_id) REFERENCES advertisement ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE announcement (
    id INT PRIMARY KEY IDENTITY,
    seen_at DATETIME,
    sent_at DATETIME,
    notified_person_id INT,
    notification_object_id INT,
    FOREIGN KEY(notified_person_id) REFERENCES notified_Person ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(notification_object_id) REFERENCES notification_object ON DELETE CASCADE ON UPDATE CASCADE
);
