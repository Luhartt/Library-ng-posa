CREATE TABLE `COMMENT` (
  `CommentID` INT,
  `CommentText` TEXT,
  `CreatedAt` TIMESTAMP,
  `UserID` INT,
  PRIMARY KEY (`CommentID`),
  
);

CREATE TABLE `ACCOUNT` (
  `UserID` INT,
  `Username` VARCHAR (255),
  `Password` VARCHAR (255),
  `Name` VARCHAR (255),
  `Email` VARCHAR (255),
  `ProfilePicture` VARCHAR (255),
  `AccountType` VARCHAR (255),
  PRIMARY KEY (`UserID`)
);

CREATE TABLE `BOOK LIST` (
  `BookID` INT,
  `Title` VARCHAR (255),
  `Author` VARCHAR (255),
  `ReleaseDate` DATE,
  `ISBN` VARCHAR (255),
  `Description` VARCHAR (255),
  `BookCover` VARCHAR (255),
  `Status` VARCHAR (255),
  PRIMARY KEY (`BookID`)
);

CREATE TABLE `BORROWED LIST` (
  `BorrowID` INT,
  `UserID` INT,
  `BookID` INT,
  `Status` VARCHAR (255),
  `DateBorrowed` DATE,
  PRIMARY KEY (`BorrowID`),
  FOREIGN KEY (`BookID`) REFERENCES `BOOK LIST`(`BookID`)
);

CREATE TABLE `WANT TO READ` (
  `WtrID` INT,
  `UserID` INT,
  `BookID` INT,
  PRIMARY KEY (`WtrID`),
  FOREIGN KEY (`BookID`) REFERENCES `BOOK LIST`(`BookID`)
);

CREATE TABLE `AUDIT LOG` (
  `AuditID` INT,
  `UserID` INT,
  `BookID` INT,
  `Action` VARCHAR (255),
  `Date` DATETIME,
  PRIMARY KEY (`AuditID`),
  FOREIGN KEY (`BookID`) REFERENCES `BOOK LIST`(`BookID`)
);
