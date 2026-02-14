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
city_name - Specifies the city where the hospital is located as TEXT.
address - Specifies the physical address of the hospital as TEXT. It will store the full address of the hospital.
phone_number - Specifies the phone number of the cafe as TEXT (since phone number may include special characters like a dashes or parantheses).
email - Specifies the email address of the hospital as TEXT.
opening_date - Specifies the date the hospital was opened as TIMESTAMP, in the format YYYY-MM-DD.
opening_time - Specifies the time the hospital opens as TIMESTAMP, in the format HH:MM.
closing_time - Specifies the time the hospital closes as TIMESTAMP, in the format HH:MM.
All columns in the hospital table are required, hence the NOT NULL constraint is applied.

Hospital_locations Table: The Hospital location table includes:

id - Specifies the unique ID for each locations as INTEGER. This column has the Primary Key constraint applied. It will automatically increment with the AUTOINCREMENT keywords.
hospital_id - Specifies the hospital where the order was placed. This is a FOREIGN KEY referencing the id in the hospital table. Stored as INTEGER. 
building_name - VARCHAR 
floor - Which determines hospital how many have floors as INTEGER. 

Department Table: The department table includes:

Department_id - Specifies the unique ID for the department as INTEGER.
Name - Specifes the each department name as a TEXT.
Head - Which determines the who managed the department as TEXT.
hospital_id - Specifies the department including which hospital. This is a FOREIGN KEY referencing the id in the hospital table. Stored as INTEGER.

Physican Table: The Physican tbale includes:

employee_id - Specifies the unique identifier for each employee as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOINCREMENT keyword to generate unique values automatically.
Name - Specifies the employee's first_name as TEXT. This is required field.
Position - Specifies the Physican specialty as TEXT.
Status - Specifies the employee work status ( active, inactive or retired) as TEXT.

Nurse Table: The Nurse table includes:

nurse_id - Specifies the the unique identifier for each nurse as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOINCREMENT keyword to generate unique values automatically.
position - Specifies the Nurse specialty as TEXT.
registred - Specifies the as BOOLEAN
Status - Specifies the employee work status ( active, inactive or retired) as TEXT.

Patient Table: The Patient table Includes:

Patient_id - Specifies the unique ID for each customer as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOICNREMENT keyword to generate unique values automatically.
Name - Determines the first_name of patient as TEXT. This is required file
address - Specifies the full address of the patient as TEXT.
gender - Specifies the gender of the patient as TEXT (e.g., 'Male', 'Female', 'Other')
email - Stores the email address of the patient as TEXT.
phone_number - Stores the phone number of the patient as TEXT to accommodate any formatting (eg., dashes, spaces).
insurance_company_name - Specifies the patient connect insurance company as TEXT.
physican_employeed_id - Specifies the therapy doctor who therapy patient as INTEGER. This column thus has the FOREIGN KEY constraint applied, referencing the id column in the physican table to ensure data integrity

Medication Table: The Medication table includes:

Medication_id - Specifies the unique ID for each customer as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOICNREMENT keyword to generate unique values automatically.
Name - Specifies the medicine name of medicine as TEXT.
Brand - It determines which brand is attached to the brand as TEXT.
Description - Giving information about medicine as TEXT.

Prescribes Table: The Prescribes table includes:

physican_employee_id - It is the responsibility of the doctor to determine which medication is prescribed by the doctor as INTEGER.This is a FOREIGN KEY referencing the id in the physican table. Stored as INTEGER.
patient_id - It determines which medication is prescribed to the patient. This is a FOREIGN KEY referencing the id in the physican table. Stored as INTEGER.
date - It is the responsibility of the patient to determine when the prescribe is given as TİMESTAMP.
appointment - An appointment will be made at the bar as INTEGER.
dose - Specifies the dose at INTEGER.

Block Table: The block table includes:

Blockfloor - Specifies the number of blocks as INTEGER.
Blockcode - Specifies block as one capital letter as INTEGER.

Room Table: The room table includes:

