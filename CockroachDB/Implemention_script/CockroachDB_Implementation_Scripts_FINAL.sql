-- CockroachDB implementation script
-- Database: university_registration
-- Dataset sizes:
-- Small: 1,000 students, 100 courses, 5,000 registrations
-- Medium: 5,000 students, 250 courses, 25,000 registrations
-- Large: 10,000 students, 500 courses, 50,000 registrations

CREATE DATABASE IF NOT EXISTS university_registration;
USE university_registration;

-- ============================================================
-- 1. ORIGINAL DATABASE
-- ============================================================

CREATE TABLE public.students (
    student_id VARCHAR(10) NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    programme VARCHAR(100) NOT NULL,
    CONSTRAINT students_pkey PRIMARY KEY (student_id ASC)
) WITH (schema_locked = true);

CREATE TABLE public.courses (
    course_id VARCHAR(10) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credit_hours INT8 NOT NULL,
    lecturer VARCHAR(100) NOT NULL,
    CONSTRAINT courses_pkey PRIMARY KEY (course_id ASC)
) WITH (schema_locked = true);

CREATE TABLE public.registrations (
    registration_id VARCHAR(10) NOT NULL,
    student_id VARCHAR(10) NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    registration_date DATE NOT NULL,
    CONSTRAINT registrations_pkey PRIMARY KEY (registration_id ASC),
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES public.students(student_id),
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES public.courses(course_id),
    UNIQUE INDEX unique_student_course (student_id ASC, course_id ASC)
) WITH (schema_locked = true);

-- ============================================================
-- 1A. ORIGINAL DATABASE SAMPLE DATA
-- ============================================================
-- These are the three original sample records previously used in the university_registration database.
-- Insert parent records before registration records because registrations has foreign keys to students and courses.

INSERT INTO public.students
    (student_id, student_name, email, programme)
VALUES
    ('S001', 'John Tan',   'john.tan@example.com',   'Business Management'),
    ('S002', 'Sarah Lim',  'sarah.lim@example.com',  'Information Technology'),
    ('S003', 'David Wong', 'david.wong@example.com', 'Business Management');

INSERT INTO public.courses
    (course_id, course_name, credit_hours, lecturer)
VALUES
    ('C001', 'Database Management Systems', 3, 'Mr. James Lee'),
    ('C002', 'Principles of Marketing',      3, 'Ms. Sarah Tan'),
    ('C003', 'Business Management',          4, 'Mr. David Lim');

INSERT INTO public.registrations
    (registration_id, student_id, course_id, registration_date)
VALUES
    ('R001', 'S001', 'C001', DATE '2026-09-01'),
    ('R002', 'S002', 'C002', DATE '2026-09-02'),
    ('R003', 'S003', 'C003', DATE '2026-09-02');

-- ============================================================
-- 2. SMALL DATASET
-- ============================================================

CREATE TABLE public.small_students (
    student_id VARCHAR(10) NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    programme VARCHAR(100) NOT NULL,
    CONSTRAINT students_test_pkey PRIMARY KEY (student_id ASC)
) WITH (schema_locked = true);

CREATE TABLE public.small_courses (
    course_id VARCHAR(10) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credit_hours INT8 NOT NULL,
    lecturer VARCHAR(100) NOT NULL,
    CONSTRAINT courses_test_pkey PRIMARY KEY (course_id ASC)
) WITH (schema_locked = true);

CREATE TABLE public.small_registrations (
    registration_id VARCHAR(10) NOT NULL,
    student_id VARCHAR(10) NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    registration_date DATE NOT NULL,
    CONSTRAINT registrations_test_pkey PRIMARY KEY (registration_id ASC),
    CONSTRAINT fk_student_test FOREIGN KEY (student_id) REFERENCES public.small_students(student_id),
    CONSTRAINT fk_course_test FOREIGN KEY (course_id) REFERENCES public.small_courses(course_id),
    UNIQUE INDEX unique_student_course_test (student_id ASC, course_id ASC)
) WITH (schema_locked = true);

-- ============================================================
-- 3. MEDIUM DATASET
-- ============================================================

CREATE TABLE public.medium_students (
    student_id VARCHAR(10) NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    programme VARCHAR(100) NOT NULL,
    CONSTRAINT medium_students_pkey PRIMARY KEY (student_id ASC)
) WITH (schema_locked = true);

CREATE TABLE public.medium_courses (
    course_id VARCHAR(10) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credit_hours INT8 NOT NULL,
    lecturer VARCHAR(100) NOT NULL,
    CONSTRAINT medium_courses_pkey PRIMARY KEY (course_id ASC)
) WITH (schema_locked = true);

CREATE TABLE public.medium_registrations (
    registration_id VARCHAR(10) NOT NULL,
    student_id VARCHAR(10) NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    registration_date DATE NOT NULL,
    CONSTRAINT medium_registrations_pkey PRIMARY KEY (registration_id ASC),
    CONSTRAINT medium_registrations_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.medium_students(student_id),
    CONSTRAINT medium_registrations_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.medium_courses(course_id),
    UNIQUE INDEX medium_registrations_student_id_course_id_key (student_id ASC, course_id ASC)
) WITH (schema_locked = true);

-- ============================================================
-- 4. LARGE DATASET
-- ============================================================

CREATE TABLE public.large_students (
    student_id VARCHAR(10) NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    programme VARCHAR(100) NOT NULL,
    CONSTRAINT large_students_pkey PRIMARY KEY (student_id ASC)
) WITH (schema_locked = true);

CREATE TABLE public.large_courses (
    course_id VARCHAR(10) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credit_hours INT8 NOT NULL,
    lecturer VARCHAR(100) NOT NULL,
    CONSTRAINT large_courses_pkey PRIMARY KEY (course_id ASC)
) WITH (schema_locked = true);

CREATE TABLE public.large_registrations (
    registration_id VARCHAR(10) NOT NULL,
    student_id VARCHAR(10) NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    registration_date DATE NOT NULL,
    CONSTRAINT large_registrations_pkey PRIMARY KEY (registration_id ASC),
    CONSTRAINT large_registrations_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.large_students(student_id),
    CONSTRAINT large_registrations_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.large_courses(course_id),
    UNIQUE INDEX large_registrations_student_id_course_id_key (student_id ASC, course_id ASC)
) WITH (schema_locked = true);

-- ============================================================
-- DATA LOADING NOTE
-- ============================================================
-- Import the prepared CSV files into the corresponding Small/Medium/Large
-- tables separately, using the actual file paths and import method already
-- used for this project. Those file paths are intentionally not fabricated.
-- Use the existing dataset files and their actual locations.
-- Data import is not included here because the CSV file paths are not
-- specified in this script. Do not rerun imports on an already populated DB.

-- END OF COCKROACHDB TABLE IMPLEMENTATION SCRIPT
