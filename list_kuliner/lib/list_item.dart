import 'package:flutter/material.dart';
import 'package:kuliner/detail_page.dart';
import 'package:kuliner/styles.dart';
import 'makanan.dart';

class ListItem extends StatelessWidget {
  final Makanan makanan;
  const ListItem({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(makanan: makanan)));
      },
      child: Container(
         margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 178, 178, 178),
            offset: Offset(1.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      height: 100,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // widget untuk menampilkan gambar lokal
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: 
            Image.asset(
            makanan.gambar,
            height: 75,
            width: 75,
            fit: BoxFit.cover,
          ),
          ),
          
          SizedBox(
            width: 10,
          ),
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                makanan.nama,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                makanan.deskripsi,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                makanan.harga,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Spacer(),

          Icon(Icons.food_bank_rounded, color: iconColor,
          )
        ],
      ),
      )
     
    );
  }
}
