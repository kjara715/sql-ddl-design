-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Teams" (
    "ID" int   NOT NULL,
    "team_name" string   NOT NULL,
    "team_rank" int   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Players" (
    "ID" int   NOT NULL,
    "team_id" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Referees" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Games" (
    "ID" int   NOT NULL,
    "team1_id" int   NOT NULL,
    "team2_id" int   NOT NULL,
    "ref_id" int   NOT NULL,
    "winner_id" int  DEFAULT null NOT NULL,
    CONSTRAINT "pk_Games" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Goals" (
    "ID" int   NOT NULL,
    "player_id" int   NOT NULL,
    "game_id" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Seasons" (
    "ID" int   NOT NULL,
    "s_date" DATE   NOT NULL,
    "e_date" DATE   NOT NULL,
    CONSTRAINT "pk_Seasons" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("ID");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_team1_id" FOREIGN KEY("team1_id")
REFERENCES "Teams" ("ID");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_team2_id" FOREIGN KEY("team2_id")
REFERENCES "Teams" ("ID");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_ref_id" FOREIGN KEY("ref_id")
REFERENCES "Referees" ("ID");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_winner_id" FOREIGN KEY("winner_id")
REFERENCES "Teams" ("ID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("ID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_game_id" FOREIGN KEY("game_id")
REFERENCES "Games" ("ID");

