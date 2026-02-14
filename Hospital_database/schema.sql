-- Represent Hospital indivudal information
CREATE TABLE IF NOT EXISTS"Hospitals" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "city_name" TEXT NOT NULL, 
    "address" TEXT NOT NULL,
    "phone_number" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "opening_date" TIMESTAMP NOT NULL,
    "opening_time" TIMESTAMP NOT NULL,
    "closing_time" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "hospital_locations" (
    "id" INTEGER NOT NULL,
    "hospital_id" INTEGER NOT NULL,
    "building_name" VARCHAR(100),
    "floor" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("hospital_id") REFERENCES "Hospitals"("id")
);

CREATE TABLE IF NOT EXISTS "department" (
    "id" INTEGER NOT NULL, 
    "Name" TEXT NOT NULL,
    "Head" TEXT NOT NULL,
    "hospital_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("Hospital_id") REFERENCES "Hospitals"("id")
);

CREATE TABLE IF NOT EXISTS "Physican" (
    "employee_id" INTEGER NOT NULL,
    "Physican_name" TEXT NOT NULL,
    "position" TEXT CHECK("position" IN(
        'Hospitalist', 
        'Emergency Medicine', 
        'Critical Care', 
        'Surgery', 
        'Gynecology', 
        'Anesthesiology'
    )),
    "status" TEXT CHECK("status" IN (
        'active', 
        'inactive', 
        'retired' 
    )),
    PRIMARY KEY ("employee_id")
);

CREATE TABLE IF NOT EXISTS "Nurse" (
    "nurse_id" INTEGER NOT NULL,
    "nurse_name" TEXT,
    "position" TEXT CHECK("position" IN(
        'Emergency Nurse',
        'Operating Room Nurse', 
        'Pediatric Nurse', 
        'Oncology Nurse', 
        'Nurse Practitioner', 
        'Nurse Manager', 
        'Critical Care Nurse'
    )),
    "registred" INTEGER CHECK(registred IN('registred', 'not registred')),
    PRIMARY KEY ("nurse_id")
);

CREATE TABLE IF NOT EXISTS "Patient" (
    "patient_id" INTEGER NOT NULL,
    "Name" TEXT NOT NULL,
    "address" TEXT,
    "Gender" TEXT,
    "email" TEXT,
    "phone_number" TEXT NOT NULL,
    "Insurance_company_name" TEXT,
    "physican_employee_id" INTEGER,
    PRIMARY KEY ("patient_id"),
    FOREIGN KEY ("physican_employee_id") REFERENCES "Physican"("employee_id")
);

CREATE TABLE IF NOT EXISTS "Medication" (
    "medication_id" INTEGER NOT NULL,
    "Name" TEXT NOT NULL,
    "Brand" TEXT NOT NULL,
    "Description" TEXT NOT NULL,
    Primary KEY ("medication_id")
);

CREATE TABLE IF NOT EXISTS "Prescribes" (
    "physican_employee_id" INTEGER,
    "patient_id" INTEGER,
    "date" TIMESTAMP,
    "appointment" INTEGER,
    "dose" INTEGER,
    FOREIGN KEY ("physican_employee_id") REFERENCES "Physican"("employee_id")
    FOREIGN KEY ("patient_id") REFERENCES "Patient"("patient_id")
);

CREATE TABLE IF NOT EXISTS "Block" (
    "block_floor" INTEGER,
    "block_code" INTEGER
);

CREATE TABLE IF NOT EXISTS "Room" (
    "Room_number" INTEGER NOT NULL,
    "Room_type" TEXT NOT NULL,
    "block_floor" INTEGER,
    "block_code" INTEGER,
    PRIMARY KEY ("Room_number"),
    FOREIGN KEY ("block_floor") REFERENCES "block"("block_floor"),
    FOREIGN KEY ("block_code") REFERENCES "block"("block_code")
);

CREATE TABLE IF NOT EXISTS "Stay" (
    "stay_id" INTEGER NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "Room" INTEGER NOT NULL,
    "Start_time" TIMESTAMP NOT NULL,
    "end_time" TIMESTAMP NOT NULL,
    PRIMARY KEY ("stay_id"),
    FOREIGN KEY ("patient_id") REFERENCES "patient"("patient_id"),
    FOREIGN KEY ("Room") REFERENCES "Room"("Room_number")
);

CREATE TABLE IF NOT EXISTS "appointment" (
    "appointment_id" INTEGER NOT NULL,
    "patient_id" INTEGER,
    "physican_id" INTEGER,
    "Nurse_id" INTEGER,
    "Start_time" TIMESTAMP NOT NULL,
    "end_time" TIMESTAMP NOT NULL,
    "examination_room" TEXT NOT NULL,
    "Reason" TEXT,
    PRIMARY KEY ("appointment_id"),
    FOREIGN KEY ("patient_id") REFERENCES "patient"("patient_id"), 
    FOREIGN KEY ("physican_id") REFERENCES "physican"("employee_id")
 );

 CREATE TABLE IF NOT EXISTS "procedure" (
    "procedure_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "cost" DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS "undergoes" (
    "patient_id" INTEGER,
    "procedure_id" INTEGER,
    "stay_id" INTEGER,
    "date" TIMESTAMP,
    "physican_id" INTEGER,
    "Nurse_id" INTEGER,
    FOREIGN KEY ("patient_id") REFERENCES "patient"("patient_id"), 
    FOREIGN KEY ("physican_id") REFERENCES "physican"("employee_id"),
    FOREIGN KEY ("procedure_id") REFERENCES "procedure"("procedure_id"),
    FOREIGN KEY ("stay_id") REFERENCES "stay"("stay_id"),
    FOREIGN KEY ("Nurse_id") REFERENCES "nurse"("nurse_id")
);

CREATE TABLE IF NOT EXISTS "On_call" (
    "Nurse_name" TEXT,
    "block_floor" INTEGER,
    "block_code" INTEGER,
    "On_call_start" TIMESTAMP,
    "On_call_end" TIMESTAMP,
    FOREIGN KEY ("Nurse_name") REFERENCES "Nurse"("nurse_name"),
    FOREIGN KEY ("block_floor") REFERENCES "block"("block_floor"),
    FOREIGN KEY ("block_code") REFERENCES "block"("block_code")
);

CREATE TABLE IF NOT EXISTS "Affilated_with" (
    "physican_name" TEXT,
    "department_id" INTEGER,
    "Primary_affilation" TEXT,
    FOREIGN KEY ("physican_name") REFERENCES "Physican"("Physican_name"),
    FOREIGN KEY ("Department_id") REFERENCES "department"("id")
);