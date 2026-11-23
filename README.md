# MyPortfolio Mobile

Aplikasi portofolio pribadi sederhana yang dibuat dengan Flutter. Halaman utama menampilkan informasi pemilik dan tiga kartu aksi: melihat proyek, menambah proyek, dan logout. Setiap kartu memiliki warna berbeda dan menampilkan SnackBar ketika ditekan.

## Menjalankan aplikasi

Pastikan Flutter SDK sudah terpasang, lalu jalankan perintah berikut dari direktori proyek:

```sh
flutter pub get
flutter run
```

Untuk memeriksa masalah statis pada kode:

```sh
flutter analyze
```

## Tugas 7

1. **Widget tree** adalah susunan widget yang membentuk antarmuka Flutter. Widget di dalam widget lain memiliki hubungan parent-child. Pada aplikasi ini, `MaterialApp` menjadi root aplikasi dan memakai `MyHomePage` sebagai halaman; di dalamnya terdapat `Scaffold`, lalu bagian seperti `AppBar`, `Padding`, `Row`, dan `Column` menyusun kontennya. Parent menentukan tata letak atau perilaku anaknya, sedangkan anak menyediakan bagian antarmuka yang lebih kecil.

2. **Widget yang digunakan dan fungsinya:**
   - `MaterialApp` menyediakan struktur aplikasi Material, tema, dan halaman awal.
   - `MyApp` adalah widget root buatan sendiri yang menjalankan aplikasi.
   - `Scaffold` menyediakan struktur halaman seperti app bar, body, dan dukungan SnackBar.
   - `MyHomePage` adalah widget halaman utama yang menata profil dan menu aksi.
   - `AppBar` menampilkan judul halaman.
   - `Padding` memberi jarak di sekitar konten.
   - `Row` menyusun tiga kartu profil secara horizontal.
   - `InfoCard` adalah widget buatan sendiri untuk menampilkan label dan nilai profil.
   - `Card` memberi bentuk kartu pada informasi profil.
   - `Container` mengatur ukuran dan padding isi kartu.
   - `MediaQuery` menyediakan ukuran layar untuk menyesuaikan lebar kartu profil.
   - `Column` menyusun isi secara vertikal.
   - `Text` menampilkan judul, informasi profil, sapaan, dan label aksi.
   - `SizedBox` memberi jarak vertikal.
   - `Center` menempatkan bagian sapaan dan menu di tengah.
   - `GridView.count` menyusun kartu aksi dalam kisi tiga kolom.
   - `ItemCard` adalah widget buatan sendiri untuk menampilkan satu aksi portofolio.
   - `Material` memberi latar berwarna dan bentuk pada kartu aksi.
   - `InkWell` membuat kartu dapat ditekan dan memberi respons sentuhan.
   - `Icon` menampilkan ikon yang sesuai dengan aksi.
   - `SnackBar` menampilkan pesan setelah kartu aksi ditekan.

3. `MaterialApp` adalah widget tingkat atas untuk aplikasi yang menggunakan pola desain Material. Widget ini menyediakan konfigurasi seperti tema, navigasi, dan halaman awal. Menjadikannya root memudahkan widget di bawahnya menggunakan layanan dan gaya Material yang konsisten.

4. `StatelessWidget` cocok untuk tampilan yang tidak menyimpan state yang berubah selama widget hidup; hasil tampilannya bergantung pada konfigurasi dan data yang diberikan. `StatefulWidget` digunakan ketika tampilan perlu berubah sebagai respons terhadap interaksi atau perubahan data lokal, dengan state yang diperbarui melalui `setState` atau mekanisme state lain. Halaman utama tugas ini menggunakan `StatelessWidget` karena data profil dan daftar aksinya tetap. Jika tombol perlu mengubah isi halaman atau mengelola status login secara lokal, bagian tersebut dapat memerlukan state.

5. `BuildContext` adalah referensi ke posisi suatu widget di dalam widget tree. Konteks digunakan untuk mencari informasi atau layanan dari widget leluhur, misalnya mengambil tema melalui `Theme.of(context)` atau menampilkan SnackBar melalui `ScaffoldMessenger.of(context)`. Metode `build` menerima `BuildContext` agar widget bisa membangun tampilannya sesuai konteks tersebut.

