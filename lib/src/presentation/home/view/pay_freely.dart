import 'package:finandina_prueba/src/presentation/widgets/_custom_image.dart';
import 'package:finandina_prueba/src/presentation/widgets/_description_section.dart';
import 'package:flutter/material.dart';

class PayFreely extends StatefulWidget {
  const PayFreely({super.key});

  @override
  State<PayFreely> createState() => _PayFreelyState();
}

class _PayFreelyState extends State<PayFreely> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45),
        Image.asset('assets/img/logo.png', width: 40, height: 40,),
        const SizedBox(height: 70),
        const CustomImage(padding: EdgeInsets.only(left: 20), imagePath: 'assets/img/payFreelyx3.png', width: 363, height: 360),
        const SizedBox(height: 85),
        const DescriptionSection(title: ('Paga libremente'),fontSizeTitle: 28, isBoldTitle: true, 
        subtitle: ('Puedes pagar tus productos, recibidos y facturas \n en cualquier momento y lugar.'), fontSizeSubtitle: 16,
        ),
      ],
    );
  }
}