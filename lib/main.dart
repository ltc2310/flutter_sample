import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_drive/childprofile.dart';
import 'package:test_drive/dashboard.dart';
import 'package:test_drive/profile.dart';
import 'package:test_drive/queryparam.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      name: "dashboard",
      path: '/',
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(
      name: "profile",
      path: '/profile/:name', // path param
      builder: (context, state) => Profile(name: state.pathParameters["name"]!),
    ),
    GoRoute(
      name: "query-param",
      path: '/query-param',
      builder: (context, state) =>
          QueryParam(username: state.uri.queryParameters["name"]!),
    ),
  ],
);

// sub-route
// final _router = GoRouter(
//   routes: [
//     GoRoute(path: '/', builder: (context, state) => Dashboard(), routes: [
//       GoRoute(path: 'profile', builder: (context, state) => Profile(), routes: [
//         GoRoute(
//             path: 'child-profile', builder: (context, state) => ChildProfile())
//       ]),
//     ]),
//   ],
// );

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Go router",
      routerConfig: _router,
    );
  }
}
