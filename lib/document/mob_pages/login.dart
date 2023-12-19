// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/user_page/blocs/user_page_bloc.dart';
import 'package:myapp/user_page/blocs/user_page_event.dart';
import 'package:myapp/user_page/blocs/user_page_state.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyAppState();
}

class _MyAppState extends State<Login> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CentraJob '),
        ),
        body: Column(
          children: [
            _bodyWidget(),
          ],
        ));
  }

  Widget _bodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Form(
            key: _formKey,
            child: Column(
              children: [
                BlocBuilder<UserPageBloc, UserPageState>(
                  builder: (context, state) {
                    if (state is UserPageErrorState) {
                      return Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 85),
                  child: TextFormField(
                    onChanged: (val) {
                      BlocProvider.of<UserPageBloc>(context).add(
                          UserPageTextChangedEvent(
                              phoneController.text, emailController.text));
                    },
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    showCursor: true,
                    decoration: const InputDecoration(
                      iconColor: Color.fromARGB(255, 2, 140, 253),
                      hintText: 'Enter Phone No.',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 85),
                  child: TextFormField(
                    onChanged: (val) {
                      BlocProvider.of<UserPageBloc>(context).add(
                          UserPageTextChangedEvent(
                              phoneController.text, emailController.text));
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    showCursor: true,
                    decoration: const InputDecoration(
                      iconColor: Color.fromARGB(255, 2, 140, 253),
                      hintText: 'Enter Email id',
                      filled: true,
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 85),
                  child: BlocBuilder<UserPageBloc, UserPageState>(
                    builder: (context, state) {
                      return CupertinoButton(
                        color: (state is UserPageValidState)
                            ? Colors.blue
                            : Colors.grey,
                        onPressed: () {
                          if (state is UserPageValidState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('OTP Send Successfully'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        child: const Text('Send OTP'),
                      );
                    },
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
