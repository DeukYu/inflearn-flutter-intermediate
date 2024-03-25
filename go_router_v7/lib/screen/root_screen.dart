import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_v7/layout/default_layout.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: Text('Go Basic'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('named_screen');
            },
            child: Text('Go Named'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/push');
            },
            child: Text('Go Push'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/pop');
            },
            child: Text('Go Pop'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/path_param/456');
            },
            child: Text('Go Path Param'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/query_param');
            },
            child: const Text('Go Query Parameter'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/nested/a');
            },
            child: const Text('Go Nested'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/login');
            },
            child: const Text('Login Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/login2');
            },
            child: const Text('Login2 Screen'),
          ),
        ],
      ),
    );
  }
}
