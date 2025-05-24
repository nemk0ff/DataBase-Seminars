CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    patronymic TEXT,
    skills TEXT[], -- массив языков программирования
    avg_grade NUMERIC(3,2) CHECK (avg_grade BETWEEN 0 AND 5)
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    prerequisite_id INT REFERENCES courses(id) ON DELETE SET NULL,
    difficulty_level INT CHECK (difficulty_level BETWEEN 1 AND 5)
);

CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    status TEXT CHECK (status IN ('active', 'completed', 'dropped'))
);

INSERT INTO students (name, surname, patronymic, skills, avg_grade) VALUES
('Иван', 'Петров', 'Александрович', ARRAY['Python', 'SQL'], 4.8),
('Мария', 'Сидорова', 'Павловна', ARRAY['Java', 'C++'], 3.6),
('Алексей', 'Иванов', 'Сергеевич', ARRAY['Python', 'JavaScript'], 4.2),
('Ольга', 'Кузнецова', 'Игоревна', ARRAY['C#', 'SQL', 'Go'], 4.5),
('Дмитрий', 'Смирнов', 'Владимирович', ARRAY['Java', 'Kotlin'], 3.2),
('Екатерина', 'Федорова', 'Дмитриевна', ARRAY['Python', 'R'], 4.9),
('Николай', 'Васильев', 'Аркадьевич', ARRAY['C', 'C++', 'Rust'], 3.8),
('Светлана', 'Михайлова', 'Олеговна', ARRAY['Python', 'SQL', 'Scala'], 4.1),
('Григорий', 'Алексеев', 'Леонидович', ARRAY['JavaScript', 'TypeScript'], 3.7),
('Анна', 'Зайцева', 'Ильинична', ARRAY['Swift', 'Objective-C'], 4.6),
('Павел', 'Тимофеев', 'Петрович', ARRAY['Python', 'Ruby'], 3.9),
('Татьяна', 'Громова', 'Андреевна', ARRAY['C++', 'Haskell'], 4.0),
('Сергей', 'Орлов', 'Алексеевич', ARRAY['Java', 'SQL', 'Python'], 4.7),
('Юлия', 'Костина', 'Романовна', ARRAY['Go', 'Rust'], 3.5),
('Артем', 'Никитин', 'Михайлович', ARRAY['Python', 'Scala', 'R'], 4.3),
('Ирина', 'Шубина', 'Викторовна', ARRAY['JavaScript', 'C#'], 3.6),
('Владимир', 'Егоров', 'Константинович', ARRAY['Kotlin', 'Java'], 4.4),
('Евгений', 'Морозов', 'Денисович', ARRAY['C', 'C++', 'Python'], 3.3),
('Оксана', 'Филатова', 'Петровна', ARRAY['Swift', 'Objective-C'], 4.2),
('Роман', 'Данилов', 'Игоревич', ARRAY['Python', 'Ruby', 'Rust'], 4.0);

INSERT INTO courses (title, prerequisite_id, difficulty_level) VALUES
('Основы программирования', NULL, 1),
('Алгоритмы и структуры данных', 1, 3),
('Базы данных', NULL, 2),
('SQL для аналитиков', 3, 3),
('Разработка на Python', 1, 2),
('Функциональное программирование', 2, 4),
('Системное программирование', 2, 5),
('Java и Kotlin', NULL, 3),
('Продвинутый SQL', 4, 4),
('Big Data и ML', 6, 5);

INSERT INTO enrollments (student_id, course_id, start_date, status) VALUES
(1, 3, '2024-01-10', 'active'),
(2, 5, '2023-11-15', 'completed'),
(3, 4, '2023-09-01', 'active'),
(4, 2, '2024-02-01', 'active'),
(5, 6, '2023-10-10', 'dropped'),
(6, 8, '2023-08-15', 'completed'),
(7, 7, '2024-01-20', 'active'),
(8, 9, '2023-12-10', 'active'),
(9, 10, '2023-07-05', 'completed'),
(10, 1, '2024-03-01', 'active'),
(11, 3, '2023-06-15', 'completed'),
(12, 2, '2024-02-20', 'active'),
(13, 5, '2023-09-30', 'active'),
(14, 7, '2024-01-15', 'dropped'),
(15, 4, '2023-11-01', 'completed'),
(16, 6, '2023-12-20', 'active'),
(17, 9, '2023-07-10', 'completed'),
(18, 1, '2024-02-05', 'active'),
(19, 8, '2023-10-25', 'completed'),
(20, 10, '2023-06-01', 'active'),
(1, 2, '2024-01-15', 'active'),
(2, 4, '2023-11-25', 'completed'),
(3, 6, '2023-09-10', 'dropped'),
(4, 8, '2024-02-10', 'active'),
(5, 9, '2023-10-15', 'active'),
(6, 7, '2023-08-20', 'completed'),
(7, 3, '2024-01-30', 'active'),
(8, 5, '2023-12-15', 'dropped'),
(9, 1, '2023-07-25', 'completed'),
(10, 4, '2024-03-10', 'active'),
(11, 8, '2023-06-30', 'completed'),
(12, 10, '2024-02-28', 'active'),
(13, 2, '2023-09-05', 'active'),
(14, 3, '2024-01-25', 'dropped'),
(15, 5, '2023-11-20', 'completed'),
(16, 7, '2023-12-25', 'active'),
(17, 9, '2023-07-15', 'completed'),
(18, 1, '2024-02-15', 'active'),
(19, 8, '2023-10-30', 'completed'),
(20, 10, '2023-06-15', 'active');
