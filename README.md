# <p align="center">  ❇️ Sistem Pengajuan Cuti Mahasiswa</p>
[ Praktikum Pemrograman Berbasis Framework (PBF). ] {{ FRONT END & BACK END }}

<p align="center">
<a href="https://github.com/RevanoAugustofa"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

##  Menggunakan Docker Compose

Proyek ini dapat dijalankan menggunakan Docker Compose untuk mengelola kontainer frontend, backend, dan database.

###  1. Setup Docker dan Docker Compose

**Instalasi Docker & Docker Compose:**

Pastikan Docker dan Docker Compose sudah terinstal:

* **Ubuntu/Debian:**

    ```bash
    sudo apt update && sudo apt install docker.io docker-compose -y
    sudo systemctl enable --now docker
    ```

* **Windows (WSL2) & macOS:**

    Download dari [https://www.docker.com/get-started](https://www.docker.com/get-started)

###  2. Buat Struktur Folder

Buat struktur berikut di dalam project utama:

```
project-docker/
├── backend/        # CodeIgniter Project
├── frontend/       # Laravel Project
├── docker/
│   ├── Dockerfile-php
│   ├── Dockerfile-nginx
│   ├── my.cnf
├── .env
├── docker-compose.yml
```

###  3. Setup Docker untuk Backend (CodeIgniter) & Frontend (Laravel)

**1️⃣ Buat Dockerfile-php untuk PHP 8.3**

Buat file `docker/Dockerfile-php`:

```dockerfile
FROM php:8.3-fpm

# Install extensions
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
```

**2️⃣ Buat Dockerfile-nginx untuk Nginx**

Buat file `docker/Dockerfile-nginx`:

```dockerfile
FROM nginx:latest
COPY default.conf /etc/nginx/conf.d/default.conf
```

**3️⃣ Buat Konfigurasi Nginx**

Buat file `docker/default.conf`:

```nginx
server {
    listen 80;

    server_name localhost;

    root /var/www/public;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass backend:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

###  4. Buat docker-compose.yml

Buat file `docker-compose.yml` di dalam `project-docker/`:

```yaml
version: '3.8'

services:
  mysql:
    image: mysql:8
    container_name: mysql_container
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: mydatabase
      MYSQL_USER: user
      MYSQL_PASSWORD: password
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql

  backend:
    build:
      context: .
      dockerfile: docker/Dockerfile-php
    container_name: backend_container
    restart: always
    working_dir: /var/www
    volumes:
      - ./backend:/var/www
    depends_on:
      - mysql
    ports:
      - "9000:9000"

  frontend:
    build:
      context: .
      dockerfile: docker/Dockerfile-php
    container_name: frontend_container
    restart: always
    working_dir: /var/www
    volumes:
      - ./frontend:/var/www
    depends_on:
      - backend
    ports:
      - "5173:5173"

  nginx:
    build:
      context: .
      dockerfile: docker/Dockerfile-nginx
    container_name: nginx_container
    restart: always
    ports:
      - "8080:80"
    depends_on:
      - backend
      - frontend
    volumes:
      - ./backend:/var/www
      - ./docker/default.conf:/etc/nginx/conf.d/default.conf

volumes:
  mysql_data:
```

###  5. Clone Backend (CodeIgniter) & Frontend (Laravel)

**Clone CodeIgniter Backend:**

```bash
git clone [https://github.com/username/codeigniter-backend.git](https://github.com/username/codeigniter-backend.git) backend
cd backend
composer install
cp env .env
php artisan key:generate
```

**Clone Laravel Frontend:**

```bash
git clone [https://github.com/username/laravel-frontend.git](https://github.com/username/laravel-frontend.git) frontend
cd frontend
composer install
npm install
cp .env.example .env
php artisan key:generate
```

###  6. Jalankan Docker Compose

Jalankan semua kontainer:

```bash
docker compose up -d --build
```

###  7. Cek Status Kontainer

```bash
docker ps
```

Jika semua kontainer berjalan, backend bisa diakses di `http://localhost:8080`, dan frontend bisa diakses di `http://localhost:5173`.

###  8. Upload ke Git

Buat `.gitignore` di `project-docker/` untuk menghindari file yang tidak perlu:

```
mysql_data/
backend/vendor/
frontend/node_modules/
frontend/vendor/
```

Lalu jalankan:

```bash
git init
git add .
git commit -m "Initial Docker setup"
git branch -M main
git remote add origin [https://github.com/username/project-docker.git](https://github.com/username/project-docker.git)
git push -u origin main
```

###  9. Cara Menjalankan Setelah Update

Jika ada perubahan di lokal dan ingin update di VPS:

```bash
git pull origin main
docker compose up -d --build
```

Untuk memeriksa log jika ada error:

```bash
docker logs backend_container
docker logs frontend_container
```

Untuk restart kontainer:

```bash
docker compose restart
```

 **Kesimpulan**

✅ Setup CodeIgniter (Backend) & Laravel (Frontend) dalam Docker
✅ Konfigurasi Docker Compose untuk menjalankan layanan PHP, MySQL, dan Nginx
✅ Deploy ke Git dan update ke VPS dengan git pull
 Setelah ini, coba akses backend dan frontend untuk memastikan semuanya berjalan! 

### Instalasi Composer (Windows)

Jika Anda menggunakan Windows dan menginstal Composer, Anda mungkin akan melihat tampilan berikut:

```
Composer Setup

Settings Check

                We need to check your PHP and other settings.

                Choose the command-line PHP you want to use:

                                                                           Browse...

                                                               Back  Next             Cancel
```

Pada tampilan ini, Anda perlu memilih lokasi file `php.exe` yang akan digunakan oleh Composer. Klik "Browse..." dan navigasikan ke direktori instalasi PHP Anda, lalu pilih `php.exe`. Ini memastikan Composer menggunakan versi PHP yang benar.
