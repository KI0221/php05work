-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2024 年 9 月 10 日 14:48
-- サーバのバージョン： 10.4.28-MariaDB
-- PHP のバージョン: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gs_db_class`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `gs_bookmark_table`
--

CREATE TABLE `gs_bookmark_table` (
  `id` int(11) NOT NULL,
  `book_name` varchar(64) NOT NULL,
  `book_url` text NOT NULL,
  `book_comment` text NOT NULL,
  `date` datetime NOT NULL,
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `gs_bookmark_table`
--

INSERT INTO `gs_bookmark_table` (`id`, `book_name`, `book_url`, `book_comment`, `date`, `image`) VALUES
(2, 'BBB', 'http://amzon.com', '面白かった', '2024-09-01 16:29:53', NULL),
(3, 'CCC', 'http://amzon.com', '終盤の展開に物足りなさを感じた', '2024-09-08 10:51:46', NULL),
(4, 'AAA', 'http://amzon.com', 'もうひと展開あっても良かった', '2024-09-08 12:32:16', NULL),
(5, 'DDD', 'http://amzon.com', '次回作が気になる', '2024-09-10 18:24:55', NULL),
(6, 'EEE', 'http://amzon.com', 'ドラえもん', '2024-09-10 21:26:01', ''),
(7, 'XXX', 'http://amzon.com', 'XXX', '2024-09-10 21:40:26', 'img66e03e3ae7c6a.'),
(8, 'XXX', 'http://amzon.com', 'YYY', '2024-09-10 21:40:46', 'img66e03e4e92d75.png');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `gs_bookmark_table`
--
ALTER TABLE `gs_bookmark_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `gs_bookmark_table`
--
ALTER TABLE `gs_bookmark_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
