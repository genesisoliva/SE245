CREATE TABLE `login_info` ( 
  `login_info_id` int,
  `email` varchar(96) NOT NULL,
  `password` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `admin` (
  `admin_id` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(96) NOT NULL,
  KEY `ADMIN_EMAIL_FK` (`email`),
  CONSTRAINT `ADMIN_EMAIL_FK` FOREIGN KEY (`email`) REFERENCES `login_info` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


CREATE TABLE `staff` (
  `staff_id` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(96) NOT NULL,
  `login_access` tinyint(1) NOT NULL,
  KEY `STAFF_EMAIL_FK` (`email`),
  CONSTRAINT `STAFF_EMAIL_FK` FOREIGN KEY (`email`) REFERENCES `login_info` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `customers` (
  `customer_id` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `login_access` tinyint(1) NOT NULL DEFAULT 1,
  `verify_key` text DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  KEY `CUST_EMAIL_FK` (`email`),
  CONSTRAINT `CUST_EMAIL_FK` FOREIGN KEY (`email`) REFERENCES `login_info` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `customer_contact` (
  `address_id` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `address_line_1` varchar(50) NOT NULL,
  `address_line_2` varchar(50) NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `pin` bigint(6) NOT NULL,
  `contact_number` bigint(10) NOT NULL,
  `alternative_contact_number` bigint(10) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  UNIQUE KEY `contact_number` (`contact_number`),
  KEY `CUST_CONTACT_FK` (`customer_id`),
  CONSTRAINT `CUST_CONTACT_FK` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `icons` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `icon_title` varchar(20) NOT NULL,
  `icon_url` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `icon_url` (`icon_url`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `icons` (`id`, `icon_title`, `icon_url`) VALUES
(1, 'bread', 'img/icons/bread.png'),
(2, 'chicken', 'img/icons/chicken.png'),
(3, 'chips', 'img/icons/chips.png'),
(4, 'egg', 'img/icons/egg.png'),
(5, 'fish', 'img/icons/fish.png'),
(6, 'ice', 'img/icons/ice.png'),
(7, 'juice', 'img/icons/juice.png'),
(8, 'noodles', 'img/icons/noodles.png'),
(9, 'soup', 'img/icons/soup.png'),
(10, 'veg', 'img/icons/veg.png');

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(30) NOT NULL,
  `icon_url` varchar(50) NOT NULL,
  `cat_desc` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cat_id`) USING BTREE,
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `CAT_ICON_URL_FK` (`icon_url`),
  CONSTRAINT `CAT_ICON_URL_FK` FOREIGN KEY (`icon_url`) REFERENCES `icons` (`icon_url`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `categories` (`cat_id`, `cat_title`, `icon_url`, `cat_desc`, `date_added`, `date_modified`) VALUES
(2, 'Main Course', 'img/icons/chicken.png', 'Chicken Tandoori, Tikka, Kolhapuri, Banjara, Lassuni, Hyderabadi, Dal Fry, Mushroom, Dal tadka, Dum Alu, Butter Masala and many more to choose from..', '2019-12-21 17:30:44', '2019-12-23 00:27:21'),
(3, 'Sides', 'img/icons/ice.png', 'Fried Papad, Finger chips, Soups - Manchow, Mushroom, Sweet Corn, Hot & Sour, Lung Fung, Desserts - Vanilla, Strawberry, Butter Scotch, Chocolate, Juice - Orange, Pineapple..', '2019-12-21 17:30:58', '0000-00-00 00:00:00'),
(4, 'Rice and Noodles', 'img/icons/noodles.png', 'Fried Rice/Noodles - Ghee/Jeera Rice, Dal Khichdi, Palak, Triple Fried Rice, Chicken items - Chicken Singapore, Chicken Hongkong, Chicken Biryani, Mixed fried rice and more...', '2019-12-21 17:31:20', '2019-12-23 15:13:13'),
(5, 'Special', 'img/icons/bread.png', 'Roti, Butter Roti, Kulcha, Naan, Parota, Butter naan, Stuffed Naan, Tokri, Mutton items - Mutton Pepper, Mutton Sukka, Mutton Hyderabadi, Mutton Kolhapuri and a lot more.. ', '2019-12-21 17:31:29', '0000-00-00 00:00:00'),
(6, 'Sea food', 'img/icons/fish.png', 'Fish Masala, Fry, Tawa, Rawa, Naked, Tandoori, Deep Fry, Pomfret, Anjal (King fish), Kane (Lady fish), Nang (Lape fish), Bondas, Crab and much more..', '2019-12-22 12:24:20', '0000-00-00 00:00:00'),
(1, 'Starters', 'img/icons/chips.png', 'Kebab, Koliwada, Pakodas, Gobi Manchurian, Baby corn, Mushroom/Panner Tikka, Boiled Egg, Omlette, Egg Masala and much more..', '2019-12-21 17:30:30', '2019-12-29 00:26:51');


CREATE TABLE `subcategories` (
  `sub_cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_id` int(10) NOT NULL,
  `sub_cat_title` varchar(30) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`sub_cat_id`) USING BTREE,
  UNIQUE KEY `sub_cat_title` (`sub_cat_title`,`cat_id`) USING BTREE,
  KEY `SUBCAT_PK` (`cat_id`),
  CONSTRAINT `SUBCAT_PK` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `items` (
  `item_id` int(12) NOT NULL AUTO_INCREMENT,
  `item_title` varchar(50) NOT NULL,
  `isAvailable` tinyint(1) NOT NULL DEFAULT 1,
  `cat_id` int(10) NOT NULL,
  `sub_cat_id` int(10) NOT NULL,
  `item_image` varchar(100) NOT NULL DEFAULT 'img/items/noimage.jpg',
  `item_price` double(6,2) NOT NULL,
  `item_limit` bigint(5) NOT NULL DEFAULT 10,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ITEM_CATID_FK` (`cat_id`),
  KEY `ITEM_SUB_CATID_FK` (`sub_cat_id`),
  CONSTRAINT `ITEM_CATID_FK` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`),
  CONSTRAINT `ITEM_SUB_CATID_FK` FOREIGN KEY (`sub_cat_id`) REFERENCES `subcategories` (`sub_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=latin1;

CREATE TABLE `cart` (
  `cart_id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_modified` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `email` (`email`,`session_id`),
  CONSTRAINT `CART_EMAIL_FK` FOREIGN KEY (`email`) REFERENCES `customers` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

CREATE TABLE `cart_items` (
  `cart_items_id` int(10) NOT NULL AUTO_INCREMENT,
  `cart_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`cart_items_id`),
  UNIQUE KEY `cart_id` (`cart_id`,`item_id`),
  KEY `CART_ITEMS_ITEMID_FK` (`item_id`),
  CONSTRAINT `CART_ITEMS_CARTID_FK` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CART_ITEMS_ITEMID_FK` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

CREATE TABLE `orders_received` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `amount` double(6,2) NOT NULL,
  `order_status` text NOT NULL,
  `order_date` datetime NOT NULL,
  `order_modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaction_type` text NOT NULL,
  `address_id` int(10) NOT NULL,
  `cust_instructions` text DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `address_id` (`address_id`),
  KEY `ORD_REC_CUSTID_FK` (`customer_id`),
  CONSTRAINT `ORD_REC_ADDRID_FK` FOREIGN KEY (`address_id`) REFERENCES `customer_contact` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ORD_REC_CUSTID_FK` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;

CREATE TABLE `order_payment` (
  `order_payment_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `txnid` varchar(100) NOT NULL,
  `txnstatus` varchar(15) NOT NULL,
  `banktxnid` varchar(110) NOT NULL,
  `bankname` varchar(30) NOT NULL,
  `checksumhash` varchar(110) NOT NULL,
  PRIMARY KEY (`order_payment_id`,`checksumhash`,`txnid`) USING BTREE,
  KEY `ORD_PAY_ORDID_FK` (`order_id`),
  CONSTRAINT `ORD_PAY_ORDID_FK` FOREIGN KEY (`order_id`) REFERENCES `orders_received` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=latin1;

CREATE TABLE `ordered_products` (
  `op_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `item_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  PRIMARY KEY (`op_id`),
  KEY `product_id` (`item_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `ORD_PROD_ITEMID_FK` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ORD_PROD_ORDID_FK` FOREIGN KEY (`order_id`) REFERENCES `orders_received` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1501 DEFAULT CHARSET=latin1;

