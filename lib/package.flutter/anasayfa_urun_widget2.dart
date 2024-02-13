// ignore: file_names
import 'package:flutter/material.dart';

class AnasayfaUrunWidget2 extends StatefulWidget {
  const AnasayfaUrunWidget2({
    super.key,
    required this.baslik,
    required this.resimAdresi,
  });

  final String baslik;
  final String resimAdresi;

  @override
  State createState() => _AnasayfaUrunWidget2State();
}

// accses modifier _ -> private demek
class _AnasayfaUrunWidget2State extends State<AnasayfaUrunWidget2> {
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
            ],
          ),
          Row(
            children: [
              Text(widget.baslik),
            ],
          ),
        ],
      ),
    );
  }
}
