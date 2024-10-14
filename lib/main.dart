import 'package:flutter/material.dart';
import 'package:sign_in/pages/home_screen.dart';
import 'package:sign_in/pages/signed_in.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

//Configuration of the routes using GoRouter
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) {
        final username = state.extra as String; //Get the username from state
        return SignedIn(username: username);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
