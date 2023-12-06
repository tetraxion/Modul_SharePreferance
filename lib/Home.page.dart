import 'package:flutter/material.dart';
import 'package:praktikum_pertemuan_10/DaftarTugasPage.dart';
import 'package:praktikum_pertemuan_10/SharePreferencesService.dart';
import 'package:praktikum_pertemuan_10/TambahTugasPage.dart';
import 'package:praktikum_pertemuan_10/TugasModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();
  List<Tugas> daftarTugas = [];

  @override
  void initState() {
    super.initState();
    loadTugas();
  }

  void loadTugas() async {
    List<Tugas> tugas = await sharedPreferencesService.getTugas();
    setState(() {
      daftarTugas = tugas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Tugas'),
      ),
      body: DaftarTugasPage(daftarTugas, onDelete: deleteTugas),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TambahTugasPage(onSubmit: addTugas)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void addTugas(Tugas tugas) async {
    await sharedPreferencesService.addTugas(tugas);
    loadTugas();
  }

  void deleteTugas(int index) async {
    await sharedPreferencesService.deleteTugas(index);
    loadTugas();
  }
}
