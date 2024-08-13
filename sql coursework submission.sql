/*
Student name: Blessing Emmanuel            
Student username: addf023
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE addf023_Organiser
(
    Organiser_ID integer(4) primary key,
    OrganiserName varchar(50),
    ContactInfo varchar(50)
);

CREATE TABLE addf023_Venues
(
    Venue_ID integer(5) primary key,
    VenueName varchar(50),
    VenueAddress varchar(50),
    VenueCapacity integer(8),
    VenueParking char(1) 
);

CREATE TABLE addf023_Events
(
    Event_ID integer(3) primary key,
    EventName varchar(50),
    EventType varchar(50),
    EventDate integer(6),
    EventBudget float(10),
    Venue_ID integer(5),
    foreign key (Venue_ID) references addf023_Venues (Venue_ID)
);

CREATE TABLE addf023_Sessions
(
    Session_ID integer(5) primary key,
    SessionTitle varchar(50),
    SessionDuration integer(10),
    StartTime time,
    EndTime time,
    Event_ID integer(3),
    foreign key (Event_ID) references addf023_Events (Event_ID)
);

CREATE TABLE addf023_EventsOrganiser
(
    Organiser_ID INTEGER(4),
    Event_ID INTEGER(3),
    Roles VARCHAR(50),
    PRIMARY KEY (Organiser_ID, Event_ID),
    FOREIGN KEY (Event_ID) REFERENCES addf023_Events (Event_ID),
    FOREIGN KEY (Organiser_ID) REFERENCES addf023_Organiser (Organiser_ID)
);



/* SECTION 2 - INSERT STATEMENTS */

INSERT into addf023_Organiser values
    (1001, 'John Smith Events', 'john.smith@example.com'),
    (1002, 'EventPro Co.', 'info@eventproco.com'),
    (1003, 'EventPlanners Ltd.', 'contact@eventplanners.com'),
    (1004, 'Elite Organisers', 'info@eliteorganisers.net'),
    (1005, 'Tech Events Management', 'tech.events@example.com'),
    (1006, 'Artistic Productions', 'info@artisticpro.com'),
    (1007, 'Cultural Affairs Group', 'cultural.affairs@example.com'),
    (1008, 'Business Summit Organisers', 'biz.summit@example.com'),
    (1009, 'Sports Event Experts', 'sports.events@example.com'),
    (1010, 'Music Festivals Inc.', 'info@musicfestivals.com');

INSERT into addf023_Venues values
    (10001, 'Conference Center A', '123 Main Street', 500, 'Y'),
    (10002, 'Music Hall B', '456 Broadway Avenue', 1000, 'N'),
    (10003, 'Workshop Venue C', '789 Oak Street', NULL, 'Y'),
    (10004, 'Exhibition Hall D', '101 Pine Street', 800, 'N'),
    (10005, 'Sports Arena E', '202 Maple Avenue', 2000, 'Y'),
    (10006, 'Seminar Hall F', '303 Cedar Street', 300, 'N'),
    (10007, 'Trade Show Venue G', '404 Elm Avenue', NULL, 'Y'),
    (10008, 'Cultural Center H', '505 Birch Street', 1000, 'N'),
    (10009, 'Tech Conference Venue I', '606 Walnut Avenue', 400, 'Y'),
    (10010, 'Art Gallery J', '707 Pine Street', 150, 'N');

INSERT into addf023_Events values 
    (101, 'Conference A', 'Conference', 20230101, 50000.00, 10001),
    (102, 'Music Festival B', 'Festival', 20230515, 75000.50, 10002),
    (103, 'Workshop C', 'Workshop', 20231020, 12000.75, 10003),
    (104, 'Exhibition D', 'Exhibition', 20231205, 30000.25, 10010),
    (105, 'Sports Event E', 'Sports Event', 20231215, 45000.00, 10004),
    (106, 'Seminar F', 'Seminar', 20240110, 18000.80, 10002),
    (107, 'Trade Show G', 'Trade Show', 20240220, 25000.50, 10003),
    (108, 'Cultural Festival H', 'Festival', 20240401, 60000.00, 10005),
    (109, 'Tech Conference I', 'Conference', 20240512, 80000.75, 10004),
    (110, 'Art Exhibition J', 'Exhibition', 20241005, 35000.25, 10008),
    (111, 'Business Summit K', 'Business Summit', 20241220, 70000.50, 10003);

INSERT into addf023_Sessions values
    (10001, 'Keynote Address', 90, '09:00:00', '10:30:00', 101),
    (10002, 'Concert Performance', 120, '18:00:00', '20:00:00', 102),
    (10003, 'Workshop on Innovation', 180, '13:00:00', '16:00:00', 103),
    (10004, 'Art Exhibition Opening', 120, '17:30:00', '19:30:00', 104),
    (10005, 'Sports Event Finals', 180, '15:00:00', '18:00:00', 105),
    (10006, 'Tech Seminar', 90, '14:00:00', '15:30:00', 106),
    (10007, 'Trade Show Presentations', 120, '11:00:00', '13:00:00', 107),
    (10008, 'Cultural Performances', 240, '19:00:00', '23:00:00', 102),
    (10009, 'Tech Conference Sessions', 180, '09:30:00', '12:30:00', 109),
    (10010, 'Art Workshop', 120, '14:30:00', '16:30:00', 110),
    (10011, 'Business Summit Panels', 180, '10:00:00', '13:00:00', 111);

