-- CockroachDB validation scripts
-- Existing database: university_registration
--
-- Dataset sizes:
-- Original: 3 students, 3 courses, 3 registrations
-- Small:    1,000 students, 100 courses, 5,000 registrations
-- Medium:   5,000 students, 250 courses, 25,000 registrations
-- Large:    10,000 students, 500 courses, 50,000 registrations

-- ============================================================
-- 1. ROW COUNTS
-- ============================================================

SELECT 'original_students' AS table_name, COUNT(*) AS total FROM public.students
UNION ALL
SELECT 'original_courses', COUNT(*) FROM public.courses
UNION ALL
SELECT 'original_registrations', COUNT(*) FROM public.registrations
UNION ALL
SELECT 'small_students', COUNT(*) FROM public.small_students
UNION ALL
SELECT 'small_courses', COUNT(*) FROM public.small_courses
UNION ALL
SELECT 'small_registrations', COUNT(*) FROM public.small_registrations
UNION ALL
SELECT 'medium_students', COUNT(*) FROM public.medium_students
UNION ALL
SELECT 'medium_courses', COUNT(*) FROM public.medium_courses
UNION ALL
SELECT 'medium_registrations', COUNT(*) FROM public.medium_registrations
UNION ALL
SELECT 'large_students', COUNT(*) FROM public.large_students
UNION ALL
SELECT 'large_courses', COUNT(*) FROM public.large_courses
UNION ALL
SELECT 'large_registrations', COUNT(*) FROM public.large_registrations;

-- Expected counts:
-- Original: 3 / 3 / 3
-- Small:    1,000 / 100 / 5,000
-- Medium:   5,000 / 250 / 25,000
-- Large:    10,000 / 500 / 50,000
--
-- Compare the returned totals with the expected counts above.

-- ============================================================
-- 2. MISSING RELATIONSHIP CHECKS
-- Expected result for each query: 0
-- ============================================================

-- Original
SELECT COUNT(*) AS original_missing_relationships
FROM public.registrations r
LEFT JOIN public.students s ON r.student_id = s.student_id
LEFT JOIN public.courses c ON r.course_id = c.course_id
WHERE s.student_id IS NULL OR c.course_id IS NULL;

-- Small
SELECT COUNT(*) AS small_missing_relationships
FROM public.small_registrations r
LEFT JOIN public.small_students s ON r.student_id = s.student_id
LEFT JOIN public.small_courses c ON r.course_id = c.course_id
WHERE s.student_id IS NULL OR c.course_id IS NULL;

-- Medium
SELECT COUNT(*) AS medium_missing_relationships
FROM public.medium_registrations r
LEFT JOIN public.medium_students s ON r.student_id = s.student_id
LEFT JOIN public.medium_courses c ON r.course_id = c.course_id
WHERE s.student_id IS NULL OR c.course_id IS NULL;

-- Large
SELECT COUNT(*) AS large_missing_relationships
FROM public.large_registrations r
LEFT JOIN public.large_students s ON r.student_id = s.student_id
LEFT JOIN public.large_courses c ON r.course_id = c.course_id
WHERE s.student_id IS NULL OR c.course_id IS NULL;

-- ============================================================
-- 3. DUPLICATE STUDENT-COURSE COMBINATION CHECKS
-- Expected result for each query: 0
-- ============================================================

-- Original
SELECT COUNT(*) AS original_duplicate_combinations
FROM (
    SELECT student_id, course_id
    FROM public.registrations
    GROUP BY student_id, course_id
    HAVING COUNT(*) > 1
) AS duplicates;

-- Small
SELECT COUNT(*) AS small_duplicate_combinations
FROM (
    SELECT student_id, course_id
    FROM public.small_registrations
    GROUP BY student_id, course_id
    HAVING COUNT(*) > 1
) AS duplicates;

-- Medium
SELECT COUNT(*) AS medium_duplicate_combinations
FROM (
    SELECT student_id, course_id
    FROM public.medium_registrations
    GROUP BY student_id, course_id
    HAVING COUNT(*) > 1
) AS duplicates;

-- Large
SELECT COUNT(*) AS large_duplicate_combinations
FROM (
    SELECT student_id, course_id
    FROM public.large_registrations
    GROUP BY student_id, course_id
    HAVING COUNT(*) > 1
) AS duplicates;

-- ============================================================
-- 4. TABLE STRUCTURE / CONSTRAINT REVIEW
-- ============================================================
-- Run these statements to inspect the actual table definitions.
-- Confirm each output contains the expected PRIMARY KEY, FOREIGN KEY, UNIQUE INDEX, and NOT NULL declarations.

SHOW CREATE TABLE public.students;
SHOW CREATE TABLE public.courses;
SHOW CREATE TABLE public.registrations;

SHOW CREATE TABLE public.small_students;
SHOW CREATE TABLE public.small_courses;
SHOW CREATE TABLE public.small_registrations;

SHOW CREATE TABLE public.medium_students;
SHOW CREATE TABLE public.medium_courses;
SHOW CREATE TABLE public.medium_registrations;

SHOW CREATE TABLE public.large_students;
SHOW CREATE TABLE public.large_courses;
SHOW CREATE TABLE public.large_registrations;
