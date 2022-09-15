import 'package:flutter/material.dart';
import 'package:perumnas/utama.dart';
import 'package:perumnas/rusunawa.dart';
import 'package:perumnas/tentang.dart';
import 'package:perumnas/jenis_proyek.dart';
import 'package:perumnas/proyek.dart';
import 'package:perumnas/lokasi_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      routes: {
        "/Beranda":(context) => const Proyek(),
        "/LokasiForm" : (context) => const LokasiForm(),
      },

    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;


  void _onTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Utama(),
    Jenis_proyek(),
    Rusunawa(),
    Proyek()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Perum Perumnas"),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration:
              BoxDecoration(
/*                borderRadius: BorderRadius.all(Radius.circular(100)),*/
                image: DecorationImage(
                  image: AssetImage("images/logo_perumnas.png"),
                  scale: 1.0,
                  alignment: Alignment.topCenter,
                ),
                color: Colors.white38,
              ),
              child: Text(""),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.supervised_user_circle,
                  size: 48,
                  color: Colors.blueAccent,
                ),
                title: Text("Visi Misi"),
                subtitle: Text("Perum Perumnas"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Tentang(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(
                  Icons.home_work),
              label: "Landed & High Rise"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.apartment), label: "Rusunawa"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.map), label: "Project Location"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onTaped,

      ),
    );
  }
}
