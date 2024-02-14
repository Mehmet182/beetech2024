class UrunModel {
  final String uid;
  final String baslik;
  final String resimAdresi;
  final String iconAdresi;
  final int fiyatUSD;
  final double indirimOrani;
  final double derece;

  const UrunModel({
    required this.uid,
    required this.baslik,
    required this.resimAdresi,
    required this.iconAdresi,
    required this.fiyatUSD,
    required this.indirimOrani,
    required this.derece,
  });

  factory UrunModel.fromFirestore(Map map, String uid) {
    return UrunModel(
      uid: uid,
      baslik: map['title'],
      iconAdresi: map['iconUrl'],
      resimAdresi: map['imageUrl'],
      fiyatUSD: map['price'],
      indirimOrani: map['discountRatio'],
      derece: map['derece'],
    );
  }
}
