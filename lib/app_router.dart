import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spingo/ui/screen/game/spingo_screen.dart';
import 'package:spingo/ui/screen/home/home_screen.dart';

class RouteNames {

  static const String RN_spingo_screen = 'SpingoScreen';

  static const String RN_test_screen = 'TestScreen';
}

class AppRouter {
  final GoRouter router = GoRouter(initialLocation: '/', routes: [
    GoRoute(path: '/', pageBuilder: defaultPageBuilder(HomeScreen())),
    GoRoute(path: '/spingo',name: RouteNames.RN_spingo_screen, pageBuilder: defaultPageBuilder(SpingoScreen())),


    //GoRoute(name: RouteNames.RN_test_screen, path: '/test', pageBuilder: defaultPageBuilder(TestScreen())),
  ]);
}

Page<dynamic> Function(BuildContext, GoRouterState) defaultPageBuilder<T>(Widget child, {String? type}) => (BuildContext context, GoRouterState state) {
      return buildPageWithDefaultTransition<T>(context: context, state: state, child: child, type: type);
    };

CustomTransitionPage buildPageWithDefaultTransition<T>({required BuildContext context, required GoRouterState state, required Widget child, String? type}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (type) {
          case 'fade':
            return FadeTransition(opacity: animation, child: child);
          case 'rotation':
            return RotationTransition(turns: animation, child: child);
          case 'size':
            return SizeTransition(sizeFactor: animation, child: child);
          case 'scale':
            return ScaleTransition(scale: animation, child: child);
          default:
            return FadeTransition(opacity: animation, child: child);
        }
      });
}
