CREATE TABLE Movie (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(255),
    ReleaseDate DATE,
    Description TEXT
);

CREATE TABLE Media (
    MediaID INT PRIMARY KEY,
    Type ENUM('Video', 'Image'),
    URL VARCHAR(255),
    MovieID INT,
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

CREATE TABLE Genre (
    GenreID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE MovieGenre (
    MovieID INT,
    GenreID INT,
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
    PRIMARY KEY (MovieID, GenreID)
);

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Email VARCHAR(255)
);

CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    Content TEXT,
    Rating INT,
    MovieID INT,
    UserID INT,
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY,
    Name VARCHAR(255),
    Biography TEXT
);

CREATE TABLE Skill (
    SkillID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE ArtistSkill (
    ArtistID INT,
    SkillID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (SkillID) REFERENCES Skill(SkillID),
    PRIMARY KEY (ArtistID, SkillID)
);

CREATE TABLE Role (
    RoleID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE MovieRole (
    MovieRoleID INT PRIMARY KEY,
    MovieID INT,
    ArtistID INT,
    RoleID INT,
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID)
);
