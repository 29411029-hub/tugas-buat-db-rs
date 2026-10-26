-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Okt 2026 pada 14.27
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rumah_sakit`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `id_poli` int(11) DEFAULT NULL,
  `spesialisasi` varchar(100) DEFAULT NULL,
  `tarif_konsultasi` decimal(12,2) NOT NULL,
  `status_dokter` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `id_poli`, `spesialisasi`, `tarif_konsultasi`, `status_dokter`) VALUES
(1, 'Dr. Budi, Sp.PD', 1, 'Konsultan Penyakit Dalam', 150000.00, 'Aktif'),
(2, 'Dr. Siti, Sp.A', 2, 'Spesialis Anak', 120000.00, 'Aktif'),
(3, 'Dr. Andi, Sp.B', 3, 'Spesialis Bedah Umum', 200000.00, 'Aktif'),
(4, 'Dr. Rina, Sp.M', 4, 'Spesialis Mata', 130000.00, 'Aktif'),
(5, 'Dr. Joko, Sp.S', 5, 'Spesialis Saraf', 170000.00, 'Cuti'),
(6, 'Dr. Maya, Sp.A', 2, 'Spesialis Anak', 120000.00, 'Aktif'),
(7, 'Dr. Hendra, Sp.PD', 1, 'Penyakit Dalam', 150000.00, 'Aktif'),
(8, 'Dr. Lestari, Sp.B', 3, 'Bedah', 200000.00, 'Aktif'),
(9, 'Dr. Doni, Sp.M', 4, 'Mata', 130000.00, 'Aktif'),
(10, 'Dr. Wati, Sp.S', 5, 'Saraf', 170000.00, 'Nonaktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kunjungan`
--

