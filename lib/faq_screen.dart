import 'package:flutter/material.dart';
import 'package:quiz_me/page.dart';

// / Flutter code sample for [ExpansionTile].

class ExpansionTileApp extends StatelessWidget {
  const ExpansionTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text('FaQ'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Settings();
              }));
            },
          ),
        ),
        backgroundColor: Colors.blue,
        body: const ExpansionTileExample(),
      ),
    );
  }
}

class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample({super.key});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        ExpansionTile(
          title: Text(
            'Bagaimana cara membuat kuis di aplikasi ini?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          children: <Widget>[
            ListTile(
                title: Text(
              'Untuk membuat kuis, masuk ke akun Anda, pilih opsi "Buat Kuis," masukkan judul dan deskripsi, tambahkan pertanyaan dengan format yang diinginkan (pilihan ganda, benar/salah, isian singkat), lalu simpan dan publikasikan kuis Anda.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            )),
          ],
        ),
        ExpansionTile(
          title: Text(
            'Bagaimana cara mengundang peserta untuk mengikuti kuis saya?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          children: <Widget>[
            ListTile(
                title: Text(
              'Anda dapat mengundang peserta dengan membagikan tautan undangan yang dihasilkan oleh aplikasi, menggunakan kode undangan, atau mengirim undangan langsung melalui daftar kontak atau grup yang terhubung dengan aplikasi.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            )),
          ],
        ),
        ExpansionTile(
          title: Text(
            'Apakah saya bisa melihat hasil kuis dan menganalisis performa peserta?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          children: <Widget>[
            ListTile(
                title: Text(
              'Ya, Anda bisa melihat hasil kuis di bagian "Hasil" atau "Analitik" aplikasi. Di sana, Anda akan menemukan ringkasan skor, detail jawaban peserta, serta grafik dan laporan analisis performa peserta.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            )),
          ],
        ),
      ],
    );
  }
}
