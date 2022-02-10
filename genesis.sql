
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL
)ENGINE InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci AUTO_INCREMENT 1;


INSERT INTO `roles` (`role_id`, `role`) VALUES
(1, 'Admin'),
(2, 'Editor'),
(3, 'User');


CREATE TABLE IF NOT EXISTS `users` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `student_id` varchar(255) NOT NULL,
  `dorm_num` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `phone2` varchar(25) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `roleid` int(4) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 0,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`roleid`) REFERENCES roles (`role_id`) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE InnoDB DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci AUTO_INCREMENT 1;


INSERT INTO `users` (`id`, `student_id`, `first_name`, `email`, `password`, `mobile`, `roleid`, `isActive`, `created_at`, `updated_at`) VALUES
(1, '005501789', 'Admin', 'admin@tigereats.com', '188000e1f0fb4075ae1c659697b96296f982cdc4', '01717090233', 1, 0, '2022-02-09 16:23:01', NULL);

-- An123456 ---
