import 'package:finandina_prueba/src/presentation/home/view/bank_wherever.dart';
import 'package:finandina_prueba/src/presentation/home/view/end_page.dart';
import 'package:finandina_prueba/src/presentation/home/view/pay_freely.dart';
import 'package:finandina_prueba/src/presentation/home/view/product_hands.dart';
import 'package:finandina_prueba/src/presentation/home/view/scan_and_go.dart';
import 'package:finandina_prueba/src/presentation/home/view/send_money.dart';
import 'package:flutter/material.dart';
import 'package:finandina_prueba/src/presentation/widgets/_custom_navigation.dart';
import 'package:finandina_prueba/src/presentation/home/view/intro_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<List<Color>> _gradients = [
    [const Color.fromARGB(255, 233, 30, 47), const Color.fromARGB(255, 132, 18, 143)],
    [const Color.fromRGBO(227, 25, 82, 1), const Color.fromRGBO(255, 134, 190, 1), const Color.fromRGBO(227, 25, 82, 1)],
    [const Color.fromRGBO(249, 28, 51, 1), const Color.fromRGBO(255, 141, 69, 1), const Color.fromRGBO(249, 28, 51, 1)],
    [const Color.fromRGBO(91, 29, 212, 1), const Color.fromRGBO(205, 52, 237, 1), const Color.fromRGBO(91, 29, 212, 1)],
    [const Color.fromRGBO(227, 25, 82, 1), const Color.fromRGBO(255, 134, 190, 1), const Color.fromRGBO(227, 25, 82, 1)],
    [const Color.fromRGBO(91, 29, 212, 1), const Color.fromRGBO(205, 52, 237, 1), const Color.fromRGBO(91, 29, 212, 1)],
    [const Color.fromRGBO(91, 29, 212, 1), const Color.fromRGBO(205, 52, 237, 1), const Color.fromRGBO(91, 29, 212, 1)],
  ];

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
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final page = _pageController.page?.round() ?? 0;
    if (_currentPage != page) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  // Método para controlar el gesto de retroceso
  Future<bool> _onWillPop() async {
    if (_currentPage > 0) {
      // Si no estamos en la primera página, regresamos a la anterior
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),  // Duración de la animación
        curve: Curves.easeOut,  // Usamos la curva easeOut para desacelerar al final
      );
      return false; // Evitar el comportamiento por defecto de retroceso
    }
    return true; // Si estamos en la primera página, dejamos que el sistema maneje el retroceso
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: _gradients[_currentPage], // Gradiente dinámico
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // PageView para navegar entre las vistas
                Expanded(
                  child:PageView(
    controller: _pageController,
    physics: const NeverScrollableScrollPhysics(), // Desactiva el desplazamiento manual
    children: _pages,
    onPageChanged: (page) {
      setState(() {
        _currentPage = page;
      });
    },
  ),
                ),
                // BottomNavigation solo si no estamos en EndPage (última página)
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
    );
  }
}
