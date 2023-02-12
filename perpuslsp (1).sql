-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jan 2023 pada 11.54
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpuslsp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul` varchar(125) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_penerbit` int(11) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `isbn` int(50) NOT NULL,
  `j_buku_baik` int(5) NOT NULL,
  `j_buku_rusak` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id`, `judul`, `id_kategori`, `id_penerbit`, `pengarang`, `tahun_terbit`, `isbn`, `j_buku_baik`, `j_buku_rusak`) VALUES
(1, 'stupid', 1, 1, 'naya', 2005, 1210, 15, 1),
(2, 'Pangeran Bodoh', 2, 2, 'D.O.', 2005, 1261, 12, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `identitas`
--

CREATE TABLE `identitas` (
  `id` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(25) NOT NULL,
  `nomor_hp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `identitas`
--

INSERT INTO `identitas` (`id`, `nama`, `alamat`, `email`, `nomor_hp`) VALUES
(1, 'naydo', 'Jl kopi', 'naydo@gmail.com', '081261'),
(2, 'ucoo', 'Jl hatinaya', 'ucoo@gmail.com', '081288');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kode` varchar(25) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `kode`, `nama`) VALUES
(1, 'umum', 'umum'),
(2, 'umum', 'Buku Hafalan'),
(3, 'sains', 'Buku Biologi'),
(4, 'mistis', 'mistis'),
(5, 'horor', 'horor');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemberitahuan`
--

CREATE TABLE `pemberitahuan` (
  `id` int(11) NOT NULL,
  `isi` text NOT NULL,
  `level_user` enum('Admin','User') DEFAULT NULL,
  `status` enum('Aktif','Non-aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemberitahuan`
--

INSERT INTO `pemberitahuan` (`id`, `isi`, `level_user`, `status`) VALUES
(1, 'Ini adalah Admin', 'Admin', 'Aktif'),
(2, 'Admin Off sdg turu', 'Admin', 'Non-aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `id_user` varchar(125) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `tanggal_peminjaman` datetime NOT NULL,
  `tanggal_pengembalian` datetime NOT NULL,
  `kondisi_buku_saat_dipinjam` enum('Baik','Rusak') NOT NULL,
  `kondisi_buku_saat_dikembalikan` enum('Baik','Rusak') NOT NULL,
  `denda` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `id_user`, `id_buku`, `tanggal_peminjaman`, `tanggal_pengembalian`, `kondisi_buku_saat_dipinjam`, `kondisi_buku_saat_dikembalikan`, `denda`) VALUES
(1, '18', 2, '2023-01-10 02:45:16', '2023-01-10 02:45:16', 'Baik', 'Rusak', '10'),
(2, '27', 3, '2023-01-10 02:45:52', '2023-01-10 02:45:52', 'Rusak', 'Rusak', '12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id` int(11) NOT NULL,
  `kode_penerbit` varchar(25) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `verif_penerbit` enum('Sudah','Belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id`, `kode_penerbit`, `nama`, `verif_penerbit`) VALUES
(1, '1261', 'KANAHAYA', 'Sudah'),
(2, '1288', 'KYUNGSOO', 'Belum'),
(3, '1288', 'NAYADO', 'Sudah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesan`
--

CREATE TABLE `pesan` (
  `id` int(11) NOT NULL,
  `id_penerima` int(11) NOT NULL,
  `id_pengirim` int(11) NOT NULL,
  `judul_pesan` varchar(25) NOT NULL,
  `isi_pesan` text NOT NULL,
  `status` enum('Terkirim','Dibaca') NOT NULL,
  `tanggal_kirim` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesan`
--

INSERT INTO `pesan` (`id`, `id_penerima`, `id_pengirim`, `judul_pesan`, `isi_pesan`, `status`, `tanggal_kirim`) VALUES
(1, 2, 2, 'Buku ini sudah di jual', 'Tolong dibeli sedang Butuh Uang', 'Dibaca', '2023-01-10 02:46:31'),
(2, 3, 3, 'Buku ini rusak', 'Tolong bagi yang merusak segera ganti atau diperbaikan', 'Terkirim', '2023-01-10 02:46:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `kode` varchar(25) NOT NULL,
  `nis` char(20) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `verif` enum('Sudah','Belum') NOT NULL,
  `role` enum('Admin','User') NOT NULL,
  `join_date` datetime NOT NULL,
  `terakhir_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `kode`, `nis`, `fullname`, `username`, `password`, `kelas`, `alamat`, `verif`, `role`, `join_date`, `terakhir_login`) VALUES
(1, '12', '1221', 'kanahaya', 'naya', '123', 'XII RPL', 'Jl.Kopi', 'Sudah', 'User', '2023-01-10 02:48:03', '2023-01-10 02:48:03'),
(2, '1288', '0102', 'naya', 'doy', 'naya jodoh D.O.', '12', 'PEKAYON', 'Sudah', 'Admin', '2023-01-12 08:36:02', '2023-01-17 08:36:02');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penerbit` (`id_penerbit`),
  ADD KEY `id_penerbit_2` (`id_penerbit`),
  ADD KEY `nama_penerbit` (`id_penerbit`),
  ADD KEY `penerbit_buku` (`id_penerbit`),
  ADD KEY `nama_penerbit_2` (`id_penerbit`),
  ADD KEY `kategori_buku` (`id_kategori`),
  ADD KEY `judul_buku` (`judul`);

--
-- Indeks untuk tabel `identitas`
--
ALTER TABLE `identitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_app` (`nama`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_kategori` (`kode`);

--
-- Indeks untuk tabel `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judul_buku` (`id_buku`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_penerbit` (`nama`);

--
-- Indeks untuk tabel `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `identitas`
--
ALTER TABLE `identitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
