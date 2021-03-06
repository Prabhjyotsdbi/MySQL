# INDEX FOR MANAGER
CREATE INDEX idx_positions ON staff(Position);
EXPLAIN SELECT
staff_id,
first_name,
last_name

FROM
staff
WHERE
Position = 'MANAGER';

# INDEX FOR PEOPLE WITH SALARY HIGHER THAN AVERAGE SALARY
CREATE INDEX idx_highsalary ON staff(Salary);
EXPLAIN SELECT
staff_id,
first_name,
last_name
FROM
staff
WHERE Salary >(SELECT AVG(Salary) FROM Staff);
SHOW INDEXES FROM staff;