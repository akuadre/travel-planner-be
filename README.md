# Travel Planner (Backend API)

Backend API untuk aplikasi Travel Planner. Project ini dibangun menggunakan framework **Laravel** dan berfungsi sebagai penyedia data RESTful untuk aplikasi frontend.

## 🌟 Fitur Utama

* **Otentikasi Aman**: Menggunakan **Laravel Sanctum** untuk sistem login berbasis token (Bearer Token).
* **Manajemen Pengguna**: Registrasi, Login, Logout, dan pengambilan profil pengguna.
* **Manajemen Destinasi**:
    * CRUD (Create, Read, Update, Delete) data destinasi wisata.
    * Fitur *Bulk Update* dan *Bulk Delete* untuk pengelolaan data massal.
* **Manajemen Itinerary**:
    * Membuat jadwal perjalanan yang terhubung dengan destinasi tertentu.
    * Mengelola detail itinerary (CRUD).
* **API Resource**: Struktur respons JSON yang konsisten.

## 🛠 Teknologi

* **Framework**: [Laravel](https://laravel.com/) ^12.0
* **Language**: PHP ^8.2
* **Auth**: Laravel Sanctum ^4.0
* **Database**: MySQL / MariaDB (Default Laravel supports multiple)
* **Testing**: PHPUnit & Pest (via Laravel built-in tests)

## 📋 Prasyarat

Pastikan server atau komputer lokal Anda memiliki:

* [PHP](https://www.php.net/) >= 8.2
* [Composer](https://getcomposer.org/)
* Database Server (MySQL, PostgreSQL, atau SQLite)

## 🚀 Instalasi dan Penggunaan

1.  **Clone Repository**
    ```bash
    git clone [https://github.com/username-anda/travel-planner-be.git](https://github.com/username-anda/travel-planner-be.git)
    cd travel-planner-be
    ```

2.  **Install Dependencies**
    Jalankan perintah berikut untuk mengunduh library vendor:
    ```bash
    composer install
    ```

3.  **Konfigurasi Environment**
    Salin file contoh konfigurasi dan sesuaikan dengan database Anda:
    ```bash
    cp .env.example .env
    ```
    Buka file `.env` dan atur koneksi database:
    ```ini
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=travel_planner
    DB_USERNAME=root
    DB_PASSWORD=
    ```

4.  **Setup Aplikasi (Shortcut)**
    Project ini memiliki script setup otomatis di `composer.json` yang akan men-generate key dan menjalankan migrasi:
    ```bash
    composer run setup
    ```
    *Atau secara manual:*
    ```bash
    php artisan key:generate
    php artisan migrate
    ```

5.  **Jalankan Server**
    ```bash
    php artisan serve
    ```
    API akan berjalan di `http://localhost:8000`.

## 📡 Dokumentasi API

Berikut adalah daftar endpoint utama yang tersedia:

### Autentikasi
| Method | Endpoint | Deskripsi |
| :--- | :--- | :--- |
| POST | `/api/register` | Mendaftarkan pengguna baru |
| POST | `/api/login` | Masuk dan mendapatkan Token |
| GET | `/api/user` | Mendapatkan data user login (Perlu Token) |
| POST | `/api/logout` | Menghapus token akses (Perlu Token) |

### Destinasi (Perlu Token)
| Method | Endpoint | Deskripsi |
| :--- | :--- | :--- |
| GET | `/api/destinations` | Melihat daftar destinasi |
| POST | `/api/destinations` | Menambah destinasi baru |
| GET | `/api/destinations/{id}` | Detail destinasi |
| PUT | `/api/destinations/{id}` | Update destinasi |
| DELETE | `/api/destinations/{id}` | Hapus destinasi |
| POST | `/api/destinations/bulk-update` | Update banyak data sekaligus |

### Itinerary (Perlu Token)
| Method | Endpoint | Deskripsi |
| :--- | :--- | :--- |
| GET | `/api/destinations/{id}/itineraries` | Lihat itinerary berdasarkan destinasi |
| POST | `/api/itineraries` | Tambah itinerary |
| PUT | `/api/itineraries/{id}` | Update itinerary |
| DELETE | `/api/itineraries/{id}` | Hapus itinerary |

## 🧪 Testing

Untuk menjalankan pengujian otomatis (Unit & Feature test):

```bash
php artisan test
```

## 📂 Struktur Folder Utama

Berikut adalah struktur folder utama dari aplikasi ini:

```text
travel-planner-be/
├── app/
│   ├── Http/Controllers/    # Logika bisnis (AuthController, DestinationController)
│   ├── Models/              # Model Database (User, Destination, Itinerary)
├── database/
│   ├── migrations/          # Struktur tabel database
│   ├── seeders/             # Data dummy
├── routes/
│   ├── api.php              # Definisi route API
│   └── web.php              # Route web standar
├── tests/                   # Folder pengujian
└── .env                     # Konfigurasi environment
```

## 🤝 Kontribusi

Kontribusi selalu diterima! Jika Anda ingin berkontribusi:

1. Fork repository ini.
2. Buat branch fitur baru (git checkout -b fitur-api-baru).
3. Commit perubahan Anda (git commit -m 'Menambahkan endpoint baru').
4. Push ke branch tersebut (git push origin fitur-api-baru).
5. Buat Pull Request.

## 📄 Lisensi

Project ini bersifat open-sourced di bawah lisensi MIT.