INSERT INTO addf023_EventsOrganiser VALUES
    (1001, 101, 'Event Coordinator'),
    (1002, 101, 'Logistics Manager'),
    (1004, 103, 'Program Manager'),
    (1005, 103, 'Speaker Coordinator'),
    (1006, 104, 'Exhibition Coordinator'),
    (1007, 105, 'Sports Event Manager'),
    (1008, 106, 'Program Manager'),
    (1009, 107, 'Trade Show Coordinator'),
    (1010, 108, 'Festival Manager'),
    (1002, 109, 'Program Manager'),
    (1006, 110, 'Art Exhibition Curator'),
    (1008, 111, 'Business Summit Organizer');


/* SECTION 3 - UPDATE STATEMENTS */

/*1*/
UPDATE addf023_Events SET EventName = 'Into the Unknown', EventDate = 20241117
WHERE Event_ID = 110;

UPDATE addf023_Sessions SET SessionDuration = 150, StartTime = '10:30:00'
WHERE Session_ID = 10011;

/* SECTION 4 - SINGLE TABLE SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/


/* 1) Lists venues with under 500 capacity in ascending order*/
SELECT * FROM addf023_Venues
WHERE VenueCapacity < 500
ORDER BY VenueCapacity ASC;

/* 2) Lists the average session duration in hours for each unique Event ID*/
SELECT Event_ID, ROUND(AVG(SessionDuration / 60), 1) AS AverageDuration
FROM addf023_Sessions
GROUP BY Event_ID;

/* 3) Gives me the number of events Organiser 1008 is working at */
SELECT Organiser_ID,
COUNT(DISTINCT Event_ID) AS NumberOfEvents
FROM addf023_EventsOrganiser
WHERE Organiser_ID = 1008;

/* 4) Gives you the contact info of the Elite Organisers company*/
SELECT ContactInfo
FROM addf023_Organiser
WHERE OrganiserName LIKE 'Elite Organisers';

/* 5) Lists venues where venue capacity is given (not NULL) */
SELECT Venue_ID, VenueName, VenueAddress, VenueCapacity
FROM addf023_Venues
WHERE VenueCapacity IS NOT NULL;

/* 6) Lists the average budget for each event type */
SELECT EventType, 
    COUNT(*) AS NumberOfEvents,
    AVG(EventBudget) AS AverageBudget
FROM addf023_Events
GROUP BY EventType;



/* SECTION 5 - MULTIPLE TABLE SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs */


/* 1) Gives you the contact email of all Program Managers, grouped by their Event type*/
SELECT e.EventType, GROUP_CONCAT(DISTINCT o.ContactInfo) 
FROM addf023_Events e, addf023_EventsOrganiser eo, addf023_Organiser o 
WHERE e.Event_ID = eo.Event_ID
AND eo.Organiser_ID = o.Organiser_ID
AND eo.Roles = 'Program Manager'
GROUP BY e.EventType, eo.Roles;

/* 2) Lists all the events organised by 'Business Summit Organisers' and their corresponding venues*/
SELECT e.Event_ID, e.EventName, v.VenueName, v.VenueAddress
FROM addf023_Events e, addf023_Venues v, addf023_EventsOrganiser eo, addf023_Organiser o
WHERE e.Venue_ID = v.Venue_ID
AND e.Event_ID = eo.Event_ID
AND eo.Organiser_ID = o.Organiser_ID
AND o.OrganiserName = 'Business Summit Organisers';

/* 3) Lists the events taking part in 2023 with any one session in the late afternoon/evening (4pm - 8pm) */
SELECT e.EventName, e.EventDate, s.SessionTitle, s.SessionDuration, s.StartTime
FROM addf023_Events e, addf023_Sessions s
WHERE e.Event_ID = s.Event_ID
AND e.EventDate > 20230101 AND e.EventDate < 20240101
    AND s.Session_ID IN (
        SELECT Session_ID
        FROM addf023_Sessions
        WHERE StartTime >= '16:00:00' AND StartTime <= '20:00:00');

 /* 4) Lists the sessions in each event, if no session, event not shown */
SELECT e.Event_ID, e.EventName, s.SessionTitle, COUNT(s.Session_ID) 
FROM addf023_Events e
LEFT JOIN addf023_Sessions s ON e.Event_ID = s.Event_ID
GROUP BY e.Event_ID, e.EventName, e.EventType
HAVING COUNT(s.Session_ID) >= 1;

/* 5) Checking to see if a venue with capacity >= 500 and has parking is available to book on 1st April 2024 and if not what event is being hosted */
SELECT v.Venue_ID, v.VenueName, v.VenueAddress, v.VenueCapacity, v.VenueParking, e.EventName, e.EventType, e.EventDate
FROM addf023_Venues v, addf023_Events e
WHERE v.Venue_ID = e.Venue_ID
AND v.VenueCapacity >= 500 
AND v.VenueParking = 'Y'
AND e.EventDate = 20240401;

/* 6) Lists the organisers and the roles that they play at the events they're working at */
SELECT o.Organiser_ID, o.OrganiserName, e.EventName, eo.Roles
FROM addf023_Organiser o, addf023_EventsOrganiser eo, addf023_Events e 
WHERE o.Organiser_ID = eo.Organiser_ID
AND eo.Event_ID = e.Event_ID;


/* SECTION 6 - DELETE ROWS (make sure the SQL is commented out in this section)
DELETE FROM addf023_Sessions
WHERE SessionDuration > 180;

DELETE FROM addf023_Venues
WHERE VenueName = 'Seminar Hall F';


*/

/* SECTION 7 - DROP TABLES (make sure the SQL is commented out in this section)
DROP TABLE addf023_Sessions;
DROP TABLE addf023_EventsOrganiser;
DROP TABLE addf023_Events;
DROP TABLE addf023_Venues;
DROP TABLE addf023_Organiser;


*/