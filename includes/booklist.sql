CREATE DATABASE IF NOT EXISTS MawmawLibrary;
USE MawmawLibrary

CREATE TABLE `COMMENT` (
  `CommentID` INT AUTO_INCREMENT,
  `CommentText` TEXT NOT NULL,
  `CreatedAt` TIMESTAMP NOT NULL,
  `UserID` INT,
  CONSTRAINT `PK_CommentID` PRIMARY KEY (`CommentID`),
  CONSTRAINT `FK_CommentUserID` FOREIGN KEY (`UserID`) REFERENCES `ACCOUNT`(`UserID`) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE `ACCOUNT` (
  `UserID` INT AUTO_INCREMENT,
  `Username` VARCHAR (255) NOT NULL,
  `Password` VARCHAR (255) NOT NULL,
  `Name` VARCHAR (255) NOT NULL,
  `Email` VARCHAR (255) NOT NULL,
  `ProfilePicture` VARCHAR (255) NOT NULL,
  `AccountType` VARCHAR (255) NOT NULL,
  CONSTRAINT `PK_UserID` PRIMARY KEY (`UserID`)
);

CREATE TABLE `BOOK LIST` (
  `BookID` INT AUTO_INCREMENT,
  `Title` VARCHAR (255) NOT NULL,
  `Author` VARCHAR (255) NOT NULL,
  `ReleaseDate` DATE NOT NULL,
  `ISBN` VARCHAR (255) NOT NULL,
  `Description` VARCHAR (255) NOT NULL,
  `BookCover` VARCHAR (255) NOT NULL,
  `Status` VARCHAR (255) NOT NULL,
  CONSTRAINT `PK_BookID` PRIMARY KEY (`BookID`),
  CONSTRAINT `CHK_Status` CHECK (`Status` IN ('Available', 'Borrowed', 'Library Only', 'Archived'))
);

CREATE TABLE `BORROWED LIST` (
  `BorrowID` INT AUTO_INCREMENT,
  `UserID` INT,
  `BookID` INT,
  `Status` VARCHAR (255) NOT NULL,
  `DateBorrowed` DATE NOT NULL,
  CONSTRAINT `PK_BorrowID` PRIMARY KEY (`BorrowID`),
  CONSTRAINT `FK_BorrowedUserID` FOREIGN KEY (`UserID`) REFERENCES `ACCOUNT`(`UserID`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `FK_BorrowedBookID` FOREIGN KEY (`BookID`) REFERENCES `BOOK LIST`(`BookID`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `CHK_Status` CHECK (`Status` IN ('Borrowed', 'Returned'))
);

CREATE TABLE `WANT TO READ` (
  `WtrID` INT AUTO_INCREMENT,
  `UserID` INT,
  `BookID` INT,
  CONSTRAINT `PK_WantToReadID` PRIMARY KEY (`WtrID`),
  CONSTRAINT `FK_WantToReadUserID` FOREIGN KEY (`UserID`) REFERENCES `ACCOUNT`(`UserID`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `FK_WantToReadBookID` FOREIGN KEY (`BookID`) REFERENCES `BOOK LIST`(`BookID`) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE `AUDIT LOG` (
  `AuditID` INT AUTO_INCREMENT,
  `UserID` INT,
  `BookID` INT,
  `Action` VARCHAR (255) NOT NULL,
  `Date` TIMESTAMP NOT NULL,
  CONSTRAINT `PK_AuditID` PRIMARY KEY (`AuditID`),
  CONSTRAINT `FK_AuditUserID` FOREIGN KEY (`UserID`) REFERENCES `ACCOUNT`(`UserID`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `FK_AuditBookID` FOREIGN KEY (`BookID`) REFERENCES `BOOK LIST`(`BookID`) ON UPDATE CASCADE ON DELETE RESTRICT
);
