import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perumnas/lokasi.dart';
import 'package:perumnas/lokasi_argument.dart';
import 'package:perumnas/databasehelper.dart';

class LokasiForm extends StatefulWidget {
  const LokasiForm({Key? key}) : super(key: key);

  @override
  State<LokasiForm> createState() => _LokasiFormState();
}

class _LokasiFormState extends State<LokasiForm> {

  final _txtAgendaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _agenda_argument =
        ModalRoute.of(context)!.settings.arguments as Lokasi_argument;

    print(_agenda_argument.id);
    print(_agenda_argument.nama_lokasi);
    print(_agenda_argument.kondisi);

    final String _kondisi = _agenda_argument.kondisi;

    if (_kondisi == "edit") {
      _txtAgendaController.text = _agenda_argument.nama_lokasi;
    } else {
      _txtAgendaController.text = "";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Lokasi Proyek"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: _txtAgendaController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_month),
                  labelText: "Nama Lokasi",
                  hintText: "Lokasi Proyek"),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  //Validasi
                  if (_txtAgendaController.text == "") {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Konfirmasi Data"),
                            content: Text("Harap Isi Data"),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("OK")),
                            ],
                          );
                        });
                  } else {
                    if (_agenda_argument.kondisi == "edit") {
                      // Setup
                      final String namaLokasi = _txtAgendaController.text;
                      await DatabaseHelper.instance.editLokasi(Lokasi(
                          id: _agenda_argument.id, lokasi_name: namaLokasi));

                    } else {
                      //Simpan Edit
                      //print(txtAgendaController.text);
                      // Setup
                      final String namaLokasi = _txtAgendaController.text;
                      Random random = Random();
                      int randomNumber = random.nextInt(100);
                      //Simpan Data
                      await DatabaseHelper.instance.addLokasi(
                          Lokasi(id: randomNumber, lokasi_name: namaLokasi));


                    }

                    setState(() {
//                    agendaState='refresh';
                      Navigator.of(context).pop();
                    });

                  }
                },
                child: const Text("Simpan"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
