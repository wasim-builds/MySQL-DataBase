-- Table: Departments
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    HireDate DATE NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table: Projects
CREATE TABLE Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    Budget DECIMAL(12, 2),
    StartDate DATE,
    EndDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Sample data insertion
INSERT INTO Departments (DepartmentName, Location)
VALUES 
('Human Resources', 'New York'),
('Engineering', 'San Francisco'),
('Sales', 'Chicago');

INSERT INTO Employees (FullName, Email, PhoneNumber, HireDate, DepartmentID)
VALUES 
('Alice Johnson', 'alice.johnson@example.com', '555-1234', '2022-03-15', 1),
('Bob Smith', 'bob.smith@example.com', '555-5678', '2021-07-01', 2),
('Charlie Brown', 'charlie.brown@example.com', '555-8765', '2023-01-10', 3);

INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate, DepartmentID)
VALUES
('HR Management System', 50000.00, '2023-05-01', '2023-12-31', 1),
('New Website Development', 150000.00, '2023-06-15', '2024-01-15', 2),
('Sales Optimization Tool', 75000.00, '2023-04-01', '2023-10-30', 3);

-- Retrieval query examples
SELECT 
    e.EmployeeID, 
    e.FullName, 
    e.Email, 
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d
ON 
    e.DepartmentID = d.DepartmentID;

SELECT 
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM 
    Departments d
LEFT JOIN 
    Employees e
ON 
    d.DepartmentID = e.DepartmentID
GROUP BY 
    d.DepartmentName;

SELECT 
    d.DepartmentName,
    SUM(p.Budget) AS TotalBudget
FROM 
    Departments d
LEFT JOIN 
    Projects p
ON 
    d.DepartmentID = p.DepartmentID
GROUP BY 
    d.DepartmentName;

SELECT 
    ProjectName, 
    StartDate, 
    EndDate 
FROM 
    Projects 
WHERE 
    StartDate > CURDATE();