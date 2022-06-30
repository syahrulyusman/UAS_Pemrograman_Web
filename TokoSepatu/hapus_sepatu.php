<?php 

include('koneksi.php');

$id_sepatu = $_GET['id_sepatu'];

$hapus= mysqli_query($koneksi, "DELETE FROM produk WHERE id_sepatu='$id_sepatu'");

if($hapus)
	header('location: daftar_sepatu.php');
else
	echo "Hapus data gagal";

 ?>