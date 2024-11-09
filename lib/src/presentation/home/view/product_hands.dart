import 'package:finandina_prueba/src/presentation/widgets/_custom_image.dart';
import 'package:finandina_prueba/src/presentation/widgets/_description_section.dart';
import 'package:flutter/material.dart';

class ProductHands extends StatefulWidget {
  const ProductHands({super.key});

  @override
  State<ProductHands> createState() => _ProductHandsState();
}

class _ProductHandsState extends State<ProductHands>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Espacio adaptable superior
          SizedBox(height: screenHeight * 0.05),
    
          // Usamos Hero para la animación del logo
          Hero(
            tag: 'logo', // Este tag debe coincidir con el de la página anterior
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, child) {
                return Image.asset(
                'assets/img/logo.png',
                width:
                    _animation.value, // Tamaño proporcional al ancho de pantalla
                height:
                    _animation.value, // Tamaño proporcional al ancho de pantalla
              );
                },
               
            ),
          ),
    
          // Espacio adaptable entre logo y la imagen
          SizedBox(height: screenHeight * 0.1),
    
          CustomImage(
            padding: EdgeInsets.only(
                left: screenWidth * 0.08), // Espaciado adaptable
            imagePath: 'assets/img/productHandsx3.png',
            width: screenWidth * 0.8, // Ancho adaptable
            height: screenHeight * 0.4, // Alto adaptable
          ),
    
          // Espacio entre imagen y descripción
          SizedBox(height: screenHeight * 0.12),
    
          DescriptionSection(
            title: 'Tus productos a la mano',
            fontSizeTitle:
                screenWidth * 0.08, // Tamaño de título proporcional al ancho
            isBoldTitle: true,
            subtitle:
                'Adminístralos libremente desde cualquier \n lugar, fácil y rápido.',
            fontSizeSubtitle: screenWidth *
                0.04, // Tamaño del subtítulo proporcional al ancho
          ),
        ],
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    // Inicializamos el controlador de animación
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _animation = Tween<double>(begin: 90, end: 40).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Reiniciar la animación al llegar a la página
    _controller.forward();
  }
}
