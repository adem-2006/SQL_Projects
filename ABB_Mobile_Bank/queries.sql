--Find balance, account number and account_type by username and email address
SELECT * FROM "accounts"
WHERE "user_id" IN (
    SELECT "id"
    FROM "users"
    WHERE "first_name" = 'Leyla'
    AND "last_name" = 'Mammadova'
    AND "email" = 'leyla.mammadova@example.com'
);

-- Find all transaction for a one customer

SELECT * FROM "transactions"
WHERE "account_id" IN (
    SELECT "id"
    FROM "accounts"
    WHERE "account_number" = 'AZ01ABB000000000027'
);

-- Join 2 table and we find which transaction belong to users

SELECT t.*,
       u.first_name AS user_name,
       a.account_number
FROM transactions t
JOIN accounts a ON t.account_id = a.id
JOIN users u ON a.user_id = u.id;

-- Customer buying new card then we update their new card

UPDATE "cards"
SET "card_number" = '4000000000000031'
WHERE "transactions_id" = '30';

-- Update accounts table

UPDATE "accounts"
SET "account_type" = 'checkings'
WHERE "id" = '19';

-- If card don't using by users we deleted this card our database

DELETE FROM
    "cards"
WHERE
    "cvv" = '258' and
    "card_type" = 'Mastercard';


-----------------------------------------------------------------------------------

-- Data Insertion for users
INSERT INTO "users" ("first_name","last_name", "email", "password", "phone")
VALUES
    ("Leyla", "Mammadova", "leyla.mammadova@example.com", "Leyla2024", "+994501234567"),
    ("Elvin"," Aliyev", "elvin.aliyev@example.com", 'Elvin123', "+994551112233"),
    ("Aydin","Huseynov", "aydin.huseynov@example.com", "Aydin789", "+994709998877"),
    ("Aysel", "Quliyeva", "aysel.quliyeva@example.com", "Aysel@2024", "+994771234890"),
    ("Rashad" ,"Karimov", "rashad.karimov@example.com", "Rashad22", "+994555550011"),
    ("Nigar", "Ismayilova", "nigar.ismayilova@example.com", "Nigar2003", "+994507774433"),
    ("Kamran", "Abbasov", "kamran.abbasov@example.com", "Kamran99", "+994701234555"),
    ("Amina", "Gurbanova", "amina.gurbanova@example.com", "Amina2025", "+994772224466"),
    ("Farid", "Seyidov", "farid.seyidov@example.com", "Farid77", "+994551119900"),
    ("Sevda", "Rzayeva", "sevda.rzayeva@example.com", "Sevda11", "+994507712345"),
    ("Orkhan", "Suleymanov", "orkhan.suleymanov@example.com", "Orkhan66", "+994551122334"),
    ("Rufat", "Nabiyev", "rufat.nabiyev@example.com", "Rufat88", "+994701009988"),
    ("Ilkin", "Muradov", "ilkin.muradov@example.com", "Ilkin55", "+994771100220"),
    ("Gulnar", "Veliyeva", "gulnar.veliyeva@example.com", "Gulnar33", "+994707788990"),
    ("Seymur", "Maharramov", "seymur.maharramov@example.com", "Seymur44", "+994559990011"),
    ("Samir", "Aliyev", "samir.aliyev@example.com", "Samir123", "+994509990022"),
    ("Ayla", "Mustafayeva", "ayla.mustafayeva@example.com", "Ayla2024", "+994701234998"),
    ("Mahir", "Qasimov", "mahir.qasimov@example.com", "Mahir55", "+994775556677"),
    ("Rashida", "Taghizade", "rashida.taghizade@example.com", "Rashida99", "+994505511223"),
    ("Emin", "Isgandarov", "emin.isgandarov@example.com", "Emin007", "+994709991122"),
    ("Lale", "Hajiyeva", "lale.hajiyeva@example.com", "Lale22", "+994557770011"),
    ("Ramin", "Bayramov", "ramin.bayramov@example.com", "Ramin333", "+994707744588"),
    ("Ilaha", "Babayeva", "ilaha.babayeva@example.com", "Ilaha@1", "+994551234555"),
    ("Zaur", "Mammadli", "zaur.mammadli@example.com", "Zaur21", "+994771199900"),
    ("Nurlan", "Mehdiyev", "nurlan.mehdiyev@example.com", "NurlanX", "+994509900221"),
    ("Aynur", "Aliyeva", "aynur.aliyeva@example.com", "Aynur08", "+994557722336"),
    ("Tural", "Sadiqov", "tural.sadiqov@example.com", "Tural2025", "+994701177288"),
    ("Parvin", "Qurbanli", "parvin.qurbanli@example.com", "Parvin999", "+994773303344"),
    ("Zehra", "Ibrahimova", "zehra.ibrahimova@example.com", "Zehra11", "+994555002244"),
    ("Murad", "Huseynli", "murad.huseynli@example.com", "Murad@77", "+994507777889")