6. **Hot reload** menerapkan perubahan kode ke aplikasi yang sedang berjalan dan berusaha mempertahankan state saat ini. Ini berguna untuk melihat perubahan tampilan atau kode widget dengan cepat. **Hot restart** memulai ulang aplikasi Flutter dari awal sehingga state aplikasi direset. Hot restart diperlukan ketika perubahan tidak dapat diterapkan oleh hot reload, misalnya perubahan pada inisialisasi global atau state awal. Perubahan kode native atau konfigurasi platform biasanya memerlukan penghentian dan build ulang aplikasi (**full restart**), bukan sekadar hot reload.

## AI Disclosure

Dalam pengerjaan Tugas 7, saya menggunakan ChatGPT sebagai alat bantu untuk memahami checklist, menerapkan beberapa perubahan pada proyek Flutter, dan menyusun dokumentasi. Saya memberikan instruksi tugas serta konteks proyek agar bantuan mengikuti kode yang sudah ada. ChatGPT membantu langsung pada pewarnaan kartu aksi dan draf jawaban reflektif; hasilnya tetap perlu saya pahami dan tinjau sebelum dikumpulkan.

Saya menggunakan AI terutama pada beberapa bagian berikut:
    - memahami checklist dan rubrik Tugas 7;
    - menambahkan atribut warna pada `ItemHomepage` dan menerapkannya pada `ItemCard`;
    - menyusun jawaban reflektif tentang widget tree, widget yang digunakan, `MaterialApp`, `StatelessWidget` dan `StatefulWidget`, `BuildContext`, serta hot reload dan hot restart;
    - menyusun deskripsi proyek, instruksi menjalankan aplikasi, dan AI disclosure di README;
    - memeriksa kode menggunakan `dart analyze`.

Dalam menggunakan ChatGPT, saya memberikan file instruksi Tugas 7, kode proyek yang sudah ada, serta identitas yang benar untuk mengganti data contoh Burhan. Bantuan diminta untuk bagian-bagian spesifik pada proyek Tutorial 08 yang sudah ada.

Saya tetap perlu mencocokkan jawaban reflektif dengan materi kuliah dan memahami perubahan kode yang dibantu AI. Identitas profil pada kode awal masih berupa data contoh, sehingga saya memberikan NPM, nama lengkap, dan kelas untuk menggantinya. Pemeriksaan `dart analyze` pada sesi pengerjaan ini menghasilkan `No issues found!`. Namun, perintah `flutter analyze` tidak mengeluarkan hasil dan berhenti merespons di lingkungan ini, dan aplikasi belum diperiksa langsung pada emulator atau perangkat.

AI juga dapat salah memahami struktur proyek atau memberikan penjelasan yang terlalu umum. Karena itu, hasil sarannya perlu dibandingkan dengan kode dan materi yang sebenarnya. Pemeriksaan analyzer hanya membantu menemukan isu statis; pemeriksaan tersebut tidak membuktikan bahwa semua interaksi berjalan baik di perangkat.

Referensi Penggunaan AI

AI yang digunakan:
    - ChatGPT

Bentuk bantuan:
    - Membaca dan merangkum checklist serta rubrik Tugas 7.
    - Membantu menerapkan warna berbeda untuk setiap kartu aksi.
    - Membantu menyusun jawaban reflektif berdasarkan implementasi Flutter pada proyek.
    - Membantu menyusun dokumentasi setup proyek dan AI disclosure.
    - Membantu menjalankan pemeriksaan kode dengan `dart analyze`.

Strategi penggunaan:
    - Memberikan instruksi tugas dan konteks kode proyek yang relevan.
    - Meminta bantuan secara bertahap untuk perubahan dan dokumentasi tertentu.
    - Memberikan identitas profil yang benar untuk menggantikan data contoh.
    - Memeriksa kembali saran AI terhadap kode proyek dan materi kuliah sebelum mengumpulkan.

## Tugas 8

1. `Navigator.push()` menambahkan halaman baru ke atas tumpukan navigasi sehingga pengguna dapat kembali dengan tombol Back. `Navigator.pushReplacement()` mengganti halaman saat ini, sedangkan `Navigator.pop()` menutup halaman teratas dan kembali ke halaman sebelumnya. Kartu **Tambah Proyek** dan **Tambah Edukasi** memakai `Navigator.push()` untuk membuka formulir masing-masing. Opsi **Home** pada drawer memakai `Navigator.pushReplacement()` agar formulir diganti halaman utama.

2. `Scaffold` menyediakan kerangka halaman, termasuk `AppBar`, body, dan drawer. `AppBar` memberi judul dan navigasi yang konsisten. Drawer yang sama dipakai di halaman utama, formulir proyek, dan formulir edukasi; warna AppBar formulir dan header drawer mengikuti `Theme.of(context).colorScheme.primary`, yang berasal dari tema indigo aplikasi.

