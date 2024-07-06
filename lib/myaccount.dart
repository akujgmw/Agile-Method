import 'package:flutter/material.dart';
import 'package:quiz_me/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySetting(),
    );
  }
}

class MySetting extends StatelessWidget {
  const MySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccountDetailsPage(),
    );
  }
}

class AccountDetailsPage extends StatefulWidget {
  @override
  _AccountDetailsPageState createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  String _gender = 'Pria';
  DateTime _tanggalLahir = DateTime(2000, 1, 1);

  TextEditingController _namaController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nomorTelpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaController.text = 'John Doe';
    _usernameController.text = 'johndoe123';
    _nomorTelpController.text = '08123456789';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Pribadi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Settings();
            }));
          },
        ),
      ),
      backgroundColor: Colors.blue, // Warna latar belakang biru
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDataContainer('Nama', _namaController),
            SizedBox(height: 20.0),
            _buildDataContainer('Username', _usernameController),
            SizedBox(height: 20.0),
            _buildDataContainer('Nomor Telepon', _nomorTelpController),
            SizedBox(height: 20.0),
            _buildDataContainer('Gender', null, dropdown: true),
            SizedBox(height: 20.0),
            _buildDataContainer('Tanggal Lahir', null, datePicker: true),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // Proses update profile di sini
                // Anda dapat mengambil nilai dari controller seperti ini:
                // _namaController.text
                // _usernameController.text
                // _nomorTelpController.text
                // _gender
                // _tanggalLahir
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataContainer(String label, TextEditingController? controller,
      {bool dropdown = false, bool datePicker = false}) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            if (controller != null)
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Masukkan $label Anda',
                ),
              ),
            if (dropdown)
              Container(
                width: double.infinity,
                child: DropdownButton<String>(
                  // padding: EdgeInsets.symmetric(horizontal: 300),
                  value: _gender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _gender = newValue!;
                    });
                  },
                  items:
                      <String>['Pria', 'Wanita', 'Lainnya'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            if (datePicker)
              Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Text(
                    "${_tanggalLahir.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Metode untuk memilih tanggal lahir
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _tanggalLahir,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _tanggalLahir)
      setState(() {
        _tanggalLahir = picked;
      });
  }
}
