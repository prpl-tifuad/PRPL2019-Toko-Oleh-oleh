-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2019 at 07:29 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jogjastore`
--

-- --------------------------------------------------------

--
-- Table structure for table `carabayar`
--

CREATE TABLE `carabayar` (
  `id_carabayar` int(11) NOT NULL,
  `rek` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carabayar`
--

INSERT INTO `carabayar` (`id_carabayar`, `rek`, `phone`) VALUES
(1, '080808081232423423', '123456789101');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(5) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  `id_produk` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `subtotal` int(11) NOT NULL,
  `ongberat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `id_checkout` varchar(5) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  `an` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `ongcart` int(11) NOT NULL,
  `ongberat` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id_contact` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `paging` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id_contact`, `phone`, `paging`, `email`, `alamat`) VALUES
(1, '| WA 081358911050', 12, 'okky.alwi123@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `control`
--

CREATE TABLE `control` (
  `id_control` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `control`
--

INSERT INTO `control` (`id_control`, `user`, `pass`) VALUES
(25, 'con', '7ed201fa20d25d22b291dc85ae9e5ced'),
(31, 'okky', 'c821adbe2db2d35a30551480105cb919'),
(32, 'test', '098f6bcd4621d373cade4e832627b4f6'),
(33, 'testing', 'ae2b1fca515949e5d54fb22b8ed95575');

-- --------------------------------------------------------

--
-- Table structure for table `finish`
--

CREATE TABLE `finish` (
  `id_finish` int(11) NOT NULL,
  `id_checkout` varchar(5) NOT NULL,
  `kode_veri` varchar(5) NOT NULL,
  `totalbayar` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama`) VALUES
(1, 'kabupaten'),
(2, 'kota'),
(3, 'kelurahan'),
(4, 'desa');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `id_produk` varchar(10) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  `komentar` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `id_checkout` varchar(5) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `id_user` varchar(5) NOT NULL,
  `id_produk` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `subtotal` int(11) NOT NULL,
  `ongberat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ongkirberat`
--

