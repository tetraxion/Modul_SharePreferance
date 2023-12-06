// ignore: file_names
import 'package:flutter/material.dart';
import 'package:praktikum_pertemuan_10/TugasModel.dart';

class TambahTugasPage extends StatelessWidget {
  final Function(Tugas) onSubmit;

  // ignore: use_key_in_widget_constructors
  TambahTugasPage({required this.onSubmit});

  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Tugas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _judulController,
              decoration: InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: _deskripsiController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Tugas tugas = Tugas(_judulController.text, _deskripsiController.text);
                onSubmit(tugas);
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
