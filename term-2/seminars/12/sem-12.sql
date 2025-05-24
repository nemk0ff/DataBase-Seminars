create table departments (
    id serial primary key,
    name varchar(50)
);

create table employees (
    id serial primary key,
    name varchar(50),
    department_id integer,
  	grade varchar(50),
    salary integer,
  	email varchar(50),
  	boss_id integer
);

insert into departments
(name)
values
('it'),
('hr'),
('accounting'),
('support'),
('design'),
('pr'),
('business'),
('management'),
('sales');

insert into employees
(name, department_id, grade, salary, email, boss_id)
values
('Марина', 1, 'middle', 104,     'dgshj@gmail.com', 4),
('Елена',1, 'junior', 84,        'jfhdie@gmail.com', 3),
('Ксения', 1, 'junior', 90,       'kdun@mail.ru',    5),
('Иван', 1 , 'senior', 120,        'sdfeq@gmail.com', NULL),
('Леонид', 1, 'middle', 104,      'iubuk@yandex.ru', 4),
('Дарья', 2, 'middle', 70,        'mdm@mail.ru',     7),
('Борис', 2, 'middle', 78,        'kdytjr@gmail.com', 27),
('Вероника', 9, 'senior', 96,  'kdjdehee@mail.ru', NULL),
('Анна', 9, 'senior', 100,     'dlldl@yandex.ru', NULL),
('Ангелина', 1, 'middle', 96,    'keytri@gmail.com', 5),
('Оксана', 9, 'junior', 66,    'ososos@mail.ru',  9),
('Денис', 4, 'middle', 100,         'pertse@gmail.com', NULL),
('Максим', 4, 'middle', 70,    'ybdnk@yandex.ru', NULL),
('Сергей', 3, 'senior', 88,      'oeeous@gmail.com', NULL),
('Михаил', 2, 'junior', 65,       'pebhgd@gmail.com', 7),
('Константин', 8, 'senior', 85,  'lndy@gmail.com',   NULL),
('Алина', 8, 'senior', 90,        'prbwh@mail.ru',   NULL ),
('Антон', 1, 'senior', 125,       'onmer@gmail.com',  NULL),
('Евгений', 9, 'junior', 64,   'leusn@yandex.ru',  8),
('Ирина', 8, 'senior', 85,          'luqjs@gmail.com',  NULL),
('Ирина', 7, 'senior', 150,          'luqjs@gmail.com',  NULL),
('Анна', 9, 'junior', 90,     'dlldl@yandex.ru', 8),
('Ангелина', 1, 'junior', 96,    'keytri@gmail.com', 5),
('Валентина', 9, 'junior', 66,    'ososos@mail.ru',  8),
('Денис', 1, 'senior', 100,         'pertse@gmail.com', NULL),
('Максим', 9, 'middle', 70,    'ybdnk@yandex.ru', 8),
('Сергей', 2, 'senior', 88,      'oeeous@gmail.com', NULL),
('Михаил', 2, 'junior', 65,       'pebhgd@gmail.com', 7),
('Константин', 9, 'senior', 85,  'lndy@gmail.com',   NULL),
('Алина', 1, 'senior', 90,        'prbwh@mail.ru',    NULL),
('Антон', 1, 'senior', 120,       'onmer@gmail.com',  NULL),
('Евгений', 4, 'junior', 64,   'leusn@yandex.ru',  12),
('Ирина', 2, 'senior', 85,          'luqjs@gmail.com',  NULL),
('Ирина', 2, 'middle', 90,          'luqjs@gmail.com',  27);