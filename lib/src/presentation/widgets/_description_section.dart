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

    // Calcular tamaños de fuente proporcionales al ancho de la pantalla
    final responsiveFontSizeTitle = screenWidth * 0.06; // Aproximadamente 6% del ancho
    final responsiveFontSizeSubtitle = screenWidth * 0.05; // Aproximadamente 5% del ancho

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% del ancho de pantalla
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSizeTitle != 24 ? fontSizeTitle : responsiveFontSizeTitle,
              fontWeight: isBoldTitle ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSizeSubtitle != 20 ? fontSizeSubtitle : responsiveFontSizeSubtitle,
              fontWeight: isBoldSubtitle ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (text3.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              text3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: responsiveFontSizeSubtitle * 0.9,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
