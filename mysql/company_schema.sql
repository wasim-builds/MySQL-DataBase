-- Drop tables if they exist to start fresh
-- Order matters due to foreign key constraints
DROP TABLE IF EXISTS Dependents;
DROP TABLE IF EXISTS Works_On;
DROP TABLE IF EXISTS Projects;
-- Drop Foreign Key from Departments to Employees to allow clean drop
ALTER TABLE Departments DROP FOREIGN KEY IF EXISTS fk_dept_manager;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- Table: Departments
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    ManagerID INT -- FK added later
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    HireDate DATE NOT NULL,
    JobTitle VARCHAR(50),
    Salary DECIMAL(10, 2),
    SupervisorID INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE SET NULL,
    FOREIGN KEY (SupervisorID) REFERENCES Employees(EmployeeID) ON DELETE SET NULL
);

-- Add constraint for ManagerID in Departments
ALTER TABLE Departments
ADD CONSTRAINT fk_dept_manager FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID) ON DELETE SET NULL;

-- Table: Projects
CREATE TABLE Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    Budget DECIMAL(12, 2),
    StartDate DATE,
    EndDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE SET NULL
);

-- Table: Works_On (Junction Table for Employees <-> Projects)
CREATE TABLE Works_On (
    EmployeeID INT,
    ProjectID INT,
    Hours DECIMAL(5, 2),
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE
);

-- Table: Dependents
CREATE TABLE Dependents (
    DependentID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    DependentName VARCHAR(100) NOT NULL,
    Relationship VARCHAR(50),
    BirthDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) ON DELETE CASCADE
);

-- ========================================================
-- SAMPLE DATA INSERTION
-- ========================================================

-- 1. Departments (Initially without ManagerID)
INSERT INTO Departments (DepartmentID, DepartmentName, Location) VALUES
(1, 'Human Resources', 'New York'),
(2, 'Engineering', 'San Francisco'),
(3, 'Sales', 'Chicago'),
(4, 'Marketing', 'Los Angeles');

-- 2. Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, PhoneNumber, HireDate, JobTitle, Salary, DepartmentID, SupervisorID) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', '2020-03-15', 'HR Manager', 85000.00, 1, NULL),
(2, 'Bob', 'Smith', 'bob.smith@example.com', '555-5678', '2021-07-01', 'Software Engineer', 95000.00, 2, NULL),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '555-8765', '2022-01-10', 'Sales Associate', 55000.00, 3, NULL),
(4, 'Diana', 'Prince', 'diana.prince@example.com', '555-4321', '2019-05-20', 'Marketing Director', 105000.00, 4, NULL),
(5, 'Evan', 'Wright', 'evan.wright@example.com', '555-1111', '2023-02-01', 'Software Engineer', 90000.00, 2, 2),
(6, 'Fiona', 'Gallagher', 'fiona.g@example.com', '555-2222', '2023-03-15', 'HR Assistant', 50000.00, 1, 1);

-- Update Supervisors
UPDATE Employees SET SupervisorID = 1 WHERE EmployeeID = 6;
UPDATE Employees SET SupervisorID = 2 WHERE EmployeeID = 5;

-- 3. Update Departments with Managers
UPDATE Departments SET ManagerID = 1 WHERE DepartmentID = 1;
UPDATE Departments SET ManagerID = 2 WHERE DepartmentID = 2;
UPDATE Departments SET ManagerID = 3 WHERE DepartmentID = 3; -- Charlie manages Sales
UPDATE Departments SET ManagerID = 4 WHERE DepartmentID = 4;

-- 4. Projects
INSERT INTO Projects (ProjectID, ProjectName, Budget, StartDate, EndDate, DepartmentID) VALUES
(1, 'HR Management System', 50000.00, '2023-05-01', '2023-12-31', 1),
(2, 'New Website Development', 150000.00, '2023-06-15', '2024-01-15', 2),
(3, 'Sales Optimization Tool', 75000.00, '2023-04-01', '2023-10-30', 3),
(4, 'Q4 Marketing Campaign', 30000.00, '2023-10-01', '2023-12-31', 4);

-- 5. Works_On
INSERT INTO Works_On (EmployeeID, ProjectID, Hours) VALUES
(1, 1, 10.0), -- Alice on HR System
(6, 1, 25.0), -- Fiona on HR System
(2, 2, 30.0), -- Bob on Website
(5, 2, 40.0), -- Evan on Website
(3, 3, 20.0), -- Charlie on Sales Tool
(4, 4, 15.5); -- Diana on Marketing Campaign

-- 6. Dependents
INSERT INTO Dependents (EmployeeID, DependentName, Relationship, BirthDate) VALUES
(1, 'Sophia Johnson', 'Daughter', '2015-06-20'),
(2, 'Liam Smith', 'Son', '2018-09-05'),
(4, 'Clark Prince', 'Husband', '1985-02-14');

-- ========================================================
-- EXAMPLE QUERIES (Verification)
-- ========================================================

-- SELECT * FROM Employees;
-- SELECT d.DepartmentName, e.FirstName, e.LastName FROM Departments d JOIN Employees e ON d.ManagerID = e.EmployeeID;