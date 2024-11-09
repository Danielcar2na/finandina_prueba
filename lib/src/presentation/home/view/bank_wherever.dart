import 'package:finandina_prueba/src/presentation/widgets/_custom_image.dart';
import 'package:finandina_prueba/src/presentation/widgets/_description_section.dart';
import 'package:flutter/material.dart';

class BankWherever extends StatefulWidget {
  const BankWherever({super.key});

  @override
  State<BankWherever> createState() => _BankWhereverState();
}

class _BankWhereverState extends State<BankWherever> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45),
        Image.asset('assets/img/logo.png',
        width: 40,
        height: 40,),
        const SizedBox(height: 60),
        const CustomImage(padding: EdgeInsets.only(right: 8), imagePath: 'assets/img/bankWhereverx3.png', width: 430, height: 430),
        const SizedBox(height: 25),
        const DescriptionSection(title: ('Tu banco donde quieras'),fontSizeTitle: 28, isBoldTitle: true, 
        subtitle: ('La oficina más cercana es tu celular. Libérate \n  de las filas y los trámites largos.'),fontSizeSubtitle: 16,),
      ],
    );
  }
}