CREATE TABLE `ongkirberat` (
  `id_berat` int(11) NOT NULL,
  `ongkir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ongkirberat`
--

INSERT INTO `ongkirberat` (`id_berat`, `ongkir`) VALUES
(1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` varchar(10) NOT NULL,
  `id_kat_produk` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `deskripsi` text NOT NULL,
  `berat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kat_produk`, `nama`, `harga`, `stok`, `gambar`, `tanggal`, `deskripsi`, `berat`) VALUES
('195b41', 'tidak ada', 'Yangko Aneka Rasa', 40000, 200, 'img/produk/Yangko.jpg', '2019-06-21 00:18:41', 'Yangko Aneka Rasa [Khas Kotagede Jogja] Isi: 30 biji Rasa: kacang, coklat, durian, strawberry, nangka Komposisi: tepung ketan, gula pasir, pewarna makanan, essen Berat Netto: 500 gram Berat kirim: 600 gram Tgl kadaluwarsa: 7 hari dari pengiriman ========================== Note: Khusus makanan ini, baru akan kirim pada hari berikutnya setelah order kami terima. Kami baru akan orderkan makanan tsb langsung dari pembuatnya, sehingga terjamin makanan tersebut benar2 baru bukan stok lama.', 1),
('77071e', 'tidak ada', 'UKEL dan BANJAR', 30000, 111, 'img/produk/Ukel and banjar.jpg', '2019-06-21 00:19:47', 'UKEL n BANJAR Bu Noto... Ukel dan BAnjar adalah makanan khas kotagede. Ukel dan Banjar adalah kue renyah yang terbuat dari tepung ketan dan telur. Yang membedakan keduanya adalah UKEL dilumuri tepung gula sehingga manis rasanya, BANJAR polosan saja jadi gurih. Ukel dan BAnjar cocok untuk oleh-oleh dan camilan keluarga', 1),
('9f7536', 'tidak ada', 'Kue Lumpur Labu Kuning', 24000, 1000, 'img/produk/kue lumpur.jpg', '2019-06-21 00:15:51', 'kue lumpur menjadi sasaran wisata kuliner yang dicari oleh wisatawan. kue lumpur adalah makanan ringan dengan bahan utama biasanya labu kuning atau kentang lalu diberi santan, tepung terigu dan telur dan diberi kismis sebagai topping. kue lumpur memiliki rasa yang manis gurih yang pas ketika disantap. sedangkan tekstur dari kue lumpur sendiri sangat lembut dan meleleh di mulut. aroma yang dihasilkan kue lumpur juga sangat khas karena menggunakan vanili harga: 25k/ kotak(isi 15)', 1),
('df36f7', 'tidak ada', 'Krasikan Ketan Asli', 25000, 500, 'img/produk/krasikan.jpg', '2019-06-21 00:17:17', 'Krasikan Ketan Asli * Makanan Tradisional legit..manis dan gurih terbuat dari tepung ketan, santan kelapa & gula jawa asli. * Fresh/baru * Tanpa bahan pengawet dan zat2 yang berbahaya. * Diproses secara khusus dan higienis, sehingga Rasa Khas Krasikan Ketan ini menjadi sangat istimewa, lebih tahan lama. * Krasikan ini mampu bertahan hingga 3 Bulan pada suhu ruang. (Tanpa Masuk Kulkas.) * Sangat cocok untuk camilan keluarga, oleh2, piknik, maupun acara selamatan/pesta. * Tersedia Kemasan mini untuk berbagai acara : Selamatan, Lamaran, Syukuran mapun pesta', 1),
('e06a9f', 'tidak ada', 'Wajik Pandan gula pasir/wajik gula merah', 50000, 243, 'img/produk/wajik.jpg', '2019-06-21 00:20:49', 'dipacking menggunakan plastik mika, terbuat dari ketan asli tanpa campuran beras dan bukan penjual musiman gan, tiap hari produksi menggunakan bahan baku yg fresh cocok buat acara arisan,meeting,gathering,resepsi,dll. spesifikasi loyang +-15*25*4cm harga 50000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rkat_produk`
--

CREATE TABLE `rkat_produk` (
  `id_kat_produk` varchar(10) NOT NULL,
  `kat_produk` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id_service` int(11) NOT NULL,
  `tanya` text NOT NULL,
  `jawab` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id_service`, `tanya`, `jawab`, `status`) VALUES
(4, 'Sudah 2 hari barang saya belum dikirim ini gimana ya?', 'Mohon Untuk menunggu, permintaan sedang diproses', 'YES'),
(6, 'Bagaimana Cara Konfirmasi Pembayaran', 'Dengan Mengirim bukti pembayaran ke wa kami', 'YES'),
(7, 'medjfjjsjsjdsmdma', 'mjghfghfhjgjgj', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id_slider` int(11) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id_slider`, `gambar`) VALUES
(9, 'img/slider/6.jpg'),
(10, 'img/slider/5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(5) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`, `gambar`) VALUES
('29d34', 'con', 'asdasdasd@gmail.com', 'con', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carabayar`
--
ALTER TABLE `carabayar`
  ADD PRIMARY KEY (`id_carabayar`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id_checkout`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_contact`);

--
-- Indexes for table `control`
--
ALTER TABLE `control`
  ADD PRIMARY KEY (`id_control`);

--
-- Indexes for table `finish`
--
ALTER TABLE `finish`
  ADD PRIMARY KEY (`id_finish`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `ongkirberat`
--
ALTER TABLE `ongkirberat`
  ADD PRIMARY KEY (`id_berat`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `rkat_produk`
--
ALTER TABLE `rkat_produk`
  ADD PRIMARY KEY (`id_kat_produk`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id_slider`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carabayar`
--
ALTER TABLE `carabayar`
  MODIFY `id_carabayar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id_contact` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `control`
--
ALTER TABLE `control`
  MODIFY `id_control` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `finish`
--
ALTER TABLE `finish`
  MODIFY `id_finish` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ongkirberat`
--
ALTER TABLE `ongkirberat`
  MODIFY `id_berat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