;

-- Data Insertion for branches
 INSERT INTO "branches"  ("name", "address")
 VALUES
     ("Head Office", "Baku city, Narimanov district, Jalil Mammadguluzade Street 85"),
     ("28 May Branch", "Baku city, Nasimi district, Dilara Aliyeva Street 243"),
     ("Ganjlik Branch", "Baku city, Fatali Khan Khoyski Avenue 121A"),
     ("Nizami Branch", "Baku city, Nizami Street 96"),
     ("Sumgayit Branch", "Sumgayit city, 9th district, Heydar Aliyev Avenue 27"),
     ("Ganja Branch", "Ganja city, Ataturk Avenue 125"),
     ("Lankaran Branch", "Lankaran city, Heydar Aliyev Avenue 44"),
     ("Qabala Branch", "Qabala city, Nizami Street 15"),
     ("Mingachevir Branch", "Mingachevir city, Azadliq Avenue 20"),
     ("Shaki Branch", "Shaki city, M.F. Akhundov Street 18")
;

-- Data Insertion for accounts

INSERT INTO "accounts" ("user_id", "account_number", "account_type", "balance")
VALUES
    (1, "AZ01ABB000000000001", "savings", 2500.75),
    (2, "AZ01ABB000000000002", "checkings", 1340.00),
    (3, "AZ01ABB000000000003", "savings", 980.50),
    (4, "AZ01ABB000000000004", "checkings", 4215.00),
    (5, "AZ01ABB000000000005", "savings", 75.30),
    (6, "AZ01ABB000000000006", "credit", 505.00),
    (7, "AZ01ABB000000000007", "savings", 1670.40),
    (8, "AZ01ABB000000000008", "checkings", 8940.90),
    (9, "AZ01ABB000000000009", "credit", 125.00),
    (10, "AZ01ABB000000000010", "savings", 642.60),
    (11, "AZ01ABB000000000011", "checkings", 10750.00),
    (12, "AZ01ABB000000000012", "savings", 2390.25),
    (13, "AZ01ABB000000000013", "credit", 12.50),
    (14, "AZ01ABB000000000014", "savings", 512.70),
    (15, "AZ01ABB000000000015", "checkings", 2999.99),
    (16, "AZ01ABB000000000016", "savings", 850.00),
    (17, "AZ01ABB000000000017", "checkings", 4000.00),
    (18, "AZ01ABB000000000018", "credit", 200.00),
    (19, "AZ01ABB000000000019", "savings", 1250.50),
    (20, "AZ01ABB000000000020", "checkings", 6750.25),
    (21, "AZ01ABB000000000021", "credit", 90.00),
    (22, "AZ01ABB000000000022", "savings", 300.30),
    (23, "AZ01ABB000000000023", "checkings", 1200.00),
    (24, "AZ01ABB000000000024", "credit", 75.00),
    (25, "AZ01ABB000000000025", "savings", 1500.00),
    (26, "AZ01ABB000000000026", "checkings", 880.75),
    (27, "AZ01ABB000000000027", "credit", 500.00),
    (28, "AZ01ABB000000000028", "savings", 420.40),
    (29, "AZ01ABB000000000029", "checkings", 1999.99),
 (30, "AZ01ABB000000000030", "credit", 250.00);
;

-- Data Insertion for transactions

