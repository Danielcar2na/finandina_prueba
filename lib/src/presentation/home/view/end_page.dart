import 'package:finandina_prueba/src/presentation/widgets/_custom_image.dart';
import 'package:finandina_prueba/src/presentation/widgets/_description_section.dart';
import 'package:flutter/material.dart';

class EndPage extends StatefulWidget {
  const EndPage({super.key});

  @override
  State<EndPage> createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // Contenedor principal con el gradiente aplicado
      body: SingleChildScrollView(
        child: Container(
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
              ], // Puedes ajustar los colores del gradiente aquí
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrar contenido verticalmente
            children: [
              // Logo ajustado
              Image.asset(
                'assets/img/logo.png',
                width: screenWidth * 0.1,  // Ancho proporcional al tamaño de la pantalla
                height: screenWidth * 0.1, // Alto proporcional al tamaño de la pantalla
              ),
            
              // Espacio entre el logo y la imagen
              SizedBox(height: screenHeight * 0.10),
            
              // Imagen ajustada
              CustomImage(
                imagePath: 'assets/img/endPagex3.png',
                width: screenWidth * 1.0, 
                height: screenHeight * 0.43,
                fit: BoxFit.cover,
              ),
            
              // Espacio entre la imagen y la descripción
              SizedBox(height: screenHeight * 0.075),
            
              // Descripción con tamaños de fuente adaptativos
              DescriptionSection(
                title: '¡Escanea y listo!',
                fontSizeTitle: screenWidth * 0.08, // Tamaño del título proporcional al ancho de la pantalla
                isBoldTitle: true,
                subtitle: 'Paga en datáfonos con QR y libérate de las \n tarjetas físicas.',
                fontSizeSubtitle: screenWidth * 0.04, // Tamaño del subtítulo proporcional al ancho de la pantalla
              ),
            
              // Espacio entre la descripción y el botón flotante
              SizedBox(height: screenHeight * 0.060),  // Espacio entre descripción y el botón

              // Botón flotante rectangular
              SizedBox(
                width: screenWidth * 0.85,  // El mismo ancho que el CustomImage
                height: screenHeight * 0.06, // Ajuste de altura del botón
                child: ElevatedButton(
                  onPressed: () {
                    // Acción del botón
                    print('Libera tu Banca');
                  },
                  style: ElevatedButton.styleFrom(// Color de fondo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Bordes redondeados
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Libera tu Banca',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth * 0.05,  // Tamaño del texto proporcional al ancho
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Configurar que el BottomNavigation no sea visible en esta página
      bottomNavigationBar: SizedBox.shrink(), // Usamos SizedBox.shrink() para no ocupar espacio en el BottomNavigation
    );
  }
}
