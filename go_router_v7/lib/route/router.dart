import 'package:go_router/go_router.dart';
import 'package:go_router_v7/screen/basic_screen.dart';
import 'package:go_router_v7/screen/named_screen.dart';
import 'package:go_router_v7/screen/root_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return RootScreen();
        },
        routes: [
          GoRoute(
            path: 'basic',
            builder: (context, state) {
              return BasicScreen();
            },
          ),
          GoRoute(
            path: 'named',
            name: 'named_screen',
            builder: (context, state) {
              return NamedScreen();
            },
          ),
        ]),
  ],
);
