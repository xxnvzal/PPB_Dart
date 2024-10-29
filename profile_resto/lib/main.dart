import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(RestoProfileApp());
}

class RestoProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Restoran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RestoProfileScreen(),
    );
  }
}

class RestoProfileScreen extends StatelessWidget {
  Future launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil : $uri');
    }
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: PhysicalModel(
        color: Colors.transparent, 
        elevation: 0, 
        child: ElevatedButton(
          onPressed: () {
            launch(uri);
          },
          child: Icon(icon),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: Color(0xFFFEF7FF),
            foregroundColor: Colors.black,
            shadowColor: Colors.transparent, 
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Nama Restoran
              Text(
                'RM. Sederhana',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              // Gambar Profil Restoran
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      16.0), 
                  child: Image.asset(
                    'assets/images/profile_resto.png',
                    width: 350,
                    height: 300,
                    fit: BoxFit.cover, 
                  ),
                ),
              ),

              SizedBox(height: 5),

              // Ikon Kontak
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  btnContact(Icons.email, Colors.black,
                       "mailto:raplirhmdnt@gmail.com?subject=Tanya%20Seputar%20Resto"),
                  btnContact(Icons.phone, Colors.black,
                      "tel:085856265044"),
                  btnContact(Icons.map, Colors.black,
                      "https://maps.app.goo.gl/jw75Cyn1YbDz93NK6"),
                ],
              ),

              Divider(
                color: const Color.fromARGB(255, 182, 182, 182),
                thickness: 1,
              ),

              // Deskripsi
              Text(
                'Deskripsi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Restoran dengan menu lengkap dan harganya terjangkau',
              ),
              SizedBox(height: 5),
              Divider(
                color: const Color.fromARGB(255, 182, 182, 182),
                thickness: 1,
              ),

              // List Menu
              Text(
                'List Menu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('• Nasi Goreng khas Jawa'),
                  Text('• Ayam Goreng Kampung'),
                  Text('• Mie Goreng Jumbo'),
                  Text('• Ikan Kepala Manyung'),
                  Text('• dll'),
                ],
              ),
              SizedBox(height: 5),
              Divider(
                color: const Color.fromARGB(255, 182, 182, 182),
                thickness: 1,
              ),

              // Alamat
              Text(
                'Alamat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Jl. Imam Bonjol No.207, Pendrikan Kidul',
              ),
              SizedBox(height: 5),
              Divider(
                color: const Color.fromARGB(255, 182, 182, 182),
                thickness: 1,
              ),

              // Jam Buka
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Jam Buka',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Senin - Jumat'),
                            Text('08:00 - 22:00'),
                          ],
                        ),
                      ),
                      Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Sabtu - Minggu'),
                            Text('09:00 - 23:00'),
                          ],
                        ),
                      ),
                      Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Tanggal Merah/Hari libur'),
                            Text('09:00 - 23:00'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
