import 'package:flutter/material.dart';
import 'package:projeto2_nicolas/common/themes/themes.dart';
import 'package:projeto2_nicolas/ui/pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Studant id card',
    home: const Homepage(),
    debugShowCheckedModeBanner: false,
    theme: myTheme,
  ));
}
