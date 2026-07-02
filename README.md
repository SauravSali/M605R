ClassSpace 🎓 — Database Schema
Name - SAURAV PRAMOD SALI
ID - GH1050149
Module - Advanced Databsed Management Retake - M605R
Note - This is the same databse schema which was used in Advanced Programming Project.

ClassSpace is a relational database designed for a smart classroom management system. It models how coordinators, teachers, and students interact across classes, timetables, lectures, attendance, feedback, and academic integrity tracking.

This repository contains the MySQL schema (classpace_new) built as part of a university Database Management Systems (DBMS) project.


📌 Overview

ClassSpace supports a full academic workflow:


Role-based access — Coordinator, Teacher, and Student roles
Class & timetable management — classes, weekly schedules, and subject-wise slots
Lecture lifecycle — scheduled → completed / cancelled, tied to the timetable
Dual attendance system — students self-declare attendance, which is cross-checked against actual (teacher-marked) attendance
Integrity scoring — tracks how often a student's declared attendance matches reality, and rewards honesty with "coins"
Feedback system — anonymized lecture feedback with star ratings and hashed student identifiers
Announcements & notes — class-wide announcements and lecture notes (Drive links)
Secure auth support — password hashing and OTP-based password reset



🗂️ Schema (Entity Overview)

TablePurposerolesDefines user roles: Coordinator, Teacher, StudentusersCore user accounts (auth, contact info, role)studentsStudent-specific details (PRN, branch, division)teachersTeacher-specific details (assigned classes/divisions, subject)classesClass/section definitions with a shareable join linkclass_membersMaps users to classes with role & approval statustimetableWeekly recurring schedule per class (day, time, subject, teacher)lecturesActual lecture instances generated from the timetableattendance_declaredStudent self-declared attendance per lectureattendance_actualTeacher-marked (ground truth) attendance per lectureintegrity_scoreAggregated honesty metrics + coin rewards per studentfeedbackAnonymous, hashed lecture feedback with star ratingsnotesLecture notes/materials shared via Drive linksannouncementsClass-wide or lecture-cancellation announcementspassword_reset_otpOTP records for password reset flow


🔗 Key Relationships


users.role_id → roles.role_id
students.student_id → users.user_id (1:1 extension)
classes.created_by → users.user_id
class_members.class_id → classes.class_id, class_members.user_id → users.user_id
timetable.class_id → classes.class_id, timetable.teacher_id → users.user_id
lectures.timetable_id → timetable.timetable_id
attendance_declared / attendance_actual → lectures.lecture_id + users.user_id
feedback.lecture_id → lectures.lecture_id
notes.lecture_id → lectures.lecture_id
announcements.class_id → classes.class_id


The schema enforces referential integrity throughout via foreign keys, and uses UNIQUE constraints (e.g. one attendance record per student per lecture, one class link per class) to prevent duplicate/conflicting data.


⚙️ Tech Details


Engine: InnoDB
Charset/Collation: utf8mb4 / utf8mb4_general_ci
RDBMS: MySQL 8.0
Includes CHECK constraints (e.g. star_rating BETWEEN 1 AND 5) and ENUM types for controlled vocabularies (PRESENT/ABSENT, YES/NO, MON–SAT, SCHEDULED/CANCELLED/COMPLETED).



🚀 Getting Started

Prerequisites


MySQL Server 8.0+ (or MariaDB equivalent)
A MySQL client (Workbench, DBeaver, CLI, etc.)


Setup


Create a database:


sql   CREATE DATABASE classpace_new;
   USE classpace_new;


Import the schema:


bash   mysql -u <username> -p classpace_new < mclassSpace.sql


Verify the tables:


sql   SHOW TABLES;


⚠️ Note: The dump in this repo may include sample/seed data used during development and testing. Replace or scrub this before using it as a public template, especially any user credentials or contact info.




📖 Project Context

This schema was built as part of a university Database Management Systems course project, focused on applying normalization, relational integrity, and real-world workflow modeling (attendance, feedback, and academic-integrity tracking) to a practical application.
