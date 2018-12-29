CREATE TABLE student (
    id int unsigned NOT NULL AUTO_INCREMENT,
    creation_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name varchar(31) NOT NULL,
    mobile char(10) NOT NULL,
    password varchar(255) NOT NULL,
    photo varchar(255) DEFAULT 'student.png',
    active boolean DEFAULT "0",
    batch char(6),
    CONSTRAINT unique_mobile UNIQUE(mobile),
    CONSTRAINT pk_student PRIMARY KEY(id)
);

CREATE TABLE fee_status(
    id int unsigned NOT NULL AUTO_INCREMENT,
    creation_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    stu_id int unsigned NOT NULL,
    jan boolean DEFAULT "0",
    feb boolean DEFAULT "0",
    mar boolean DEFAULT "0",
    apr boolean DEFAULT "0",
    may boolean DEFAULT "0",
    jun boolean DEFAULT "0",
    jul boolean DEFAULT "0",
    aug boolean DEFAULT "0",
    sep boolean DEFAULT "0",
    oct boolean DEFAULT "0",
    nov boolean DEFAULT "0",
    decem boolean DEFAULT "0",
    CONSTRAINT pk_fee_status PRIMARY KEY(id),
    CONSTRAINT `fk_stu_id_fee` FOREIGN KEY (stu_id) REFERENCES student (id)
);

CREATE TABLE course(
    id int unsigned NOT NULL AUTO_INCREMENT,
    creation_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name varchar(20) NOT NULL,
    CONSTRAINT pk_course PRIMARY KEY (id)
);

CREATE TABLE enrollment (
    id int unsigned NOT NULL AUTO_INCREMENT,
    creation_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    course_id int unsigned NOT NULL,
    stu_id int unsigned NOT NULL,
    batch char(6),
    CONSTRAINT fk_course_id_enrollment FOREIGN KEY(course_id) REFERENCES course(id),
    CONSTRAINT fk_stu_id_enrollment FOREIGN KEY(stu_id) REFERENCES student(id),
    CONSTRAINT pk_enrollment PRIMARY KEY(id)
);

CREATE TABLE lecture(
    id int unsigned NOT NULL AUTO_INCREMENT,
    creation_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lecture_date date NOT NULL,
    batch char(6),
    course_id int unsigned NOT NULL,
    CONSTRAINT fk_course_id_lecture FOREIGN KEY(course_id) REFERENCES course(id),
    CONSTRAINT pk_lecture PRIMARY KEY(id)
);

NOTE: use DATE('yyyy-mm-dd') while inserting date in lecture table

CREATE table attendance(
    id int unsigned NOT NULL AUTO_INCREMENT,
    creation_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lecture_id int unsigned NOT NULL,
    stu_id int unsigned NOT NULL,
    present boolean NOT NULL,
    CONSTRAINT fk_lecture_id_attendance FOREIGN KEY(lecture_id) REFERENCES lecture(id),
    CONSTRAINT fk_stu_id_attendance FOREIGN KEY(stu_id) REFERENCES student(id),
    CONSTRAINT pk_attendance PRIMARY KEY(id)
);

CREATE TABLE test(
    id int unsigned NOT NULL AUTO_INCREMENT,
    creation_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    test_date date NOT NULL,
    course_id int unsigned NOT NULL,
    batch char(6),
    max_marks int(4),
    CONSTRAINT fk_course_id_test FOREIGN KEY(course_id) REFERENCES course(id),
    CONSTRAINT pk_test PRIMARY KEY(id)
);

CREATE TABLE test_result(
    id int unsigned NOT NULL AUTO_INCREMENT,
    creation_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    test_id int unsigned NOT NULL,
    stu_id int unsigned NOT NULL,
    marks_obtained int(4) unsigned NOT NULL CHECK (marks_obtained<=test(max_marks)),
    CONSTRAINT fk_test_id_test_result FOREIGN KEY(test_id) REFERENCES test(id),
    CONSTRAINT fk_stu_id_test_result FOREIGN KEY(stu_id) REFERENCES student(id),
    CONSTRAINT pk_test_result PRIMARY KEY(id)
);

CREATE TABLE parent(
    id int unsigned NOT NULL AUTO_INCREMENT,
    creation_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    stu_id int unsigned NOT NULL,
    mobile char(10) NOT NULL,
    password varchar(255) NOT NULL,
    CONSTRAINT fk_stu_id_parent FOREIGN KEY(stu_id) REFERENCES student(id),
    CONSTRAINT pk_parent PRIMARY KEY(id)
);