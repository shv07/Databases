CREATE DATABASE PublicationManagementSystem;
USE PublicationManagementSystem;

DROP TABLE IF EXISTS Author;
CREATE TABLE Author (
  AuthCode INTEGER NOT NULL,
  AuthName VARCHAR(80) NOT NULL,
  PRIMARY KEY(AuthCode)
); 

DROP TABLE IF EXISTS Book;
CREATE TABLE Book (
  BookCode INTEGER NOT NULL,
  BookName VARCHAR(80) NOT NULL,
  PRIMARY KEY(BookCode)
); 


DROP TABLE IF EXISTS Publisher;
CREATE TABLE Publisher (
  PubCode INTEGER NOT NULL,
  PubName VARCHAR(80) NOT NULL,
  PubCity VARCHAR(80) NOT NULL,
  PRIMARY KEY(PubCode)
); 


DROP TABLE IF EXISTS Writes;
CREATE TABLE Writes (
  AuthCode INTEGER NOT NULL,
  BookCode INTEGER NOT NULL,
  FOREIGN KEY(AuthCode) REFERENCES Author(AuthCode),
  FOREIGN KEY(BookCode) REFERENCES Book(BookCode),
  PRIMARY KEY(AuthCode, BookCode)

); 


DROP TABLE IF EXISTS Sends;
CREATE TABLE Sends (
  AuthCode INTEGER NOT NULL,
  BookCode INTEGER NOT NULL,
  PubCode INTEGER NOT NULL,
  FOREIGN KEY(AuthCode) REFERENCES Author(AuthCode),
  FOREIGN KEY(PubCode) REFERENCES Publisher(PubCode),
  FOREIGN KEY(BookCode) REFERENCES Book(BookCode),
  PRIMARY KEY(AuthCode, PubCode, BookCode)
); 

DROP TABLE IF EXISTS Publishes;
CREATE TABLE Publishes (
  BookCode INTEGER NOT NULL,
  PubCode INTEGER ,
  FOREIGN KEY(BookCode) REFERENCES Book(BookCode),
  FOREIGN KEY(PubCode) REFERENCES Publisher(PubCode),
  PRIMARY KEY(BookCode)
); 
