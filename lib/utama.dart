import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Utama extends StatelessWidget {
  const Utama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  autoPlayInterval: Duration(seconds: 4),
                  autoPlay: true,
                ),
                items: ["logo_perumnas.png", "teluk_jambe.jpeg", "haluoleo.jpeg","jeruk_sawit.jpeg","cilegon.jpeg","apartemen-sentraland-cengkareng.jpeg","rusunawa-pulogebang-perumnas.jpeg"].map((i) {
                  return Builder(builder: (context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Image.asset("images/$i"),
                    );
                  });
                }).toList(),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(0),
                child: Text("PERUMNAS adalah Badan Usaha Milik Negara (BUMN) yang berbentuk Perusahaan Umum (Perum) dimana keseluruhan sahamnya dimiliki oleh Pemerintah. Perumnas didirikan sebagai solusi pemerintah dalam menyediakan perumahan yang layak bagi masyarakat menengah ke bawah."),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(0),
                child: Text("Perusahan didirikan berdasarkan Peraturan Pemerintah Nomor 29 Tahun 1974, diubah dengan Peraturan Pemerintah Nomor 12 Tahun 1988, dan disempurnakan melalui Peraturan Pemerintah No. 15 Tahun 2004 tanggal 10 Mei 2004. Sejak didirikan tahun 1974, Perumnas selalu tampil dan berperan sebagai pioneer dalam penyediaan perumahan dan permukiman bagi masyarakat berpenghasilan menengah ke bawah."),
              )

            ],

          )



      ),

    );
  }
}
