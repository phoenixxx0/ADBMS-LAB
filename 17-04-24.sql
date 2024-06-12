import mysql.connector

# Connecting to the server
conn = mysql.connector.connect(user='root',
                               host='localhost',
                               passwd='root',
                               database='dbmslab0304',
                               auth_plugin='mysql_native_password')

cur = conn.cursor()

# Define the SQL query to select all rows from the instructor table
query = "SELECT * FROM TEACHES"

# Execute the SQL query
cur.execute(query)

# Fetch all rows from the result set
results = cur.fetchall()

# Print the results
for row in results:
    print(row)
import mysql.connector

# Connecting to the server
conn = mysql.connector.connect(user='root',
                               host='localhost',
                               passwd='root',
                               database='dbmslab0304',
                               auth_plugin='mysql_native_password')

cur = conn.cursor()

# 1. Insert additional tuple in instructor
insert_query = "INSERT INTO instructor (ID, name, dept_name, salary) VALUES ('10211', 'Smith', 'Biology', 66000)"
cur.execute(insert_query)
conn.commit()

# 2. Delete tuple from instructor
delete_query = "DELETE FROM instructor WHERE ID = '10211' AND name = 'Smith' AND dept_name = 'Biology' AND salary = 66000"
cur.execute(delete_query)
conn.commit()

# 3. Select tuples from instructor where dept_name = 'History'
select_history_query = "SELECT * FROM instructor WHERE dept_name = 'History'"
cur.execute(select_history_query)
history_results = cur.fetchall()
print("Tuples from instructor where dept_name = 'History':")
for row in history_results:
    print(row)

# 4. Find the Cartesian product instructor x TEACHES
cartesian_product_query = "SELECT * FROM instructor, TEACHES"
cur.execute(cartesian_product_query)
cartesian_results = cur.fetchall()
print("\nCartesian product of instructor x TEACHES:")
for row in cartesian_results:
    print(row)

# 5. Find the names of all instructors who have taught some course and the course_id
instructors_course_query = "SELECT DISTINCT i.name, t.COURSE_ID FROM instructor i INNER JOIN TEACHES t ON i.ID = t.ID"
cur.execute(instructors_course_query)
instructors_course_results = cur.fetchall()
print("\nNames of instructors who have taught some course and the course_id:")
for row in instructors_course_results:
    print(row)

# 6. Find the names of all instructors whose name includes the substring “dar”
dar_instructors_query = "SELECT * FROM instructor WHERE name LIKE '%dar%'"
cur.execute(dar_instructors_query)
dar_results = cur.fetchall()
print("\nNames of instructors whose name includes the substring 'dar':")
for row in dar_results:
    print(row)

# 7. Find the names of all instructors with salary between 90,000 and 100,000
salary_range_query = "SELECT * FROM instructor WHERE salary BETWEEN 90000 AND 100000"
cur.execute(salary_range_query)
salary_results = cur.fetchall()
print("\nNames of instructors with salary between 90,000 and 100,000:")
for row in salary_results:
    print(row)

# Close the cursor and connection
cur.close()
conn.close()

# Close the cursor and connection
cur.close()
conn.close()

-- OUTPUT

❯ python 17-04-24.sql
(10101, 'CS-101', '1', 'Fall', 2017)
(10101, 'CS-315', '1', 'Spring', 2018)
(10101, 'CS-347', '1', 'Fall', 2017)
(12121, 'FIN-201', '1', 'Spring', 2018)
(15151, 'MU-199', '1', 'Spring', 2018)
(22222, 'PHY-101', '1', 'Fall', 2017)
(32343, 'HIS-351', '1', 'Spring', 2018)
(45565, 'CS-101', '1', 'Spring', 2018)
(45565, 'CS-319', '1', 'Spring', 2018)
(76766, 'BIO-101', '1', 'Summer', 2017)
(76766, 'BIO-301', '1', 'Summer', 2018)
(83821, 'CS-190', '2', 'Spring', 2017)
(83821, 'CS-319', '2', 'Spring', 2018)
(98345, 'EE-181', '1', 'Spring', 2017)
Tuples from instructor where dept_name = 'History':
(32343, 'El Said', 'History', 60000)
(58583, 'Califieri', 'History', 62000)

