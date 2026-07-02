-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: classpace_new
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_general_ci,
  `created_by` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `division` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `created_by` (`created_by`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `announcements_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (1,'Early Break','due to rain',13,2,'2026-02-01 14:33:09','A'),(2,'asad','adas',13,2,'2026-02-01 16:35:11','A'),(3,'acd','asdas',13,2,'2026-02-01 17:48:59','A'),(4,'LECTURE CANCELLED: Mathematics','The lecture scheduled for today (2026-02-02) at 09:00 has been cancelled. Reason: ffhvjhjk',12,1,'2026-02-01 20:08:11','A'),(5,'LECTURE CANCELLED: DBMS','The lecture scheduled for today (2026-02-02) at 10:00 has been cancelled. Reason: sorryyyy',12,2,'2026-02-01 21:19:53','A');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_actual`
--

DROP TABLE IF EXISTS `attendance_actual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_actual` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lecture_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `actual_status` enum('PRESENT','ABSENT') COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lecture_id` (`lecture_id`,`student_id`),
  UNIQUE KEY `UK8rahx1636x2ealbmwqhn1fjg7` (`lecture_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `attendance_actual_ibfk_1` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`lecture_id`),
  CONSTRAINT `attendance_actual_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_actual`
--

LOCK TABLES `attendance_actual` WRITE;
/*!40000 ALTER TABLE `attendance_actual` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_actual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_declared`
--

DROP TABLE IF EXISTS `attendance_declared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_declared` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lecture_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `declared_status` enum('YES','NO') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `declared_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lecture_id` (`lecture_id`,`student_id`),
  UNIQUE KEY `UK1p3lll12a1ku2mtdv400rri3w` (`lecture_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `attendance_declared_ibfk_1` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`lecture_id`),
  CONSTRAINT `attendance_declared_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_declared`
--

LOCK TABLES `attendance_declared` WRITE;
/*!40000 ALTER TABLE `attendance_declared` DISABLE KEYS */;
INSERT INTO `attendance_declared` VALUES (1,12,1,'YES','2026-02-01 03:25:02'),(2,14,1,'NO','2026-02-01 19:35:02'),(3,16,11,'YES','2026-02-01 19:38:34');
/*!40000 ALTER TABLE `attendance_declared` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_members`
--

DROP TABLE IF EXISTS `class_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_members` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `role_in_class` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `joined_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_id` (`class_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `class_members_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `class_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_members`
--

LOCK TABLES `class_members` WRITE;
/*!40000 ALTER TABLE `class_members` DISABLE KEYS */;
INSERT INTO `class_members` VALUES (1,2,1,'TEACHER','APPROVED','2026-01-29 14:10:24'),(2,2,5,'STUDENT','APPROVED','2026-01-29 14:10:30'),(4,2,11,'STUDENT','APPROVED','2026-02-01 14:35:56'),(5,2,15,'STUDENT','APPROVED','2026-02-01 14:36:58'),(7,2,17,'STUDENT','APPROVED','2026-02-01 16:37:18'),(8,2,18,'STUDENT','APPROVED','2026-02-01 16:39:07'),(9,1,38,'STUDENT','APPROVED','2026-02-01 18:08:22'),(10,2,39,'STUDENT','APPROVED','2026-02-01 21:44:49');
/*!40000 ALTER TABLE `class_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `class_link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `class_link` (`class_link`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'CSE ','https://classspace.app/class/cse-a-sem5',1,'2026-02-01 17:31:39'),(2,'CSE-A Semester 6','https://classspace.app/class/cse-a-sem6',1,'2026-01-29 01:28:46');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` bigint NOT NULL AUTO_INCREMENT,
  `lecture_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `understand` enum('YES','NO') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `star_rating` int DEFAULT NULL,
  `is_valid` tinyint(1) DEFAULT '1',
  `submitted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `hashed_student_key` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`feedback_id`),
  UNIQUE KEY `lecture_id` (`lecture_id`,`student_id`),
  UNIQUE KEY `uq_feedback_lecture_hash` (`lecture_id`,`hashed_student_key`),
  UNIQUE KEY `UK3eaj6yrqtw98lq66yvy9gjlui` (`lecture_id`,`hashed_student_key`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`lecture_id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `feedback_chk_1` CHECK ((`star_rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,4,NULL,'YES','good lecture',5,1,'2026-01-31 06:27:13','J5p3QQKWiB3dVNdnjpyRY93TlZ90EOEZQriAyyTOpiA='),(2,5,NULL,'NO','Really bad lecture didnt understand at all',1,1,'2026-01-31 07:00:20','p79e9pYNAMdsyq34dRVQ8XCqSGyPUTRTEKKfyLS3hPI='),(3,10,NULL,'YES','sdfsf',4,1,'2026-02-01 02:21:32','zg7I/bgESJdMvzd9it9feL61ZaV55HV6Eiq/YQi7duo='),(4,12,NULL,'NO','asdasd',3,1,'2026-02-01 02:39:51','FZcVYf8PVItaReGFJTv7T2dCbWMZRSSi7r6gr/fLcSU='),(5,11,NULL,'YES','not okay!!',1,1,'2026-02-01 02:54:02','oXVsOUTQR5wzWO1vhaaeSJan3i2swI0IkDvC23v1cuA='),(6,9,NULL,'YES','dasdfsf',3,1,'2026-02-01 06:51:01','z76jWdDXn7jUyNzM4LxDLPgHowmtcXyIqiWs8KPjABs='),(7,13,NULL,'YES','test 1',4,1,'2026-02-01 06:51:01','z76jWdDXn7jUyNzM4LxDLPgHowmtcXyIqiWs8KPjABs='),(8,13,NULL,'NO','test 2',5,1,'2026-02-01 06:51:01','jjhggjhgj'),(9,8,NULL,'NO','sdfsdasad',5,1,'2026-02-01 10:17:01','XdFs9JGwXgvOe1li/LRls70mBvwl5JLqo3Vp8cs9CRk=');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrity_score`
--

DROP TABLE IF EXISTS `integrity_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integrity_score` (
  `student_id` int NOT NULL,
  `total_lectures` int DEFAULT '0',
  `honest_count` int DEFAULT '0',
  `dishonest_count` int DEFAULT '0',
  `integrity_percentage` decimal(5,2) DEFAULT '100.00',
  `coins` int NOT NULL,
  PRIMARY KEY (`student_id`),
  CONSTRAINT `integrity_score_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrity_score`
--

LOCK TABLES `integrity_score` WRITE;
/*!40000 ALTER TABLE `integrity_score` DISABLE KEYS */;
INSERT INTO `integrity_score` VALUES (14,0,0,0,100.00,0),(15,0,0,0,100.00,0),(16,0,0,0,100.00,0),(17,0,0,0,100.00,0),(18,0,0,0,100.00,0),(38,0,0,0,100.00,0),(39,0,0,0,100.00,0);
/*!40000 ALTER TABLE `integrity_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectures`
--

DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lectures` (
  `lecture_id` int NOT NULL AUTO_INCREMENT,
  `timetable_id` int DEFAULT NULL,
  `lecture_date` date DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `status` enum('SCHEDULED','CANCELLED','COMPLETED') COLLATE utf8mb4_general_ci DEFAULT 'SCHEDULED',
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`lecture_id`),
  UNIQUE KEY `uq_lecture_timetable_date` (`timetable_id`,`lecture_date`),
  UNIQUE KEY `uq_timetable_date` (`timetable_id`,`lecture_date`),
  UNIQUE KEY `UK8aefk5epwvfavx066vqe7a33n` (`timetable_id`,`lecture_date`),
  CONSTRAINT `lectures_ibfk_1` FOREIGN KEY (`timetable_id`) REFERENCES `timetable` (`timetable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures`
--

LOCK TABLES `lectures` WRITE;
/*!40000 ALTER TABLE `lectures` DISABLE KEYS */;
INSERT INTO `lectures` VALUES (2,4,'2026-01-29','2026-01-29 04:30:00','2026-01-29 05:30:00','COMPLETED',NULL,'2026-01-29 01:32:10'),(4,4,'2026-01-31',NULL,NULL,'SCHEDULED',NULL,'2026-01-30 22:48:46'),(5,5,'2026-01-31',NULL,NULL,'SCHEDULED',NULL,'2026-01-31 04:48:40'),(8,4,'2026-02-01',NULL,NULL,'SCHEDULED',NULL,'2026-01-31 22:21:42'),(9,5,'2026-02-01',NULL,NULL,'SCHEDULED',NULL,'2026-01-31 22:21:45'),(10,4,'2026-01-26',NULL,NULL,'SCHEDULED',NULL,'2026-02-01 02:21:20'),(11,6,'2026-01-31',NULL,NULL,'SCHEDULED',NULL,'2026-02-01 02:21:54'),(12,5,'2026-01-27',NULL,NULL,'SCHEDULED',NULL,'2026-02-01 02:26:29'),(13,7,'2026-02-01',NULL,NULL,'SCHEDULED',NULL,'2026-02-01 05:12:35'),(14,7,'2026-02-02',NULL,NULL,'CANCELLED','2026-02-01 21:19:53','2026-02-01 18:33:23'),(15,11,'2026-02-02',NULL,NULL,'CANCELLED','2026-02-01 20:08:11','2026-02-01 18:42:53'),(16,5,'2026-02-02',NULL,NULL,'SCHEDULED',NULL,'2026-02-01 19:38:33'),(17,16,'2026-02-02',NULL,NULL,'SCHEDULED',NULL,'2026-02-01 21:17:52'),(18,15,'2026-02-02',NULL,NULL,'SCHEDULED',NULL,'2026-02-01 21:20:39'),(19,18,'2026-02-02',NULL,NULL,'SCHEDULED',NULL,'2026-02-01 21:35:42');
/*!40000 ALTER TABLE `lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` bigint NOT NULL AUTO_INCREMENT,
  `lecture_id` int DEFAULT NULL,
  `uploaded_by` int DEFAULT NULL,
  `drive_link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `version` int DEFAULT '1',
  `uploaded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`note_id`),
  KEY `lecture_id` (`lecture_id`),
  KEY `uploaded_by` (`uploaded_by`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`lecture_id`),
  CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_otp`
--

DROP TABLE IF EXISTS `password_reset_otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_otp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `otp` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `verified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_otp`
--

LOCK TABLES `password_reset_otp` WRITE;
/*!40000 ALTER TABLE `password_reset_otp` DISABLE KEYS */;
INSERT INTO `password_reset_otp` VALUES (10,'sohampatil0715@gmail.com','761090','2026-02-01 14:10:43','2026-02-01 14:15:43',1),(17,'test@gmail.com','833120','2026-02-02 01:34:54','2026-02-02 01:39:54',0);
/*!40000 ALTER TABLE `password_reset_otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'COORDINATOR'),(3,'STUDENT'),(2,'TEACHER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL,
  `prn` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `division` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `prn` (`prn`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'1234',NULL,'A'),(6,'213',NULL,NULL),(10,'100',NULL,NULL),(11,'PRN111',NULL,NULL),(14,'456203',NULL,'A'),(15,'1111',NULL,'A'),(16,'123456',NULL,'A'),(17,'22',NULL,'B'),(18,'121',NULL,'C'),(20,'PRN10001',NULL,'A'),(21,'PRN10002',NULL,'A'),(22,'PRN10003',NULL,'A'),(23,'PRN10004',NULL,'A'),(24,'PRN10005',NULL,'A'),(25,'PRN10006',NULL,'A'),(26,'PRN10007',NULL,'A'),(27,'PRN10008',NULL,'A'),(28,'PRN10009',NULL,'A'),(29,'PRN10010',NULL,'A'),(30,'PRN10011',NULL,'A'),(31,'PRN10012',NULL,'A'),(32,'PRN10013',NULL,'A'),(33,'PRN10014',NULL,'A'),(34,'PRN10015',NULL,'A'),(38,'P234',NULL,'B'),(39,'111',NULL,'AA');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teacher_id` bigint NOT NULL,
  `assigned_classes` varchar(255) DEFAULT NULL,
  `assigned_divisions` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (19,'','','maths'),(35,'','','as'),(36,'','','dasda');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable` (
  `timetable_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL,
  `week_number` int DEFAULT NULL,
  `day` enum('MON','TUE','WED','THU','FRI','SAT') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `teacher_id` int DEFAULT NULL,
  `division` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`timetable_id`),
  UNIQUE KEY `uq_timetable_slot` (`class_id`,`week_number`,`day`,`start_time`,`end_time`,`teacher_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (4,2,1,'MON','10:00:00','11:00:00','DBMS',5,NULL),(5,2,1,'TUE','10:00:00','11:00:00','CPP',5,NULL),(6,2,1,'SAT','12:00:00','15:00:00','OS',5,NULL),(7,2,1,'MON','10:00:00','11:00:00','DBMS',12,'A'),(11,1,1,'MON','09:00:00','10:00:00','Mathematics',12,'A'),(15,1,1,'MON','12:00:00','13:00:00','ssds',35,'A'),(16,2,1,'TUE','10:00:00','11:00:00','ML',19,'A'),(18,2,1,'THU','10:00:00','11:00:00','ssa',35,'A');
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Soham','sohampatil0715@gmail.com','$2a$10$aXQ8krUWNqkL98ekwoM4b.QArD8T7CLgE0kkl9Z/X6EZkMT9nvzRK',3,1,'2026-01-28 20:06:51','1098706544','2013-02-28','hjfktyf'),(5,'Arsh','arshup213@gmail.com','$2a$10$YAaJu03kPPbcnsWoyPt0d.8XzglVMoJb.UyN0kyAUA2SVHRJ4RW.i',2,1,'2026-01-28 22:32:51',NULL,NULL,NULL),(6,'Arsh2','arshshirsekar213@gmail.com','$2a$10$mZ0QusUyUNljDMRdtc8OPuBDjShhiULlifH0i96B9Mh7W3.bo/X2m',3,1,'2026-01-31 05:59:13','334343434','2016-02-02',NULL),(10,'Abhishek','gunjalabhishek95@gmail.com','$2a$10$Vzv3fg1OQohWvUbDyr2PHOtQoQmw61Cl5M/aF9tuXeGVQWYvJ8BXC',3,1,'2026-01-31 21:08:51','6969696969','2005-02-08',NULL),(11,'test','sohampatil@gmail.com','$2a$10$AqY3uALfQlxuzY216oiRLO74B1ZMWRkAX6X5qeivxUUfzG1E8Zfvm',3,1,'2026-02-01 01:25:06','3234211114','2002-10-22','fsdsdfsfd'),(12,'Teacher One','teacher1@classspace.com','$2a$10$iaori3lrBQsUJmx4DleLquO9Q/0wA6zqFFwfwqUmS4lHuotmcNLS.',2,1,'2026-02-01 05:11:40',NULL,NULL,NULL),(13,'Admin Coordinator','coordinator@classspace.com','$2a$10$sNXZyDNWp4vU1UeeVxmkMe9IQfyzQ6cmlh0sukOcqwWfp6nYnKAIG',1,1,'2026-02-01 05:55:54','9999999999','1998-01-01','ClassSpace Admin Office'),(14,'test123','johnbhai@gmail.com','$2a$10$XfoBp7fBBJYD15F5pS6MguL9t7.SEJkOOlR28gqKnTm5NcRGHnO2a',3,0,'2026-02-01 14:32:06','82610458','2026-02-24',NULL),(15,'asdas','ada@gmail.com','$2a$10$8sDO5A/2R8LLa64oKiC3teSH03uCG5qwYA4CTXTHeCkiOkmIVHiS2',3,0,'2026-02-01 14:36:58','sdas',NULL,NULL),(16,'asdasd','abc@gmail.com','$2a$10$x.Wx2YP7lq1pa/FK2R7f/eQiv8H4UdA9N.9fcsLXmAnHsHECqO6w2',3,0,'2026-02-01 14:52:43','123456','2026-02-25',NULL),(17,'22std','22std@gmail.com','$2a$10$v1h4Hsakrd7AW.lQyQhgR.JaPPnClG.xTfpzasLZUzO5sjAzjZSTi',3,1,'2026-02-01 16:37:18','1112223334','2001-06-11',NULL),(18,'asa','asa@123','$2a$10$5OLFFJGMn0PL/.0YjpJPPOux2QhUtMScR90l6qsuKxIDiV4fOgP0K',3,1,'2026-02-01 16:39:07','1424242142','2019-06-01',NULL),(19,'abc','abasdsdasdc@gmail.com','$2a$10$/dMUz7y0JzDZa8qItzaAyOUVyYIjWXrVW.S6EjPePb5V4PqGImYu.',2,1,'2026-02-01 17:26:45',NULL,NULL,NULL),(20,'Amit Sharma','amit.sharma@example.com','$2a$10$l9Iu.UwLijjy/EpdMP/.j.XdqmkraiFSXB3NjnPIgUhwYy6vdYWtW',3,1,'2026-02-01 17:28:46','9876543210','2026-02-01','Pune'),(21,'Rahul Patil','rahul.patil@example.com','$2a$10$Yg82A9E0LGAAB9.RKODzfuq6drzcmL5uIfoMrJMbix6pv/j.3qMka',3,1,'2026-02-01 17:28:47','9876543211','2026-02-01','Mumbai'),(22,'Sneha Kulkarni','sneha.k@example.com','$2a$10$AnBJWDKWpxMaE55sh0HNVuO0fQrg0UfMy4tLvB.gSUMYRt9xRODAe',3,1,'2026-02-01 17:28:47','9876543212','2026-02-01','Nashik'),(23,'Priya Deshmukh','priya.d@example.com','$2a$10$oBvDM83fnUZH61crIyDxI.XbLxX3yIk9ouXjmAExREyKpfy5grdGu',3,1,'2026-02-01 17:28:47','9876543213','2026-02-01','Nagpur'),(24,'Rohit Joshi','rohit.j@example.com','$2a$10$oLbKIuLxlLyZj9s4ZHTOoeihusC.eozP8Wm5/ZZqyQCKal3Indlyq',3,1,'2026-02-01 17:28:47','9876543214','2026-02-01','Aurangabad'),(25,'Neha Chavan','neha.c@example.com','$2a$10$FO9U/ZTNap4P8.nwcpCSPuQKGUJ6REzOIvZ0rzEyGjzUpZlQq5j2G',3,1,'2026-02-01 17:28:47','9876543215','2026-02-01','Kolhapur'),(26,'Kunal More','kunal.m@example.com','$2a$10$BItZRkvVKMcRQgYauWV5mOd1oQ.h9edgwyQkzK7UgWsvwnZqeVjd.',3,1,'2026-02-01 17:28:47','9876543216','2026-02-01','Satara'),(27,'Pooja Pawar','pooja.p@example.com','$2a$10$rA6rCEn.7Cm83kbV3HEay.KsGAwPkBARFGVgkg6JG9Y8Tvgl0k9MO',3,1,'2026-02-01 17:28:47','9876543217','2026-02-01','Sangli'),(28,'Aditya Jadhav','aditya.j@example.com','$2a$10$089i6ckvj9Ck9Ar7z73.Fu3XHGeT8phZw.nbN6EZ6sNoEWe9y0dxG',3,1,'2026-02-01 17:28:47','9876543218','2026-02-01','Solapur'),(29,'Anjali Bhosale','anjali.b@example.com','$2a$10$SM1PWHmXjhXKXVHbnVjwi.oE.SmC7GKrId1z6YeXGhbq7xYwLFCLi',3,1,'2026-02-01 17:28:47','9876543219','2026-02-01','Latur'),(30,'Sanket Kale','sanket.k@example.com','$2a$10$SZEjwv2GtYrTUso.N44U5ejRUnp29PZkEuGDEe./AJEbTP8N6t1da',3,1,'2026-02-01 17:28:47','9876543220','2026-02-01','Beed'),(31,'Rutuja Shinde','rutuja.s@example.com','$2a$10$bhWrAe3sJt1bGplZZ/oO2OvuZlw9Zjq/UqP/KSPs117TVnfCIkyaG',3,1,'2026-02-01 17:28:47','9876543221','2026-02-01','Ahmednagar'),(32,'Omkar Patil','omkar.p@example.com','$2a$10$sWE2e0F0yVeJ1B8NsKdlM.qApEMPasH9Q9gyR4ufx9oh7p0LKJ9oG',3,1,'2026-02-01 17:28:47','9876543222','2026-02-01','Jalgaon'),(33,'Shubham More','shubham.m@example.com','$2a$10$FInJLIsQt2tUWTsMH2GRjOhmrRVNDyxDanmUGDNbBoBOVFyZ8mvgi',3,1,'2026-02-01 17:28:47','9876543223','2026-02-01','Dhule'),(34,'Kavita Gaikwad','kavita.g@example.com','$2a$10$MI5JLEoWja8qKjeV9IqKauG2UFWBn8mV0GEkaqOAliolVQn72YqrO',3,1,'2026-02-01 17:28:48','9876543224','2026-02-01','Nanded'),(35,'sda','as@gmail.com','$2a$10$.UUM6oN0tRu1eq/YVDC7KuXrjLHMnB1WpRM5Q.d70adGmP5Cp5CzG',2,1,'2026-02-01 17:47:57',NULL,NULL,NULL),(36,'ssdds','asds@gmail.com','$2a$10$QhoBVbq6R8jvftuxZNZPy.iJiWrdg7RsFmxzGJpucxiluGElJfXMu',2,1,'2026-02-01 17:48:17',NULL,NULL,NULL),(38,'saca','saasds@gmail.com','$2a$10$fEd2b5Iqhu3N1ChC4vN9keSqTwW/eGfpUNe5BQJ5hwDJZg4rzIMy.',3,1,'2026-02-01 18:08:22','9814513210','2026-02-01','asd'),(39,'nytt','nyttt@gmail.com','$2a$10$CqMAa0RT183jMpVEdcMgaelLEEaj3mqO729A.WI7o9818k68ixYxW',3,1,'2026-02-01 21:44:49','1232312312','2019-02-02',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-02  3:16:38
