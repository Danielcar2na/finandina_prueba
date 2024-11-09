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
            width: screenWidth * 0.1,  // Ancho proporcional
            height: screenWidth * 0.1, // Alto proporcional
          ),

          // Espacio entre el logo y la imagen
          SizedBox(height: screenHeight * 0.1),

          // Imagen ajustada
          CustomImage(
            padding: EdgeInsets.only(left: screenWidth * 0.05), // Espaciado adaptable
            imagePath: 'assets/img/payFreelyx3.png',
            width: screenWidth * 0.8, // Ancho ajustado
            height: screenHeight * 0.4, // Alto ajustado
          ),

          // Espacio entre la imagen y la descripción
          SizedBox(height: screenHeight * 0.12),

          // Descripción con tamaños de fuente adaptativos
          DescriptionSection(
            title: 'Paga libremente',
            fontSizeTitle: screenWidth * 0.08, // Tamaño de título proporcional al ancho
            isBoldTitle: true,
            subtitle: 'Puedes pagar tus productos, recibidos y facturas \n en cualquier momento y lugar.',
            fontSizeSubtitle: screenWidth * 0.04, // Tamaño del subtítulo proporcional al ancho
          ),
        ],
      ),
    );
  }
}
