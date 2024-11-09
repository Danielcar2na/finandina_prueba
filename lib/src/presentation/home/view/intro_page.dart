import 'package:finandina_prueba/src/presentation/widgets/_description_section.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with SingleTickerProviderStateMixin {
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

    return WillPopScope(
      onWillPop: () async {
        // Cuando el usuario presiona el botón de retroceso, animamos el logo a su tamaño original
        _controller.reverse();
        return true;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Espacio superior adaptable
            SizedBox(height: screenHeight * 0.05),

            // Usamos Hero para la animación del logo
            Hero(
              tag: 'logo',
              child: AnimatedBuilder(
                animation: _controller, // Usa el controlador para la animación
                builder: (context, child) {
                  return Image.asset(
                    'assets/img/logo.png',
                    width: _animation.value,
                    height: _animation.value,
                  );
                },
              ),
            ),

            SizedBox(height: screenHeight * 0.01), // Ajuste de espacio

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Con ',
                  style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.06),
                ),
                Text(
                  "Banco Finandina",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Text(
              "tienes el poder de ser libre",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.06, // Tamaño adaptado al ancho
              ),
            ),

            // Espacio adaptable
            SizedBox(height: screenHeight * 0.45),

            DescriptionSection(
              title: 'Descubre lo que puedes hacer con tu',
              fontSizeTitle: screenWidth * 0.04, // Tamaño del título ajustado
              subtitle: 'App Banco Finandina',
              fontSizeSubtitle: screenWidth * 0.08, // Tamaño de subtítulo ajustado
              isBoldSubtitle: true,
            ),
          ],
        ),
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
    _animation = Tween<double>(begin: 40, end: 90).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Reiniciar la animación al llegar a la página
    _controller.forward();
  }
}
