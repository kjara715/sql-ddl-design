-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Users" (
    "ID" int   NOT NULL,
    "first_name" string   NOT NULL,
    "last_name" string   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Regions" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Categories" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Posts" (
    "ID" int   NOT NULL,
    "title" string   NOT NULL,
    "text" string   NOT NULL,
    "user_id" int   NOT NULL,
    "post_location" string   NOT NULL,
    "region_id" int   NOT NULL,
    "cat_id" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Regions" ADD CONSTRAINT "fk_Regions_ID" FOREIGN KEY("ID")
REFERENCES "Posts" ("region_id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_user_id" FOREIGN KEY("user_id")
REFERENCES "Users" ("ID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_cat_id" FOREIGN KEY("cat_id")
REFERENCES "Categories" ("ID");

