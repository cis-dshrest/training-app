create database if not exists exploration;
use exploration;
create table if not exists helpmessage
(
	id INT NOT NULL auto_increment, 
    title VARCHAR(80) NOT NULL,
    body TEXT NOT NULL,
    PRIMARY KEY(id),
    UNIQUE KEY (title)
    
    
);

insert ignore into helpmessage values(0, "Home", "This is the Home page. Please log in to advance.");
insert ignore into helpmessage(id, title, body) values(null, "About", "This is the About page.");
insert ignore into helpmessage(id, title, body) values(null, "Admin", "This is the Admin page visible only to admins.");
insert ignore into helpmessage(id, title, body) values(null, "Profile", "This is the Profile page. Here you can update your information.");
insert ignore into helpmessage(id, title, body) values(null, "Sign In", "Please sign in to advance. You will need to register for an account if you haven't done so.\nForgot your password? Click forgot password and follow instructions.");
insert ignore into helpmessage(id, title, body) values(null, "Sign Out", "This is the Sign out page.");
insert ignore into helpmessage(id, title, body) values(null, "Edit Users", "Administrators can edit other user preferences from resetting other user's passwords to making a user active or inactive. Admins can also delete users.");
insert ignore into helpmessage(id, title, body) values(null, "Create Game", "Add your friends and create a game.");


create table if not exists users
(	
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(255) DEFAULT "USER",
    is_active INT DEFAULT 1,
    PRIMARY KEY (id),
    UNIQUE KEY (username)
);

insert ignore into users(firstname, lastname, username, password) values("tom", "hanks", "testuser", "password");
insert ignore into users(firstname, lastname, username, password) values("ed", "eddy", "edddy", "password");
insert ignore into users(firstname, lastname, username, password, role) values("kumar", "shrestha", "kumar", "kumar", "ADMIN");


create table if not exists gamescores
(
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
    gametitle VARCHAR(255) NOT NULL,
    jsondata TEXT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (gametitle)
);


create table if not exists events
(
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
    eventname VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    startdate TIMESTAMP,
    enddate TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY (eventname)
);

insert ignore into events(id, eventname, description, location, startdate, enddate) values(0, "Jmeter Training Session", "Learn to test your application for performance with jmeter.", "111 Mass Ave", "2015-11-20 09:00:00", "2015-11-20 15:00:00");
insert ignore into events(id, eventname, description, location, startdate, enddate) values(0, "Version Control/GIT Training", "This training will provide an introduction to Version Control Systems, specifically GIT and will provide introductory training for using git.", "20 Mass Ave", "2015-11-25 10:00:00", "2015-11-25 4:00:00");


create table if not exists event_registration
(
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
    eventid int(11) unsigned NOT NULL,
    username VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (eventId,username)
);

