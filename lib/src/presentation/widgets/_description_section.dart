import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String text3;
  final double fontSizeTitle;
  final double fontSizeSubtitle;
  final bool isBoldSubtitle;
  final bool isBoldTitle;


  const DescriptionSection({
    super.key,
    required this.title,
    required this.subtitle,
    this.text3 = '',
    this.fontSizeTitle = 24, 
    this.fontSizeSubtitle = 20, 
    this.isBoldSubtitle = false, 
    this.isBoldTitle = false, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSizeTitle,
              fontWeight: isBoldTitle ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(height: 5,),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSizeSubtitle,
              fontWeight: isBoldSubtitle ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
