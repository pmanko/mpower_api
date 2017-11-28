#
# Copy createdb.sql.example to createdb.sql
# then uncomment then set database name and username to create you need databases
#
# example: .env MYSQL_USER=appuser and need db name is myshop_db
#
#    CREATE DATABASE IF NOT EXISTS `myshop_db` ;
#    GRANT ALL ON `myshop_db`.* TO 'appuser'@'%' ;
#
#
# this sql script will auto run when the mysql container starts and the $DATA_SAVE_PATH/mysql not found.
#
# if your $DATA_SAVE_PATH/mysql exists and you do not want to delete it, you can run by manual execution:
#
#     docker-compose exec mysql bash
#     mysql -u root -p < /docker-entrypoint-initdb.d/createdb.sql
#

CREATE DATABASE IF NOT EXISTS `mpower_api`;
GRANT ALL ON `mpower_api`.* TO 'mpower'@'%' ;

FLUSH PRIVILEGES

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/* Initial Subset of Tables: Clinics, Sites, Patients, Users*/
DROP TABLE IF EXISTS `clinics`;
CREATE TABLE IF NOT EXISTS `clinics` (
`id` int(10) unsigned NOT NULL,
  `site_id` int(10) unsigned NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `friendly_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `support_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `irb_contact` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `support_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `support_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_status_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `one_usual_care_session` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'If true, after the 1st survey session the patient is either moved to "usual care" or "off-project"'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `clinics`
 ADD PRIMARY KEY (`id`), ADD KEY `site_id` (`site_id`);

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
`id` int(11) NOT NULL,
  `MRN` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `test_flag` tinyint(1) NOT NULL,
  `phone1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mailing_address` text COLLATE utf8_unicode_ci,
  `study_participation_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if they requested to learn more about the study',
  `user_type` enum('Home/Independent','Clinic/Assisted') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'used in randomization algorithm; should not be null if consent_status=consented',
  `consent_status` enum('usual care','elements of consent','pre-consent','consented','declined','ineligible','off-project') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'usual care' COMMENT 'consented indicates that the patient is a participant',
  `consent_date` date DEFAULT NULL,
  `consenter_id` int(11) DEFAULT NULL COMMENT 'foreign key into users table',
  `consent_checked` tinyint(1) NOT NULL DEFAULT '0',
  `hipaa_consent_checked` tinyint(1) NOT NULL DEFAULT '0',
  `clinical_service` enum('MedOnc','RadOnc','Transplant','Surgery') COLLATE utf8_unicode_ci DEFAULT 'MedOnc',
  `treatment_start_date` date DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Settable by survey or patient editor',
  `ethnicity` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'apparently not used',
  `eligible_flag` tinyint(2) DEFAULT NULL,
  `study_group` enum('Control','Treatment') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'field is redundant given user_acl_leafs table, but still used; only set if patient has consented',
  `secret_phrase` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `check_again_date` date DEFAULT NULL COMMENT 'date when someone should view this patient record and take action',
  `no_more_check_agains` tinyint(1) NOT NULL DEFAULT '0',
  `alt_contact_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'alternative contact name',
  `alt_contact_relation` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'alternative contact''s relationship to patient',
  `alt_contact_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'alternative contact phone number',
  `alt_contact_email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'alternative contact email address',
  `t2a_subscale_id` int(11) DEFAULT NULL,
  `t2b_subscale_id` int(11) DEFAULT NULL,
  `off_study_status` enum('On study','Completed all study requirements','Ineligible','Voluntary withdrawal','Lost to follow-up','Adverse effects','Other') COLLATE utf8_unicode_ci DEFAULT NULL,
  `off_study_reason` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `off_study_timestamp` timestamp NULL DEFAULT NULL,
  `declined_reason` enum('The study does not interest me','I prefer not to participate in research','I am too busy','I do not use computers/the Internet','Other (describe in Notes)','Prefer not to answer/no answer given') COLLATE utf8_unicode_ci DEFAULT NULL,
  `72_hr_follow_up` tinyint(1) NOT NULL DEFAULT '0',
  `farthestStepInIntervention` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ie ''priorities'', or ''factors.46'''
) ENGINE=MyISAM AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `sites`;
CREATE TABLE IF NOT EXISTS `sites` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `friendly_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `research_staff_email_alias` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'alias to email all associated research staff for the site',
  `research_staff_signature` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'signature to attach to email from the research staff',
  `new_aim_consent_mod_date` date DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `change_pw_flag` tinyint(1) DEFAULT NULL COMMENT 'If 1, must change password after next login',
  `clinic_id` int(11) DEFAULT NULL,
  `language` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last4ssn` smallint(6) DEFAULT NULL,
  `registered` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE `patients`
ADD PRIMARY KEY (`id`);

ALTER TABLE `sites`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD KEY `clinic_id` (`clinic_id`), ADD KEY `last_name` (`last_name`);

ALTER TABLE `clinics`
 MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;

ALTER TABLE `patients`
 MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2000;

ALTER TABLE `sites`
 MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;

ALTER TABLE `users`
 MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2000;
