import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class SepetButtonWidget extends StatelessWidget {
  const SepetButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    return IconButton(
      icon: Stack(
        children: [
          Image.asset(
            'varliklar/bag1.jpg',
            height: 32.5,
            width: 32.5,
          ),
          /*
          Positioned(
            top: 0,
            right: 0,
            child: StreamBuilder(
                stream: userDoc.snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    final List cartArray = snapshot.data!['cart'] ?? [];
                    if (cartArray.isEmpty) return const SizedBox();

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: ColoredBox(
                        color: Colors.red,
                        child: Text("${cartArray.length}"),
                      ),
                    );
                  }
                  return const SizedBox();
                }),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
*/
          Positioned(
            top: 0,
            right: 0,
            child: StreamBuilder(
                stream: userDoc.snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    final List cartArray = snapshot.data!['cart'] ?? [];
                    if (cartArray.isEmpty) return const SizedBox();

                    return Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Text(
                        "${cartArray.length}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return const SizedBox();
                }),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
