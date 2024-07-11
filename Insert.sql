INSERT INTO
    music_genre (name)
VALUES
    ('Jazz'),
    ('Electronic dance music'),
    ('Pop'),
    ('Rock'),
    ('Reggae'),
    ('Country'),
    ('Punk'),
    ('Blues'),
    ('Hip hop'),
    ('Folk'),
    ('Soul');

INSERT INTO
    artist (name)
VALUES
    ('Louis Armstrong'),
    ('Avicii'),
    ('Michael Jackson'),
    ('The Beatles'),
    ('Bob Marley'),
    ('Johnny Cash'),
    ('Ramones'),
    ('John Lee Hooker'),
    ('Eminem'),
    ('Bob Dylan'),
    ('Aretha Franklin'),
    ('Miles Davis'),
    ('Duke Ellington'),
    ('Drake'),
    ('Kanye West'); -- без связи с жанром 

INSERT INTO
    artist_genre (artist_id, music_genre_id) -- генерация связей исполнителя и жанра c помощью генератора
VALUES
    (generate_series(1, 11), generate_series(1, 11));

INSERT INTO
    artist_genre (artist_id, music_genre_id)
VALUES
    (12, 1),
    (13, 1),
    (14, 9),
    (3, 4),
    (3, 11),
    (3, 2);

INSERT INTO
    album (title, year_of_release)
VALUES
    ('Ella and Louis', 1956),
    ('Stories', 2015),
    ('Thriller', 1982),
    ('Abbey Road', 1969),
    ('Natty Dread', 1974),
    ('Songs of Our Soil', 1959),
    ('Mondo Bizarro', 1992),
    ('Jealous', 1987),
    ('Music to Be Murdered By', 2020),
    ('Modern Times', 2006),
    ('Aretha', 1986);

INSERT INTO
    artist_album (artist_id, album_id) -- генерация связей исполнителя и альбома для основного задания
VALUES
    (generate_series(1, 11), generate_series(1, 11));

INSERT INTO
    track (title, duration, album_id)
VALUES
    ('Isn’t This a Lovely Day?', '6:14', 1),
    ('Talk to Myself', '3:55', 2),
    ('Thriller', '5:57', 3),
    ('Come Together', '4:19', 4),
    ('Lively Up Yourself', '5:29', 5),
    ('Drink to Me', '1:54', 6),
    ('Anxiety', '2:04', 7),
    ('Ninety Days', '3:24', 8),
    ('In Too Deep', '3:15', 9),
    ('Spirit on the Wate', '7:42', 10),
    ('If You Need My Love Tonigh', '4:30', 11),
    ('Do You Still Remember', '5:10', 11),
    ('Nettie Moore', '6:53', 10),
    ('Marsh', '3:21', 9),
    ('Early One Morning', '4:02', 8);

INSERT INTO
    collection (name, year_of_release)
VALUES
    ('popular track 2020 year', 2020),
    ('popular track 2019 year', 2019),
    ('popular track 2010 year', 2010),
    ('popular track 2005 year', 2005);

INSERT INTO
    track_collection (track_id, collection_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 2),
    (5, 3),
    (6, 3),
    (7, 3),
    (8, 4),
    (9, 4);

INSERT INTO
    -- Тестовые записи для тестирования SELECT запроса с мой/my
    track (title, duration)
VALUES
    ('my own', '1:02'),
    ('own my', '2:02'),
    ('my', '3:02'),
    ('oh my god', '4:02'),
    ('myself by', '1:02'),
    ('by myself by', '2:02');

-- Для тестирования задания 3.4 дополнительно создал несуществующий альбом с 2020 годом у исполнителя
INSERT INTO
    album (title, year_of_release)
VALUES
    ('Graduation', 2010),
    ('JESUS IS KING', 2020);

INSERT INTO
    artist_album (artist_id, album_id) -- генерация связей исполнителя и альбома дополнительной проверки
VALUES
    (15, 12),
    (15, 13);

-- Дополнительные команды которые могут понадобится 
-- Если мы удаляем данные из таблицы, инкремент запоминает последний испольщованный ID поэтому при тестировании возникла необходимость сбросить счетчик принудительно
--ALTER SEQUENCE collection_id_seq RESTART WITH 1; Сбрасывается этой командой где таблица_столбец_seq, необходимую таблицу так же можно посмотреть в DBveaver в таблице по умолчанию в данном поле
