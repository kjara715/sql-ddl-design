-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "MedicalCenters" (
    "ID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_MedicalCenters" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Doctors" (
    "ID" int   NOT NULL,
    "Med_ID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Patients" (
    "ID" int   NOT NULL,
    "Name" sting   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Appointments" (
    "ID" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    CONSTRAINT "pk_Appointments" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Diseases" (
    "ID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Diagnoses" (
    "ID" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Doctors" ADD CONSTRAINT "fk_Doctors_Med_ID" FOREIGN KEY("Med_ID")
REFERENCES "MedicalCenters" ("ID");

ALTER TABLE "Appointments" ADD CONSTRAINT "fk_Appointments_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctors" ("ID");

ALTER TABLE "Appointments" ADD CONSTRAINT "fk_Appointments_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("ID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("ID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Diseases" ("ID");

