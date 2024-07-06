CREATE TABLE IF NOT EXISTS music_genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL	
);
CREATE TABLE IF NOT EXISTS artist_genre (
    music_genre_id INTEGER REFERENCES music_genre(id),
    artist_id INTEGER REFERENCES artist(id),
    constraint artist_genre_pk PRIMARY KEY (music_genre_id, artist_id)
);
CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	year_of_release INTEGER NOT NULL CHECK (year_of_release > 1900 and year_of_release < EXTRACT (YEAR FROM current_date))
);
CREATE TABLE IF NOT EXISTS artist_album (
    artist_id INTEGER REFERENCES artist(id),
    album_id INTEGER REFERENCES album(id),
    CONSTRAINT artist_album_pk PRIMARY KEY (artist_id, album_id)
);
CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL UNIQUE,
	duration interval MINUTE TO SECOND CHECK (duration > '00:00'),
	album_id INTEGER REFERENCES album(id)
);
CREATE TABLE IF NOT EXISTS collection (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    year_of_release INTEGER NOT NULL CHECK (year_of_release > 1900 and year_of_release < EXTRACT (YEAR FROM current_date))
);
CREATE TABLE IF NOT EXISTS track_collection (
    track_id INTEGER REFERENCES track(id),
    collection_id INTEGER REFERENCES collection(id),
    constraint track_collection_pk PRIMARY KEY (track_id, collection_id)
);