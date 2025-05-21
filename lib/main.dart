import 'package:flutter/material.dart';
import 'package:projeto2_nicolas/common/config/dependencies.dart';
import 'package:projeto2_nicolas/common/themes/themes.dart';
import 'package:projeto2_nicolas/ui/pages/home_page.dart';

void main() {
  setupDependencies();
  runApp(MaterialApp(
    title: 'Studant id card',
    home: const HomePage(),
    debugShowCheckedModeBanner: false,
    theme: myTheme,
  ));
}
