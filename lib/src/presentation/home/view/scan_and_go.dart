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
    // Obtener el tamaño de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Espacio superior adaptable
          SizedBox(height: screenHeight * 0.05),

          // Logo ajustado
          Image.asset(
            'assets/img/logo.png',
            width: screenWidth * 0.1, // Ancho proporcional al tamaño de la pantalla
            height: screenWidth * 0.1, // Alto proporcional al tamaño de la pantalla
          ),

          // Espacio entre el logo y la imagen
          SizedBox(height: screenHeight * 0.06),

          // Imagen ajustada
          CustomImage(
            imagePath: 'assets/img/endPagex3.png',
            width: screenWidth * 0.85, // Ancho ajustado al 85% del ancho de la pantalla
            height: screenHeight * 0.4, // Alto ajustado al 40% de la altura de la pantalla
          ),

          // Espacio entre la imagen y la descripción
          SizedBox(height: screenHeight * 0.12),

          // Descripción con tamaños de fuente adaptativos
          DescriptionSection(
            title: '¡Escanea y listo!',
            fontSizeTitle: screenWidth * 0.08, // Tamaño del título proporcional al ancho de la pantalla
            isBoldTitle: true,
            subtitle: 'Paga en datáfonos con QR y libérate de las \n tarjetas físicas.',
            fontSizeSubtitle: screenWidth * 0.04, // Tamaño del subtítulo proporcional al ancho de la pantalla
          ),
        ],
      ),
    );
  }
}
