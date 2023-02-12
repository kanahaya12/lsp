<?php
$hostname = "localhost";
$username ="root";
$password ="";
$database ="perpuslsp";

$koneksi= mysqli_connect($hostname,$username,$password,$database);
if($koneksi->connect_error){
    die(mysqli_connect_error());
}
?>