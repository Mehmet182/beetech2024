// ignore: file_names
import 'package:flutter/material.dart';

class AnasayfaUrunWidget extends StatefulWidget {
  const AnasayfaUrunWidget({
    super.key,
    required this.baslik,
    required this.IndirimOrani,
    required this.resimAdresi,
    required this.usdfiyat,
    required this.iconAdresi,
    required this.derece,
  });

  final String baslik;
  final String resimAdresi;
  final String iconAdresi;
  final double usdfiyat;
  final double IndirimOrani;
  final double derece;

  @override
  State createState() => _AnasayfaUrunWidgetState();
}

/* üstteki fonksiyonun uzun versiyonu 
State createState() {
    return _AnasayfaUrunWidgetState();
  }
*/
/*
String baslik = "adidas white sneakers for men";
String resimAdresi = "varliklar/shoes1.png";
double usdfiyat = 68.5;
double IndirimOrani = 50;
bool favoriMi = false;
*/

// accses modifier _ -> private demek
class _AnasayfaUrunWidgetState extends State<AnasayfaUrunWidget> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                widget.resimAdresi,
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Positioned(
                top: 7.5,
                right: 7.5,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFavorited = !_isFavorited;
                    });
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(
                          255, 254, 225, 225), // Arka plan rengini ayarlar
                      shape: BoxShape.circle, // Daire şeklini ayarlar
                    ),
                    // ),
                    child: Icon(
                      Icons.favorite,
                      color: _isFavorited ? Colors.red : Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            widget.baslik,
            style: TextStyle(
              fontSize: 17, /*fontWeight: FontWeight.bold*/
            ),
          ),
          //*******************
          //****************** */ */
          Row(
            children: [
              Text(
                "\$${widget.usdfiyat}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(width: 5),
              Text(
                "\$136",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.red),
              ),
              SizedBox(width: 8),
              Text("${widget.IndirimOrani}% OFF"),
            ],
          ),
          //SizedBox(width: 8),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, bottom: 0),
                child: Image.asset(
                  widget.iconAdresi,
                  width: 17.5,
                  height: 17.5,
                ),
              ),
              SizedBox(width: 8),
              Text("${widget.derece}"),
            ],
          ),
        ],
      ),
    );
  }
}
