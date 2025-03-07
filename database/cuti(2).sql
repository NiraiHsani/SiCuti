/*
 Navicat MySQL Dump SQL

 Source Server         : koneksi
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : cuti

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 06/03/2025 21:35:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_user` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_admin`) USING BTREE,
  INDEX `id_user`(`id_user` ASC) USING BTREE,
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'andin', 1);
INSERT INTO `admin` VALUES (2, 'andin', 1);

-- ----------------------------
-- Table structure for baup
-- ----------------------------
DROP TABLE IF EXISTS `baup`;
CREATE TABLE `baup`  (
  `id_baup` int NOT NULL AUTO_INCREMENT,
  `nama_baup` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_user` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_baup`) USING BTREE,
  INDEX `id_user`(`id_user` ASC) USING BTREE,
  CONSTRAINT `baup_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of baup
-- ----------------------------
INSERT INTO `baup` VALUES (1, 'mayang', 4);

-- ----------------------------
-- Table structure for cuti
-- ----------------------------
DROP TABLE IF EXISTS `cuti`;
CREATE TABLE `cuti`  (
  `id_cuti` int NOT NULL AUTO_INCREMENT,
  `npm` int NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tgl_pengajuan` timestamp NOT NULL,
  `semester` int NOT NULL,
  `dokumen_pendukung` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_cuti`) USING BTREE,
  UNIQUE INDEX `unique_cuti`(`npm` ASC, `semester` ASC) USING BTREE,
  CONSTRAINT `cuti_ibfk_1` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cuti
-- ----------------------------
INSERT INTO `cuti` VALUES (1, 230102051, '', '2025-03-06 13:15:21', 2, 'aaaaa');
INSERT INTO `cuti` VALUES (5, 230102051, '', '2025-03-06 13:17:07', 4, 'aaaa');
INSERT INTO `cuti` VALUES (9, 230102051, '', '2025-03-06 13:17:33', 3, 'aaaa');

-- ----------------------------
-- Table structure for dosen_wali
-- ----------------------------
DROP TABLE IF EXISTS `dosen_wali`;
CREATE TABLE `dosen_wali`  (
  `id_dosen` int NOT NULL AUTO_INCREMENT,
  `nama_dosen` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nidn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_user` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_dosen`) USING BTREE,
  INDEX `id_user`(`id_user` ASC) USING BTREE,
  CONSTRAINT `dosen_wali_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dosen_wali
-- ----------------------------
INSERT INTO `dosen_wali` VALUES (1, 'hana', '2654970840', 2);
INSERT INTO `dosen_wali` VALUES (2, 'raya', '2782862663', 3);
INSERT INTO `dosen_wali` VALUES (4, 'hana', '5949401106', 2);
INSERT INTO `dosen_wali` VALUES (5, 'raya', '1398417848', 3);
INSERT INTO `dosen_wali` VALUES (7, 'hana', '1234567890', 2);
INSERT INTO `dosen_wali` VALUES (8, 'raya', '0987654321', 3);

-- ----------------------------
-- Table structure for kajur
-- ----------------------------
DROP TABLE IF EXISTS `kajur`;
CREATE TABLE `kajur`  (
  `id_kajur` int NOT NULL AUTO_INCREMENT,
  `nama_kajur` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nidn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nama_jurusan` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_user` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_kajur`) USING BTREE,
  INDEX `id_user`(`id_user` ASC) USING BTREE,
  CONSTRAINT `kajur_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kajur
-- ----------------------------
INSERT INTO `kajur` VALUES (1, 'Windy', '123456789', 'JKB', 5);

-- ----------------------------
-- Table structure for koor_perpus
-- ----------------------------
DROP TABLE IF EXISTS `koor_perpus`;
CREATE TABLE `koor_perpus`  (
  `id_koor` int NOT NULL AUTO_INCREMENT,
  `nama_koor_perpus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_user` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_koor`) USING BTREE,
  INDEX `id_user`(`id_user` ASC) USING BTREE,
  CONSTRAINT `koor_perpus_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of koor_perpus
-- ----------------------------
INSERT INTO `koor_perpus` VALUES (1, 'manda', 6);

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE `mahasiswa`  (
  `npm` int NOT NULL,
  `id_user` int NULL DEFAULT NULL,
  `id_dosen` int NULL DEFAULT NULL,
  `id_kajur` int NULL DEFAULT NULL,
  `nama_mahasiswa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tempat_tanggal_lahir` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alamat` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `agama` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `angkatan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `program_studi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `semester` int NOT NULL,
  `no_hp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`npm`) USING BTREE,
  INDEX `id_user`(`id_user` ASC) USING BTREE,
  INDEX `id_dosen`(`id_dosen` ASC) USING BTREE,
  INDEX `id_kajur`(`id_kajur` ASC) USING BTREE,
  CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`id_dosen`) REFERENCES `dosen_wali` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mahasiswa_ibfk_3` FOREIGN KEY (`id_kajur`) REFERENCES `kajur` (`id_kajur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO `mahasiswa` VALUES (230102051, 7, 1, 1, 'nana', 'Jakarta, 01-01-2000', 'Laki-laki', 'Jl. Merdeka No. 1', 'Islam', '2023', 'Teknik Informatika', 2, '081234567890', 'nana@gmail.com');
INSERT INTO `mahasiswa` VALUES (230102052, 8, 1, 1, 'fijar', 'Jakarta, 01-01-2000', 'Laki-laki', 'Jl. Merdeka No. 1', 'Islam', '2023', 'Teknik Informatika', 2, '081234567890', 'fijar@gmail.com');
INSERT INTO `mahasiswa` VALUES (230102053, 9, 1, 1, 'rara', 'Jakarta, 01-01-2000', 'Laki-laki', 'Jl. Merdeka No. 1', 'Islam', '2023', 'Teknik Informatika', 2, '081234567890', 'rara@gmail.com');
INSERT INTO `mahasiswa` VALUES (230102055, 7, 1, 1, 'Nana', 'Jakarta, 12-05-2003', 'Perempuan', 'Jl. Mawar No. 1', 'Islam', '2023', 'Teknik Informatika', 2, '081234567891', 'nana@gmail.com');
INSERT INTO `mahasiswa` VALUES (230102056, 8, 1, 1, 'Fijar', 'Bandung, 20-07-2004', 'Laki-laki', 'Jl. Melati No. 5', 'Kristen', '2023', 'Teknik Informatika', 2, '081234567892', 'fijar@gmail.com');
INSERT INTO `mahasiswa` VALUES (230102057, 9, 1, 1, 'Rara', 'Surabaya, 15-03-2003', 'Perempuan', 'Jl. Kenanga No. 3', 'Hindu', '2023', 'Teknik Informatika', 2, '081234567893', 'rara@gmail.com');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `level` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'andin', 'passadmin123', 'admin');
INSERT INTO `user` VALUES (2, 'hana', 'passdosen123', 'dosen');
INSERT INTO `user` VALUES (3, 'raya', 'passdosen123', 'dosen');
INSERT INTO `user` VALUES (4, 'mayang', 'passbaup123', 'baup');
INSERT INTO `user` VALUES (5, 'windy', 'passkajur123', 'kajur');
INSERT INTO `user` VALUES (6, 'manda', 'passperpus123', 'perpus');
INSERT INTO `user` VALUES (7, 'nana', 'mhs1', 'mahasiswa');
INSERT INTO `user` VALUES (8, 'fijar', 'mhs2', 'mahasiswa');
INSERT INTO `user` VALUES (9, 'rara', 'mhs3', 'mahasiswa');

-- ----------------------------
-- View structure for view_beranda_dosenbaupperpuskajur
-- ----------------------------
DROP VIEW IF EXISTS `view_beranda_dosenbaupperpuskajur`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_beranda_dosenbaupperpuskajur` AS select `u`.`username` AS `username`,`m`.`npm` AS `npm`,`m`.`nama_mahasiswa` AS `nama_mahasiswa`,`m`.`program_studi` AS `program_studi`,`k`.`nama_jurusan` AS `nama_jurusan`,`m`.`email` AS `email`,`d`.`nama_dosen` AS `nama_dosen`,`k`.`nama_kajur` AS `nama_kajur`,`c`.`semester` AS `semester`,`c`.`tgl_pengajuan` AS `tgl_pengajuan` from ((((`mahasiswa` `m` join `user` `u` on((`m`.`id_user` = `u`.`id_user`))) join `dosen_wali` `d` on((`m`.`id_dosen` = `d`.`id_dosen`))) join `kajur` `k` on((`m`.`id_kajur` = `k`.`id_kajur`))) left join `cuti` `c` on((`m`.`npm` = `c`.`npm`)));

-- ----------------------------
-- View structure for view_beranda_mahasiswa
-- ----------------------------
DROP VIEW IF EXISTS `view_beranda_mahasiswa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_beranda_mahasiswa` AS select `m`.`npm` AS `npm`,`m`.`nama_mahasiswa` AS `nama_mahasiswa`,`m`.`tempat_tanggal_lahir` AS `tempat_tanggal_lahir`,`m`.`jenis_kelamin` AS `jenis_kelamin`,`m`.`agama` AS `agama`,`m`.`angkatan` AS `angkatan`,`m`.`program_studi` AS `program_studi`,`k`.`nama_jurusan` AS `nama_jurusan`,`m`.`alamat` AS `alamat`,`m`.`email` AS `email`,`m`.`no_hp` AS `no_hp` from (`mahasiswa` `m` join `kajur` `k` on((`m`.`id_kajur` = `k`.`id_kajur`)));

-- ----------------------------
-- View structure for view_mahasiswa_cuti
-- ----------------------------
DROP VIEW IF EXISTS `view_mahasiswa_cuti`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_mahasiswa_cuti` AS select `m`.`npm` AS `npm`,`m`.`nama_mahasiswa` AS `nama_mahasiswa`,`m`.`program_studi` AS `program_studi`,`k`.`nama_jurusan` AS `nama_jurusan`,`m`.`angkatan` AS `angkatan`,`c`.`semester` AS `semester` from ((`mahasiswa` `m` join `cuti` `c` on((`m`.`npm` = `c`.`npm`))) join `kajur` `k` on((`m`.`id_kajur` = `k`.`id_kajur`))) where (`c`.`id_cuti` is not null);

-- ----------------------------
-- View structure for view_riwayat_admin
-- ----------------------------
DROP VIEW IF EXISTS `view_riwayat_admin`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_riwayat_admin` AS select `u`.`username` AS `username`,`m`.`npm` AS `npm`,`m`.`nama_mahasiswa` AS `nama_mahasiswa`,`m`.`program_studi` AS `program_studi`,`k`.`nama_jurusan` AS `nama_jurusan`,`d`.`nama_dosen` AS `nama_dosen`,`k`.`nama_kajur` AS `nama_kajur`,`c`.`semester` AS `semester`,`c`.`tgl_pengajuan` AS `tgl_pengajuan`,`m`.`no_hp` AS `no_hp`,`m`.`email` AS `email` from ((((`mahasiswa` `m` join `user` `u` on((`m`.`id_user` = `u`.`id_user`))) join `dosen_wali` `d` on((`m`.`id_dosen` = `d`.`id_dosen`))) join `kajur` `k` on((`m`.`id_kajur` = `k`.`id_kajur`))) left join `cuti` `c` on((`m`.`npm` = `c`.`npm`)));

-- ----------------------------
-- Event structure for auto_insert_dosen
-- ----------------------------
DROP EVENT IF EXISTS `auto_insert_dosen`;
delimiter ;;
CREATE EVENT `auto_insert_dosen`
ON SCHEDULE
EVERY '1' MINUTE STARTS '2025-03-04 10:15:26'
DO INSERT INTO dosen (nama_dosen, nidn, id_user)
SELECT username, '0000000000', id_user 
FROM user 
WHERE role = 'dosen' AND id_user NOT IN (SELECT id_user FROM dosen)
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `after_user_insert`;
delimiter ;;
CREATE TRIGGER `after_user_insert` AFTER INSERT ON `user` FOR EACH ROW BEGIN
    IF NEW.level = 'mahasiswa' THEN
        -- Pastikan NPM tidak duplikat
        IF (SELECT COUNT(*) FROM mahasiswa WHERE npm = (SELECT COALESCE(MAX(npm), 230102050) + 1 FROM mahasiswa)) = 0 THEN
            INSERT INTO mahasiswa (npm, id_user, id_dosen, id_kajur, nama_mahasiswa, tempat_tanggal_lahir, jenis_kelamin, alamat, agama, angkatan, program_studi, semester, no_hp, email)
            VALUES (
                (SELECT COALESCE(MAX(npm), 230102050) + 1 FROM mahasiswa), -- NPM otomatis bertambah
                NEW.id_user, 
                1, -- ID Dosen Wali (Sesuaikan dengan dosen default)
                1, -- ID Kajur (Sesuaikan dengan kajur default)
                NEW.username, 
                'Jakarta, 01-01-2000', -- Default tempat tanggal lahir
                'Laki-laki', -- Default jenis kelamin
                'Jl. Merdeka No. 1', -- Default alamat
                'Islam', -- Default agama
                '2023', -- Default angkatan
                'Teknik Informatika', -- Default program studi
                2, -- Default semester
                '081234567890', -- Default no HP
                CONCAT(NEW.username, '@gmail.com') -- Email otomatis dibuat dari username
            );
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NPM sudah ada, harap periksa kembali!';
        END IF;
    END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
