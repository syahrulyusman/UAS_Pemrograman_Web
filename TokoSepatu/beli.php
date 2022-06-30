<?php 
session_start();

$id_sepatu = $_GET['id_sepatu'];

if (isset($_SESSION['pesanan'][$id_sepatu]))
{
	$_SESSION['pesanan'][$id_sepatu]+=1;
}

else 
{
	$_SESSION['pesanan'][$id_sepatu]=1;
}

echo "<script>alert('Produk telah masuk ke pesanan anda');</script>";
echo "<script>location= 'pesanan_pembeli.php'</script>";

 ?>