import "package:flutter/material.dart";

class SepetButtonWidget extends StatelessWidget {
  const SepetButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        children: [
          Image.asset(
            'varliklar/bag1.jpg',
            height: 32.5,
            width: 32.5,
          ),
          const Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: ColoredBox(
                color: Colors.red,
                child: Text("0"),
              ),
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
