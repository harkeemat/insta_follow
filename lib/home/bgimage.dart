import 'package:flutter/material.dart';

class Bgimage extends StatelessWidget {
  const Bgimage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
     "src/images/instagram.jpg",
     fit: BoxFit.cover,
     color: Colors.black.withOpacity(0.7),
     colorBlendMode: BlendMode.darken,
   );
  }
}