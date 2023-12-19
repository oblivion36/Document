import 'package:flutter/material.dart';
import 'package:myapp/document/views/mobile.dart';
import 'package:myapp/document/views/windows.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 600;

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      return const Mobileview();
    } else {
      return const Window();
    }
  }
}
