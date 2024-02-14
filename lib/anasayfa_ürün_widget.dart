// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modeller/urun_model.dart';

class AnasayfaUrunWidget extends StatefulWidget {
  const AnasayfaUrunWidget({super.key, required this.urun});

  final UrunModel urun;
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
              Image.network(
                widget.urun.resimAdresi,
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
                    decoration: const BoxDecoration(
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
            widget.urun.baslik,
            style: const TextStyle(
              fontSize: 17, /*fontWeight: FontWeight.bold*/
            ),
          ),
          //*******************
          //****************** */ */
          Row(
            children: [
              Text(
                "\$${widget.urun.fiyatUSD}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(width: 5),
              const Text(
                "\$136",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.red),
              ),
              const SizedBox(width: 8),
              Text("${widget.urun.derece}% OFF"),
            ],
          ),
          //SizedBox(width: 8),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, bottom: 0),
                child: Image.asset(
                  widget.urun.iconAdresi,
                  width: 17.5,
                  height: 17.5,
                ),
              ),
              const SizedBox(width: 8),
              Text("${widget.urun.derece}"),
            ],
          ),
        ],
      ),
    );
  }
}
