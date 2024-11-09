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
            width: screenWidth * 0.1,  // Ancho proporcional al tamaño de la pantalla
            height: screenWidth * 0.1, // Alto proporcional al tamaño de la pantalla
          ),

          // Espacio entre el logo y la imagen
          SizedBox(height: screenHeight * 0.08),

          // Imagen ajustada
          CustomImage(
            padding: EdgeInsets.only(right: screenWidth * 0.02), // Ajuste del espaciado a la derecha
            imagePath: 'assets/img/bankWhereverx3.png',
            width: screenWidth * 0.9,  // Ancho ajustado al 90% del ancho de la pantalla
            height: screenHeight * 0.4, // Alto ajustado al 40% de la altura de la pantalla
          ),

          // Espacio entre la imagen y la descripción
          SizedBox(height: screenHeight * 0.14),

          // Descripción con tamaños de fuente adaptativos
          DescriptionSection(
            title: 'Tu banco donde quieras',
            fontSizeTitle: screenWidth * 0.08,  // Tamaño del título proporcional al ancho de la pantalla
            isBoldTitle: true,
            subtitle: 'La oficina más cercana es tu celular. Libérate \n de las filas y los trámites largos.',
            fontSizeSubtitle: screenWidth * 0.04,  // Tamaño del subtítulo proporcional al ancho de la pantalla
          ),
        ],
      ),
    );
  }
}
