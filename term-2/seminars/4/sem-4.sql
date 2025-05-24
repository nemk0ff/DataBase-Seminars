create table employees (
    id serial primary key,
    name varchar(50),
  	gender varchar(50),
    city varchar(50),
    department varchar(50),
  	grade varchar(50),
    salary integer,
  	contacts jsonb,
  	hiring_date date
);

insert into employees
(name, gender, city, department, grade, salary, contacts, hiring_date)
values
('Марина', 'жен', 'Москва', 'it', 'middle', 104,     '{ "phone": [ "89650957834" ],"email": [ "dgshj@gmail.com" ],  "tg": ["@marinette"]}'::jsonb,     '2022-07-03'),
('Елена', 'жен','Самара', 'it', 'junior', 84,        '{ "phone": [ "89340972334" ],"email": [ "jfhdie@gmail.com" ], "tg": ["@superhero"]}'::jsonb,     '2024-02-06'),
('Ксения', 'жен','Москва', 'it', 'junior', 90,       '{ "phone": [ "89994512334" ],"email": [ "kdun@mail.ru" ],     "tg": ["@ksunya"]}'::jsonb,        '2024-04-28'),
('Иван', 'муж','Москва', 'it', 'senior', 120,        '{ "phone": [ "89660972919" ],"email": [ "sdfeq@gmail.com" ],  "tg": ["@cool_ivan"]}'::jsonb,     '2020-09-03'),
('Леонид', 'муж','Самара', 'it', 'middle', 104,      '{ "phone": [ "89349362363" ],"email": [ "iubuk@yandex.ru" ],  "tg": ["@leoandtig"]}'::jsonb,     '2023-03-15'),
('Дарья', 'жен','Самара', 'hr', 'middle', 70,        '{ "phone": [ "89057340138" ],"email": [ "mdm@mail.ru" ],      "tg": ["@feelthat"]}'::jsonb,      '2022-10-29'),
('Борис', 'муж','Самара', 'hr', 'middle', 78,        '{ "phone": [ "89010973434" ],"email": [ "kdytjr@gmail.com" ], "tg": ["@hipobor"]}'::jsonb,       '2023-08-31'),
('Вероника', 'жен','Москва', 'sales', 'senior', 96,  '{ "phone": [ "89240675111" ],"email": [ "kdjdehee@mail.ru" ], "tg": ["@veraofficial"]}'::jsonb,  '2021-11-11'),
('Анна', 'жен','Москва', 'sales', 'senior', 100,     '{ "phone": [ "89071677222" ],"email": [ "dlldl@yandex.ru" ],  "tg": ["@anna_sokolova"]}'::jsonb, '2021-06-30'),
('Ангелина', 'жен','Воронеж', 'it', 'middle', 96,    '{ "phone": [ "89608971234" ],"email": [ "keytri@gmail.com" ], "tg": ["@angel"]}'::jsonb,         '2022-11-09'),
('Оксана', 'жен','Москва', 'sales', 'junior', 66,    '{ "phone": [ "89770665513" ],"email": [ "ososos@mail.ru" ],   "tg": ["@oxxana"]}'::jsonb,        '2024-01-11'),
('Денис', 'муж','Тула', 'it', 'middle', 100,         '{ "phone": [ "89010978838" ],"email": [ "pertse@gmail.com" ], "tg": ["@denchik_one"]}'::jsonb,   '2023-03-17'),
('Максим', 'муж','Самара', 'sales', 'middle', 70,    '{ "phone": [ "89097772233" ],"email": [ "ybdnk@yandex.ru" ],  "tg": ["@maxpower"]}'::jsonb,      '2022-12-01'),
('Сергей', 'муж','Воронеж', 'hr', 'senior', 88,      '{ "phone": [ "89880978976" ],"email": [ "oeeous@gmail.com"], "tg": ["@notserious"]}'::jsonb,     '2021-01-23'),
('Михаил', 'муж','Москва', 'hr', 'junior', 65,       '{ "phone": [ "89153079352" ],"email": [ "pebhgd@gmail.com"], "tg": ["@sys"]}'::jsonb,            '2024-12-05'),
('Константин', 'муж','Тула', 'sales', 'senior', 85,  '{ "phone": [ "89406459115" ],"email": [ "lndy@gmail.com"],   "tg": ["@koschey"]}'::jsonb,        '2020-10-13'),
('Алина', 'жен','Казань', 'hr', 'senior', 90,        '{ "phone": [ "89161427694" ],"email": [ "prbwh@mail.ru"],    "tg": ["@allinone"]}'::jsonb,       '2021-07-14'),
('Антон', 'муж','Москва', 'it', 'senior', 125,       '{ "phone": [ "89407625434" ],"email": [ "onmer@gmail.com"],  "tg": ["@whithoutg"]}'::jsonb,      '2020-05-22'),
('Евгений', 'муж','Самара', 'sales', 'junior', 64,   '{ "phone": [ "89999564488" ],"email": [ "leusn@yandex.ru"],  "tg": ["@evgenius"]}'::jsonb,       '2024-07-13'),
('Ирина', 'жен','Тула', 'hr', 'senior', 85,          '{ "phone": [ "89037631832" ],"email": [ "luqjs@gmail.com"],  "tg": ["@skorootpusk"]}'::jsonb,    '2020-12-03');