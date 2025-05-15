import 'package:go_router/go_router.dart';
import 'package:tcp/featuer/splash/presentation/view/splash_screen.dart';
import 'package:tcp/screens/on_boarding_screen.dart';
import 'package:tcp/screens/register_screen.dart';
import 'package:tcp/screens/sign_in_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onBoarding = '/on_boarding_screen';
  static const String register = '/register_screen';
  static const String signIn = '/sign_in_screen';
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      name: AppRoutes.splash,
      builder: (context, state) => SplashSreen(),
    ),
    GoRoute(
      path: AppRoutes.onBoarding,
      name: AppRoutes.onBoarding,
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: AppRoutes.register,
      name: AppRoutes.register,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: AppRoutes.signIn,
      name: AppRoutes.signIn,
      builder: (context, state) => SignInScreen(),
    ),
  ],
);
