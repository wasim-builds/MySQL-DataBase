-- Verification Script for Company Schema
-- Run this after company_schema.sql

-- 1. Check Row Counts
SELECT 'Departments' AS TableName, COUNT(*) AS Count FROM Departments
UNION ALL
SELECT 'Employees', COUNT(*) FROM Employees
UNION ALL
SELECT 'Projects', COUNT(*) FROM Projects
UNION ALL
SELECT 'Works_On', COUNT(*) FROM Works_On
UNION ALL
SELECT 'Dependents', COUNT(*) FROM Dependents;

-- 2. Verify Relationships: Employees and their Departments and Managers
SELECT 
    e.EmployeeID, 
    CONCAT(e.FirstName, ' ', e.LastName) AS Employee, 
    d.DepartmentName, 
    CONCAT(m.FirstName, ' ', m.LastName) AS Manager
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
LEFT JOIN Employees m ON d.ManagerID = m.EmployeeID;

-- 3. Verify Works_On: Who is working on what?
SELECT 
    CONCAT(e.FirstName, ' ', e.LastName) AS Employee, 
    p.ProjectName, 
    w.Hours
FROM Works_On w
JOIN Employees e ON w.EmployeeID = e.EmployeeID
JOIN Projects p ON w.ProjectID = p.ProjectID;

-- 4. Verify Dependents
SELECT 
    CONCAT(e.FirstName, ' ', e.LastName) AS Employee, 
    d.DependentName, 
    d.Relationship
FROM Dependents d
JOIN Employees e ON d.EmployeeID = e.EmployeeID;
