CREATE TABLE IF NOT EXISTS artists
(
    id       BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name     VARCHAR(255) NOT NULL,
    is_group BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS songs
(
    id        BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name      VARCHAR(255) NOT NULL,
    artist_id BIGINT       NOT NULL,
    CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES artists (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS song_details
(
    id           BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    song_id      BIGINT NOT NULL,
    text         TEXT   NOT NULL,
    release_date DATE   NOT NULL,
    link         VARCHAR(255),
    CONSTRAINT fk_song FOREIGN KEY (song_id) REFERENCES songs (id) ON DELETE CASCADE
);