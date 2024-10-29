import 'package:flutter/material.dart';
import 'package:kuliner/styles.dart';
import 'makanan.dart';

class DetailPage extends StatelessWidget {
  final Makanan makanan;
  const DetailPage({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pageBgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: <Widget>[
                  Image.asset(
                    makanan.gambar,
                    scale: 0.5,
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          FavouriteButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  makanan.nama,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        const Icon(Icons.access_time_filled,
                            color: Color.fromARGB(255, 255, 230, 0)),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          makanan.waktubuka,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          makanan.kalori,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.monetization_on, color: Colors.green),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          makanan.harga,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  makanan.detail,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: makanan.gambarlain.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(url),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  'Bahan Racikan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Column(
                            children: [
                              Image.asset(makanan.bahan[index].values.first, width: 52),
                              Text(makanan.bahan[index].keys.first),
                            ],
                          ),
                        ),
                    separatorBuilder: (_, index) => SizedBox(
                          width: 15,
                        ),
                    itemCount: makanan.bahan.length),
              ),
              SizedBox(
                height: 50,
              ),
              
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FavouriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: Colors.white,
      ),
      iconSize: 40.0,
      onPressed: () {
        // Action to perform when button is pressed
      },
    );
  }
}
