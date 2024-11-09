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
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 90, end: 40).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Hero(
          tag: 'logo',
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Image.asset(
                'assets/img/logo.png',
                width: _animation.value,
                height: _animation.value,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              'Con ',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              "Banco Finandina",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Text(
          "tienes el poder de ser libre",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 350),
        const DescriptionSection(
          title: 'Descubre lo que puedes hacer con tu',
          fontSizeTitle: 16,
          subtitle: 'App Banco Finandina',
          fontSizeSubtitle: 28,
          isBoldSubtitle: true,
        ),
      ],
    );
  }
}