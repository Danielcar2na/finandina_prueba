import 'package:finandina_prueba/src/presentation/widgets/_custom_image.dart';
import 'package:finandina_prueba/src/presentation/widgets/_description_section.dart';
import 'package:flutter/material.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45),
        Image.asset('assets/img/logo.png', width: 40, height: 40,),
        const SizedBox(height: 50),
        const CustomImage(imagePath: 'assets/img/sendMoneyx3.png', width: 400, height: 400),
        const SizedBox(height: 65),
        const DescriptionSection(title: ('Envía dinero'),fontSizeTitle: 28, isBoldTitle: true, 
        subtitle: ('Pasa plata libremente y sin costo a cualquier \n cuenta bancaria o de celular en Colombia.'),fontSizeSubtitle: 16,),
      ],
    );
  }
}