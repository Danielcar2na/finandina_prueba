import 'package:finandina_prueba/src/presentation/widgets/_animated_page_statict.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomNavigation extends StatelessWidget {
  final PageController pageController;
  final int pageCount;
  const BottomNavigation({
    super.key,
    required this.pageController,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
          16.0), // Espaciado exterior del contenedor principal
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 6.0), // Espaciado interior del contenedor
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255)
              .withOpacity(0.2), // Fondo semitransparente
          borderRadius: BorderRadius.circular(30), // Bordes redondeados
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Distribuye los elementos de forma equitativa
          children: [
            // Botón para saltar a la última página
            TextButton(
              onPressed: () {
                pageController.jumpToPage(
                    pageCount - 1); // Salta directamente a la última página
              },
              child: const Text(
                "Saltar",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // Indicador de páginas con puntos que muestra el progreso de la paginación
            SmoothPageIndicator(
              controller:
                  pageController, // Controlador que gestiona el estado de la página actual
              count: pageCount, // Número total de páginas
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.white, // Color del punto activo
                dotColor: Color.fromARGB(
                    134, 255, 255, 255), // Color de los puntos inactivos
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3, // Factor de expansión para el punto activo
              ),
            ),
            // Botón de siguiente página (flecha) que anima la transición a la siguiente página
            IconButton(
              icon: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 255, 255, 255), // Fondo blanco para el icono
                  borderRadius: BorderRadius.circular(30), // Bordes redondeados
                ),
                child: const Icon(
                  Icons.arrow_forward, // Icono de flecha
                  color: Color.fromARGB(255, 233, 30, 47), // Color de la flecha
                ),
              ),
              splashColor:
                  Colors.transparent, // Color de salpicadura desactivado
              highlightColor:
                  Colors.transparent, // Color de resaltado desactivado
              padding: EdgeInsets
                  .zero, // Sin espaciado adicional alrededor del icono
              hoverColor: Colors.transparent, // Color de hover desactivado
              onPressed: () {
                // Calcula la siguiente página y realiza la animación
                int nextPage = pageController.page!.toInt() + 1;
                if (nextPage < pageCount) {
                  // Anima la transición a la siguiente página
                  pageController.animateToPage(
                    nextPage,
                    duration: const Duration(
                        milliseconds: 300), // Duración de la animación
                    curve: Curves.easeIn, // Curva de animación
                  );
                } else {
                  // Mensaje cuando se alcanza la última página
                  // ignore: avoid_print
                  print("Has llegado al final de la introducción");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
