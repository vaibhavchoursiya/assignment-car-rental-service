import 'package:car_rental_service/screens/filter_screen.dart';
import 'package:car_rental_service/screens/home_screen.dart';
import 'package:car_rental_service/screens/show_result_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(initialLocation: "/home", routes: [
    GoRoute(
      path: "/home",
      name: "/home",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/show_result",
      name: "/show_result",
      builder: (context, state) => const ShowResultScreen(),
    ),
    GoRoute(
      path: "/filter",
      name: "/filter",
      builder: (context, state) => const FilterScreen(),
    )
  ]);
}
