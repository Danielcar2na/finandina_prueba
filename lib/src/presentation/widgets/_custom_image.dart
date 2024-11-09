import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imagePath; // Ruta de la imagen
  final double width; // Ancho de la imagen
  final double height; // Alto de la imagen
  final BoxFit fit; // Propiedad para ajustar el tamaño de la imagen
  final  EdgeInsetsGeometry padding ;

  // Constructor que acepta estos parámetros
  const CustomImage({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
    this.fit = BoxFit.contain, 
    this.padding = const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit,
         // Ajusta la imagen dentro de los límites definidos
      ),
    );
  }
}
