-- Build a DATABASE.
CREATE DATABASE sub_saharan_covid;

USE sub_saharan_covid;

-- Table Person
CREATE TABLE Person (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Country VARCHAR(255),
    Age_Group VARCHAR(50),
    Gender VARCHAR(10),
    Employment_Type VARCHAR(100)
);

-- Table Jobs
CREATE TABLE Jobs (
    ID INT PRIMARY KEY,
    Job_Type VARCHAR(255),
    Informal_Worker VARCHAR(10),
    Informal_Work_Type VARCHAR(255),
    Job_Loss VARCHAR(255),
    Job_Regain VARCHAR(255),
    FOREIGN KEY (ID) REFERENCES Person(ID)
);

-- Table Income_Expenses
CREATE TABLE Income_Expenses (
    ID INT PRIMARY KEY,
    Monthly_Income VARCHAR(100),
    Monthly_Income_Bracket FLOAT,
    Income_Change VARCHAR(255),
    Monthly_Need VARCHAR(100),
    Expense_Responsibility VARCHAR(255),
    FOREIGN KEY (ID) REFERENCES Person(ID)
);

-- Table Financial_Assistance
CREATE TABLE Financial_Assistance (
    ID INT PRIMARY KEY,
    Aid VARCHAR(10),
    AidSource_Government VARCHAR(10),
    AidSource_Charities_Donations VARCHAR(10),
    AidSource_Friends_family VARCHAR(10),
    AidSource_Other VARCHAR(10),
    AidSource_Religious_Organizations VARCHAR(10),
    FOREIGN KEY (ID) REFERENCES Person(ID)
);

-- Table Economical_Impact
CREATE TABLE Economical_Impact (
    ID INT PRIMARY KEY,
    COVID_Loans VARCHAR(10),
    Mobile_Money_Activity VARCHAR(255),
    Mobile_Money_Deposit VARCHAR(10),
    Government_Priority VARCHAR(255),
    FOREIGN KEY (ID) REFERENCES Person(ID)
);