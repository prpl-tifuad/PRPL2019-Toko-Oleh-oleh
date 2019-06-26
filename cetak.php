<?php require 'koneksi/koneksi.php'; ?>
<!DOCTYPE html>
<html>
<head>
	<title>CETAK PRINT DATA DARI DATABASE DENGAN PHP - WWW.MALASNGODING.COM</title>
</head>
<body>
	<center>

		<h1>TOKO OLEH-OLEH</h1>
		<p>LAYANAN KONSUMEN : 0813-5891-1040</p>

	</center>

	<table border="1" style="width: 100%">
		<tr>
			<th width="1%">No</th>
			<th>Nama Barang</th>
			<th width="5%">Jumlah Pesanan</th>
			<th>Harga PerUnit</th>
			<th>SubTotal</th>
			<th width="5%">Tanggal</th>
		</tr>
		<?php 
		$no = 1;
		$sql = mysqli_query($con,"SELECT * FROM cart");
		while($data = $sql -> fetch_assoc()){
			?>
			<tr>
				<td><?php echo $no++; ?></td>
				<?php
				$test = $data['id_produk'];
				$sql1 = mysqli_query($con, "SELECT * FROM produk where id_produk='$test'");
				$npro = $sql1 -> fetch_assoc();
				?>
				<td><?php echo $npro['nama']; ?></td>
				<td><?php echo $data['jumlah']; ?></td>
				<td><?php echo $npro['harga']; ?></td>
				<td><?php echo $data['subtotal']; ?></td>
				<td><?php echo $data['tanggal']; ?></td>
			</tr>
			<?php 
		}
		?>
	</table>

	<script>
		window.print();
	</script>
	<?php
	$sql2 = mysqli_query($con, "SELECT * FROM checkout");
	$ttest = $sql2 -> fetch_assoc();
	?>	
	<div class="col-md-5 pull-right" style="float: right; margin-right: 15%; ">
		<?php
		$asw = $ttest['id_checkout'];
		$sql3 = mysqli_query($con, "SELECT * FROM finish where id_checkout='$asw'");
		$nprot = $sql3 -> fetch_assoc();
		?>
		Total : Rp. <?php echo $nprot['totalbayar']; ?>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<center>
		<p>TERIMA KASIH SUDAH BERBELANJA</p>
		<p>Note*: Barang yang sudah dibeli tidak bisa dikembalikan</p>
	</center>

</body>
</html>