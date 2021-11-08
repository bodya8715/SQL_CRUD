DROP TABLE IF EXISTS workers;

CREATE TABLE workers(
    id serial PRIMARY KEY,
    "name" varchar(64) NOT NULL CHECK("name" != ''),
    birthday date NOT NULL,
    salary int NOT NULL CHECK(salary > 0)
);

-- Задачи на INSERT

INSERT INTO workers ("name", birthday, salary)
VALUES
('Никита', '1990-2-4', 300);

INSERT INTO workers ("name", birthday, salary)
VALUES
('Светлана', '1984-4-8', 1200);

INSERT INTO workers ("name", birthday, salary)
VALUES
('Ярослав', '1980-4-12', 1200),
('Петр', '1993-4-8', 1000);

-- несколько произвольных пользователей

INSERT INTO workers ("name", birthday, salary)
VALUES
('Никита', '1964-12-4', 1842),
('Василий', '1998-5-10', 2042),
('Алексей', '1991-2-3', 792),
('Николай', '1992-1-7', 920);

-- Задачи на UPDATE

UPDATE workers SET salary = 200 WHERE "name" = 'Василий';

UPDATE workers SET birthday = '1987-1-1' WHERE id = 4;

UPDATE workers SET salary = 700 WHERE salary = 500;

UPDATE workers SET birthday = '1999-1-1' WHERE id > 2 AND id <= 5;

UPDATE workers SET "name" = 'Женя', salary = 900 WHERE "name" = 'Василий';

-- Задачи на SELECT

SELECT * FROM workers WHERE id = 3;

SELECT * FROM workers WHERE salary > 400;

SELECT * FROM workers WHERE salary != 500;

SELECT salary, extract(year from age(birthday)) AS "age" FROM workers WHERE "name" = 'Женя';

SELECT * FROM workers WHERE "name" = 'Петр';

SELECT * FROM workers WHERE "name" != 'Петр';

SELECT * FROM workers WHERE extract(year from age(birthday)) > 27 OR salary = 1000;

SELECT * FROM workers WHERE extract(year from age(birthday)) > 25 AND extract(year from age(birthday)) <= 28;

SELECT * FROM workers WHERE (extract(year from age(birthday)) > 23 AND extract(year from age(birthday)) < 27) OR (salary > 400 AND salary < 1000);

SELECT * FROM workers WHERE extract(year from age(birthday)) = 27 OR salary != 400;

-- Задачи на DELETE

DELETE FROM workers WHERE id = 7;

DELETE FROM workers WHERE "name" = 'Николай';

DELETE FROM workers WHERE extract(year from age(birthday)) = 23;

