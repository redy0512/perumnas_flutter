import 'package:flutter/material.dart';

class Tentang extends StatelessWidget {
  const Tentang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Visi Misi"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          Text("Visi",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Card(
              child: Text("Menjadi Pengembang Permukiman dan Perumahan Rakyat Terpercaya di Indonesia"),
            ),
          ),
          SizedBox(height: 20,),
          Text("Misi",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Card(
              child: Text("1. Pengembang Terpercaya : Mengembangkan perumahan dan permukiman yang bernilai tambah untuk kepuasan pelanggan."),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Card(
              child: Text("2. Profesional : Meningkatkan professionalitas, pemberdayaan dan kesejahteraan Karyawan."),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Card(
              child: Text("3. Bernilai Maksimal : Memaksimalkan nilai bagi Pemegang Saham dan Pemangku Kepentingan lain."),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Card(
              child: Text("3. Sinergi : Mengoptimalkan sinergi dengan Mitra Kerja, Pemerintah, BUMN dan Instansi lain."),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Card(
              child: Text("4. Berkontribusi : Meningkatkan kontribusi positif kepada masyarakat dan lingkungan."),
            ),
          ),
        ],



      ),

    );
  }
}
