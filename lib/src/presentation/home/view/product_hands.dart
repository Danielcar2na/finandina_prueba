import 'package:finandina_prueba/src/presentation/widgets/_custom_image.dart';
import 'package:finandina_prueba/src/presentation/widgets/_description_section.dart';
import 'package:flutter/material.dart';

class ProductHands extends StatefulWidget {
  const ProductHands({super.key});

  @override
  State<ProductHands> createState() => _ProductHandsState();
}

class _ProductHandsState extends State<ProductHands> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45),
        Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/img/logo.png',
            width: 40,
            height: 40,
          ),
        ),
        const SizedBox(height: 70),
        const CustomImage(
          padding: EdgeInsets.only(left: 30),
          imagePath: 'assets/img/productHandsx3.png',
          width: 370,
          height: 373,
        ),
        const SizedBox(height: 70),
        const DescriptionSection(
          title: 'Tus productos a la mano',
          fontSizeTitle: 28,
          isBoldTitle: true,
          subtitle:
              'Adminístralos libremente desde cualquier \n lugar, fácil y rapido.',
          fontSizeSubtitle: 16,
        ),
      ],
    );
  }
}
