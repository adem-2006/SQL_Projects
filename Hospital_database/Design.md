Design Document
By Adam Aliyev

## Scope

In this section you should answer the following questions:

** What is your purpose of your database?
The ABB Mobile Bank database contains all the assets necessary to facilitate the process of tracking users progress and providing transactions on users work. Therefore, the database's scope include:

** Which people, places, things etc. are you including in the scope of your database?
This database includes:

Hospital - Basic information about each hospital location, including branch name, city, adress, contact details(phone, email) and the city it belongs to.
Hospital_locations - Basic information about each hospital location, including the building name, floor and etc.
Cities - city names and their respective states, including city name and state name.
Department - which includes the which department belong to which hospital.
Physican - It should give basic information (name, gender, contact, DOB, adress), role of the employee, salary details, date of hiring, the hospital location they are assigned to, and current employment status(active/resgined/on leave).
Nurse - Basic nurse information, department, status.
Patient - Basic customer details, contact information, membership and their associated city ID.
Medication - Contains medicare details including ID, name and description.
Prescribes - Details of prescribes included in each other, including pysican_id, patient_id, medication_id and prescribe_date.
Block - 
Room - Which includes the information about room.
Stay - Records of each patient's illness. Including room_id, patient_id, admission_date, discharge_date and status.
Appointment - which determine relationship between patient and physican.
Procedure - Includes procedure name and cost. 
Undergoes - Information about general data from how many days patient stayed, which procedures showing from which physican.
On_call - Details about 
Affilated_with - Basic information about patient connected to department. 

## Functional Requirements

In this section you should answer the following questions:

** What should be a user be abe to do with your database?
A user should be able to:

User Management: Users should be able to manage records (personal details, roles, salary, status), customer details (contact inforamtion), and reservation data(date, time and special requests)
Employee and Staff Management: Store and update information about physicans, nurses and other employees. Check employee roles, departments and current status. Track staff salaries and positions.
Patient Management: Show patient presonal and contact information. Track patient medical history and hospital stays and identifed which department a patient visited and the reason for the visit.
Treatment and medication management: Record medical procedures performed on patients.View treatment history for each patient.
Reservation management: Users should be able to handle customer reservations, including booking details (date, time, branch and special requests).
Reporting and Analysis management: Identify departments with the highest number of patients.Analyze hospital resource usage (rooms, staff workload). 

## Representation

## Entities

In this section you should answer the following questions:

** Which entities will you choose to represent in your database?


Hospital Table: The Hospital table includes:

id - Specifies the unique ID for each hospital as INTEGER. This column has the PRIMARY KEY constraint applied. It will automatically increment with the AUTOINCREMENT keywords.
name - Specifies the name of the hospital as TEXT. This field will store the name of the hospital.
city_id - Specifies the city where the hospital is located. This column is a FOREIGN KEY referencing the id in the cities table, and it will be type INTEGER.
address - Specifies the physical address of the hospital as TEXT. It will store the full address of the hospital.
phone_number - Specifies the phone number of the cafe as TEXT (since phone number may include special characters like a dashes or parantheses).
email - Specifies the email address of the hospital as TEXT.
opening_date - Specifies the date the hospital was opened as TEXT, in the format YYYY-MM-DD.
opening_time - Specifies the time the hospital opens as TEXT, in the format HH:MM.
closing_time - Specifies the time the hospital closes as TEXT, in the format HH:MM.
All columns in the hospital table are required, hence the NOT NULL constraint is applied.

Hospital_locations Table: The Hospital location table includes:

id - Specifies the unique ID for each locations as INTEGER. This column has the Primary Key constraint applied. It will automatically increment with the AUTOINCREMENT keywords.
hospital_id - Specifies the hospital where the order was placed. This is a FOREIGN KEY referencing the id in the hospital table. Stored as INTEGER. 
building_name - VARCHAR 
floor - Which determines hospital how many have floors as INTEGER. 

Department Table: The department table includes:

Department_id - Specifies the unique ID for the department as INTEGER.
Name - Specifes the each department name as a TEXT.
Head - Which determines the who managed the department.
hospital_id - Specifies the department including which hospital. This is a FOREIGN KEY referencing the id in the hospital table. Stored as INTEGER.

