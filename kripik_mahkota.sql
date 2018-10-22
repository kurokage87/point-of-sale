-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2018 at 11:34 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kripik_mahkota`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `barang_satuan` varchar(5) DEFAULT NULL,
  `harga_modal` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `stock` varchar(255) DEFAULT NULL,
  `min_stock` varchar(255) DEFAULT NULL,
  `tgl_input` datetime DEFAULT CURRENT_TIMESTAMP,
  `tgl_last_update` datetime DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama_barang`, `barang_satuan`, `harga_modal`, `harga_jual`, `stock`, `min_stock`, `tgl_input`, `tgl_last_update`, `kategori_id`, `user_id`) VALUES
(1, 'Kripik Balado', 'Kg', 10000, 15000, '15', '5', NULL, '2018-10-14 19:19:31', 1, 2),
(2, 'Kripik Sanjay', 'Kg', 9000, 13000, '10', '5', '2018-10-14 19:21:31', NULL, 2, 2),
(3, 'Pancake Durian', 'Buah', 15000, 20000, '10', '3', '2018-10-14 19:22:27', NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `beli_supplier`
--

CREATE TABLE `beli_supplier` (
  `id` int(11) NOT NULL,
  `no_faktur` varchar(255) DEFAULT NULL,
  `tgl_beli` date DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `kode_pembelian` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `name`, `value`, `status`) VALUES
('58jpru7hoj2oe8hodtc76or8n4', 1, 'cart1', 'a:2:{i:1;O:17:\"app\\models\\Barang\":11:{s:36:\"\0yii\\db\\BaseActiveRecord\0_attributes\";a:11:{s:2:\"id\";i:1;s:11:\"nama_barang\";s:13:\"Kripik Balado\";s:13:\"barang_satuan\";s:2:\"Kg\";s:11:\"harga_modal\";s:5:\"10000\";s:10:\"harga_jual\";s:5:\"15000\";s:5:\"stock\";s:2:\"15\";s:9:\"min_stock\";s:1:\"5\";s:9:\"tgl_input\";N;s:15:\"tgl_last_update\";s:19:\"2018-10-14 19:19:31\";s:11:\"kategori_id\";i:1;s:7:\"user_id\";i:2;}s:39:\"\0yii\\db\\BaseActiveRecord\0_oldAttributes\";a:11:{s:2:\"id\";i:1;s:11:\"nama_barang\";s:13:\"Kripik Balado\";s:13:\"barang_satuan\";s:2:\"Kg\";s:11:\"harga_modal\";s:5:\"10000\";s:10:\"harga_jual\";s:5:\"15000\";s:5:\"stock\";s:2:\"15\";s:9:\"min_stock\";s:1:\"5\";s:9:\"tgl_input\";N;s:15:\"tgl_last_update\";s:19:\"2018-10-14 19:19:31\";s:11:\"kategori_id\";i:1;s:7:\"user_id\";i:2;}s:33:\"\0yii\\db\\BaseActiveRecord\0_related\";a:0:{}s:47:\"\0yii\\db\\BaseActiveRecord\0_relationsDependencies\";a:0:{}s:23:\"\0yii\\base\\Model\0_errors\";N;s:27:\"\0yii\\base\\Model\0_validators\";N;s:25:\"\0yii\\base\\Model\0_scenario\";s:7:\"default\";s:27:\"\0yii\\base\\Component\0_events\";a:0:{}s:35:\"\0yii\\base\\Component\0_eventWildcards\";a:0:{}s:30:\"\0yii\\base\\Component\0_behaviors\";a:0:{}s:12:\"\0*\0_quantity\";s:1:\"3\";}i:2;O:17:\"app\\models\\Barang\":11:{s:36:\"\0yii\\db\\BaseActiveRecord\0_attributes\";a:11:{s:2:\"id\";i:2;s:11:\"nama_barang\";s:13:\"Kripik Sanjay\";s:13:\"barang_satuan\";s:2:\"Kg\";s:11:\"harga_modal\";i:9000;s:10:\"harga_jual\";i:13000;s:5:\"stock\";s:2:\"10\";s:9:\"min_stock\";s:1:\"5\";s:9:\"tgl_input\";s:19:\"2018-10-14 19:21:31\";s:15:\"tgl_last_update\";N;s:11:\"kategori_id\";i:2;s:7:\"user_id\";i:2;}s:39:\"\0yii\\db\\BaseActiveRecord\0_oldAttributes\";a:11:{s:2:\"id\";i:2;s:11:\"nama_barang\";s:13:\"Kripik Sanjay\";s:13:\"barang_satuan\";s:2:\"Kg\";s:11:\"harga_modal\";i:9000;s:10:\"harga_jual\";i:13000;s:5:\"stock\";s:2:\"10\";s:9:\"min_stock\";s:1:\"5\";s:9:\"tgl_input\";s:19:\"2018-10-14 19:21:31\";s:15:\"tgl_last_update\";N;s:11:\"kategori_id\";i:2;s:7:\"user_id\";i:2;}s:33:\"\0yii\\db\\BaseActiveRecord\0_related\";a:0:{}s:47:\"\0yii\\db\\BaseActiveRecord\0_relationsDependencies\";a:0:{}s:23:\"\0yii\\base\\Model\0_errors\";N;s:27:\"\0yii\\base\\Model\0_validators\";N;s:25:\"\0yii\\base\\Model\0_scenario\";s:7:\"default\";s:27:\"\0yii\\base\\Component\0_events\";a:0:{}s:35:\"\0yii\\base\\Component\0_eventWildcards\";a:0:{}s:30:\"\0yii\\base\\Component\0_behaviors\";a:0:{}s:12:\"\0*\0_quantity\";s:1:\"3\";}}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `detail_beli_supplier`
--

CREATE TABLE `detail_beli_supplier` (
  `id` int(11) NOT NULL,
  `no_faktur` varchar(255) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_jual`
--

CREATE TABLE `detail_jual` (
  `id` int(11) NOT NULL,
  `penjualan_id` int(11) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_jual`
--

INSERT INTO `detail_jual` (`id`, `penjualan_id`, `barang_id`, `qty`, `total`) VALUES
(1, NULL, 1, 11, NULL),
(2, NULL, 1, 12, NULL),
(3, NULL, 1, 11, NULL),
(4, NULL, 1, 11, NULL),
(5, NULL, 2, 12312, NULL),
(6, 3, 1, 12, NULL),
(7, 3, 1, 111, NULL),
(8, 10, 2, 11, NULL),
(9, 10, 1, 12, NULL),
(10, 10, 3, 12, NULL),
(11, 11, 2, 11, NULL),
(12, 11, 1, 12, NULL),
(13, 11, 3, 1, NULL),
(14, 12, 2, 11, NULL),
(15, 12, 1, 12, NULL),
(16, 12, 3, 1, NULL),
(17, 13, 1, 11, NULL),
(18, 14, 1, 11, NULL),
(19, 15, 2, 11, NULL),
(20, 16, 3, NULL, NULL),
(21, 17, 3, 111, NULL),
(22, 17, 1, 11, NULL),
(23, 18, 1, 11, NULL),
(24, 10, 3, 111, NULL),
(25, 19, 1, 11, NULL),
(26, 19, 2, 12, NULL),
(27, 19, 1, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`) VALUES
(1, 'Makana Basah'),
(2, 'Makanan Kering'),
(3, 'Sambal Lado');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1539518465),
('m130524_201442_init', 1539518466),
('m160117_225613_create_cart_table', 1539744328),
('m180916_081150_table_kebutuhan', 1539518481);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `no_faktur` varchar(255) DEFAULT NULL,
  `tgl_jual` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_jual` double DEFAULT NULL,
  `jumlah_uang` double DEFAULT NULL,
  `kembalian` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `no_faktur`, `tgl_jual`, `total_jual`, `jumlah_uang`, `kembalian`, `user_id`, `keterangan`) VALUES
(1, 'awdadasas', '2018-10-20 18:08:57', 12312, 123123, 12312321, NULL, 'asdnasaskdnalks'),
(2, 'asdasd123', '2018-10-20 18:24:13', 12312, 13123, 1231, NULL, 'aksjndakjsdnaksd'),
(3, 'polo121', '2018-10-20 18:26:02', 12312, 12312, 12312, NULL, 'alskdnalsd'),
(4, 'MHKT20102018004', '2018-10-19 17:00:00', 12, 123123, 1231, NULL, 'alskdnalsdk'),
(5, 'awdadasas', '2018-10-20 18:08:57', 12312, 123123, 12312321, NULL, 'asdnasaskdnalks'),
(6, 'asdasd123', '2018-10-20 18:24:13', 12312, 13123, 1231, NULL, 'aksjndakjsdnaksd'),
(7, 'polo121', '2018-10-20 18:26:02', 12312, 12312, 12312, NULL, 'alskdnalsd'),
(8, 'MHKT20102018004', '2018-10-19 17:00:00', 12, 123123, 1231, NULL, 'alskdnalsdk'),
(9, 'MHKT20102018004', '2018-10-19 17:00:00', 12, 123123, 1231, NULL, 'alskdnalsdk'),
(10, 'MHKT2110201800010', '2018-10-21 06:54:57', NULL, NULL, NULL, NULL, ''),
(11, 'MHKT2110201800011', '2018-10-21 06:54:59', NULL, NULL, NULL, NULL, ''),
(12, 'MHKT2110201800012', '2018-10-21 06:55:07', NULL, NULL, NULL, NULL, ''),
(13, 'MHKT2110201800013', '2018-10-21 06:56:56', NULL, NULL, NULL, 1, ''),
(14, 'MHKT2110201800014', '2018-10-21 07:01:22', NULL, NULL, NULL, 1, ''),
(15, 'MHKT2110201800015', '2018-10-21 07:01:47', NULL, NULL, NULL, 1, ''),
(16, 'MHKT2110201800016', '2018-10-21 07:02:14', NULL, NULL, NULL, 1, ''),
(17, 'MHKT2110201800017', '2018-10-21 07:02:43', NULL, NULL, NULL, 1, ''),
(18, 'MHKT2110201800018', '2018-10-21 07:09:27', NULL, NULL, NULL, 1, ''),
(19, 'MHKT2110201800019', '2018-10-21 09:31:59', NULL, NULL, NULL, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `retur`
--

CREATE TABLE `retur` (
  `id` int(11) NOT NULL,
  `tgl_retur` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `barang_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `nama_supplier` varchar(255) DEFAULT NULL,
  `alamat` text,
  `no_telp` varchar(15) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `level` smallint(6) DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `level`, `nama`) VALUES
(1, 'admin', 'fuGoqSFbfL0z8zz2Y_8EeBu9ij-Qza7L', '$2y$13$miQmzQt80VGf1N8KpjtXgeklCKdmgW7Qpomfnj3xo7M3s34EdleFu', NULL, 'admiN@gmail.com', 10, 1539519098, 1539519098, 0, NULL),
(2, 'supplier', 'LrXl3oPsm3tmmZQ2T0Cg7QKfzdq26Vmm', '$2y$13$8mtE.o6bowY.K1RBotHMzuW6CEVY7H52K.c6a6WwAu2OAXHTqasH2', NULL, 'supplier@aa.c', 10, 1539519150, 1539519150, 0, NULL),
(3, 'karyawan', 'mmVzPXFUitXn-1JdB6z8DleOsmJvbS-S', '$2y$13$pmRzMxSzT7ZtHXtI1TwIPO4xw2EEhW6jesBnLRXzBZpH6Ru4VCqeu', NULL, 'karywan@k.c', 10, 1539519169, 1539519169, 0, NULL),
(4, 'owner', 'WWmBPEAg-aEI2vTlGDO0jzlMYI9k-FbM', '$2y$13$.rJC4b8wKcthi.J5yK8v6eZDh4GmDiYIhiAPxiyDhG9QRvwYMdXeq', NULL, 'owner@f.c', 10, 1539519189, 1539519189, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-kategori_id-barang-kategori-id` (`kategori_id`),
  ADD KEY `fk-user_id-barang-user-id` (`user_id`);

--
-- Indexes for table `beli_supplier`
--
ALTER TABLE `beli_supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-beli_supplier-supplier_id-supplier_id` (`supplier_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_beli_supplier`
--
ALTER TABLE `detail_beli_supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-detail_beli_supplier-barang_id-barang-id` (`barang_id`);

--
-- Indexes for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-detail_jual-penjualan_id-penjualan-id` (`penjualan_id`),
  ADD KEY `fk-detail_jual-barang_id-barang-id` (`barang_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-penjualan-user_id-user-id` (`user_id`);

--
-- Indexes for table `retur`
--
ALTER TABLE `retur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-supplier-user_id-user-id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `beli_supplier`
--
ALTER TABLE `beli_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_beli_supplier`
--
ALTER TABLE `detail_beli_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `detail_jual`
--
ALTER TABLE `detail_jual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `retur`
--
ALTER TABLE `retur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk-kategori_id-barang-kategori-id` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-user_id-barang-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `beli_supplier`
--
ALTER TABLE `beli_supplier`
  ADD CONSTRAINT `fk-beli_supplier-supplier_id-supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_beli_supplier`
--
ALTER TABLE `detail_beli_supplier`
  ADD CONSTRAINT `fk-detail_beli_supplier-barang_id-barang-id` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD CONSTRAINT `fk-detail_jual-barang_id-barang-id` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-detail_jual-penjualan_id-penjualan-id` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk-penjualan-user_id-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `fk-supplier-user_id-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
