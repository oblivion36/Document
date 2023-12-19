import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/document/myhomepage.dart';

import 'package:myapp/user_page/blocs/user_page_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      home: BlocProvider(
        create: (context) => UserPageBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}
