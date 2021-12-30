create table if not exists bds.user (
	"user_id"		bigserial		primary key not null,
	"given_name"	varchar(20)	not null,
	"family_name"	varchar(20)	not null,
	"date_of_birth"	date		not null,
	"status"		varchar(20) not null,
	"sex"			varchar(10),
	"password"		varchar(255),
    "nickname"		varchar(20),
    "email"			varchar(255)
);

create table if not exists bds.address (
	"address_id"	bigserial		primary key not null,
	"city"			varchar(45) not null,
	"street"		varchar(45) not null,
	"number"		varchar(45),
	"zip"			varchar(45)
);

create table if not exists bds.salary (
	"salary_id"		bigserial		primary key not null,
	"salary_type"	varchar(45)	not null,
	"salary_amount"	integer		not null
);

create table if not exists bds.scholarship (
	"scholarship_id"	bigserial		primary key not null,
	"scholarship_type"	varchar(45) not null
);

create table if not exists bds.user_has_salary (
	"user_id"		integer		not null,
	"salary_id"		integer		not null,
	foreign key	("user_id")		references bds.user,
	foreign key ("salary_id")	references bds.salary
);

create table if not exists bds.course (
	"course_id"			bigserial		primary key not null,
	"course_name"		varchar(45)	not null,
	"course_location"	varchar(45)	not null,
	"course_duration"	integer 	not null
);

create table if not exists bds.course_grade (
	"course_grade_id"	bigserial		primary key not null,
	"test_grade"		varchar(8) 	not null,
	"lab_grade"			varchar(8)	not null,
	"final_grade"		varchar(8)	not null
);


create table if not exists bds.role (
	"role_id"			serial		primary key not null,
	"role_type"			varchar(45)	not null
);

create table if not exists bds.user_has_role (
	"user_id"		integer		not null,
	"role_id"		integer		not null,
	"start_date"	date		not null,
	"end_date"		date,
	foreign key ("user_id")		references bds.user,
	foreign key ("role_id")		references bds.role
);

create table if not exists bds.user_has_course (
	"user_id"	integer			not null,
	"course_id" integer			not null,
	"user_feedback"	varchar(150),
	foreign key ("user_id")		references bds.user,
	foreign key ("course_id")	references bds.course
);

create table if not exists bds.user_has_grade (
	"user_id"			integer	not null,
	"course_grade_id"	integer	not null,
	"timestamp"			date not null,
	foreign key ("user_id")			references bds.user,
	foreign key ("course_grade_id")	references bds.course_grade
);

create table if not exists bds.user_has_scholarship (
	"user_id"			integer	not null,
	"scholarship_id"	integer,
	foreign key	("user_id")			references bds.user,
	foreign key ("scholarship_id")	references bds.scholarship
);

create table if not exists bds.user_has_address (
	"user_id"		integer 	not null,
	"address_id"	integer		not null,
	"address_type"	varchar(45)	not null,
	foreign key ("user_id")		references bds.user,
	foreign key ("address_id")	references bds.address
);

create table if not exists bds.enrolment (
	"enrolment_id"	bigserial		primary key not null,
	"start_date"	date		not null,
	"end_date"		date,
	"user_id"		integer	not null,
	foreign key ("user_id")		references bds.user
);

create table if not exists bds.contact (
	"contact_id"	bigserial		primary key not null,
	"faculty_email"	varchar(45)	not null,
	"primary_phone"	varchar(45)	not null,
	"user_id"		integer		not null,
	foreign key ("user_id")	references bds.user
);
