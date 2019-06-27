-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2019 at 08:06 AM
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
-- Database: `toko_oleh`
--

-- --------------------------------------------------------

--
-- Table structure for table `carabayar`
--

CREATE TABLE `carabayar` (
  `id_carabayar` int(11) NOT NULL,
  `rek` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carabayar`
--

INSERT INTO `carabayar` (`id_carabayar`, `rek`, `phone`) VALUES
(1, '686501014400575', '085895092046');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id_cart`, `id_user`, `id_produk`, `jumlah`, `tanggal`, `subtotal`, `ongberat`) VALUES
(12, '88a9c', '493124', 1, '2019-06-26', 40000, 1000);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`id_checkout`, `id_user`, `an`, `alamat`, `phone`, `ongcart`, `ongberat`, `status`, `tanggal`) VALUES
('7eab0', '07681', 'Amin', 'jl bakung', '081939393908', 225000, 6000, 'success', '2019-06-26');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `control`
--

INSERT INTO `control` (`id_control`, `user`, `pass`) VALUES
(32, 'amin', '30ae43ad1aa0a416699051b73a3dfcf6'),
(31, 'okky', 'c821adbe2db2d35a30551480105cb919');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `finish`
--

INSERT INTO `finish` (`id_finish`, `id_checkout`, `kode_veri`, `totalbayar`, `status`, `tanggal`) VALUES
(6, '7eab0', '21ff7', 231000, 'success', '2019-06-26'),
(5, 'b7d8a', '08b33', 56000, 'pending', '2019-06-26');

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id_komentar`, `id_produk`, `id_user`, `komentar`, `tanggal`) VALUES
(1, 'dd29fa', '7a42c', 'Indah Menawan', '2017-09-04'),
(2, '628347', '288da', 'Sip Sip', '2017-09-05'),
(3, 'caf086', '288da', 'saya mintanya warna hitam', '2017-09-05'),
(4, 'dd29fa', 'fc05a', 'Saya rasa ini bukan Asli deh.. soalnya desainnya beda sama yang Barcelona pakai', '2017-12-26'),
(5, 'd5447d', '8b71c', 'Keren nih bukunya, gue suka bacanya, jadi lebih memprkuat iman..', '2018-01-18'),
(6, '9e7d54', 'fc05a', 'sdjkjshsogsjogjsdogjfhlfgkdfnjldfkhndf\r\nsdflknldfkljfgdkljfdkjlghkjlhgdklj', '2019-05-28');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id_log`, `id_checkout`, `id_cart`, `id_user`, `id_produk`, `jumlah`, `tanggal`, `subtotal`, `ongberat`) VALUES
(1, 'd1dff', 1, '335ec', '493124', 12, '2019-05-31', 480000, 12000),
(2, '63906', 2, '335ec', '03602d', 2, '2019-06-12', 60000, 2000),
(3, '63906', 3, '335ec', 'dfc72c', 1, '2019-06-12', 55000, 1000),
(4, 'ae58d', 5, '29d34', 'd2ab72', 1, '2019-06-19', 25000, 1000),
(5, '7eab0', 11, '07681', '493124', 5, '2019-06-26', 200000, 5000),
(6, '7eab0', 8, '07681', 'f1e8e2', 1, '2019-06-26', 25000, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `ongkirberat`
--

CREATE TABLE `ongkirberat` (
  `id_berat` int(11) NOT NULL,
  `ongkir` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kat_produk`, `nama`, `harga`, `stok`, `gambar`, `tanggal`, `deskripsi`, `berat`) VALUES
('dfc72c', 'd04755', 'Wajik Pandan gula pasir/wajik gula merah per loyang', 55000, 149, 'img/produk/wajik.jpg', '2019-05-30 23:35:14', 'dipacking menggunakan plastik mika, terbuat dari ketan asli tanpa campuran beras dan bukan penjual musiman gan,\r\ntiap hari produksi menggunakan bahan baku yg fresh cocok buat acara arisan,meeting,gathering,resepsi,dll.\r\n\r\nspesifikasi \r\nloyang +-15*25*4cm harga 50000', 1),
('f1e8e2', '442669', 'Kue Lumpur Labu Kuning', 25000, 199, 'img/produk/kue lumpur.jpg', '2019-06-13 22:06:00', 'kue lumpur menjadi sasaran wisata kuliner yang dicari oleh wisatawan. kue lumpur adalah makanan ringan dengan bahan utama biasanya labu kuning atau kentang lalu diberi santan, tepung terigu dan telur dan diberi kismis sebagai topping. kue lumpur memiliki rasa yang manis gurih yang pas ketika disantap. sedangkan tekstur dari kue lumpur sendiri sangat lembut dan meleleh di mulut. aroma yang dihasilkan kue lumpur juga sangat khas karena menggunakan vanili\r\n\r\nharga: 25k/ kotak(isi 15)', 1),
('d2ab72', 'd04755', 'Krasikan Ketan Asli', 25000, 149, 'img/produk/krasikan.jpg', '2019-06-13 22:05:31', 'Krasikan Ketan Asli\r\n* Makanan Tradisional legit..manis dan gurih terbuat dari tepung ketan, santan kelapa & \r\ngula jawa asli.\r\n* Fresh/baru\r\n* Tanpa bahan pengawet dan zat2 yang berbahaya.\r\n* Diproses secara khusus dan higienis, sehingga Rasa Khas Krasikan Ketan ini menjadi sangat istimewa, lebih tahan lama.\r\n* Krasikan ini mampu bertahan hingga 3 Bulan pada suhu ruang. (Tanpa Masuk Kulkas.)\r\n* Sangat cocok untuk camilan keluarga, oleh2, piknik, maupun acara selamatan/pesta.\r\n* Tersedia Kemasan mini untuk berbagai acara : Selamatan, Lamaran, Syukuran mapun pesta', 1),
('493124', '442669', 'Yangko Aneka Rasa', 40000, 233, 'img/produk/Yangko.jpg', '2019-06-13 22:05:11', 'Yangko Aneka Rasa [Khas Kotagede Jogja]\r\nIsi: 30 biji\r\nRasa: kacang, coklat, durian, strawberry, nangka\r\nKomposisi: tepung ketan, gula pasir, pewarna makanan, essen\r\nBerat Netto: 500 gram\r\nBerat kirim: 600 gram\r\nTgl kadaluwarsa: 7 hari dari pengiriman\r\n\r\n==========================\r\nNote:\r\nKhusus makanan ini, baru akan kirim pada hari berikutnya setelah order kami terima. Kami baru akan orderkan makanan tsb langsung dari pembuatnya, sehingga terjamin makanan tersebut benar2 baru bukan stok lama.', 1),
('03602d', 'f8b022', 'UKEL dan BANJAR', 30000, 148, 'img/produk/Ukel and banjar.jpg', '2019-05-30 23:47:21', 'UKEL n BANJAR Bu Noto... \r\nUkel dan BAnjar adalah makanan khas kotagede. \r\nUkel dan Banjar adalah kue renyah yang terbuat dari tepung ketan dan telur. Yang membedakan keduanya adalah UKEL dilumuri tepung gula sehingga manis rasanya, BANJAR polosan saja jadi gurih.\r\nUkel dan BAnjar cocok untuk oleh-oleh dan camilan keluarga', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rkat_produk`
--

CREATE TABLE `rkat_produk` (
  `id_kat_produk` varchar(10) NOT NULL,
  `kat_produk` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rkat_produk`
--

INSERT INTO `rkat_produk` (`id_kat_produk`, `kat_produk`) VALUES
('d04755', 'Makanan Basah'),
('892554', 'Makanan Kering'),
('fe92d9', 'Makanan Ringan'),
('f8b022', 'Kue Kering'),
('442669', 'Kue Basah');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id_service` int(11) NOT NULL,
  `tanya` text NOT NULL,
  `jawab` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id_service`, `tanya`, `jawab`, `status`) VALUES
(2, 'Siapa Yang membuat Program ini? sangat enak digunakan dan sangat mantap', 'Siapa Yang membuat Program ini? sangat enak digunakan dan sangat mantap Siapa Yang membuat Program ini? sangat enak digunakan dan sangat mantap', 'YES'),
(4, 'Sudah 2 hari barang saya belum dikirim ini gimana ya?', 'Mohon Untuk menunggu, permintaan sedang diproses', 'YES'),
(6, 'Bagaimana Cara Konfirmasi Pembayaran', 'Dengan Mengirim bukti pembayaran ke wa kami', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id_slider` int(11) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id_slider`, `gambar`) VALUES
(12, 'img/slider/3-kt-hm.jpg'),
(13, 'img/slider/Bakpia.jpg'),
(14, 'img/slider/Keripik-Welut-Oleh-oleh-Khas-Yogyakarta.jpg'),
(15, 'img/slider/Kipo.jpg');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`, `gambar`) VALUES
('88a9c', 'amin', 'amin@gmai.com', 'amin', '');

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
  MODIFY `id_cart` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id_contact` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `control`
--
ALTER TABLE `control`
  MODIFY `id_control` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `finish`
--
ALTER TABLE `finish`
  MODIFY `id_finish` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
