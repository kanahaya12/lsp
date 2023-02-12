-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2023 at 08:59 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `kategori` enum('umum','sains','sejarah') NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `t_terbit` datetime NOT NULL,
  `isbn` varchar(10) NOT NULL,
  `jb_baik` int(50) NOT NULL,
  `jb_rusak` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `kategori`, `penerbit`, `pengarang`, `t_terbit`, `isbn`, `jb_baik`, `jb_rusak`) VALUES
(1, 'cara bernafas', 'umum', 'Gramedia', 'siska jesika', '2014-04-08 08:51:03', '0012345', 1, 0),
(2, 'habis mati lampu terbitlah lilin', 'sejarah', 'erlangga', 'ibu kita', '2013-02-05 08:51:03', '002233', 2, 0),
(3, 'Meneliti darah', 'sains', 'elang', 'samudra', '2006-02-16 08:54:16', '0045678', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `identitas`
--

CREATE TABLE `identitas` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `n_hp` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `identitas`
--

INSERT INTO `identitas` (`id`, `nama`, `alamat`, `email`, `n_hp`) VALUES
(1, 'Sasa', 'jl. diujung timur', 'ffah222@gmail.com', '0219688721'),
(2, 'sisi', 'jl. dapur', 'deren@gmail.com', '089668777231');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `k_kategori` varchar(50) NOT NULL,
  `n_kagetori` enum('umum','sains','sejarah') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `k_kategori`, `n_kagetori`) VALUES
(1, '001', 'umum'),
(2, '002', 'sains'),
(3, '003', 'sejarah');

-- --------------------------------------------------------

--
-- Table structure for table `pemberitahuan`
--

CREATE TABLE `pemberitahuan` (
  `id` int(11) NOT NULL,
  `isi_pemberitahuan` text NOT NULL,
  `level_user` varchar(20) NOT NULL,
  `status` enum('terkirim','dibaca') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemberitahuan`
--

INSERT INTO `pemberitahuan` (`id`, `isi_pemberitahuan`, `level_user`, `status`) VALUES
(1, 'Balikin bukunya dong', '1', 'terkirim'),
(2, 'buku udah balik yaa', '2', 'dibaca');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `n_anggota` varchar(50) NOT NULL,
  `judul_b` varchar(50) NOT NULL,
  `tgl_peminjam` datetime NOT NULL,
  `kd_dipinjam` enum('baik','rusak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `n_anggota`, `judul_b`, `tgl_peminjam`, `kd_dipinjam`) VALUES
(1, 'sasa', 'cara bernafas', '2023-02-16 09:16:21', 'baik'),
(2, 'sisi', 'meneliti darah', '2016-04-12 03:16:21', 'baik'),
(3, 'fafah', 'habis mati lampu terbitlah lilin', '2023-03-31 09:19:34', 'rusak');

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id` int(11) NOT NULL,
  `k_penerbit` varchar(50) NOT NULL,
  `n_penerbit` varchar(100) NOT NULL,
  `verif` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id`, `k_penerbit`, `n_penerbit`, `verif`) VALUES
(1, '0011', 'gramedia', 'aktif'),
(2, '0022', 'erlangga', 'aktif'),
(3, '0033', 'elang', 'non aktif');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id` int(11) NOT NULL,
  `n_anggota` varchar(100) NOT NULL,
  `j_buku` varchar(50) NOT NULL,
  `tgl_pengembalian` datetime NOT NULL,
  `kd_dipinjam` enum('baik','rusak') NOT NULL,
  `denda` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id`, `n_anggota`, `j_buku`, `tgl_pengembalian`, `kd_dipinjam`, `denda`) VALUES
(1, 'fafah', 'habis mati lampu terbitlah lilin', '2024-02-15 09:22:04', 'rusak', '100'),
(2, 'sasa', 'meneliti darah', '2023-02-01 03:22:04', 'baik', '0'),
(3, 'sisi', 'cara bernafas', '2023-02-01 03:23:51', 'baik', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id` int(11) NOT NULL,
  `penerima` int(11) NOT NULL,
  `pengirim` int(11) NOT NULL,
  `j_pesan` varchar(50) NOT NULL,
  `isi_pesan` text NOT NULL,
  `status` enum('terkirim','dibaca') NOT NULL,
  `tgl_kirim` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id`, `penerima`, `pengirim`, `j_pesan`, `isi_pesan`, `status`, `tgl_kirim`) VALUES
(1, 0, 0, 'balikin', 'tolong balikin buku nya', 'terkirim', '2023-02-23 09:26:11'),
(2, 0, 0, 'dibalikin', 'sudah dibalikin yaa', 'dibaca', '2025-03-31 09:26:11'),
(3, 0, 0, 'kamu dapet denda', 'maap yaak, harus bayar', 'dibaca', '2023-02-28 09:27:29');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `kode_u` int(20) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `alamat` text NOT NULL,
  `verif` enum('aktif','non_aktif') NOT NULL,
  `role` enum('admin','angota') NOT NULL,
  `join_date` datetime NOT NULL,
  `terakhir_login` datetime NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `kode_u`, `nis`, `fullname`, `username`, `password`, `kelas`, `alamat`, `verif`, `role`, `join_date`, `terakhir_login`, `foto`) VALUES
(1, 1, '0101', 'Siti sarifah', 'Sasa', '123', '12', 'jl. pertigaan', 'aktif', 'angota', '2023-02-10 08:45:22', '2023-02-28 08:45:22', ''),
(2, 2, '0102', 'sarifah nur', 'Sisi', '231', '11', 'jl. dulu', 'aktif', 'angota', '2023-02-09 08:45:22', '2023-02-10 08:45:22', ''),
(3, 3, '0103', 'nur khotimah', 'fafah', '456', '10', 'jl. apa tuh', 'non_aktif', 'angota', '2023-02-22 09:28:37', '2023-02-24 09:28:37', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `identitas`
--
ALTER TABLE `identitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `identitas`
--
ALTER TABLE `identitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
