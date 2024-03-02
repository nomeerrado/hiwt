import 'package:go_router/go_router.dart';
import 'package:hiwt/pages/cities.dart';
import 'package:hiwt/pages/home.dart';

final appRoutes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
            path: 'cities', builder: (context, state) => const CitiesPage()),
      ],
    ),
  ],
);
