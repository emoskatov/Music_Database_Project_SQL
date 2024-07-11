-- Задание 2.1
SELECT
    title,
    to_char(duration, 'MI:SS') AS duration -- с приведением к формату минуты:секунды
FROM
    track
WHERE
    duration = (
        SELECT
            max(duration)
        FROM
            track
    );

-- Задание 2.2   
SELECT
    title,
    to_char(duration, 'MI:SS') AS duration -- с приведением к формату минуты:секунды
FROM
    track
WHERE
    -- также приведение к нужному нам интервалу, можно использовать как явное указание минут и секунд или приведение как указано в столбце при создании ::INTERVAL MINUTE TO SECOND
    duration >= '3m:30s';

-- Задание 2.3   
SELECT
    name
FROM
    collection
WHERE
    year_of_release BETWEEN 2018
    AND 2020;

-- Задание 2.4   
SELECT
    name
FROM
    artist
WHERE
    name NOT LIKE '% %';

-- Задание 2.5   
SELECT
    title,
    album_id
FROM
    track
WHERE
    -- Сделал приведение к нижнему регистру для нерегистрозависимому поиску
    -- Исправил по комментариям на способо пересечения между двумя массивами, короче и лаконичнее
    string_to_array(lower("title"), ' ') & & ARRAY ['my','мой'];

-- Задание 3.1
SELECT
    mg.name,
    count(a.name)
FROM
    music_genre AS mg
    JOIN artist_genre AS ag ON mg.id = ag.music_genre_id -- Можно опустить INNER так как он стоит по умолчанию и подходит нам, не выбираем то что не сооттносится
    JOIN artist AS a ON ag.artist_id = a.id
GROUP BY
    mg.name
ORDER BY
    mg.name;

-- Задание 3.2   
SELECT
    count(t.title)
FROM
    album AS a
    JOIN track AS t ON a.id = t.album_id
WHERE
    a.year_of_release BETWEEN 2019
    AND 2020;

-- Задание 3.3   
SELECT
    a.title,
    to_char(avg(t.duration), 'MI:SS') AS duration
FROM
    album AS a
    JOIN track AS t ON a.id = t.album_id -- Расчет происходит корректно, проверено дополнительно, за счет приведения была отброшена часть с микросекундами, без округления
GROUP BY
    a.title;

-- Задание 3.4   
SELECT
    a.name
FROM
    artist AS a
    JOIN artist_album AS aa ON a.id = aa.artist_id
    JOIN album AS a2 ON a2.id = aa.album_id
WHERE
    a.name NOT IN (
        SELECT
            a.name
        FROM
            artist AS a
            JOIN artist_album AS aa ON a.id = aa.artist_id
            JOIN album AS a2 ON a2.id = aa.album_id
        WHERE
            a2.year_of_release = 2020
    )
GROUP BY
    a.name;

-- Задание 3.5   
SELECT
    c.name AS name_collection
FROM
    artist_album AS aa
    JOIN artist AS a ON aa.artist_id = a.id
    AND a.name = 'Bob Marley' -- Исполнителем выбран Bob Marley
    JOIN album AS a2 ON a2.id = aa.album_id
    JOIN track AS t ON t.album_id = a2.id
    JOIN track_collection AS tc ON tc.track_id = t.id
    JOIN collection AS c ON c.id = tc.collection_id;

-- Дополнительное задание 4.1
SELECT
    a2.title
FROM
    artist AS a
    JOIN artist_genre AS ag ON ag.artist_id = a.id
    JOIN artist_album AS aa ON a.id = aa.artist_id
    JOIN album AS a2 ON a2.id = aa.album_id
GROUP BY
    a2.title,
    a.id
HAVING
    count(ag.music_genre_id) > 1;

--Дополнительное задание 4.2
SELECT
    t.title
FROM
    track AS t
    LEFT JOIN track_collection AS tc ON t.id = tc.track_id
WHERE
    tc.track_id IS NULL;

--Дополнительное задание 4.3 
SELECT
    a2.name,
    t.duration
FROM
    album AS a
    JOIN track AS t ON t.album_id = a.id
    AND t.duration = (
        SELECT
            min(duration)
        FROM
            track
    )
    JOIN artist_album AS aa ON aa.album_id = a.id
    JOIN artist AS a2 ON aa.artist_id = a2.id;

-- Дополнительное задание 4.4
SELECT
    t.album_id
FROM
    track AS t
    JOIN album AS a ON a.id = t.album_id
GROUP BY
    t.album_id
HAVING
    count(t.album_id) = (
        SELECT
            count(t.album_id) AS count
        FROM
            track AS t
            JOIN album AS a ON a.id = t.album_id
        GROUP BY
            t.album_id
        ORDER BY
            count
        LIMIT
            1
    )
ORDER BY
    t.album_id;
