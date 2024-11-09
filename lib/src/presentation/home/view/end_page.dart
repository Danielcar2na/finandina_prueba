import 'package:finandina_prueba/src/presentation/widgets/_custom_image.dart';
import 'package:finandina_prueba/src/presentation/widgets/_description_section.dart';
import 'package:flutter/material.dart';

class EndPage extends StatefulWidget {
  const EndPage({super.key});

  @override
  State<EndPage> createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Comienza desde el lado derecho
      end: Offset.zero, // Termina en su posición normal
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Inicia la animación
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(91, 29, 212, 1),
              Color.fromRGBO(205, 52, 237, 1),
              Color.fromRGBO(91, 29, 212, 1),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Image.asset(
                'assets/img/logo.png',
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
              ),
              SizedBox(height: screenHeight * 0.08),
              CustomImage(
                imagePath: 'assets/img/endPagex3.png',
                width: screenWidth * 1.0,
                height: screenHeight * 0.43,
                fit: BoxFit.cover,
              ),
              SizedBox(height: screenHeight * 0.11),
              DescriptionSection(
                title: '¡Escanea y listo!',
                fontSizeTitle: screenWidth * 0.08,
                isBoldTitle: true,
                subtitle: 'Paga en datáfonos con QR y libérate de las \n tarjetas físicas.',
                fontSizeSubtitle: screenWidth * 0.04,
              ),
              SizedBox(height: screenHeight * 0.06),

              // Botón con animación de entrada desde la derecha
              SlideTransition(
                position: _offsetAnimation,
                child: SizedBox(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Libera tu Banca');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Libera tu Banca',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox.shrink(),
    );
  }
}
