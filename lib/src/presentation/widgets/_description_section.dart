import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String text3;
  final double fontSizeTitle;
  final double fontSizeSubtitle;
  final bool isBoldSubtitle;
  final bool isBoldTitle;

  const DescriptionSection({
    super.key,
    required this.title,
    required this.subtitle,
    this.text3 = '',
    this.fontSizeTitle = 24,
    this.fontSizeSubtitle = 20,
    this.isBoldSubtitle = false,
    this.isBoldTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Ajuste de tamaño de fuente en función del ancho de pantalla
    final responsiveFontSizeTitle = screenWidth * 0.06;
    final responsiveFontSizeSubtitle = screenWidth * 0.05;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth *
              0.04), // Espaciado horizontal basado en el ancho de la pantalla
      child: Column(
        crossAxisAlignment: CrossAxisAlignment
            .center, // Centrado horizontal de los elementos de texto
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSizeTitle != 24
                  ? fontSizeTitle
                  : responsiveFontSizeTitle, // Tamaño de fuente adaptable o valor especificado
              fontWeight: isBoldTitle
                  ? FontWeight.bold
                  : FontWeight.normal, // Negrita opcional para el título
            ),
          ),
          const SizedBox(height: 5), // Espacio entre el título y el subtítulo
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSizeSubtitle != 20
                  ? fontSizeSubtitle
                  : responsiveFontSizeSubtitle, // Tamaño de fuente adaptable o valor especificado
              fontWeight: isBoldSubtitle
                  ? FontWeight.bold
                  : FontWeight.normal, // Negrita opcional para el subtítulo
            ),
          ),
          if (text3.isNotEmpty) ...[
            const SizedBox(
                height:
                    8), // Espacio entre el subtítulo y el texto adicional si está presente
            Text(
              text3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: responsiveFontSizeSubtitle *
                    0.9, // Tamaño de fuente más pequeño para el texto adicional
              ),
            ),
          ],
        ],
      ),
    );
  }
}
