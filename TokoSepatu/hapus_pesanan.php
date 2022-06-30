<?php 
session_start();
 
$id_sepatu = $_GET["id_sepatu"];

unset($_SESSION["pesanan"][$id_sepatu]);

echo "<script>alert('Produk telah dihapus');</script>"; 
echo "<script>location= 'pesanan_pembeli.php'</script>";


?>