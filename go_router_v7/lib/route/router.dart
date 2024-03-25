import 'package:go_router/go_router.dart';
import 'package:go_router_v7/screen/basic_screen.dart';
import 'package:go_router_v7/screen/named_screen.dart';
import 'package:go_router_v7/screen/nested_child_screen.dart';
import 'package:go_router_v7/screen/nested_screen.dart';
import 'package:go_router_v7/screen/path_param_screen.dart';
import 'package:go_router_v7/screen/pop_base_screen.dart';
import 'package:go_router_v7/screen/pop_return_screen.dart';
import 'package:go_router_v7/screen/push_screen.dart';
import 'package:go_router_v7/screen/query_parameter.dart';
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
        GoRoute(
          path: 'push',
          builder: (context, state) {
            return PushScreen();
          },
        ),
        GoRoute(
          path: 'pop',
          builder: (context, state) {
            return PopBaseScreen();
          },
          routes: [
            GoRoute(
              path: 'return',
              builder: (context, state) {
                return PopReturnScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) {
            return PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                return PathParamScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) {
            return const QueryParameterScreen();
          },
        ),
        ShellRoute(
          builder: (context, state, child) {
            return NestedScreen(child: child);
          },
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (_, state) => NestedChildScreen(
                routeName: '/nested/a',
              ),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (_, state) => NestedChildScreen(
                routeName: '/nested/b',
              ),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (_, state) => NestedChildScreen(
                routeName: '/nested/c',
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
