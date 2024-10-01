CREATE TABLE `gudang` (
 `id_gudang` bigint PRIMARY KEY,
 `id_outlet` bigint(11),
 `alamat` VARCHAR(225)
);
CREATE TABLE `barang` (
 `id_barang` bigint(11) PRIMARY KEY,
 `id_gudang` bigint(11),
 `id_supplier` bigint(11),
 `nama_barang` VARCHAR(225),
 `category` VARCHAR(225),
 `jumlah_barang` bigint(11)
);
CREATE TABLE `supplier` (
 `id_supplier` bigint(11) PRIMARY KEY,
 `nama_supplier` VARCHAR(225),
 `alamat` VARCHAR(225),
 `email` VARCHAR(225)
);
CREATE TABLE `outlet` (
 `id_outlet` bigint(11) PRIMARY KEY,
 `id_manager` bigint(11),
 `nama_outlet` VARCHAR(225),
 `kota` VARCHAR(225),
 `alamat_outlet` VARCHAR(225)
);
CREATE TABLE `menu` (
 `id_menu` VARCHAR(10) PRIMARY KEY,
 `harga_menu` VARCHAR(225),
 `nama_menu` VARCHAR(225)
);
CREATE TABLE `transaksi` (
 `id_transaksi` bigint(21) PRIMARY KEY,
 `id_menu` VARCHAR(10),
 `id_outlet` bigint(11),
 `quantity` bigint(11),
 `total_harga` bigint(11),
 `date_time` DATETIME
);
CREATE TABLE `manager` (
 `id_manager` bigint PRIMARY KEY,
 `NIK` bigint (16),
 `Nama_manager` VARCHAR(225),
 `jenis_kelamin` VARCHAR(225),
 `alamat` VARCHAR(225),
 `status_pernikahan` VARCHAR(225),
 `nomor_telepon` bigint,
 `pendidikan_terakhir` VARCHAR(225)
);
CREATE TABLE `karyawan` (
 `id_karyawan` bigint PRIMARY KEY,
 `id_outlet` bigint,
 `id_gudang` bigint,
 `id_kantor_pusat` bigint,
 `id_role_karyawan` bigint,
 `NIK` bigint(16),
 `Nama_karyawan` VARCHAR(225),
 `jenis_kelamin` VARCHAR(225),
 `alamat` VARCHAR(225),
 `status_pernikahan` VARCHAR(225),
 `nomor_telepon` bigint,
 `pendidikan_terakhir` VARCHAR(225)
);
CREATE TABLE `kantor_pusat` (
 `id_kantor_pusat` bigint PRIMARY KEY,
 `alamat` VARCHAR(225),
 `nama_kantor` VARCHAR(30)
);
CREATE TABLE `role_karyawan` (
 `id_role_karyawan` bigint(3) PRIMARY KEY,
 `nama_role` VARCHAR(225)
);
CREATE TABLE `mutasi_barang` (
 `id_mutasi` bigint(11) PRIMARY KEY,
 `status_in_out` VARCHAR(10),
 `id_gudang` bigint(11),
 `id_barang` bigint(11),
 `date_time` DATETIME
);

ALTER TABLE `barang` ADD FOREIGN KEY (`id_gudang`) REFERENCES `gudang` (`id_gudang`);
ALTER TABLE `barang` ADD FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);
ALTER TABLE `gudang` ADD FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id_outlet`);
ALTER TABLE `transaksi` ADD FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id_outlet`);
ALTER TABLE `transaksi` ADD FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);
ALTER TABLE `outlet` ADD FOREIGN KEY (`id_manager`) REFERENCES `manager` (`id_manager`);
ALTER TABLE `karyawan` ADD FOREIGN KEY (`id_role_karyawan`) REFERENCES `role_karyawan` (`id_role_karyawan`);
ALTER TABLE `karyawan` ADD FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id_outlet`);
ALTER TABLE `karyawan` ADD FOREIGN KEY (`id_gudang`) REFERENCES `gudang` (`id_gudang`);
ALTER TABLE `karyawan` ADD FOREIGN KEY (`id_kantor_pusat`) REFERENCES `kantor_pusat` (`id_kantor_pusat`);
ALTER TABLE `mutasi_barang` ADD FOREIGN KEY (`id_gudang`) REFERENCES `gudang` (`id_gudang`);
ALTER TABLE `mutasi_barang` ADD FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);