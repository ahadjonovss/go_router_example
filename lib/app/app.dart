import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/screens/authorization/sign_in_page.dart';
import 'package:go_router_example/screens/client/client_page.dart';
import 'package:go_router_example/screens/home/home_page.dart';
import 'package:go_router_example/screens/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GoRouter router = GoRouter(initialLocation: '/splash', routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return HomePage();
      },
      redirect: (context, state) async {
        SharedPreferences storage = await SharedPreferences.getInstance();
        String? token = storage.getString('token');
        if (token == null) {
          return '/sign_in';
        } else {
          return null;
        }
      },
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: '/sign_in',
      builder: (context, state) {
        return const SignInPage();
      },
    ),
    GoRoute(
      path: '/client:value',
      builder: (context, state) {
        return ClientPage(int.parse(
            state.pathParameters['value']?.replaceAll(':', '') ?? '0'));
      },
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
