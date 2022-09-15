import 'package:flutter/material.dart';

class Rusunawa extends StatelessWidget {
  const Rusunawa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
          Text("Rusunawa",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Image.asset("images/rusunawa-pulogebang-perumnas.jpeg",fit: BoxFit.fitWidth),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(10),
            child: Text("1. DKI Jakarta : Pulo Gebang, Cengkareng, PS Jumat, Kemayoran dan Koja"),
          ),
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(10),
            child: Text("2. Riau Kepulauan : Tanjung Piayu Batam"),
          )
        ],
      ),
    );  }
}
