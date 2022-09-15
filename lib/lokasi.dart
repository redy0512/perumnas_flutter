class Lokasi{

  final int id;
  final String lokasi_name;

  Lokasi({required this.id,required this.lokasi_name});

  factory Lokasi.fromMap(Map<String, dynamic> json)=>  Lokasi(
      id: json['id'],
    lokasi_name: json['lokasi_name'],
  );

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'lokasi_name':lokasi_name,
    };
  }
}