Physican Table: The Physican tbale includes:

employee_id - Specifies the unique identifier for each employee as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOINCREMENT keyword to generate unique values automatically.
Name - Specifies the employee's first_name as TEXT. This is required field.
Position - Specifies the Physican specialty as TEXT.
Status - Specifies the employee work status ( active, inactive or retired) as TEXT.

Nurse Table: The Nurse table includes:

nurse_id - Specifies the the unique identifier for each 




Users
The users table includes:

id, which specifies the unique ID for the user as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
first_name, which specifes the user's first name as TEXT, given TEXT is appropriate for name fields.
last_name, which specifies the user's last name. TEXT is used for the same reason as first_name.
email, which specifes the user's email TEXT, is used for the same reason as name.A UNIQUE constraint ensures no two userss have the same email username.
phone, which the specifies when the users opened the bank account used this phone number as an INTEGER. Additionally, the security of the bank account is protected in this number.
Branches
The branches table includes:

id, which specifies the unique ID for the branch as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
name, which specifes the branch name's as an TEXT. Each branch has its own name, which comes from the name of the area.
address, determines the branch location as an TEXT.
Accounts
The accounts table includes:

id, which specifies the unique ID for the account as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
user_id, which is the ID of the users who the transaction as an INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the students table to ensure data integrity.
account_number This shows which account number the user transaction on this account number is going through as an INTEGER.A UNIQUE constraint ensures no two users have the same account number.
balance, determines the how much money is left, as REAL.
account_type indicates whether the account type corresponds to check savings checkings or credits as an TEXT
Transactions
The transactions table includes:

id, which specifies the unique ID for the transactions as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
account_id, which is the ID of the accounts which all transactions are carried out through this account number as an INTEGER.This column thus has the FOREIGN KEY constraint applied, referencing the id column in the accounts table to ensure data integrity.
branch_id, determines the what branch of a transaction is it going as an INTEGER.This column thus has the FOREIGN KEY constraint applied, referencing the id column in the branches table to ensure data integrity.
transaction_type, which specifes the type of the transaction like deposit, withdrawal, transfer or payment as an TEXT.
amount, measures and checks account balance as an REAL.
transaction_date, determines the date on which the operation occurred.Timestamps in SQLite can be conveniently stored as NUMERIC.The default value for the started attribute is the current timestamp, as denoted by DEFAULT CURRENT_TIMESTAMP.
card_id
The card_id table includes:

id, which specifies the unique ID for the cards as an INTEGER. This column thus has the PRIMARY KEY constraint applied.
transaction_id, determines through which transaction the card ID is processed as an INTEGER.This column thus has the FOREIGN KEY constraint applied, referencing the id column in the transactions table to ensure data integrity.
card_number, each user's card must be UNIQUE and linked to one bank account as an INTEGER.
expiry_date, which specifes the shows until which date it is active as an TEXT.
CVV, whcih provide the card security from bank as an INTEGER.
card_type, shows and checks what type of card the card is compatible with as an TEXT.
Relationships
The below entity relationship diagram describes the relationships among the entities in the database.

ER.diagram

As detailed by the diagram:

A user cannot create more than one account. If there is 0 accounts, there is no 1, if there is 1 account, there is no second account.
Each account is linked to a branch. If a new user receives an account from a branch, all of their payments will go through that branch's account number.
Each Transaction is associated with one and only one Card ID, but each Card ID can belong to more than zero Transactions — zero if no transactions have been made with the card, and many if several transactions have been made.
Each Account can be associated with more than zero Transactions — zero if no transactions have been made, and many if several transactions have been made. Each Transaction is associated with one and only one Account.
Optimizations
According to typical queries in queries.sql, it is common for database users to see all transactions entered by the bank in order to be contacted more quickly if they have any problems. For this reason, indexes are created on the firs_name, last_name and email columns to speed up the identification of users by these columns.

Similarly, it is common practice for a database user to be interested in a particular transaction. Thus, to speed up the identification of the transaction by transaction_type and id, an index is created on the "id" and type columns in the "transactions" table.

Limitations
The current scheme assumes individual accounts. It requires a transition to a many-to-many relationship between business accounts' transactions.
