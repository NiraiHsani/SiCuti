# <p align="center"> 🚀 Sistem Pengajuan Cuti Mahasiswa</p>
[ Praktikum Pemrograman Berbasis Framework (PBF). ] {{ FRONT END }}

<p align="center">
<a href="https://github.com/RevanoAugustofa"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## 🔴Prasyarat

- Pastikan sistem Anda sudah terinstall:
- PHP >= 8.2
- Composer
- Laravel 12 (Proyek Anda sudah dibuat atau di-clone)

## Setup & Instalasi

1. Clone Repository (Jika Belum Ada)
```bash 
git clone https://github.com/user/repo.git
cd nama-proyek
```
2. Instal Dependency PHP
```bash 
composer install
```
3. Copy File Environment & Generate App Key
```bash
cp .env.example .env
php artisan key:generate
```
Sesuaikan konfigurasi di file .env (misalnya, pengaturan database, APP_URL, dll).

4. 🫀 Jalankan Migrasi (Jika Proyek Menggunakan Database)
```bash
php artisan migrate
```

## Menjalankan Aplikasi
1. Jalankan Server Laravel Jalankan perintah berikut agar aplikasi berjalan secara lokal:
```bash
php artisan serve
```
Secara default, aplikasi dapat diakses melalui http://127.0.0.1:8000.

2. Akses Aplikasi Buka browser dan akses URL di atas.

## Troubleshooting
- Masalah Environment: Pastikan file .env sudah dikonfigurasi dengan benar dan APP_KEY telah di-generate.
- Masalah Database: Pastikan database sudah terkonfigurasi dengan benar di file .env
- Cache: Jika terjadi masalah, bersihkan cache konfigurasi:
```bash
php artisan config:clear
php artisan cache:clear
```

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
