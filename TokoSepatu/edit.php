<?php 
include('koneksi.php');

$id_sepatu = $_POST['id_sepatu'];
$nama_sepatu = $_POST['nama_sepatu'];
$stok = $_POST['stok'];
$harga = $_POST['harga'];
$nama_file = $_FILES['gambar']['name'];
$source = $_FILES['gambar']['tmp_name'];
$folder = './upload/';

move_uploaded_file($source, $folder.$nama_file);
$edit = mysqli_query($koneksi, "UPDATE produk SET nama_sepatu='$nama_sepatu', stok='$stok', harga='$harga', gambar='$nama_file' WHERE id_sepatu='$id_sepatu' ");

if($edit)
	header('location: daftar_sepatu.php');
else
	echo "Edit Sepatu Gagal";


 ?>