-- public.courses definition

-- Drop table

-- DROP TABLE public.courses;

CREATE TABLE public.courses (
	course_id VARCHAR(10) NOT NULL,
	course_name VARCHAR(100) NOT NULL,
	credit_hours INT8 NOT NULL,
	lecturer VARCHAR(100) NOT NULL,
	CONSTRAINT courses_pkey PRIMARY KEY (course_id ASC)
) WITH (schema_locked = true);


-- public.large_courses definition

-- Drop table

-- DROP TABLE public.large_courses;

CREATE TABLE public.large_courses (
	course_id VARCHAR(10) NOT NULL,
	course_name VARCHAR(100) NOT NULL,
	credit_hours INT8 NOT NULL,
	lecturer VARCHAR(100) NOT NULL,
	CONSTRAINT large_courses_pkey PRIMARY KEY (course_id ASC)
) WITH (schema_locked = true);


-- public.large_students definition

-- Drop table

-- DROP TABLE public.large_students;

CREATE TABLE public.large_students (
	student_id VARCHAR(10) NOT NULL,
	student_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	programme VARCHAR(100) NOT NULL,
	CONSTRAINT large_students_pkey PRIMARY KEY (student_id ASC)
) WITH (schema_locked = true);


-- public.medium_courses definition

-- Drop table

-- DROP TABLE public.medium_courses;

CREATE TABLE public.medium_courses (
	course_id VARCHAR(10) NOT NULL,
	course_name VARCHAR(100) NOT NULL,
	credit_hours INT8 NOT NULL,
	lecturer VARCHAR(100) NOT NULL,
	CONSTRAINT medium_courses_pkey PRIMARY KEY (course_id ASC)
) WITH (schema_locked = true);


-- public.medium_students definition

-- Drop table

-- DROP TABLE public.medium_students;

CREATE TABLE public.medium_students (
	student_id VARCHAR(10) NOT NULL,
	student_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	programme VARCHAR(100) NOT NULL,
	CONSTRAINT medium_students_pkey PRIMARY KEY (student_id ASC)
) WITH (schema_locked = true);


-- public.small_courses definition

-- Drop table

-- DROP TABLE public.small_courses;

CREATE TABLE public.small_courses (
	course_id VARCHAR(10) NOT NULL,
	course_name VARCHAR(100) NOT NULL,
	credit_hours INT8 NOT NULL,
	lecturer VARCHAR(100) NOT NULL,
	CONSTRAINT courses_test_pkey PRIMARY KEY (course_id ASC)
) WITH (schema_locked = true);


-- public.small_students definition

-- Drop table

-- DROP TABLE public.small_students;

CREATE TABLE public.small_students (
	student_id VARCHAR(10) NOT NULL,
	student_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	programme VARCHAR(100) NOT NULL,
	CONSTRAINT students_test_pkey PRIMARY KEY (student_id ASC)
) WITH (schema_locked = true);


-- public.students definition

-- Drop table

-- DROP TABLE public.students;

CREATE TABLE public.students (
	student_id VARCHAR(10) NOT NULL,
	student_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	programme VARCHAR(100) NOT NULL,
	CONSTRAINT students_pkey PRIMARY KEY (student_id ASC)
) WITH (schema_locked = true);


-- public.large_registrations definition

-- Drop table

-- DROP TABLE public.large_registrations;

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


-- public.medium_registrations definition

-- Drop table

-- DROP TABLE public.medium_registrations;

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


-- public.registrations definition

-- Drop table

-- DROP TABLE public.registrations;

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


-- public.small_registrations definition

-- Drop table

-- DROP TABLE public.small_registrations;

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