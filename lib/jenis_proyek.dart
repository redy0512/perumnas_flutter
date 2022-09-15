import 'package:flutter/material.dart';

class Jenis_proyek extends StatelessWidget {
  const Jenis_proyek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
          Text("Landed Project",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Image.asset("images/jeruk_sawit.jpeg",fit: BoxFit.fitWidth),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(00),
            margin: EdgeInsets.all(10),
            child: Text("1. Jawa : Cilegon, Bogor, Karawang, Purwakarta, Bandung, Garut, Semarang, Demak, Solo, Yogyakarta, Cilacap, Madiun, Surabaya, Pasuruan, Mojokerto, Malang dan Banyuwangi."),
          ),
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(10),
            child: Text("2. Sumatera : Melauboh, Medan, Martubung, Jambi, Bengkulu, Sumatera Barat, Palembang, Jakabaring dan Lampung"),
          ),
          SizedBox(height: 30,),
          Text("High Rise Project",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Image.asset("images/apartemen-sentraland-cengkareng.jpeg",fit: BoxFit.fitWidth),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(00),
            margin: EdgeInsets.all(10),
            child: Text("1. Jawa : DKI Jakarta, Karawang, Semarang"),
          ),
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(10),
            child: Text("2. Sumatera : Sukaramai Medan dan Jakabaring"),
          ),
        ],
      ),
    );  }
}