Room_number - Specifies the each room has own index or number as INTEGER.
Room_type - Specifies the each room for the type as TEXT
Blockfloor - Specifies which block of the room belongs to and how many floors it belongs to as INTEGER. This is a FOREIGN KEY referencing the id in the block table. Stored as INTEGER.
Blockcode - Specifies the which room belong to block as INTEGER unavilable

Stay Table: The stay table includes: 

stay_id - Specifies the unique ID for each stay report as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOICNREMENT keyword to generate unique values automatically.
patient_id - Specifies which patient stay in room as INTEGER. This is a FOREIGN KEY referencing the id in the patient table. Stored as INTEGER.
room - It will show you how many days patient will be staying in the room as INTEGER. This is a FOREIGN KEY referencing the number in the room table. Stored as INTEGER.
Start_time - Specifies the date on which the treatment period begins as TİMESTAMP.
End_time - Specifes the date on which the treatment period finish as TIMESTAMP.

Appointment Table: The appointment table includes:

appointment_id - Specifies the unique ID for appointment point as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOINCREMENT keyword to generate unique values automatically.
Patient_id - This will determine which patient is making an appointment with. This column is a FOREIGN KEY referencing the id in the patient table, and it will be type INTEGER.
Physican_id - It will show you which doctor you are going to see for the patient. This column is a FOREIGN KEY referencing the id in the physican table, and it will be type INTEGER.
Nurse_id - It is important to determine which nurse is in contact with the patient. This column is a FOREIGN KEY referencing the id in the nurse table, and it will be type INTEGER. 
Start_time - Specifies the date on which the appointment period begins as TİMESTAMP.
End_time - Specifies the date on which the treatment period finish as TİMESTAMP.
Examination_room - Indicates which examination room the patient is in as TEXT. This column is a FOREIGN KEY referencing the text in 
the room table, and it will be type INTEGER.
Reason - This is the reason why she decided to make an appointment as TEXT.

Procedure Table: The procedure table includes:

procedure_id - Specifies the unique ID for appointment point as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOINCREMENT keyword to generate unique values automatically.
name - It shows the patient what procedures are being performed as TEXT.
cost - Specifies the overall cost of procedure as INTEGER.  

Undergoes Table: The undergoes table includes:

Patient_id - It provides information about the patient. This column is a FOREIGN KEY referencing the id in the patient table, and it will be type INTEGER.
Procedure_id - It provides information about the procedure. This column is a FOREIGN KEY referencing the id in the procedure table, and it will be type INTEGER. 
Stay_id - It provides information about the stay. This colum is a FOREIGN KEY referencing the id in the stay table, and it will be type INTEGER.
Date - Indicates the time at which the procedure was performed as TİMESATMP.
Phsyican_id - It provides information about the physican. This column is a FOREIGN KEY referencing the id in the physican table, and it will be type INTEGER.
Nurse - It provides information about the nurse. This column is a FOREIGN KEY referencing the id in the nurse table, and it will be type INTEGER.

ON_Call Table: The on_call table includes:

Nurse_name - Specifies the nurse who waiting in emergency. This column is a FOREIGN KEY referencing the name in the nurse table, and it will be type INTEGER.
Blockfloor - Specifies which block dived for emergency call. This is a FOREIGN KEY referencing the id in the block table. Stored as INTEGER.
Blockcode - Specifies the information about block code. This is a FOREIGN KEY referencing the id in the block table. Stored as INTEGER.
On_call_start - Specifies the date on which the emergency period begins as TİMESTAMP.
On_call_end - Specifies the date on which the emergency period finish as TİMESTAMP.

Affilated_with: The affilated_with table includes:

Physican_name: It provides information about the physican. This column is a FOREIGN KEY referencing the name in the physican table, and it will be type TEXT.
Department_id: It provides information about the department name. This column is a FOREIGN KEY referencing the id in the department table, and it will be type INTEGER.
Primary_affilation: If physican work 2 departments information about the this table. 

## Relationship

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
