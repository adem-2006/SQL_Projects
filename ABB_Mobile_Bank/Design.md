Design Document
By Adam Aliyev

Video overview: https://www.youtube.com/watch?v=JjCgwf1dbJk

Scope
The ABB Mobile Bank database contains all the assets necessary to facilitate the process of tracking users progress and providing transactions on users work. Therefore, the database's scope include:

Users, including basic users information.
Branches, including basic Abb branch information.
Card_id, including the basic card infromation howeever users controlling and managing card balance in this Mobile app.
Transactions, which includes the every transaction like deposits, withdrawal, transfer or payment.
Accounts, this includes each account number, for example, which branch the account number was obtained from.
Out of scope are elements like atms, credits and other non-core attributes.

Functional Requirements
This database will support:

Bank account management for everyone on online.
Tracking all version of users accounts, including multiple bank serives in one program
Adding multiple card in one mobile app.
Access to a walk-in registration at the bank with an online appointment.
Representation
Entities are captured in SQLite tables with the following schema.

Entities
The database includes the following entities:

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
