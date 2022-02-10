CREATE TABLE IF NOT EXISTS `promocodes` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `item` varchar(255) NOT NULL,
  `amount` int(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `admin` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;