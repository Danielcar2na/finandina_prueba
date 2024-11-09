import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;

  final double width;
  final double height;
  final BoxFit fit;
  final EdgeInsetsGeometry padding;

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
      padding: padding, // Aplica el relleno alrededor de la imagen
      child: Image.asset(
        imagePath, // Ruta de la imagen en los assets
        width: width, // Define el ancho de la imagen
        height: height, // Define la altura de la imagen
        fit: fit, // Ajuste de la imagen dentro del contenedor
      ),
    );
  }
}
