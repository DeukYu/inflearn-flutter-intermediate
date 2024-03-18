import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/riverpod/provider_observer.dart';
import 'package:state_management/screen/home_screen.dart';

void main() {
  runApp(ProviderScope(
    observers: [
      Logger(),
    ],
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}
