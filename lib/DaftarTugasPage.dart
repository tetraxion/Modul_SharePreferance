import 'package:flutter/material.dart';
import 'package:praktikum_pertemuan_10/TugasModel.dart';


class DaftarTugasPage extends StatelessWidget {
  final List<Tugas> daftarTugas;
  final Function(int) onDelete;

  DaftarTugasPage(this.daftarTugas, {required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: daftarTugas.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(daftarTugas[index].judul),
          subtitle: Text(daftarTugas[index].deskripsi),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              onDelete(index);
            },
          ),
        );
      },
    );
  }
}
