-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2018 at 01:20 PM
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
-- Database: `ta`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `jumlah_barnag_baru` varchar(100) DEFAULT NULL,
  `tgl_kadaluarsa` date DEFAULT NULL,
  `status_barang` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id`, `produk_id`, `jumlah_barnag_baru`, `tgl_kadaluarsa`, `status_barang`) VALUES
(5, 1, '15', '2018-09-30', 2);

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
('m000000_000000_base', 1538272613),
('m130524_201442_init', 1538272614),
('m180916_081150_table_kebutuhan', 1538272621);

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_barang`
--

CREATE TABLE `mutasi_barang` (
  `id` int(11) NOT NULL,
  `produk_terjual` varchar(100) DEFAULT NULL,
  `produk_dikembalikan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `tgl_beli` date DEFAULT NULL,
  `jumlah` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `produk_id`, `tgl_beli`, `jumlah`) VALUES
(1, 1, '2018-03-09', '3');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `harga_jual` varchar(100) DEFAULT NULL,
  `harga_satuan_modal` varchar(100) DEFAULT NULL,
  `stok_awal` varchar(100) DEFAULT NULL,
  `tgl_kadaluarsa` date DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama`, `harga_jual`, `harga_satuan_modal`, `stok_awal`, `tgl_kadaluarsa`, `kategori`, `user_id`) VALUES
(1, 'Kripik Balado', '15000', '10000', '100', '2018-09-29', '2', 1),
(2, 'Galamai', '12000', '8000', '20', '2018-09-30', '2', 2),
(3, 'Kue lapan', '10000', '7000', '30', '2018-09-30', '2', 3);

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
(1, 'admin', 'SHVYMBisJxLFenLUlWgI9ZK5bhptsb7u', '$2y$13$Iaf0e8IzPpyHJCAgKWboEeXMkCBpL.O6srlJ83qz/ArmCeZ.npf7S', NULL, 'admin@fg.c', 10, 1538272757, 1538272757, 0, NULL),
(2, 'supplier1', '-bnNGG-tU60TROgzaBLWmvWNGprVLH0s', '$2y$13$JptANiHqGVMTLOD0HOjGKeMgXJ/pkUAO7qgh.mxR3dMezfaKl/8xe', NULL, 'sup@a.c', 10, 1538274106, 1538274106, 2, NULL),
(3, 'sup2', '3ZShMMPalBaXVJDuhaCDU4EwreqQHa3w', '$2y$13$gDDL1TeD8jZm.w1fBAwg5esbHl88o5nR2sbTTe9n7gng8aXX3d0te', NULL, 'sup2@as.sca', 10, 1538274132, 1538274132, 2, NULL),
(4, 'owner', 'PeYhk8juSE9B4glzh8cWNFnBottA6Vw3', '$2y$13$..X90zIuw/u0DbvpGEM3q.hrUjdZpZokIwn1H7yQG3UvbtZAYPjum', NULL, 'ow@s.s', 10, 1538274159, 1538274159, 1, NULL),
(5, 'karyawan', 'oV3Wc1712CW-cshhc-bHwQM6CcDK4eMq', '$2y$13$N2fCLWjopAhVKLwbvdmhcuQed0tRBvoe/C8XlaPmwzq1eXC8OKXFm', NULL, 'k@k.a', 10, 1538274191, 1538274191, 3, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-barang_masuk-produk_id-produk-id` (`produk_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `mutasi_barang`
--
ALTER TABLE `mutasi_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-penjualan-produk_id-produk-id` (`produk_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-produk-user_id-user-id` (`user_id`);

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
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mutasi_barang`
--
ALTER TABLE `mutasi_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `fk-barang_masuk-produk_id-produk-id` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk-penjualan-produk_id-produk-id` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk-produk-user_id-user-id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
