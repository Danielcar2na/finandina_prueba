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
            width: screenWidth * 0.1, // Tamaño proporcional al ancho
            height: screenWidth * 0.1, // Tamaño proporcional al ancho
          ),

          // Espacio entre el logo y la imagen
          SizedBox(height: screenHeight * 0.07), // Ajusta el espacio según necesidad

          // Imagen ajustada
          CustomImage(
            imagePath: 'assets/img/endPagex3.png',
            width: screenWidth * 1.0, // Ancho ajustado al 100% del ancho de la pantalla
            height: screenHeight * 0.43,
            fit: BoxFit.cover, // Altura ajustada al 40% de la altura de la pantalla
          ),

          // Espacio entre la imagen y la descripción
          SizedBox(height: screenHeight * 0.12), // Ajusta el espacio según necesidad

          // Descripción con tamaños de fuente adaptativos
          DescriptionSection(
            title: '¡Escanea y listo!',
            fontSizeTitle: screenWidth * 0.08, // Tamaño de título proporcional al ancho
            isBoldTitle: true,
            subtitle: 'Paga en datáfonos con QR y libérate de las \n tarjetas físicas.',
            fontSizeSubtitle: screenWidth * 0.04, // Tamaño del subtítulo proporcional al ancho
          ),
        ],
      ),
    );
  }
}