INSERT INTO "transactions" ("account_id", "branch_id", "transaction_type", "amount", "transaction_date")
VALUES
    (1, 1, "deposit", 500.00, "2025-11-01 09:15:00"),
    (2, 2, "withdrawal", 200.00, "2025-11-01 10:20:00"),
    (3, 3, "deposit", 150.00, "2025-11-02 14:05:00"),
    (4, 4, "transfer", 1000.00, "2025-11-02 15:30:00"),
    (5, 5, "deposit", 75.30, "2025-11-03 08:45:00"),
    (6, 6, "withdrawal", 50.00, "2025-11-03 12:10:00"),
    (7, 7, "deposit", 670.40, "2025-11-04 11:25:00"),
    (8, 8, "transfer", 3000.00, "2025-11-04 16:00:00"),
    (9, 9, "deposit", 125.00, "2025-11-05 09:50:00"),
    (10, 10, "withdrawal", 100.00, "2025-11-05 14:40:00"),
    (11, 1, "deposit", 5000.00, "2025-11-06 10:15:00"),
    (12, 2, "transfer", 1500.25, "2025-11-06 13:30:00"),
    (13, 3, "withdrawal", 10.00, "2025-11-07 09:00:00"),
    (14, 4, "deposit", 512.70, "2025-11-07 11:45:00"),
    (15, 5, "transfer", 2000.00, "2025-11-08 15:20:00"),
    (16, 6, "withdrawal", 300.00, "2025-11-08 16:10:00"),
    (17, 7, "deposit", 400.00, "2025-11-09 09:05:00"),
    (18, 8, "transfer", 250.00, "2025-11-09 10:50:00"),
    (19, 9, "payment", 150.00, "2025-11-10 08:30:00"),
    (20, 10, "deposit", 800.00, "2025-11-10 14:35:00"),
    (21, 1, "withdrawal", 100.00, "2025-11-10 15:45:00"),
    (22, 7, "deposit", 600.00, "2025-11-11 09:20:00"),
    (23, 8, "transfer", 50.00, "2025-11-11 11:10:00"),
    (24, 1, "deposit", 420.70, "2025-11-12 12:25:00"),
    (25, 6, "payment", 300.00, "2025-11-12 14:40:00"),
    (26, 9, "deposit", 850.00, "2025-11-13 10:05:00"),
    (27, 3, "withdrawal", 400.00, "2025-11-13 11:50:00"),
    (28, 8, "transfer", 200.00, "2025-11-14 09:15:00"),
    (29, 7, "deposit", 1250.50, "2025-11-14 13:30:00"),
    (30, 4, "withdrawal", 675.25, "2025-11-15 15:45:00");
;

-- Data Insertion for people cards

INSERT INTO "cards" ("id", "transactions_id", "card_number", "expiry_date", "cvv", "card_type")
VALUES
    ("1","1","4000000000000001","202512","123","Visa"),
    ("2","2","4000000000000002","202608","456","Visa"),
    ("3","3","5100000000000003","202709","789","Mastercard"),
    ("4","4","340000000000004","202611","321","AMEX"),
    ("5","5","5100000000000005","202706","654","Mastercard"),
    ("6","6","4000000000000006","202503","987","Visa"),
    ("7","7","4000000000000007","202812","159","Visa"),
    ("8","8","5100000000000008","202905","753","Mastercard"),
    ("9","9","340000000000009","202912","852","AMEX"),
    ("10","10","4000000000000010","202707","147","Visa"),
    ("11","11","5100000000000011","202611","258","Mastercard"),
    ("12","12","4000000000000012","202710","369","Visa"),
    ("13","13","340000000000013","202804","486","AMEX"),
    ("14","14","5100000000000014","202902","579","Mastercard"),
    ("15","15","4000000000000015","202906","681","Visa"),
    ("16","16","5100000000000016","202511","792","Mastercard"),
    ("17","17","4000000000000017","202603","834","Visa"),
    ("18","18","340000000000018","202712","915","AMEX"),
    ("19","19","5100000000000019","202805","246","Mastercard"),
    ("20","20","4000000000000020","202901","357","Visa"),
    ("21","21","5100000000000021","202912","468","Mastercard"),
    ("22","22","4000000000000022","202804","579","Visa"),
    ("23","23","340000000000023","202811","690","AMEX"),
    ("24","24","5100000000000024","202703","111","Mastercard"),
    ("25","25","4000000000000025","202612","222","Visa"),
    ("26","26","5100000000000026","202909","333","Mastercard"),
    ("27","27","340000000000027","202710","444","AMEX"),
    ("28","28","4000000000000028","202806","555","Visa"),
    ("29","29","5100000000000029","202711","666","Mastercard"),
    ("30","30","4000000000000030","202904","777","Visa")
;
