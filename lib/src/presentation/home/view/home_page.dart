import 'package:finandina_prueba/src/presentation/home/view/bank_wherever.dart';
import 'package:finandina_prueba/src/presentation/home/view/end_page.dart';
import 'package:finandina_prueba/src/presentation/home/view/pay_freely.dart';
import 'package:finandina_prueba/src/presentation/home/view/product_hands.dart';
import 'package:finandina_prueba/src/presentation/home/view/scan_and_go.dart';
import 'package:finandina_prueba/src/presentation/home/view/send_money.dart';
import 'package:flutter/material.dart';
import 'package:finandina_prueba/src/presentation/widgets/_custom_navigation.dart';
import 'package:finandina_prueba/src/presentation/home/view/intro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controlador para gestionar el desplazamiento de las páginas en el PageView
  final PageController _pageController = PageController();

  // Variable para almacenar la página actual en la que se encuentra el usuario
  int _currentPage = 0;

  // Lista de gradientes para cada página, que cambia el fondo de la aplicación
  final List<List<Color>> _gradients = [
    [const Color.fromARGB(255, 233, 30, 47), const Color.fromARGB(255, 132, 18, 143)],
    [const Color.fromRGBO(227, 25, 82, 1), const Color.fromRGBO(255, 134, 190, 1), const Color.fromRGBO(227, 25, 82, 1)],
    [const Color.fromRGBO(249, 28, 51, 1), const Color.fromRGBO(255, 141, 69, 1), const Color.fromRGBO(249, 28, 51, 1)],
    [const Color.fromRGBO(91, 29, 212, 1), const Color.fromRGBO(205, 52, 237, 1), const Color.fromRGBO(91, 29, 212, 1)],
    [const Color.fromRGBO(227, 25, 82, 1), const Color.fromRGBO(255, 134, 190, 1), const Color.fromRGBO(227, 25, 82, 1)],
    [const Color.fromRGBO(91, 29, 212, 1), const Color.fromRGBO(205, 52, 237, 1), const Color.fromRGBO(91, 29, 212, 1)],
    [const Color.fromRGBO(91, 29, 212, 1), const Color.fromRGBO(205, 52, 237, 1), const Color.fromRGBO(91, 29, 212, 1)],
  ];

  // Lista de widgets que representan las páginas en el PageView
  final List<Widget> _pages = [
    const IntroPage(),
    const ProductHands(),
    const PayFreely(),
    const SendMoney(),
    const BankWherever(),
    const ScanAndGo(),
    const EndPage(),
  ];

  @override
  void initState() {
    super.initState();
    // Se añade un listener al controlador de página para detectar cambios de página
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    // Elimina el listener del controlador de página y lo libera cuando el widget se destruye
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  // Función llamada cuando la página cambia
  void _onPageChanged() {
    final page = _pageController.page?.round() ?? 0;
    // Actualiza el estado si la página actual ha cambiado
    if (_currentPage != page) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  // Función que controla la acción al intentar regresar a la página anterior
  Future<bool> _onWillPop() async {
    // Si no estamos en la primera página, retrocede una página en lugar de salir
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return false; // Evita que se cierre la aplicación
    }
    return true; // Permite que se cierre la aplicación
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop, // Intercepta el botón de retroceso
      child: SafeArea(
        child: Scaffold(
          body: Container(
            // Se aplica un gradiente de fondo basado en la página actual
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: _gradients[_currentPage],
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // PageView que permite el desplazamiento horizontal entre las páginas
                    child: PageView(
                      controller: _pageController,
                      children: _pages,
                      onPageChanged: (page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                    ),
                  ),
                  // Si no estamos en la última página, muestra la navegación inferior
                  if (_currentPage != 6)
                    BottomNavigation(
                      pageController: _pageController,
                      pageCount: _pages.length,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
