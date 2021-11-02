create table if not exists "user" (
	"user_id"		serial		primary key not null,
	"name"			varchar(20)	not null,
	"surname"		varchar(20)	not null,
	"date_of_birth"	date		not null,
	"status"		varchar(20) not null,
	"sex"			varchar(10),
	"password"		varchar(45)
);

create table if not exists "address" (
	"address_id"	serial		primary key not null,
	"city"			varchar(45) not null,
	"street"		varchar(45) not null,
	"number"		varchar(45),
	"zip"			varchar(45)
);

create table if not exists "enrolment" (
	"enrolment_id"	serial		primary key not null,
	"start_date"	date		not null,
	"end_date"		date,
	"user_id"		integer	not null,
	foreign key ("user_id")		references "user"
);

create table if not exists "contact" (
	"contact_id"	serial		primary key not null,
	"faculty_email"	varchar(45)	not null,
	"primary_phone"	varchar(45)	not null,
	"user_id"		integer		not null,
	foreign key ("user_id")	references "user"
);

create table if not exists "salary" (
	"salary_id"		serial		primary key not null,
	"salary_type"	varchar(45)	not null,
	"salary_amount"	integer		not null
);

create table if not exists "scholarship" (
	"scholarship_id"	serial		primary key not null,
	"scholarship_type"	varchar(45) not null
);

create table if not exists "user_has_salary" (
	"user_id"		integer		not null,
	"salary_id"		integer		not null,
	foreign key	("user_id")		references "user",
	foreign key ("salary_id")	references "salary"
);

create table if not exists "course_grade" (
	"course_grade_id"	serial		primary key not null,
	"test_grade"		varchar(8) 	not null,
	"lab_grade"			varchar(8)	not null,
	"final_grade"		varchar(8)	not null
);

create table if not exists "course" (
	"course_id"			serial		primary key not null,
	"course_name"		varchar(45)	not null,
	"course_location"	varchar(45)	not null,
	"course_duration"	integer 	not null
);

create table if not exists "role" (
	"role_id"			serial		primary key not null,
	"role_type"			varchar(45)	not null
);

create table if not exists "user_has_role" (
	"user_id"		integer		not null,
	"role_id"		integer		not null,
	"start_date"	date		not null,
	"end_date"		date,
	foreign key ("user_id")		references "user",
	foreign key ("role_id")		references "role"
);

create table if not exists "user_has_course" (
	"user_id"	integer			not null,
	"course_id" integer			not null,
	"user_feedback"	varchar(150),
	foreign key ("user_id")		references "user",
	foreign key ("course_id")	references "course"
);

create table if not exists "user_has_grade" (
	"user_id"			integer	not null,
	"course_grade_id"	integer	not null,
	"timestamp"			date not null,
	foreign key ("user_id")			references "user",
	foreign key ("course_grade_id")	references "course_grade"
);

create table if not exists "user_has_scholarship" (
	"user_id"			integer	not null,
	"scholarship_id"	integer,
	foreign key	("user_id")			references "user",
	foreign key ("scholarship_id")	references "scholarship"
);

create table if not exists "user_has_address" (
	"user_id"		integer 	not null,
	"address_id"	integer		not null,
	"address_type"	varchar(45)	not null,
	foreign key ("user_id")		references "user",
	foreign key ("address_id")	references "address"
);
