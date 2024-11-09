import 'package:finandina_prueba/src/presentation/widgets/_custom_image.dart';
import 'package:finandina_prueba/src/presentation/widgets/_description_section.dart';
import 'package:flutter/material.dart';

class ScanAndGo extends StatefulWidget {
  const ScanAndGo({super.key});

  @override
  State<ScanAndGo> createState() => _ScanAndGoState();
}

class _ScanAndGoState extends State<ScanAndGo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45),
        Image.asset('assets/img/logo.png', width: 40, height: 40,),
        const SizedBox(height: 50),
        const CustomImage(imagePath: 'assets/img/endPagex3.png', width: 383, height: 370),
        const SizedBox(height: 95,),
        const DescriptionSection(title: ('¡Escanea y listo!'),fontSizeTitle: 28, isBoldTitle: true, 
        subtitle: ('Paga en datáfonos con QR y libérate de las \n tarjetas físicas.'),fontSizeSubtitle: 16,),
      ],
    );
  }
}