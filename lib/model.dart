// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String nama;
  final String? alamat;
  final String tempatLahir;
  final String tanggalLahir;
  final String status;
  final String? pekerjaan;
  final List<String>? bahasa;
  final String? foto;
  final List<String>? bahasaPemrograman;
  
  const User({
    required this.nama,
    this.alamat,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.status,
    this.pekerjaan,
    this.bahasa,
    this.foto,
    this.bahasaPemrograman,
  });
}

List<User> userList = [
  User(
    nama: 'felix',
    tempatLahir: 'Medan',
    tanggalLahir: '21 Agustus 2003',
    status: 'Mahasiswa',
    pekerjaan: 'Junior Software Developer',
    alamat:
        'Jl. A.M.D, Komplek Dewiindah Blok D5, Rengas Pulau, Medan Marelan, Sumatera Utara',
    foto: 'images/felix.jpg',
    bahasa: ['Indonesia - Mahir', 'Inggris - Sedang'],
    bahasaPemrograman: ['Dart', 'JavaScript', 'SQL',  ]
  ),
];
