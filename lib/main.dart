import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libraria_news/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF1e1e22),
        accentColor: Color(0xFFe82822),
        textTheme: GoogleFonts.interTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PostsList(),
    );
  }
}

