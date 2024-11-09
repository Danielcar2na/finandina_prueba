import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomNavigation extends StatelessWidget {
  final PageController pageController;
  final int pageCount;

  const BottomNavigation({
    Key? key,
    required this.pageController,
    required this.pageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.04;
    
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding * 0.5, vertical: padding * 0.4),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => pageController.jumpToPage(pageCount - 1),
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
                padding: EdgeInsets.all(padding * 0.6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 233, 30, 47),
                ),
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              onPressed: () {
                final nextPage = pageController.page!.toInt() + 1;
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
