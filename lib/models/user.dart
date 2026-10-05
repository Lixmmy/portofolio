// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
  final List<String>? backend;
  final List<String>? frameworks;
  final String? githubLink;
  final String? linkedinLink;
  final String? instagramLink;

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
    this.backend,
    this.frameworks,
    this.githubLink,
    this.instagramLink,
    this.linkedinLink,
  });
}

User felix = User(
  nama: dotenv.get('NAMA'),
  tempatLahir: dotenv.get('TEMPAT_LAHIR'),
  tanggalLahir: dotenv.get('TANGGAL_LAHIR'),
  status: dotenv.get('STATUS'),
  pekerjaan: dotenv.get('PEKERJAAN'),
  alamat: dotenv.get('ALAMAT'),
  foto: 'assets/images/felix.jpg',
  bahasa: ['Indonesia - Mahir', 'Inggris - Sedang'],
  bahasaPemrograman: ['Dart', 'JavaScript', 'SQL', 'Python'],
  backend: ['Node.js', 'Express.js', 'Hapi.js', 'FastAPI'],
  frameworks: ['Flutter', 'N8N', 'GitHub', 'GitLab', 'Docker', 'Postman'],
  githubLink: 'https://github.com/Lixmmy',
  linkedinLink: 'https://www.linkedin.com/in/lix-goh/',
  instagramLink: 'https://www.instagram.com/felix.go_/',
);
