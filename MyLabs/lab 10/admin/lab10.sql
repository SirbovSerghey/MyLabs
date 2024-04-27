-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 22 2024 г., 15:32
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab10`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Child`
--

CREATE TABLE `Child` (
  `id_child` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `birth` date NOT NULL,
  `id_par` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Child`
--

INSERT INTO `Child` (`id_child`, `name`, `birth`, `id_par`) VALUES
(7, 'testChild', '2024-04-11', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Crafti_Department`
--

CREATE TABLE `Crafti_Department` (
  `id_dep` int NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `telefon` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Crafti_Department`
--

INSERT INTO `Crafti_Department` (`id_dep`, `address`, `telefon`) VALUES
(1, 'address 1', 77884455);

-- --------------------------------------------------------

--
-- Структура таблицы `Dep_Date_Hour`
--

CREATE TABLE `Dep_Date_Hour` (
  `id_depDH` int NOT NULL,
  `date` date NOT NULL,
  `hour` varchar(5) NOT NULL,
  `id_dep` int NOT NULL,
  `id_ev` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Dep_Date_Hour`
--

INSERT INTO `Dep_Date_Hour` (`id_depDH`, `date`, `hour`, `id_dep`, `id_ev`) VALUES
(1, '2024-04-16', '18:00', 1, 1),
(2, '2024-04-24', '16:00', 1, 2),
(3, '2024-05-01', '20:00', 1, 3),
(4, '2024-06-01', '18:00', 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `Event`
--

CREATE TABLE `Event` (
  `id_ev` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `mentor` varchar(50) NOT NULL,
  `nr_seats` int NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Event`
--

INSERT INTO `Event` (`id_ev`, `name`, `mentor`, `nr_seats`, `price`) VALUES
(1, 'Event 1', 'Mentor 1', 10, 500),
(2, 'Event 2', 'Mentor 1', 8, 750),
(3, 'Event 3', 'Mentor 2', 3, 1000),
(4, 'Event 4', 'Mentor 3', 20, 350);

-- --------------------------------------------------------

--
-- Структура таблицы `Manager`
--

CREATE TABLE `Manager` (
  `id_manager` int NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Manager`
--

INSERT INTO `Manager` (`id_manager`, `login`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Структура таблицы `Parent`
--

CREATE TABLE `Parent` (
  `id_par` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telefon` int NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Parent`
--

INSERT INTO `Parent` (`id_par`, `name`, `telefon`, `password`) VALUES
(2, 'test', 79112233, '098f6bcd4621d373cade4e832627b4f6');

-- --------------------------------------------------------

--
-- Структура таблицы `Registration`
--

CREATE TABLE `Registration` (
  `id_reg` int NOT NULL,
  `date` date NOT NULL,
  `id_depDH` int NOT NULL,
  `id_child` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Registration`
--

INSERT INTO `Registration` (`id_reg`, `date`, `id_depDH`, `id_child`) VALUES
(1, '2024-04-11', 1, 7);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Child`
--
ALTER TABLE `Child`
  ADD PRIMARY KEY (`id_child`),
  ADD KEY `id_par` (`id_par`);

--
-- Индексы таблицы `Crafti_Department`
--
ALTER TABLE `Crafti_Department`
  ADD PRIMARY KEY (`id_dep`);

--
-- Индексы таблицы `Dep_Date_Hour`
--
ALTER TABLE `Dep_Date_Hour`
  ADD PRIMARY KEY (`id_depDH`),
  ADD KEY `id_dep` (`id_dep`),
  ADD KEY `id_ev` (`id_ev`);

--
-- Индексы таблицы `Event`
--
ALTER TABLE `Event`
  ADD PRIMARY KEY (`id_ev`);

--
-- Индексы таблицы `Manager`
--
ALTER TABLE `Manager`
  ADD PRIMARY KEY (`id_manager`);

--
-- Индексы таблицы `Parent`
--
ALTER TABLE `Parent`
  ADD PRIMARY KEY (`id_par`);

--
-- Индексы таблицы `Registration`
--
ALTER TABLE `Registration`
  ADD PRIMARY KEY (`id_reg`),
  ADD KEY `id_child` (`id_child`),
  ADD KEY `id_depDH` (`id_depDH`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Child`
--
ALTER TABLE `Child`
  MODIFY `id_child` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `Crafti_Department`
--
ALTER TABLE `Crafti_Department`
  MODIFY `id_dep` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Dep_Date_Hour`
--
ALTER TABLE `Dep_Date_Hour`
  MODIFY `id_depDH` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Event`
--
ALTER TABLE `Event`
  MODIFY `id_ev` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Manager`
--
ALTER TABLE `Manager`
  MODIFY `id_manager` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Parent`
--
ALTER TABLE `Parent`
  MODIFY `id_par` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Registration`
--
ALTER TABLE `Registration`
  MODIFY `id_reg` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Child`
--
ALTER TABLE `Child`
  ADD CONSTRAINT `child_ibfk_2` FOREIGN KEY (`id_par`) REFERENCES `Parent` (`id_par`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Dep_Date_Hour`
--
ALTER TABLE `Dep_Date_Hour`
  ADD CONSTRAINT `dep_date_hour_ibfk_2` FOREIGN KEY (`id_dep`) REFERENCES `Crafti_Department` (`id_dep`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `dep_date_hour_ibfk_3` FOREIGN KEY (`id_ev`) REFERENCES `Event` (`id_ev`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Registration`
--
ALTER TABLE `Registration`
  ADD CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`id_depDH`) REFERENCES `Dep_Date_Hour` (`id_depDH`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`id_child`) REFERENCES `Child` (`id_child`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
