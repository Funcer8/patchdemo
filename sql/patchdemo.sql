CREATE DATABASE IF NOT EXISTS patchdemo;

USE patchdemo;

CREATE TABLE IF NOT EXISTS wikis (
	wiki VARCHAR(32) NOT NULL,
	creator VARCHAR(255) NOT NULL,
	created DATETIME NOT NULL,
	patches TEXT,
	announcedTasks TEXT,
	PRIMARY KEY (wiki)
);

CREATE TABLE IF NOT EXISTS patches (
	patch VARCHAR(16) NOT NULL,
	status VARCHAR(16) NOT NULL,
	subject TEXT NOT NULL,
	message TEXT NOT NULL,
	updated DATETIME NOT NULL,
	PRIMARY KEY (patch)
);

CREATE TABLE IF NOT EXISTS tasks (
	task INT UNSIGNED NOT NULL,
	title TEXT NOT NULL,
	updated DATETIME NOT NULL,
	PRIMARY KEY(task)
);

-- NB: ADD COLUMN IF NOT EXISTS requires Maria DB >=10.219
ALTER TABLE `wikis`
	ADD COLUMN IF NOT EXISTS `timeToCreate` SMALLINT UNSIGNED NULL DEFAULT NULL AFTER `announcedTasks`;

ALTER TABLE `wikis`
	ADD INDEX IF NOT EXISTS `created` (`created`);

ALTER TABLE `wikis`
	ADD COLUMN IF NOT EXISTS `deleted` BIT NOT NULL DEFAULT 0 AFTER `timeToCreate`;

ALTER TABLE `tasks`
	ADD COLUMN IF NOT EXISTS `status` VARCHAR(16) NOT NULL AFTER `title`;
