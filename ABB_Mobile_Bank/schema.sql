-- Represent user individual information
CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    "password" INTEGER,
    "phone" INTEGER,
    PRIMARY KEY ("id")
);

-- Represent braches information

CREATE TABLE "branches" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "address" TEXT,
    PRIMARY KEY ("id")
);

-- Represent basic accounts information in the mobile app

CREATE TABLE "accounts" (
    "id" INTEGER,
    "user_id" INTEGER,
    "account_number" INTEGER UNIQUE NOT NULL,
    "account_type" TEXT CHECK("account_type" IN("savings", "checkings", "credit" )) NOT NULL,
    "balance" REAL DEFAULT 0,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id")
);

-- Represent every transactions in the mobile app

CREATE TABLE "transactions" (
    "id" INTEGER,
    "account_id" INTEGER NOT NULL,
    "branch_id" INTEGER,
    "transaction_type" TEXT CHECK("transaction_type" IN("deposit","withdrawal", "transfer", "payment")),
    "amount" REAL NOT NULL CHECK(amount >= 0),
    "transaction_date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("account_id") REFERENCES "accounts"("id"),
    FOREIGN KEY ("branch_id") REFERENCES "branches"("id")
);

-- Represent individual card information

CREATE TABLE "cards" (
    "id" INTEGER,
    "transactions_id" INTEGER NOT NULL,
    "card_number" INTEGER UNIQUE NOT NULL,
    "expiry_date" TEXT NOT NULL,
    "cvv" INTEGER,
    "card_type" TEXT CHECK("card_type" IN("Visa", "Mastercard", "AMEX")),
    PRIMARY KEY ("id"),
    FOREIGN KEY ("transactions_id") REFERENCES "transactions"("id")
);

-- Create indexes to speed common searches
CREATE INDEX "users_name_search" ON "users" ("first_name", "last_name");
CREATE INDEX "users_email_search" ON "users" ("email");
CREATE INDEX "card_information" ON "cards" ("card_number", "cvv", "card_type");
CREATE INDEX "account_information" ON "accounts" ("account_number", "account_type", "balance");
