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
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2), // Color semitransparente
          borderRadius: BorderRadius.circular(30), // Bordes redondeados
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                pageController.jumpToPage(pageCount - 1);
              },
              child: const Text(
                "Saltar",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: pageCount,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Color.fromARGB(134, 255, 255, 255),
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
              ),
            ),
            IconButton(
  icon: Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(30),
      // Añadir esta propiedad para quitar cualquier sombra
      boxShadow: const [], 
    ),
    child: const Icon(
      Icons.arrow_forward, 
      color: Color.fromARGB(255, 233, 30, 47),
    ),
  ),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  padding: EdgeInsets.zero,
  hoverColor: Colors.transparent,
  onPressed: () {
    int nextPage = pageController.page!.toInt() + 1;
    if (nextPage < pageCount) {
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
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