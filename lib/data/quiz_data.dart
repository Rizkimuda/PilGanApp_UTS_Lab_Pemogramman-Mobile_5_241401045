import '../models/question_model.dart';

class QuizData {
  static const List<String> categories = [
    'Semua Topik',
    'Pemrograman Mobile',
    'Matematika & Logika',
    'Teknologi & Komputer',
  ];

  static const List<QuestionModel> questions = [
    // === TOPIK: PEMROGRAMAN MOBILE ===
    QuestionModel(
      id: 1,
      category: 'Pemrograman Mobile',
      question:
          'Widget apa di Flutter yang digunakan ketika tampilan UI tidak pernah berubah setelah dibuat?',
      options: [
        'StatefulWidget',
        'StatelessWidget',
        'InheritedWidget',
        'AnimatedWidget',
      ],
      correctIndex: 1,
    ),
    QuestionModel(
      id: 2,
      category: 'Pemrograman Mobile',
      question:
          'Fungsi utama dari method setState() pada StatefulWidget adalah...',
      options: [
        'Menghapus widget dari widget tree',
        'Memberitahu framework bahwa internal state berubah sehingga UI di-rebuild',
        'Menavigasi pengguna ke halaman berikutnya',
        'Menyimpan data aplikasi ke dalam local storage',
      ],
      correctIndex: 1,
    ),
    QuestionModel(
      id: 3,
      category: 'Pemrograman Mobile',
      question:
          'Manakah alasan utama mengapa State Management (seperti Provider) dibutuhkan pada aplikasi Flutter?',
      options: [
        'Hanya untuk menggantikan fungsi StatelessWidget',
        'Agar aplikasi bisa berjalan tanpa koneksi internet',
        'Menghindari prop-drilling dan menjaga persistensi data saat rotasi layar/pindah halaman',
        'Memperkecil ukuran file instalasi APK',
      ],
      correctIndex: 2,
    ),
    QuestionModel(
      id: 4,
      category: 'Pemrograman Mobile',
      question:
          'Widget manakah yang digunakan untuk menyusun elemen UI secara bertumpuk (layering z-axis)?',
      options: [
        'Column',
        'Row',
        'Stack',
        'Wrap',
      ],
      correctIndex: 2,
    ),
    QuestionModel(
      id: 5,
      category: 'Pemrograman Mobile',
      question:
          'Apa fungsi widget MediaQuery pada Flutter dalam perancangan tampilan responsif?',
      options: [
        'Memutar file audio dan video di aplikasi',
        'Mengambil informasi ukuran layar, orientasi, dan padding aman perangkat',
        'Menghubungkan aplikasi ke server backend',
        'Melakukan kompresi ukuran gambar aset',
      ],
      correctIndex: 1,
    ),
    QuestionModel(
      id: 6,
      category: 'Pemrograman Mobile',
      question:
          'File konfigurasi utama pada proyek Flutter yang digunakan untuk mengatur dependensi dan aset adalah...',
      options: [
        'AndroidManifest.xml',
        'pubspec.yaml',
        'build.gradle',
        'main.dart',
      ],
      correctIndex: 1,
    ),

    // === TOPIK: MATEMATIKA & LOGIKA ===
    QuestionModel(
      id: 7,
      category: 'Matematika & Logika',
      question:
          'Berapakah hasil perhitungan dari operasi: 15 + 25 × 2 - 10?',
      options: [
        '55',
        '70',
        '65',
        '45',
      ],
      correctIndex: 0,
    ),
    QuestionModel(
      id: 8,
      category: 'Matematika & Logika',
      question:
          'Tentukan angka berikutnya pada pola deret: 2, 4, 8, 16, 32, ...?',
      options: [
        '48',
        '64',
        '56',
        '72',
      ],
      correctIndex: 1,
    ),
    QuestionModel(
      id: 9,
      category: 'Matematika & Logika',
      question:
          'Sebuah kemeja seharga Rp 200.000 mendapatkan potongan diskon sebesar 25%. Berapakah harga yang harus dibayar?',
      options: [
        'Rp 175.000',
        'Rp 160.000',
        'Rp 150.000',
        'Rp 125.000',
      ],
      correctIndex: 2,
    ),
    QuestionModel(
      id: 10,
      category: 'Matematika & Logika',
      question:
          'Jika 5 mesin pabrik membutuhkan waktu 5 menit untuk membuat 5 baju, berapa menit yang dibutuhkan 100 mesin untuk membuat 100 baju?',
      options: [
        '100 menit',
        '50 menit',
        '5 menit',
        '1 menit',
      ],
      correctIndex: 2,
    ),
    QuestionModel(
      id: 11,
      category: 'Matematika & Logika',
      question:
          'Berapakah hasil dari 2 dipangkatkan 5 (2⁵)?',
      options: [
        '16',
        '25',
        '32',
        '64',
      ],
      correctIndex: 2,
    ),
    QuestionModel(
      id: 12,
      category: 'Matematika & Logika',
      question:
          'Akar kuadrat dari 144 (√144) adalah...',
      options: [
        '11',
        '12',
        '13',
        '14',
      ],
      correctIndex: 1,
    ),

    // === TOPIK: TEKNOLOGI & KOMPUTER ===
    QuestionModel(
      id: 13,
      category: 'Teknologi & Komputer',
      question:
          'Komponen utama perangkat keras komputer yang berfungsi sebagai otak pusat pengolahan instruksi data adalah...',
      options: [
        'Hard Disk Drive (HDD)',
        'Central Processing Unit (CPU)',
        'Power Supply Unit (PSU)',
        'Video Graphics Array (VGA)',
      ],
      correctIndex: 1,
    ),
    QuestionModel(
      id: 14,
      category: 'Teknologi & Komputer',
      question:
          'Dalam sistem komputasi digital, 1 Byte terdiri dari berapa bit?',
      options: [
        '4 bit',
        '8 bit',
        '16 bit',
        '32 bit',
      ],
      correctIndex: 1,
    ),
    QuestionModel(
      id: 15,
      category: 'Teknologi & Komputer',
      question:
          'Sistem bilangan yang menjadi dasar pengolahan data pada sirkuit digital komputer karena hanya menggunakan simbol 0 dan 1 disebut...',
      options: [
        'Sistem Desimal',
        'Sistem Oktal',
        'Sistem Heksadesimal',
        'Sistem Biner',
      ],
      correctIndex: 3,
    ),
    QuestionModel(
      id: 16,
      category: 'Teknologi & Komputer',
      question:
          'Jenis memori utama komputer yang bersifat "volatile" (data di dalamnya akan hilang saat aliran listrik padam) adalah...',
      options: [
        'Read Only Memory (ROM)',
        'Solid State Drive (SSD)',
        'Random Access Memory (RAM)',
        'Flashdisk',
      ],
      correctIndex: 2,
    ),
    QuestionModel(
      id: 17,
      category: 'Teknologi & Komputer',
      question:
          'Protokol jaringan standar yang digunakan untuk mentransfer data halaman website dengan enkripsi keamanan data adalah...',
      options: [
        'FTP',
        'HTTP',
        'HTTPS',
        'SMTP',
      ],
      correctIndex: 2,
    ),
  ];
}
