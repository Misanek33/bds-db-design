BEGIN;


CREATE TABLE IF NOT EXISTS public.address
(
    address_id integer NOT NULL,
    city character varying(45) NOT NULL,
    street character varying(45) NOT NULL,
    "number" character varying(45),
    zip character varying(45),
    PRIMARY KEY (address_id)
);

CREATE TABLE IF NOT EXISTS public.contact
(
    contact_id integer NOT NULL,
    faculty_email character varying(45) NOT NULL,
    primary_phone character varying(45) NOT NULL,
    PRIMARY KEY (contact_id)
);

CREATE TABLE IF NOT EXISTS public.course
(
    course_id integer NOT NULL,
    course_name character varying(45) NOT NULL,
    course_location character varying(45) NOT NULL,
    course_duration integer NOT NULL,
    PRIMARY KEY (course_id)
);

CREATE TABLE IF NOT EXISTS public.course_grade
(
    course_grade_id integer NOT NULL,
    test_grade character varying(8) NOT NULL,
    lab_grade character varying(8) NOT NULL,
    final_grade character varying(8) NOT NULL,
    PRIMARY KEY (course_grade_id)
);

CREATE TABLE IF NOT EXISTS public.enrolment
(
    enrolment_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date,
    user_id integer NOT NULL,
    PRIMARY KEY (enrolment_id)
);

CREATE TABLE IF NOT EXISTS public.role
(
    role_id integer NOT NULL,
    role_type character varying(45) NOT NULL,
    PRIMARY KEY (role_id)
);

CREATE TABLE IF NOT EXISTS public.salary
(
    salary_id integer NOT NULL,
    salary_type character varying(45) NOT NULL,
    salary_amount integer NOT NULL,
    PRIMARY KEY (salary_id)
);

CREATE TABLE IF NOT EXISTS public.scholarship
(
    scholarship_id integer NOT NULL,
    scholarship_type character varying(45) NOT NULL,
    PRIMARY KEY (scholarship_id)
);

CREATE TABLE IF NOT EXISTS public."user"
(
    user_id integer NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    date_of_birth date NOT NULL,
    status character varying(20) NOT NULL,
    sex character varying(10),
    password character varying(45),
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS public.user_has_address
(
    user_id integer NOT NULL,
    address_id integer NOT NULL,
    address_type character varying(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.user_has_course
(
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    user_feedback character varying(45)
);

CREATE TABLE IF NOT EXISTS public.user_has_grade
(
    user_id integer NOT NULL,
    course_grade_id integer NOT NULL,
    "timestamp" date NOT NULL
);

CREATE TABLE IF NOT EXISTS public.user_has_role
(
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date
);

CREATE TABLE IF NOT EXISTS public.user_has_salary
(
    user_id integer NOT NULL,
    salary_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.user_has_scholarship
(
    user_id integer NOT NULL,
    scholarship_id integer
);