CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `date_of_birth` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(10) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
;


CREATE TABLE IF NOT EXISTS `mydb`.`enrolment` (
  `enrolment_id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL,
  PRIMARY KEY (`enrolment_id`),
  CONSTRAINT `user_id`
    FOREIGN KEY (`enrolment_id`)
    REFERENCES `mydb`.`user` (`user_id`)
);


CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
;


CREATE TABLE IF NOT EXISTS `mydb`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `number` VARCHAR(45) NULL,
  `zip` VARCHAR(45) NULL,
  PRIMARY KEY (`address_id`))
;


CREATE TABLE IF NOT EXISTS `mydb`.`contact` (
  `contact_id` INT NOT NULL AUTO_INCREMENT,
  `faculty_email` VARCHAR(45) NOT NULL,
  `primary_phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`contact_id`),
  CONSTRAINT `user_id`
    FOREIGN KEY (`contact_id`)
    REFERENCES `mydb`.`user` (`user_id`)
);


CREATE TABLE IF NOT EXISTS `mydb`.`user_has_address` (
  `user_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `address_type` VARCHAR(45) NOT NULL,
  INDEX `address_id_idx` (`address_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`user_id`, `address_id`),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`),
  CONSTRAINT `address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `mydb`.`address` (`address_id`)
);


CREATE TABLE IF NOT EXISTS `mydb`.`user_has_role` (
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `role_id_idx` (`role_id` ASC) VISIBLE,
  PRIMARY KEY (`user_id`, `role_id`),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`),
  CONSTRAINT `role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `mydb`.`role` (`role_id`)
);


CREATE TABLE IF NOT EXISTS `mydb`.`scholarship` (
  `scholarship_id` INT NOT NULL,
  `scholarship_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`scholarship_id`))
;


CREATE TABLE IF NOT EXISTS `mydb`.`user_has_scholarship` (
  `user_id` INT NULL,
  `scholarship_id` INT GENERATED ALWAYS AS () VIRTUAL,
  `expiration_date` DATE NULL,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `scholarship_id_idx` (`scholarship_id` ASC) VISIBLE,
  PRIMARY KEY (`scholarship_id`),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`),
  CONSTRAINT `scholarship_id`
    FOREIGN KEY (`scholarship_id`)
    REFERENCES `mydb`.`scholarship` (`scholarship_id`)
);


CREATE TABLE IF NOT EXISTS `mydb`.`course` (
  `course_id` INT NOT NULL,
  `course_name` VARCHAR(45) NOT NULL,
  `course_location` VARCHAR(45) NOT NULL,
  `course_duration` INT NOT NULL,
  PRIMARY KEY (`course_id`))
;


CREATE TABLE IF NOT EXISTS `mydb`.`user_has_course` (
  `user_id` INT NULL,
  `course_id` INT NOT NULL,
  `user_feedback` VARCHAR(45) NULL,
  PRIMARY KEY (`course_id`),
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`),
  CONSTRAINT `course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`course` (`course_id`)
);


CREATE TABLE IF NOT EXISTS `mydb`.`course_grade` (
  `course_grade_id` INT NOT NULL,
  `test_grade` VARCHAR(10) NOT NULL,
  `lab_grade` VARCHAR(10) NOT NULL,
  `final_grade` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`course_grade_id`))
;

CREATE TABLE IF NOT EXISTS `mydb`.`user_has_grade` (
  `user_id` INT NULL,
  `course_grade_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `course_grade_id`),
  INDEX `course_grade_id_idx` (`course_grade_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`),
  CONSTRAINT `course_grade_id`
    FOREIGN KEY (`course_grade_id`)
    REFERENCES `mydb`.`course_grade` (`course_grade_id`)
);

CREATE TABLE IF NOT EXISTS `mydb`.`salary` (
  `salary_id` INT NOT NULL,
  `salary_type` VARCHAR(45) NOT NULL,
  `salary_amount` INT NOT NULL,
  PRIMARY KEY (`salary_id`))
;

CREATE TABLE IF NOT EXISTS `mydb`.`user_has_salary` (
  `user_id` INT NULL,
  `salary_id` INT NOT NULL,
  `timestamp` DATE NULL,
  PRIMARY KEY (`salary_id`),
  INDEX `salary_id_idx` (`salary_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
  CONSTRAINT `salary_id`
    FOREIGN KEY (`salary_id`)
    REFERENCES `mydb`.`salary` (`salary_id`)
);