Cartesian product of instructor x TEACHES:
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 10101, 'CS-101', '1', 'Fall', 2017)
(12121, 'Wu', 'Finance', 90000, 10101, 'CS-101', '1', 'Fall', 2017)
(15151, 'Mozart', 'Music', 40000, 10101, 'CS-101', '1', 'Fall', 2017)
(22222, 'Einstein', 'Physics', 95000, 10101, 'CS-101', '1', 'Fall', 2017)
(32343, 'El Said', 'History', 60000, 10101, 'CS-101', '1', 'Fall', 2017)
(33456, 'Gold', 'Physics', 87000, 10101, 'CS-101', '1', 'Fall', 2017)
(45565, 'Katz', 'Comp. Sci.', 75000, 10101, 'CS-101', '1', 'Fall', 2017)
(58583, 'Califieri', 'History', 62000, 10101, 'CS-101', '1', 'Fall', 2017)
(76543, 'Singh', 'Finance', 80000, 10101, 'CS-101', '1', 'Fall', 2017)
(76766, 'Crick', 'Biology', 72000, 10101, 'CS-101', '1', 'Fall', 2017)
(83821, 'Brandt', 'Comp. Sci.', 92000, 10101, 'CS-101', '1', 'Fall', 2017)
(98345, 'Kim', 'Elec. Eng.', 80000, 10101, 'CS-101', '1', 'Fall', 2017)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 10101, 'CS-315', '1', 'Spring', 2018)
(12121, 'Wu', 'Finance', 90000, 10101, 'CS-315', '1', 'Spring', 2018)
(15151, 'Mozart', 'Music', 40000, 10101, 'CS-315', '1', 'Spring', 2018)
(22222, 'Einstein', 'Physics', 95000, 10101, 'CS-315', '1', 'Spring', 2018)
(32343, 'El Said', 'History', 60000, 10101, 'CS-315', '1', 'Spring', 2018)
(33456, 'Gold', 'Physics', 87000, 10101, 'CS-315', '1', 'Spring', 2018)
(45565, 'Katz', 'Comp. Sci.', 75000, 10101, 'CS-315', '1', 'Spring', 2018)
(58583, 'Califieri', 'History', 62000, 10101, 'CS-315', '1', 'Spring', 2018)
(76543, 'Singh', 'Finance', 80000, 10101, 'CS-315', '1', 'Spring', 2018)
(76766, 'Crick', 'Biology', 72000, 10101, 'CS-315', '1', 'Spring', 2018)
(83821, 'Brandt', 'Comp. Sci.', 92000, 10101, 'CS-315', '1', 'Spring', 2018)
(98345, 'Kim', 'Elec. Eng.', 80000, 10101, 'CS-315', '1', 'Spring', 2018)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 10101, 'CS-347', '1', 'Fall', 2017)
(12121, 'Wu', 'Finance', 90000, 10101, 'CS-347', '1', 'Fall', 2017)
(15151, 'Mozart', 'Music', 40000, 10101, 'CS-347', '1', 'Fall', 2017)
(22222, 'Einstein', 'Physics', 95000, 10101, 'CS-347', '1', 'Fall', 2017)
(32343, 'El Said', 'History', 60000, 10101, 'CS-347', '1', 'Fall', 2017)
(33456, 'Gold', 'Physics', 87000, 10101, 'CS-347', '1', 'Fall', 2017)
(45565, 'Katz', 'Comp. Sci.', 75000, 10101, 'CS-347', '1', 'Fall', 2017)
(58583, 'Califieri', 'History', 62000, 10101, 'CS-347', '1', 'Fall', 2017)
(76543, 'Singh', 'Finance', 80000, 10101, 'CS-347', '1', 'Fall', 2017)
(76766, 'Crick', 'Biology', 72000, 10101, 'CS-347', '1', 'Fall', 2017)
(83821, 'Brandt', 'Comp. Sci.', 92000, 10101, 'CS-347', '1', 'Fall', 2017)
(98345, 'Kim', 'Elec. Eng.', 80000, 10101, 'CS-347', '1', 'Fall', 2017)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 12121, 'FIN-201', '1', 'Spring', 2018)
(12121, 'Wu', 'Finance', 90000, 12121, 'FIN-201', '1', 'Spring', 2018)
(15151, 'Mozart', 'Music', 40000, 12121, 'FIN-201', '1', 'Spring', 2018)
(22222, 'Einstein', 'Physics', 95000, 12121, 'FIN-201', '1', 'Spring', 2018)
(32343, 'El Said', 'History', 60000, 12121, 'FIN-201', '1', 'Spring', 2018)
(33456, 'Gold', 'Physics', 87000, 12121, 'FIN-201', '1', 'Spring', 2018)
(45565, 'Katz', 'Comp. Sci.', 75000, 12121, 'FIN-201', '1', 'Spring', 2018)
(58583, 'Califieri', 'History', 62000, 12121, 'FIN-201', '1', 'Spring', 2018)
(76543, 'Singh', 'Finance', 80000, 12121, 'FIN-201', '1', 'Spring', 2018)
(76766, 'Crick', 'Biology', 72000, 12121, 'FIN-201', '1', 'Spring', 2018)
(83821, 'Brandt', 'Comp. Sci.', 92000, 12121, 'FIN-201', '1', 'Spring', 2018)
(98345, 'Kim', 'Elec. Eng.', 80000, 12121, 'FIN-201', '1', 'Spring', 2018)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 15151, 'MU-199', '1', 'Spring', 2018)
(12121, 'Wu', 'Finance', 90000, 15151, 'MU-199', '1', 'Spring', 2018)
(15151, 'Mozart', 'Music', 40000, 15151, 'MU-199', '1', 'Spring', 2018)
(22222, 'Einstein', 'Physics', 95000, 15151, 'MU-199', '1', 'Spring', 2018)
(32343, 'El Said', 'History', 60000, 15151, 'MU-199', '1', 'Spring', 2018)
(33456, 'Gold', 'Physics', 87000, 15151, 'MU-199', '1', 'Spring', 2018)
(45565, 'Katz', 'Comp. Sci.', 75000, 15151, 'MU-199', '1', 'Spring', 2018)
(58583, 'Califieri', 'History', 62000, 15151, 'MU-199', '1', 'Spring', 2018)
(76543, 'Singh', 'Finance', 80000, 15151, 'MU-199', '1', 'Spring', 2018)
(76766, 'Crick', 'Biology', 72000, 15151, 'MU-199', '1', 'Spring', 2018)
(83821, 'Brandt', 'Comp. Sci.', 92000, 15151, 'MU-199', '1', 'Spring', 2018)
(98345, 'Kim', 'Elec. Eng.', 80000, 15151, 'MU-199', '1', 'Spring', 2018)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 22222, 'PHY-101', '1', 'Fall', 2017)
(12121, 'Wu', 'Finance', 90000, 22222, 'PHY-101', '1', 'Fall', 2017)
(15151, 'Mozart', 'Music', 40000, 22222, 'PHY-101', '1', 'Fall', 2017)
(22222, 'Einstein', 'Physics', 95000, 22222, 'PHY-101', '1', 'Fall', 2017)
(32343, 'El Said', 'History', 60000, 22222, 'PHY-101', '1', 'Fall', 2017)
(33456, 'Gold', 'Physics', 87000, 22222, 'PHY-101', '1', 'Fall', 2017)
(45565, 'Katz', 'Comp. Sci.', 75000, 22222, 'PHY-101', '1', 'Fall', 2017)
(58583, 'Califieri', 'History', 62000, 22222, 'PHY-101', '1', 'Fall', 2017)
(76543, 'Singh', 'Finance', 80000, 22222, 'PHY-101', '1', 'Fall', 2017)
(76766, 'Crick', 'Biology', 72000, 22222, 'PHY-101', '1', 'Fall', 2017)
(83821, 'Brandt', 'Comp. Sci.', 92000, 22222, 'PHY-101', '1', 'Fall', 2017)
(98345, 'Kim', 'Elec. Eng.', 80000, 22222, 'PHY-101', '1', 'Fall', 2017)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 32343, 'HIS-351', '1', 'Spring', 2018)
(12121, 'Wu', 'Finance', 90000, 32343, 'HIS-351', '1', 'Spring', 2018)
(15151, 'Mozart', 'Music', 40000, 32343, 'HIS-351', '1', 'Spring', 2018)
(22222, 'Einstein', 'Physics', 95000, 32343, 'HIS-351', '1', 'Spring', 2018)
(32343, 'El Said', 'History', 60000, 32343, 'HIS-351', '1', 'Spring', 2018)
(33456, 'Gold', 'Physics', 87000, 32343, 'HIS-351', '1', 'Spring', 2018)
(45565, 'Katz', 'Comp. Sci.', 75000, 32343, 'HIS-351', '1', 'Spring', 2018)
(58583, 'Califieri', 'History', 62000, 32343, 'HIS-351', '1', 'Spring', 2018)
(76543, 'Singh', 'Finance', 80000, 32343, 'HIS-351', '1', 'Spring', 2018)
(76766, 'Crick', 'Biology', 72000, 32343, 'HIS-351', '1', 'Spring', 2018)
(83821, 'Brandt', 'Comp. Sci.', 92000, 32343, 'HIS-351', '1', 'Spring', 2018)
(98345, 'Kim', 'Elec. Eng.', 80000, 32343, 'HIS-351', '1', 'Spring', 2018)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 45565, 'CS-101', '1', 'Spring', 2018)
(12121, 'Wu', 'Finance', 90000, 45565, 'CS-101', '1', 'Spring', 2018)
(15151, 'Mozart', 'Music', 40000, 45565, 'CS-101', '1', 'Spring', 2018)
(22222, 'Einstein', 'Physics', 95000, 45565, 'CS-101', '1', 'Spring', 2018)
(32343, 'El Said', 'History', 60000, 45565, 'CS-101', '1', 'Spring', 2018)
(33456, 'Gold', 'Physics', 87000, 45565, 'CS-101', '1', 'Spring', 2018)
(45565, 'Katz', 'Comp. Sci.', 75000, 45565, 'CS-101', '1', 'Spring', 2018)
(58583, 'Califieri', 'History', 62000, 45565, 'CS-101', '1', 'Spring', 2018)
(76543, 'Singh', 'Finance', 80000, 45565, 'CS-101', '1', 'Spring', 2018)
(76766, 'Crick', 'Biology', 72000, 45565, 'CS-101', '1', 'Spring', 2018)
(83821, 'Brandt', 'Comp. Sci.', 92000, 45565, 'CS-101', '1', 'Spring', 2018)
(98345, 'Kim', 'Elec. Eng.', 80000, 45565, 'CS-101', '1', 'Spring', 2018)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 45565, 'CS-319', '1', 'Spring', 2018)
(12121, 'Wu', 'Finance', 90000, 45565, 'CS-319', '1', 'Spring', 2018)
(15151, 'Mozart', 'Music', 40000, 45565, 'CS-319', '1', 'Spring', 2018)
(22222, 'Einstein', 'Physics', 95000, 45565, 'CS-319', '1', 'Spring', 2018)
(32343, 'El Said', 'History', 60000, 45565, 'CS-319', '1', 'Spring', 2018)
(33456, 'Gold', 'Physics', 87000, 45565, 'CS-319', '1', 'Spring', 2018)
(45565, 'Katz', 'Comp. Sci.', 75000, 45565, 'CS-319', '1', 'Spring', 2018)
(58583, 'Califieri', 'History', 62000, 45565, 'CS-319', '1', 'Spring', 2018)
(76543, 'Singh', 'Finance', 80000, 45565, 'CS-319', '1', 'Spring', 2018)
(76766, 'Crick', 'Biology', 72000, 45565, 'CS-319', '1', 'Spring', 2018)
(83821, 'Brandt', 'Comp. Sci.', 92000, 45565, 'CS-319', '1', 'Spring', 2018)
(98345, 'Kim', 'Elec. Eng.', 80000, 45565, 'CS-319', '1', 'Spring', 2018)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 76766, 'BIO-101', '1', 'Summer', 2017)
(12121, 'Wu', 'Finance', 90000, 76766, 'BIO-101', '1', 'Summer', 2017)
(15151, 'Mozart', 'Music', 40000, 76766, 'BIO-101', '1', 'Summer', 2017)
(22222, 'Einstein', 'Physics', 95000, 76766, 'BIO-101', '1', 'Summer', 2017)
(32343, 'El Said', 'History', 60000, 76766, 'BIO-101', '1', 'Summer', 2017)
(33456, 'Gold', 'Physics', 87000, 76766, 'BIO-101', '1', 'Summer', 2017)
(45565, 'Katz', 'Comp. Sci.', 75000, 76766, 'BIO-101', '1', 'Summer', 2017)
(58583, 'Califieri', 'History', 62000, 76766, 'BIO-101', '1', 'Summer', 2017)
(76543, 'Singh', 'Finance', 80000, 76766, 'BIO-101', '1', 'Summer', 2017)
(76766, 'Crick', 'Biology', 72000, 76766, 'BIO-101', '1', 'Summer', 2017)
(83821, 'Brandt', 'Comp. Sci.', 92000, 76766, 'BIO-101', '1', 'Summer', 2017)
(98345, 'Kim', 'Elec. Eng.', 80000, 76766, 'BIO-101', '1', 'Summer', 2017)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 76766, 'BIO-301', '1', 'Summer', 2018)
(12121, 'Wu', 'Finance', 90000, 76766, 'BIO-301', '1', 'Summer', 2018)
(15151, 'Mozart', 'Music', 40000, 76766, 'BIO-301', '1', 'Summer', 2018)
(22222, 'Einstein', 'Physics', 95000, 76766, 'BIO-301', '1', 'Summer', 2018)
(32343, 'El Said', 'History', 60000, 76766, 'BIO-301', '1', 'Summer', 2018)
(33456, 'Gold', 'Physics', 87000, 76766, 'BIO-301', '1', 'Summer', 2018)
(45565, 'Katz', 'Comp. Sci.', 75000, 76766, 'BIO-301', '1', 'Summer', 2018)
(58583, 'Califieri', 'History', 62000, 76766, 'BIO-301', '1', 'Summer', 2018)
(76543, 'Singh', 'Finance', 80000, 76766, 'BIO-301', '1', 'Summer', 2018)
(76766, 'Crick', 'Biology', 72000, 76766, 'BIO-301', '1', 'Summer', 2018)
(83821, 'Brandt', 'Comp. Sci.', 92000, 76766, 'BIO-301', '1', 'Summer', 2018)
(98345, 'Kim', 'Elec. Eng.', 80000, 76766, 'BIO-301', '1', 'Summer', 2018)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 83821, 'CS-190', '2', 'Spring', 2017)
(12121, 'Wu', 'Finance', 90000, 83821, 'CS-190', '2', 'Spring', 2017)
(15151, 'Mozart', 'Music', 40000, 83821, 'CS-190', '2', 'Spring', 2017)
(22222, 'Einstein', 'Physics', 95000, 83821, 'CS-190', '2', 'Spring', 2017)
(32343, 'El Said', 'History', 60000, 83821, 'CS-190', '2', 'Spring', 2017)
(33456, 'Gold', 'Physics', 87000, 83821, 'CS-190', '2', 'Spring', 2017)
(45565, 'Katz', 'Comp. Sci.', 75000, 83821, 'CS-190', '2', 'Spring', 2017)
(58583, 'Califieri', 'History', 62000, 83821, 'CS-190', '2', 'Spring', 2017)
(76543, 'Singh', 'Finance', 80000, 83821, 'CS-190', '2', 'Spring', 2017)
(76766, 'Crick', 'Biology', 72000, 83821, 'CS-190', '2', 'Spring', 2017)
(83821, 'Brandt', 'Comp. Sci.', 92000, 83821, 'CS-190', '2', 'Spring', 2017)
(98345, 'Kim', 'Elec. Eng.', 80000, 83821, 'CS-190', '2', 'Spring', 2017)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 83821, 'CS-319', '2', 'Spring', 2018)
(12121, 'Wu', 'Finance', 90000, 83821, 'CS-319', '2', 'Spring', 2018)
(15151, 'Mozart', 'Music', 40000, 83821, 'CS-319', '2', 'Spring', 2018)
(22222, 'Einstein', 'Physics', 95000, 83821, 'CS-319', '2', 'Spring', 2018)
(32343, 'El Said', 'History', 60000, 83821, 'CS-319', '2', 'Spring', 2018)
(33456, 'Gold', 'Physics', 87000, 83821, 'CS-319', '2', 'Spring', 2018)
(45565, 'Katz', 'Comp. Sci.', 75000, 83821, 'CS-319', '2', 'Spring', 2018)
(58583, 'Califieri', 'History', 62000, 83821, 'CS-319', '2', 'Spring', 2018)
(76543, 'Singh', 'Finance', 80000, 83821, 'CS-319', '2', 'Spring', 2018)
(76766, 'Crick', 'Biology', 72000, 83821, 'CS-319', '2', 'Spring', 2018)
(83821, 'Brandt', 'Comp. Sci.', 92000, 83821, 'CS-319', '2', 'Spring', 2018)
(98345, 'Kim', 'Elec. Eng.', 80000, 83821, 'CS-319', '2', 'Spring', 2018)
(10101, 'Srinivasan', 'Comp. Sci.', 65000, 98345, 'EE-181', '1', 'Spring', 2017)
(12121, 'Wu', 'Finance', 90000, 98345, 'EE-181', '1', 'Spring', 2017)
(15151, 'Mozart', 'Music', 40000, 98345, 'EE-181', '1', 'Spring', 2017)
(22222, 'Einstein', 'Physics', 95000, 98345, 'EE-181', '1', 'Spring', 2017)
(32343, 'El Said', 'History', 60000, 98345, 'EE-181', '1', 'Spring', 2017)
(33456, 'Gold', 'Physics', 87000, 98345, 'EE-181', '1', 'Spring', 2017)
(45565, 'Katz', 'Comp. Sci.', 75000, 98345, 'EE-181', '1', 'Spring', 2017)
(58583, 'Califieri', 'History', 62000, 98345, 'EE-181', '1', 'Spring', 2017)
(76543, 'Singh', 'Finance', 80000, 98345, 'EE-181', '1', 'Spring', 2017)
(76766, 'Crick', 'Biology', 72000, 98345, 'EE-181', '1', 'Spring', 2017)
(83821, 'Brandt', 'Comp. Sci.', 92000, 98345, 'EE-181', '1', 'Spring', 2017)
(98345, 'Kim', 'Elec. Eng.', 80000, 98345, 'EE-181', '1', 'Spring', 2017)

Names of instructors who have taught some course and the course_id:
('Srinivasan', 'CS-101')
('Srinivasan', 'CS-315')
('Srinivasan', 'CS-347')
('Wu', 'FIN-201')
('Mozart', 'MU-199')
('Einstein', 'PHY-101')
('El Said', 'HIS-351')
('Katz', 'CS-101')
('Katz', 'CS-319')
('Crick', 'BIO-101')
('Crick', 'BIO-301')
('Brandt', 'CS-190')
('Brandt', 'CS-319')
('Kim', 'EE-181')

Names of instructors whose name includes the substring 'dar':

Names of instructors with salary between 90,000 and 100,000:
(12121, 'Wu', 'Finance', 90000)
(22222, 'Einstein', 'Physics', 95000)
(83821, 'Brandt', 'Comp. Sci.', 92000)
