-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2022 at 11:09 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtokosepatu`
--

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` int(50) NOT NULL,
  `tanggal_pemesanan` date NOT NULL,
  `total_belanja` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_produk`
--

CREATE TABLE `pemesanan_produk` (
  `id_pemesanan_sepatu` int(50) NOT NULL,
  `id_pemesanan` int(50) NOT NULL,
  `id_sepatu` varchar(50) NOT NULL,
  `jumlah` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesanan_produk`
--

INSERT INTO `pemesanan_produk` (`id_pemesanan_sepatu`, `id_pemesanan`, `id_sepatu`, `jumlah`) VALUES
(34, 45, '21', 1),
(35, 47, '21', 1),
(36, 47, '21', 1),
(34, 45, '21', 1),
(35, 47, '21', 1),
(36, 47, '21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_sepatu` int(50) NOT NULL,
  `nama_sepatu` varchar(50) NOT NULL,
  `stok` int(50) NOT NULL,
  `harga` int(50) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_sepatu`, `nama_sepatu`, `stok`, `harga`, `gambar`) VALUES
(21, 'Patrobas Cloud Off White Low', 50, 12000, 'Patrobas Cloud Off White Low(237.000).png'),
(22, 'Patrobas Ivan Black White Low', 50, 13000, 'Patrobas Ivan Black White Low(205.400).png'),
(23, 'Patrobas Equip Black White Low', 50, 17000, 'Patrobas Equip Black White Low(229.100).png'),
(24, 'Ventela Basic White High', 50, 20000, 'Ventela Basic White High(171.600).png'),
(25, 'Ventela BTS Cream Low MURAH', 50, 12000, 'Ventela BTS Cream Low MURAH(218.400).png'),
(26, 'Ventela Ethnic Black Natural High', 50, 10000, 'Ventela Ethnic Black Natural High(163.800).png'),
(27, 'Ventela Ethnic Black Natural High', 50, 2000, 'Ventela Ethnic Black Natural High(232.000).png'),
(28, 'Ventela Evil x Gading Martin Low', 50, 8000, 'Ventela Evil x Gading Martin Low(320.000).png'),
(29, 'Ventela Evil x Gading Martin x High', 50, 10000, 'Ventela Evil x Gading Martin x High(300.000).png'),
(30, 'Ventela New Public White', 50, 10000, 'Ventela New Public White(260.000).png'),
(31, 'Ventela Public Cream Low', 50, 5000, 'Ventela Public Cream Low(200.000).png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nama_lengkap` varchar(25) NOT NULL,
  `jenis_kelamin` varchar(25) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(25) NOT NULL,
  `hp` varchar(25) NOT NULL,
  `status` enum('admin','user','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_lengkap`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `hp`, `status`) VALUES
(16, 'syahrul', '123', 'Syahrul Yusman', 'Laki-Laki', '0000-00-00', 'perumahan dwi', '08123456789', 'admin'),
(17, 'yusman', '123', 'yusman', 'Laki-Laki', '2022-06-16', 'perumahan dwite', '081234567890', 'user'),
(18, 'aldi', '123', 'renaldi', 'Laki-Laki', '2022-01-01', 'UIN Suska Riau', '08123456789', 'user'),
(19, 'aldo', '123', 'rinaldo', 'Laki-Laki', '2022-01-01', 'UIN Suska Riau', '081345678901', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `total_belanja` (`total_belanja`);

--
-- Indexes for table `pemesanan_produk`
--
ALTER TABLE `pemesanan_produk`
  ADD KEY `id_pemesanan_sepatu` (`id_pemesanan_sepatu`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD KEY `harga` (`harga`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan_produk` (`id_pemesanan_sepatu`) ON DELETE CASCADE,
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`total_belanja`) REFERENCES `produk` (`harga`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
