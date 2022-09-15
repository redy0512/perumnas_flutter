import 'package:flutter/material.dart';

import 'package:perumnas/lokasi.dart';
import 'package:perumnas/lokasi_argument.dart';
import 'package:perumnas/databasehelper.dart';


class Proyek extends StatefulWidget {
  const Proyek({Key? key}) : super(key: key);

  @override
  State<Proyek> createState() => _ProyekState();
}

class _ProyekState extends State<Proyek> {
  //State Management
  late String lokasiState = 'awal';


  final txtCari = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: txtCari,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                labelText: "Cari ?",
                hintText: "Ketik yang anda cari ",
              ),
              onChanged: (text){
                setState((){
                  lokasiState = "cari";
                });
              },
            ),
          ),
          Expanded(
              child: FutureBuilder<List<Lokasi>>(
                future: lokasiState == 'refresh'
                    ? DatabaseHelper.instance.getLokasi()
                    : DatabaseHelper.instance.seleksiLokasi(txtCari.text),
//              : null,
//          future: DatabaseHelper.instance.getAgenda(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Lokasi>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("Loading, please wait..."),
                    );
                  }
                  // tampilkan data
                  return snapshot.data!.isEmpty
                      ? const Text("Belum Ada Data")
                      : ListView(
                    children: snapshot.data!.map((lokasi) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            leading: IconButton(
                                onPressed: () {
                                  final _lokasi_argument = Lokasi_argument(
                                      lokasi.id, lokasi.lokasi_name, "edit");

                                  Navigator.pushNamed(
                                    context,
                                    "/LokasiForm",
                                    arguments: _lokasi_argument,
                                  ).whenComplete(() {
                                    setState(() {
                                      lokasiState = "refresh";
                                    });
                                  });
                                },
                                icon: Icon(Icons.edit)),
                            title: Text(lokasi.lokasi_name),
                            subtitle: Text("ID " + lokasi.id.toString()),
                            trailing: IconButton(
                                onPressed: () {
                                  // Konfirmasi hap
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title:
                                          const Text("Konfirmasi hapus"),
                                          content: Text(
                                              "Yakin akan hapus data ${lokasi.lokasi_name}?"),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () async {
                                                  final idx = lokasi.id;
                                                  await DatabaseHelper
                                                      .instance
                                                      .deleteLokasi(idx);

                                                  setState(() {
                                                    lokasiState = "refresh";
                                                    Navigator.of(context)
                                                        .pop();
                                                  });
                                                },
                                                child: const Text("OK")),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("Batal")),
                                          ],
                                        );
                                      });
                                },
                                icon: const Icon(Icons.delete)),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
/*          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AgendaForm()),
          ).whenComplete(() {
            setState(() {
              agendaState = 'refresh';

            });
*/
          final lokasi_argument = Lokasi_argument(0, "", "simpan");
          Navigator.pushNamed(
            context,
            "/LokasiForm",
            arguments: lokasi_argument,
          ).whenComplete(() {
            setState(() {
              lokasiState = 'refresh';
            });
          });
        },
        child: const Icon(Icons.create),
      ),
    );
  }
}