CREATE TABLE `kunjungan` (
  `id_kunjungan` int(11) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `jenis_kunjungan` varchar(30) NOT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `status_kunjungan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kunjungan`
--

INSERT INTO `kunjungan` (`id_kunjungan`, `id_pasien`, `id_dokter`, `tanggal_kunjungan`, `jenis_kunjungan`, `diagnosis`, `status_kunjungan`) VALUES
(1, 1, 1, '2026-10-01', 'Umum', 'Hipertensi ringan', 'Selesai'),
(2, 2, 2, '2026-10-02', 'Kontrol', 'Demam berdarah membaik', 'Selesai'),
(3, 3, 3, '2026-10-03', 'Darurat', 'Appendicitis akut', 'Selesai'),
(4, 4, 4, '2026-10-04', 'Umum', 'Iritasi mata ringan', 'Selesai'),
(5, 5, 1, '2026-10-05', 'Kontrol', 'Diabetes kontrol', 'Selesai'),
(6, 6, 2, '2026-10-06', 'Darurat', 'Asthma bronchiale', 'Diperiksa'),
(7, 7, 3, '2026-10-07', 'Umum', 'Hernia inguinalis', 'Menunggu'),
(8, 8, 4, '2026-10-08', 'Darurat', 'Kecelakaan - Trauma mata', 'Batal'),
(9, 1, 2, '2026-10-09', 'Kontrol', 'Check-up rutin anak', 'Selesai'),
(10, 3, 1, '2026-10-10', 'Umum', 'Konsultasi umum', 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL CHECK (`jenis_kelamin` in ('L','P')),
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `no_hp`) VALUES
(1, 'Ahmad Fauzi', 'L', '1990-05-12', 'Jl. Merdeka No. 10', '081234567890'),
(2, 'Siti Aminah', 'P', '1985-08-20', 'Jl. Melati No. 5', '081345678901'),
(3, 'Rian Hidayat', 'L', '1995-03-15', 'Jl. Sudirman No. 12', '081456789012'),
(4, 'Dewi Lestari', 'P', '2000-12-01', 'Jl. Ahmad Yani No. 8', '081567890123'),
(5, 'Eko Prasetyo', 'L', '1988-07-25', 'Jl. Diponegoro No. 3', '081678901234'),
(6, 'Ratna Sari', 'P', '1992-11-10', 'Jl. Pahlawan No. 15', '081789012345'),
(7, 'Bambang Sudibyo', 'L', '1975-02-18', 'Jl. Gajah Mada No. 20', '081890123456'),
(8, 'Lala Karmila', 'P', '1998-09-30', 'Jl. Hayam Wuruk No. 7', '081901234567'),
(9, 'Tono Suwiryo', 'L', '1991-04-05', 'Jl. Kenanga No. 4', '081223344556'),
(10, 'Siska Melina', 'P', '1996-06-14', 'Jl. Anggrek No. 9', '081334455667');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_kunjungan` int(11) DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `biaya_konsultasi` decimal(12,2) DEFAULT 0.00,
  `biaya_obat` decimal(12,2) DEFAULT 0.00,
  `biaya_laboratorium` decimal(12,2) DEFAULT 0.00,
  `diskon` decimal(12,2) DEFAULT 0.00,
  `metode_bayar` varchar(30) DEFAULT NULL,
  `status_bayar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_kunjungan`, `tanggal_bayar`, `biaya_konsultasi`, `biaya_obat`, `biaya_laboratorium`, `diskon`, `metode_bayar`, `status_bayar`) VALUES
(1, 1, '2026-10-01', 150000.00, 50000.00, 0.00, 10000.00, 'Tunai', 'Lunas'),
(2, 2, '2026-10-02', 120000.00, 75000.00, 50000.00, 0.00, 'Transfer', 'Lunas'),
(3, 3, '2026-10-03', 200000.00, 150000.00, 100000.00, 25000.00, 'Asuransi', 'Lunas'),
(4, 4, '2026-10-04', 130000.00, 30000.00, 0.00, 0.00, 'Tunai', 'Lunas'),
(5, 5, '2026-10-05', 150000.00, 45000.00, 0.00, 5000.00, 'Transfer', 'Belum Lunas'),
(6, 6, '2026-10-06', 120000.00, 100000.00, 150000.00, 0.00, 'Asuransi', 'Belum Lunas'),
(7, 7, '2026-10-07', 200000.00, 0.00, 0.00, 0.00, 'Tunai', 'Belum Lunas'),
(8, 8, '2026-10-08', 130000.00, 0.00, 0.00, 0.00, 'Tunai', 'Belum Lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `poli`
--

CREATE TABLE `poli` (
  `id_poli` int(11) NOT NULL,
  `nama_poli` varchar(100) NOT NULL,
  `lantai` int(11) NOT NULL,
  `status_poli` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `poli`
--

INSERT INTO `poli` (`id_poli`, `nama_poli`, `lantai`, `status_poli`) VALUES
(1, 'Penyakit Dalam', 2, 'Aktif'),
(2, 'Anak', 1, 'Aktif'),
(3, 'Bedah', 3, 'Aktif'),
(4, 'Mata', 2, 'Aktif'),
(5, 'Saraf', 2, 'Nonaktif');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_dokter_kunjungan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_dokter_kunjungan` (
`nama_dokter` varchar(100)
,`spesialisasi` varchar(100)
,`nama_poli` varchar(100)
,`id_kunjungan` int(11)
,`status_kunjungan` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_keterangan_diskon`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_keterangan_diskon` (
`id_pembayaran` int(11)
,`id_kunjungan` int(11)
,`diskon` decimal(12,2)
,`keterangan_diskon` varchar(21)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_klasifikasi_biaya`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_klasifikasi_biaya` (
`id_pembayaran` int(11)
,`id_kunjungan` int(11)
,`total_biaya` decimal(15,2)
,`klasifikasi_biaya` varchar(8)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_kunjungan_lengkap`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_kunjungan_lengkap` (
`id_pasien` int(11)
,`nama_pasien` varchar(100)
,`id_dokter` int(11)
,`nama_dokter` varchar(100)
,`nama_poli` varchar(100)
,`spesialisasi` varchar(100)
,`tanggal_kunjungan` date
,`status_kunjungan` varchar(30)
,`diagnosis` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_laporan_pembayaran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_laporan_pembayaran` (
`nama_pasien` varchar(100)
,`nama_dokter` varchar(100)
,`nama_poli` varchar(100)
,`tanggal_kunjungan` date
,`diagnosis` varchar(200)
,`total_biaya_sebelum_diskon` decimal(14,2)
,`diskon` decimal(12,2)
,`total_tagihan_setelah_diskon` decimal(15,2)
,`metode_pembayaran` varchar(30)
,`status_pembayaran` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_prioritas_pelayanan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_prioritas_pelayanan` (
`id_kunjungan` int(11)
,`jenis_kunjungan` varchar(30)
,`status_kunjungan` varchar(30)
,`prioritas_pelayanan` varchar(17)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_rekap_pasien`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_rekap_pasien` (
`id_pasien` int(11)
,`nama_pasien` varchar(100)
,`no_hp` varchar(15)
,`jumlah_kunjungan` bigint(21)
,`tanggal_kunjungan_terakhir` date
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_dokter_kunjungan`
--
DROP TABLE IF EXISTS `view_dokter_kunjungan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_dokter_kunjungan`  AS SELECT `d`.`nama_dokter` AS `nama_dokter`, `d`.`spesialisasi` AS `spesialisasi`, `po`.`nama_poli` AS `nama_poli`, `k`.`id_kunjungan` AS `id_kunjungan`, `k`.`status_kunjungan` AS `status_kunjungan` FROM ((`dokter` `d` left join `kunjungan` `k` on(`k`.`id_dokter` = `d`.`id_dokter`)) join `poli` `po` on(`d`.`id_poli` = `po`.`id_poli`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_keterangan_diskon`
--
DROP TABLE IF EXISTS `view_keterangan_diskon`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_keterangan_diskon`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_kunjungan` AS `id_kunjungan`, `pembayaran`.`diskon` AS `diskon`, if(`pembayaran`.`diskon` > 0,'Mendapat Diskon','Tidak Mendapat Diskon') AS `keterangan_diskon` FROM `pembayaran` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_klasifikasi_biaya`
--
DROP TABLE IF EXISTS `view_klasifikasi_biaya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_klasifikasi_biaya`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_kunjungan` AS `id_kunjungan`, `pembayaran`.`biaya_konsultasi`+ `pembayaran`.`biaya_obat` + `pembayaran`.`biaya_laboratorium` - `pembayaran`.`diskon` AS `total_biaya`, if(`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat` + `pembayaran`.`biaya_laboratorium` - `pembayaran`.`diskon` < 100000,'Ekonomis',if(`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat` + `pembayaran`.`biaya_laboratorium` - `pembayaran`.`diskon` < 300000,'Menengah','Premium')) AS `klasifikasi_biaya` FROM `pembayaran` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_kunjungan_lengkap`
--
DROP TABLE IF EXISTS `view_kunjungan_lengkap`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_kunjungan_lengkap`  AS SELECT `p`.`id_pasien` AS `id_pasien`, `p`.`nama_pasien` AS `nama_pasien`, `d`.`id_dokter` AS `id_dokter`, `d`.`nama_dokter` AS `nama_dokter`, `po`.`nama_poli` AS `nama_poli`, `d`.`spesialisasi` AS `spesialisasi`, `k`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `k`.`status_kunjungan` AS `status_kunjungan`, `k`.`diagnosis` AS `diagnosis` FROM (((`kunjungan` `k` join `pasien` `p` on(`k`.`id_pasien` = `p`.`id_pasien`)) join `dokter` `d` on(`k`.`id_dokter` = `d`.`id_dokter`)) join `poli` `po` on(`d`.`id_poli` = `po`.`id_poli`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_laporan_pembayaran`
--
DROP TABLE IF EXISTS `view_laporan_pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan_pembayaran`  AS SELECT `p`.`nama_pasien` AS `nama_pasien`, `d`.`nama_dokter` AS `nama_dokter`, `po`.`nama_poli` AS `nama_poli`, `k`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `k`.`diagnosis` AS `diagnosis`, coalesce(`pb`.`biaya_konsultasi`,0) + coalesce(`pb`.`biaya_obat`,0) + coalesce(`pb`.`biaya_laboratorium`,0) AS `total_biaya_sebelum_diskon`, coalesce(`pb`.`diskon`,0) AS `diskon`, coalesce(`pb`.`biaya_konsultasi`,0) + coalesce(`pb`.`biaya_obat`,0) + coalesce(`pb`.`biaya_laboratorium`,0) - coalesce(`pb`.`diskon`,0) AS `total_tagihan_setelah_diskon`, coalesce(`pb`.`metode_bayar`,'Belum Bayar') AS `metode_pembayaran`, coalesce(`pb`.`status_bayar`,'Belum Ada Pembayaran') AS `status_pembayaran` FROM ((((`kunjungan` `k` join `pasien` `p` on(`k`.`id_pasien` = `p`.`id_pasien`)) join `dokter` `d` on(`k`.`id_dokter` = `d`.`id_dokter`)) join `poli` `po` on(`d`.`id_poli` = `po`.`id_poli`)) left join `pembayaran` `pb` on(`k`.`id_kunjungan` = `pb`.`id_kunjungan`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_prioritas_pelayanan`
--
DROP TABLE IF EXISTS `view_prioritas_pelayanan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_prioritas_pelayanan`  AS SELECT `kunjungan`.`id_kunjungan` AS `id_kunjungan`, `kunjungan`.`jenis_kunjungan` AS `jenis_kunjungan`, `kunjungan`.`status_kunjungan` AS `status_kunjungan`, if(`kunjungan`.`status_kunjungan` = 'Batal','Tidak Dilayani',if(`kunjungan`.`jenis_kunjungan` = 'Darurat' and `kunjungan`.`status_kunjungan` <> 'Batal','Prioritas Tinggi',if(`kunjungan`.`jenis_kunjungan` = 'Kontrol' and `kunjungan`.`status_kunjungan` = 'Selesai','Kontrol Selesai','Pelayanan Reguler'))) AS `prioritas_pelayanan` FROM `kunjungan` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_rekap_pasien`
--
DROP TABLE IF EXISTS `view_rekap_pasien`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_rekap_pasien`  AS SELECT `p`.`id_pasien` AS `id_pasien`, `p`.`nama_pasien` AS `nama_pasien`, `p`.`no_hp` AS `no_hp`, count(`k`.`id_kunjungan`) AS `jumlah_kunjungan`, max(`k`.`tanggal_kunjungan`) AS `tanggal_kunjungan_terakhir` FROM (`pasien` `p` left join `kunjungan` `k` on(`p`.`id_pasien` = `k`.`id_pasien`)) GROUP BY `p`.`id_pasien`, `p`.`nama_pasien`, `p`.`no_hp` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indeks untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id_kunjungan`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD UNIQUE KEY `id_kunjungan` (`id_kunjungan`);

--
-- Indeks untuk tabel `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  MODIFY `id_kunjungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `poli`
--
ALTER TABLE `poli`
  MODIFY `id_poli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_kunjungan`) REFERENCES `kunjungan` (`id_kunjungan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
