import 'package:finandina_prueba/src/presentation/home/view/bank_wherever.dart';
import 'package:finandina_prueba/src/presentation/home/view/end_page.dart';
import 'package:finandina_prueba/src/presentation/home/view/pay_freely.dart';
import 'package:finandina_prueba/src/presentation/home/view/product_hands.dart';
import 'package:finandina_prueba/src/presentation/home/view/scan_and_go.dart';
import 'package:finandina_prueba/src/presentation/home/view/send_money.dart';
import 'package:flutter/material.dart';
import 'package:finandina_prueba/src/presentation/widgets/_custom_navigation.dart';
import 'package:finandina_prueba/src/presentation/widgets/_description_section.dart';
import 'package:finandina_prueba/src/presentation/home/view/intro_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Lista de gradientes para cada página
  final List<List<Color>> _gradients = [
    // IntroPage
    [
      
      const Color.fromARGB(255, 233, 30, 47),
      const Color.fromARGB(255, 132, 18, 143),
    ],
    // ProductHands
    [
      const Color.fromRGBO(227, 25, 82, 1),
      const Color.fromRGBO(255, 134, 190, 1),
      const Color.fromRGBO(227, 25, 82, 1),
      ],
    // PayFreely
    [
      const Color.fromRGBO(249, 28, 51, 1),
      const Color.fromRGBO(255, 141, 69, 1),
      const Color.fromRGBO(249, 28, 51, 1),
    ],
    // SendMoney
    [
      const Color.fromRGBO(91, 29, 212, 1),
      const Color.fromRGBO(205, 52, 237, 1),
      const Color.fromRGBO(91, 29, 212, 1),
    ],
    // BankWherever
    [
      const Color.fromRGBO(227, 25, 82, 1),
      const Color.fromRGBO(255, 134, 190, 1),
      const Color.fromRGBO(227, 25, 82, 1),
    ],
    // ScanAndGo
    [
      const Color.fromRGBO(91, 29, 212, 1),
      const Color.fromRGBO(205, 52, 237, 1),
      const Color.fromRGBO(91, 29, 212, 1),
    ],
    // EndPage
    [
      const Color.fromRGBO(91, 29, 212, 1),
      const Color.fromRGBO(205, 52, 237, 1),
      const Color.fromRGBO(91, 29, 212, 1),
    ],
  ];

  // Lista de vistas que deseas mostrar en el PageView
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                // PageView para navegar entre las vistas
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: _pages,
                  ),
                ),
                // BottomNavigation pasándole el controlador y el count dinámico
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
