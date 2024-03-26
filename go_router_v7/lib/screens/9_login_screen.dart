import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_v7/layout/default_layout.dart';
import 'package:go_router_v7/route/router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(
      children: [
        Text('Login State: $authState'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              authState = !authState;
            });
          },
          child: Text(authState ? 'logout' : 'login'),
        ),
        ElevatedButton(
          onPressed: () {
            print(GoRouterState.of(context).uri.toString());
            if (GoRouterState.of(context).uri.toString() == '/login') {
              context.go('/login2/private');
            } else {
              context.go('/login2/private');
            }
          },
          child: const Text('Go to Private Route'),
        ),
      ],
    ));
  }
}
