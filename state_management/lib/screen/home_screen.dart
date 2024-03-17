import 'package:flutter/material.dart';
import 'package:state_management/layout/default_layout.dart';
import 'package:state_management/screen/state_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: 'HomeScreen',
        body: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => StateProviderScreen(),
                    ),
                  );
                },
                child: Text('StateProviderScreen'))
          ],
        ));
  }
}
