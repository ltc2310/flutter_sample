import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_drive/animation.dart';
import 'package:test_drive/childprofile.dart';
import 'package:test_drive/dashboard.dart';
import 'package:test_drive/employee.dart';
import 'package:test_drive/employeedetail.dart';
import 'package:test_drive/error_page.dart';
import 'package:test_drive/login.dart';
import 'package:test_drive/profile.dart';
import 'package:test_drive/queryparam.dart';

// final isLoggedIn = true;

final GoRouter _router = GoRouter(
  errorBuilder: (context, state) => const ErrorPage(),
  // redirect: (context, state) {
  //   if (isLoggedIn) {
  //     return "/dashboard";
  //   } else {
  //     return "/";
  //   }
  // },
  routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const Login(),
    // ),
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
    GoRoute(
        name: "child-profile",
        path: '/child-profile',
        builder: (context, state) => ChildProfile()),
    GoRoute(
      name: "animation",
      path: '/animation',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            child: AnimationPage(),
            fullscreenDialog: true,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                  opacity:
                      CurveTween(curve: Curves.bounceIn).animate(animation),
                  child: child);
            });
      },
    ),
    GoRoute(
        name: "employees", path: '/', builder: (context, state) => Employees()),
    GoRoute(
        name: "employees-detail",
        path: '/employees-detail/:id',
        builder: (context, state) => EDetail()),
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