3. Formulir memakai `SingleChildScrollView` di sekitar `Column`, sehingga isian dapat disusun vertikal dan tetap dapat digulir ketika layar pendek atau keyboard terbuka. `Padding` atau `SizedBox` memberi jarak antarinput agar tidak berhimpitan. Scroll memungkinkan pengguna mencapai tombol **Simpan** atau **Save** saat ruang layar terbatas.

4. `GlobalKey<FormState>` memberi akses ke state `Form`, termasuk pemanggilan `validate()`. Setiap `TextFormField` menjalankan validator; tombol simpan hanya menampilkan `AlertDialog` setelah seluruh validator lolos. Pada formulir edukasi, nama institusi yang kosong atau hanya spasi ditolak. Tahun mulai dan tahun selesai juga diperiksa sebagai angka dalam rentang yang masuk akal, dan tahun selesai tidak boleh mendahului tahun mulai. Keyboard angka saja tidak menjamin isian tahun valid, seperti halnya keyboard URL tidak memastikan tautan memiliki skema `http` atau `https` dan host.

## AI Disclosure

Dalam pengerjaan Tugas 8, saya menggunakan ChatGPT sebagai pendamping untuk membaca rubrik dan memeriksa implementasi formulir serta navigasi yang sudah ada di proyek. Formulir **Tambah Proyek** berasal dari Tutorial 9. Untuk melengkapi tugas, ChatGPT membantu membuat halaman **Tambah Edukasi** yang terpisah, menambahkan aksesnya dari kartu beranda dan drawer, serta melengkapi validasi dan dialog ringkasan. Bantuan juga mencakup validasi format tautan opsional pada formulir proyek, konsistensi warna tema, serta penyusunan jawaban reflektif dan dokumentasi Tugas 8.

Saya memberikan PDF instruksi dan rubrik Tugas 8, `README.md`, serta kode halaman dan widget yang terkait. Saya meminta pemeriksaan checklist terhadap kode yang ada, kemudian perubahan terarah pada bagian yang perlu dilengkapi. Sebelum dikumpulkan, saya perlu memastikan jawaban dan perubahan sesuai dengan rubrik dan implementasi. AI dapat keliru membaca perilaku navigasi atau menganggap validasi input sudah cukup, jadi saya perlu memahami hasilnya dan mencocokkannya dengan materi kuliah.

Referensi Penggunaan AI

AI yang digunakan:
    - ChatGPT

Bentuk bantuan:
    - Membaca checklist dan rubrik Tugas 8 lalu membandingkannya dengan implementasi proyek.
    - Membuat halaman form edukasi baru dengan field institusi, jenjang, jurusan, dan rentang tahun pendidikan.
    - Menambahkan navigasi ke form edukasi dari kartu beranda dan drawer.
    - Menambahkan validasi field dan dialog ringkasan pada form edukasi.
    - Menambahkan validasi URL opsional untuk tautan dengan skema `http` atau `https` dan host.
    - Menyesuaikan warna AppBar formulir dan header drawer agar memakai warna utama tema aplikasi.
    - Membantu menyusun empat jawaban reflektif berdasarkan kode aktual.
    - Membantu memperbarui dokumentasi dan bagian AI Disclosure di README.
    - Menjalankan `flutter analyze`; hasilnya `No issues found!`.
    - Menjalankan tes widget untuk validasi, ringkasan, navigasi, dan layout pada layar ponsel 390 × 844.

Strategi penggunaan:
    - Memberikan instruksi tugas, rubrik, README, dan file kode yang relevan sebagai konteks.
    - Meminta pemeriksaan checklist terlebih dahulu, lalu perubahan kecil pada bagian yang perlu dilengkapi.
    - Meminta jawaban reflektif merujuk pada implementasi proyek, bukan hanya penjelasan umum Flutter.
    - Mencocokkan saran dengan kode dan rubrik; hasil analyzer tidak menggantikan pemeriksaan interaksi aplikasi.

ChatGPT turut menghasilkan perubahan kode dan draf dokumentasi, jadi bantuannya bukan hanya pemeriksaan ejaan atau pencarian informasi. Saya perlu memahami perubahan tersebut dan memastikan hasil akhirnya sesuai dengan materi kuliah. `flutter analyze` dan tes widget pada ukuran ponsel lulus, tetapi tes widget tidak sepenuhnya menggantikan pemeriksaan pada perangkat.
