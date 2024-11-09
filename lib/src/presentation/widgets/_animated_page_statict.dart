import 'package:flutter/material.dart';

class AnimatedPageStatic extends PageRouteBuilder {
  final Widget child;

  // Constructor que recibe un widget hijo y define la animación de transición de página
  AnimatedPageStatic(this.child)
      : super(
          // Define el widget a mostrar en la página
          pageBuilder: (context, animation, secondaryAnimation) {
            return child;
          },
          // Define la transición de la página, en este caso, una animación de desvanecimiento (Fade)
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation, // Controla la opacidad de la transición
              child: child, // Widget hijo que será animado
            );
          },
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Este método sobreescribe la transición de la página, pero aquí se retorna el child sin animación adicional
    return child;
  }
}
