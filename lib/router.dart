import 'package:go_router/go_router.dart';
import 'package:god_father/screens/home.dart';

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Home(),
    )
  ],
);
