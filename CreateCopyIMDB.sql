DROP TABLE IF EXISTS name_basics;
DROP TABLE IF EXISTS title_akas;
DROP TABLE IF EXISTS title_basics;
DROP TABLE IF EXISTS title_crew;
DROP TABLE IF EXISTS title_episode;
DROP TABLE IF EXISTS title_principals;
DROP TABLE IF EXISTS title_ratings;

CREATE TABLE name_basics
    (
        ID int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        nconst text,
        primaryName text,
        birthYear int,
        deathYear int,
        primaryProfession text,
        knownForTitles text
    );

CREATE INDEX idx_name_basics ON name_basics (nconst);

CREATE TABLE title_akas
    (
        ID int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        titleId text,
        ordering int,
        title text,
        region text,
        language text,
        types text,
        attributes text,
        isOriginalTitle bit
    );

CREATE INDEX idx_title_akas ON title_akas (titleId, ordering, region, language);

CREATE TABLE title_basics
    (
        ID int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        tconst text,
        titleType text,
        primaryTitle text,
        originalTitle text,
        isAdult bit,
        startYear int,
        endYear int,
        runtimeMinutes int,
        genres text
    );

CREATE INDEX idx_title_basics ON title_basics (tconst);
CREATE INDEX idx_title_basics2 ON title_basics (startYear, endYear);
CREATE INDEX idx_title_basics3 ON title_basics (titleType);

CREATE TABLE title_crew
    (
        ID int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        tconst text,
        directors text,
        writers text
    );

CREATE INDEX idx_title_crew ON title_crew (tconst);

CREATE TABLE title_episode
    (
        ID int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        tconst text,
        parentTconst text,
        seasonNumber int,
        episodeNumber int
    );

CREATE INDEX idx_title_episode ON title_episode (tconst);
CREATE INDEX idx_title_episode2 ON title_episode (parentTconst);

CREATE TABLE title_principals
    (
        ID int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        tconst text,
        ordering int,
        nconst text,
        category text,
        job text,
        characters text
    );

CREATE INDEX idx_title_principals ON title_principals (tconst, nconst, ordering);
CREATE INDEX idx_title_principals2 ON title_principals (category);

CREATE TABLE title_ratings
    (
        ID int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        tconst text,
        averageRating float,
        numVotes int
    );
CREATE INDEX idx_title_ratings ON title_ratings (tconst);
CREATE INDEX idx_title_ratings2 ON title_ratings (averageRating);

COPY name_basics FROM '/Users/murat.turkoglu/Downloads/imdbdb/name_basics.tsv' DELIMITER ',' CSV HEADER;
COPY title_akas FROM '/Users/murat.turkoglu/Downloads/imdbdb/title_akas.tsv' DELIMITER ',' CSV HEADER;
COPY title_basics FROM '/Users/murat.turkoglu/Downloads/imdbdb/title_basics.tsv' DELIMITER ',' CSV HEADER;
COPY title_crew FROM '/Users/murat.turkoglu/Downloads/imdbdb/title_crew.tsv' DELIMITER ',' CSV HEADER;
COPY title_episode FROM '/Users/murat.turkoglu/Downloads/imdbdb/title_episode.tsv' DELIMITER ',' CSV HEADER;
COPY title_principals FROM '/Users/murat.turkoglu/Downloads/imdbdb/title_principals.tsv' DELIMITER ',' CSV HEADER;
COPY title_ratings FROM '/Users/murat.turkoglu/Downloads/imdbdb/title_ratings.tsv' DELIMITER ',' CSV HEADER;