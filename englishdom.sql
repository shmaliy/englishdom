-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Сен 05 2013 г., 00:49
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `englishdom`
--
DROP DATABASE `englishdom`;
CREATE DATABASE `englishdom` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `englishdom`;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `priority` int(10) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `title`, `alias`, `priority`, `content`) VALUES
(1, 0, 'Category_1', 'url_1', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque et cursus ante. Praesent vitae felis quam. Vestibulum consectetur placerat sollicitudin. Curabitur ac purus purus. Integer vitae nisl fermentum, fermentum mauris in, venenatis dui. Mauris viverra adipiscing mauris. Sed feugiat auctor dignissim. Ut semper enim metus. Nam volutpat tempus lacus vitae tincidunt. Nunc facilisis vehicula libero ac suscipit. Ut scelerisque libero nibh, quis auctor quam bibendum vitae. Morbi faucibus ante tortor, vitae sagittis nisi blandit quis. Fusce lacus sapien, lobortis ut lobortis at, molestie non enim. Etiam ac nunc lacinia, dapibus neque eu, facilisis velit. In dictum ligula volutpat lorem elementum, et luctus diam feugiat. '),
(2, 1, 'Category_2 ', 'url_2', 1, 'Aliquam erat volutpat. Donec quis arcu egestas, sollicitudin orci quis, ornare lacus. Curabitur eget dolor ultricies, egestas velit a, suscipit nisl. Integer eget lorem elementum, tincidunt metus et, ultricies tortor. Vivamus ut erat sit amet nisl varius aliquet ac nec ipsum. In et neque dapibus turpis pretium laoreet. Aenean ligula enim, condimentum sed dictum a, mollis at dui. Nulla quam elit, ullamcorper in libero sed, luctus eleifend sem. Donec quam mi, congue ut congue et, fermentum sit amet ante. Duis luctus leo erat, sit amet auctor nisi iaculis sed. '),
(3, 1, 'Category_3 ', 'url_3', 2, 'Ut consectetur ornare risus, vitae ornare ligula posuere eu. Praesent cursus est nisl, et tempus lacus blandit et. Nullam laoreet interdum lorem ac convallis. Morbi tincidunt, eros sed scelerisque ornare, quam justo suscipit purus, quis ultricies nulla lacus quis risus. Quisque elementum, massa quis tempus semper, nulla nunc pharetra ipsum, ac accumsan tellus massa non odio. Nullam eget orci faucibus, molestie libero at, molestie nunc. Etiam risus urna, rhoncus a ullamcorper et, eleifend sed quam. Donec suscipit consectetur odio, fringilla sagittis felis hendrerit vitae. Phasellus facilisis tristique porttitor. Integer pulvinar feugiat tellus at mattis. Suspendisse dapibus egestas mauris ac scelerisque. '),
(4, 1, 'Category_4', 'url_4', 3, 'Aliquam nec consectetur ante. Fusce gravida condimentum neque, eget vehicula diam pretium et. Mauris lorem tortor, mollis sit amet justo ac, ullamcorper condimentum tortor. Vivamus tincidunt odio justo, sit amet adipiscing metus ornare quis. Nullam cursus dui est, id venenatis lorem vestibulum at. Quisque mattis, diam non varius fermentum, urna diam tincidunt diam, vel rhoncus lectus eros eget odio. Proin gravida pulvinar faucibus. '),
(5, 0, 'Category_5', 'url_5', 2, 'Morbi porta ipsum pulvinar, feugiat justo nec, rhoncus leo. Sed sodales cursus urna, et vulputate nisl molestie vitae. Donec feugiat, erat a luctus elementum, nisi neque sagittis justo, a congue ante purus quis magna. Quisque eu pellentesque magna, eu egestas eros. Maecenas ut risus faucibus, commodo orci et, euismod lectus. Fusce mauris lacus, blandit id quam vitae, tristique gravida purus. Donec eu sollicitudin neque. Suspendisse vulputate, justo nec auctor tincidunt, massa magna posuere tortor, a adipiscing mi leo at felis. Nullam purus tortor, tristique tincidunt massa eu, aliquam iaculis mauris. Curabitur tristique lorem a ipsum porttitor pulvinar. Nullam urna quam, sollicitudin sit amet viverra vel, sodales in urna. Nullam non ultrices diam, eu pellentesque sem. Etiam dapibus justo imperdiet vestibulum ultricies. Mauris pharetra metus eu nibh egestas posuere.'),
(6, 0, 'Category_7', 'url_7', 3, 'Ut fringilla, leo at aliquam laoreet, odio sapien mattis ipsum, eget mattis erat mauris ac nisl. Praesent mollis tortor sed felis feugiat, a bibendum ipsum commodo. Phasellus varius lacus massa, vitae elementum erat volutpat a. Cras convallis tempus dolor, id volutpat nibh sodales at. Nam ligula nulla, eleifend non nulla vel, elementum blandit enim. Ut diam ipsum, vehicula in rhoncus vitae, adipiscing eu risus. Phasellus interdum, quam in placerat laoreet, dolor libero semper nibh, vitae adipiscing sem libero sit amet metus. Vivamus pretium, est sed eleifend varius, sapien erat tincidunt turpis, sed euismod metus leo tempor mauris. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin sed urna nec tortor malesuada tristique at et diam. Praesent dapibus arcu augue, euismod fringilla dui bibendum vitae. '),
(7, 0, 'Category_8', 'url_8', 4, 'Vivamus venenatis venenatis eros vitae ullamcorper. Donec facilisis a metus vitae elementum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer ac ipsum odio. Aenean vitae faucibus lacus, eu iaculis velit. Proin ac hendrerit magna. Proin vitae orci ante. Curabitur pretium sollicitudin diam. Duis ac odio pretium, ornare sapien vitae, bibendum massa. Suspendisse non odio velit. Ut eu odio diam. Vestibulum quis turpis interdum, fermentum lorem at, condimentum nibh. Curabitur vel magna ultrices, aliquet enim at, fringilla dui. '),
(8, 3, 'Category_9 ', 'url_9', 1, 'In nisl libero, consectetur in sapien sit amet, imperdiet pulvinar risus. Integer non mauris magna. Vivamus mi dui, hendrerit vel purus vel, dignissim iaculis magna. Aliquam tristique imperdiet metus, at commodo risus egestas ac. In faucibus arcu id eros blandit, sed accumsan turpis ultricies. Pellentesque fringilla rhoncus ante. Aliquam eget tempor neque, eu sagittis nunc. Ut in condimentum nulla. Etiam vel tellus tortor. Nunc sit amet turpis in massa varius bibendum. Morbi luctus nec mi elementum ullamcorper. Duis nisi mi, tincidunt eget sollicitudin ut, ultrices in quam. Cras ultricies nec magna id imperdiet. Morbi urna ante, congue a sodales fermentum, tincidunt a arcu. Mauris ac odio in massa vulputate vulputate. Praesent facilisis quam sit amet mauris aliquam sodales. '),
(9, 8, 'Category_N', 'url_n', 1, 'Phasellus mollis nunc ac neque suscipit, id cursus neque molestie. Quisque mattis nisl vel egestas commodo. Ut congue dictum justo in adipiscing. Vivamus nec orci non massa elementum ullamcorper. Etiam consectetur ipsum nisl, eu tincidunt quam viverra eget. Aenean non ante consequat, faucibus odio a, condimentum dui. Maecenas mollis lectus et libero tincidunt, vitae ultrices est scelerisque. Integer rhoncus lorem in erat faucibus facilisis. Vivamus ultrices faucibus egestas. Vivamus vestibulum adipiscing nisi, eu gravida massa bibendum non. '),
(10, 3, 'Category_10', 'url_10', 2, 'In quam ipsum, fringilla eu ante id, accumsan laoreet est. Maecenas vulputate risus vel velit vestibulum, sit amet auctor libero condimentum. Proin lectus augue, facilisis at laoreet at, aliquet nec metus. Cras sit amet vestibulum leo. Praesent iaculis, nisi vitae feugiat gravida, odio ipsum rutrum enim, id posuere metus leo in odio. Pellentesque sollicitudin neque sed augue blandit, at pretium est viverra. Pellentesque a feugiat nulla. Aliquam auctor pulvinar quam, et mollis nulla pellentesque vitae. Proin ultricies risus id ultrices ornare. '),
(11, 5, 'Category_6', 'url_6', 1, 'Integer congue a tortor vel facilisis. Vivamus porttitor pulvinar tempor. Ut sit amet sem nisl. Proin porttitor ligula ut eros condimentum, eu pellentesque mi dapibus. Donec non quam mollis quam porta dignissim. Phasellus nec dui non erat fringilla auctor. Vestibulum quis ante ultrices, malesuada lacus in, euismod diam. Suspendisse tincidunt eros ac arcu sodales pharetra. Duis dapibus euismod nulla pellentesque faucibus. Morbi fermentum turpis ut ligula ornare, vitae luctus tellus interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent mi dui, aliquam quis hendrerit ut, pharetra vitae elit. Integer quis sollicitudin tellus. In pellentesque augue non quam accumsan, sodales tempor ipsum tincidunt. ');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
