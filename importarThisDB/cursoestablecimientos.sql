/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.21-MariaDB : Database - cursoestablecimientos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categorias` */

insert  into `categorias`(`id`,`nombre`,`slug`,`created_at`,`updated_at`) values (1,'Restaurant','restaurant','2020-11-06 19:09:35','2020-11-06 19:09:35'),(2,'Cafe','cafe','2020-11-06 19:09:35','2020-11-06 19:09:35'),(3,'Hotel','hotel','2020-11-06 19:09:35','2020-11-06 19:09:35'),(4,'Bar','bar','2020-11-06 19:09:35','2020-11-06 19:09:35'),(5,'Hospital','hospital','2020-11-06 19:09:35','2020-11-06 19:09:35'),(6,'Gimnasio','gimnasio','2020-11-06 19:09:35','2020-11-06 19:09:35'),(7,'Doctor','doctor','2020-11-06 19:09:35','2020-11-06 19:09:35');

/*Table structure for table `establecimientos` */

DROP TABLE IF EXISTS `establecimientos`;

CREATE TABLE `establecimientos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` bigint(20) unsigned NOT NULL,
  `imagen_principal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `colonia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `apertura` time NOT NULL,
  `cierre` time NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `establecimientos_categoria_id_foreign` (`categoria_id`),
  KEY `establecimientos_user_id_foreign` (`user_id`),
  CONSTRAINT `establecimientos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `establecimientos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `establecimientos` */

insert  into `establecimientos`(`id`,`nombre`,`categoria_id`,`imagen_principal`,`direccion`,`colonia`,`lat`,`lng`,`telefono`,`descripcion`,`apertura`,`cierre`,`uuid`,`user_id`,`created_at`,`updated_at`) values (1,'inversionesRpz',6,'principales/wuGhDQiNOFtEQRP9x4n7HKrbpjU6XfcdIr62LT7d.jpeg','Diagonal Golfo de Cortés','Vallarta Norte','20.675370000000044','-103.38858999999997','5543767878','Negocio donde se invierte en todo aquello que tenga plusvalia sin faltar a las leyes y normas del pais.','08:00:00','17:00:00','bc80c87b-ad7a-4989-8c2f-cbfec47ccf93',1,'2020-11-06 21:45:02','2020-11-17 20:33:56'),(2,'Starbucks',2,'principales/ez0277NuYTGkacDgbLgszjAnjoSzKrL0IXfDJSe4.jpeg','Avenida Tepeyac','Chapalita','20.665728603640794','-103.39552209583042','5531311234','Es un cafe, se desconoce que es lo que en realidad ofrece \"Cafe\" o \"experiencia\", sigue siendo una incognita para la humanidad','09:00:00','21:00:00','43b44efc-73b7-446f-a187-fe43561563d6',1,'2020-11-09 18:59:17','2020-11-09 18:59:17'),(3,'Cielito lindo',2,'principales/QmxqRG0tWZ2mibIWWU2r3WTCbwo4alXuhmXOANaE.jpeg','Avenida Inglaterra 2709','Vallarta','20.66877000064997','-103.38537001208653','5524254524','Cafe 100 Mexicano, a diferencia de otros cielito lindo ofrece cafe supuestamente 100% mexicano que entonces es de una calidad regular','10:00:00','19:00:00','b36432d3-01a0-4317-a0ef-a517c1ff14e9',1,'2020-11-09 19:01:26','2020-11-09 19:01:26'),(4,'Fishers',1,'principales/gRWbip2B08PsyWaBrufNxQ943fKtVKhaYAtzmynh.jpeg','Avenida Niños Héroes 716','Jardines de los Arcos','20.66709000000003','-103.39271999999994','5542456345','Mariscos frescos, seleccionados al dia para su deleite alv','13:00:00','22:00:00','363754e6-13b2-402b-9fd6-eec1e0f5969a',1,'2020-11-11 20:38:31','2020-11-11 20:38:31'),(5,'Hotwolf',1,'principales/gR7LzhJmLh435FF0iZV4spCt7eDhYl2n6S1nL0PR.jpeg','Avenida Guadalupe 1001','Chapalita','20.66589002062841','-103.40208000661902','5541234524','Son como los hotdogs pero son un poco mas grandes y se agregan mas especias para darlos mas caros','12:00:00','21:00:00','76e65a3b-5f57-423e-b064-d493256b1405',1,'2020-11-11 20:40:39','2020-11-11 20:40:39'),(6,'Picasso',3,'principales/0fzK1ZWWzDtWnQsOWqaTAgfZSdA6pdk1FdZuPHbX.jpeg','Avenida San Francisco 317','Chapalita','20.66860001565358','-103.39666999103346','5545242415','Buen lugar, para relajarte contamos con habitaciones con jacuzzi y también algunas habitaciones con piscina','10:00:00','23:00:00','a0f4089b-30df-4b41-8764-3ef23bc543af',1,'2020-11-11 20:50:42','2020-11-11 20:50:42'),(7,'Elite',3,'principales/HvKuYgc9zBfcs2GiHait23sIgPYEtYTbpT3QDCXO.jpeg','Calle Ámsterdam 1555','Arcos Vallarta','20.67106999488132','-103.38409998611738','5565625434','Manejamos precios accesibles, contamos con habitaciones con jacuzzi e hidromasaje o también tenemos lo que es la habitación sencilla','09:00:00','22:00:00','709df490-a974-40b7-930e-f5abaf81bab5',1,'2020-11-11 20:52:44','2020-11-11 20:52:44');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `imagens` */

DROP TABLE IF EXISTS `imagens`;

CREATE TABLE `imagens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_establecimiento` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta_imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `imagens` */

insert  into `imagens`(`id`,`id_establecimiento`,`ruta_imagen`,`created_at`,`updated_at`) values (1,'5fe62a0f-9ad4-4782-9815-2e7656910a8f','establecimientos/XuERUYb8tzFSlZzm4uga2pOpfCUzS29V6UxH9bfW.jpeg','2020-11-06 20:28:16','2020-11-06 20:28:16'),(2,'e05a74bb-7b27-4e35-9257-0701c8538f25','establecimientos/UgcuW9Z983JfifdNpj8HXlJ1gumo7D0tR431FKCI.jpeg','2020-11-06 20:30:30','2020-11-06 20:30:30'),(3,'450274ab-22d3-4cdd-b4ef-9325eac79bfd','establecimientos/MLB6mD1ojPbtUPuPRU3GXQdGkuenErWDnl3WEMCN.jpeg','2020-11-06 20:33:15','2020-11-06 20:33:15'),(4,'28bb789d-035a-4a05-8e19-f78e987cc03e','establecimientos/PydIUVBDIoHIseKehMlXcHlKMnlyNtXjw9mvSqJO.jpeg','2020-11-06 20:44:31','2020-11-06 20:44:31'),(5,'43b44efc-73b7-446f-a187-fe43561563d6','establecimientos/0OoV5hhg6JaRk4nTiawR1g9LwMZr8qdzCbFhGflV.jpeg','2020-11-09 18:59:15','2020-11-09 18:59:15'),(6,'b36432d3-01a0-4317-a0ef-a517c1ff14e9','establecimientos/vGYSeIFItz2NZhkl1aqrBUwZbJ8YrATOtAirkInQ.jpeg','2020-11-09 19:01:25','2020-11-09 19:01:25'),(7,'363754e6-13b2-402b-9fd6-eec1e0f5969a','establecimientos/YJmEyspeEDJcAgeMvvvReRh2ECFqbLQjmfvpKjTh.jpeg','2020-11-11 20:38:29','2020-11-11 20:38:29'),(8,'76e65a3b-5f57-423e-b064-d493256b1405','establecimientos/upCmDUYWwh8m3xlrbR2OCwdFaK83q1G1xvv0YLJe.jpeg','2020-11-11 20:40:34','2020-11-11 20:40:34'),(9,'a0f4089b-30df-4b41-8764-3ef23bc543af','establecimientos/RiGsZCIic33DlyeuX6UimCWDK1VqaupSLHRSPUEB.jpeg','2020-11-11 20:49:53','2020-11-11 20:49:53'),(10,'709df490-a974-40b7-930e-f5abaf81bab5','establecimientos/lQQ6CRZRJRRZgU0AV3kGSubiSAhNMHNCr9JquOKk.jpeg','2020-11-11 20:52:42','2020-11-11 20:52:42');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_11_03_020826_create_establecimientos_table',1),(5,'2020_11_06_185651_create_imagens_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (1,'Arturo','correo@correo.com','2020-11-06 19:09:34','$2y$10$TkZyvZUyld9u6eRmFUqz.OGL/GacVorcptmsSMz0DEabDw7k5CbhC',NULL,'2020-11-06 19:09:34','2020-11-06 19:09:34'),(2,'Galio','correo2@correo.com','2020-11-06 19:09:34','$2y$10$rbTxi3SE9jsxauoF6CLyo.YMJNd.vweboRDcHn02uieKXpUZCyxbe',NULL,'2020-11-06 19:09:35','2020-11-06 19:09:35');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
