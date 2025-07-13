import 'package:go_router/go_router.dart';
import 'package:tcp/featuer/home/presentation/view/home_view.dart';
import 'package:tcp/featuer/row_materials/add_row_materials/presentation/view/add_row_materials.dart';
import 'package:tcp/featuer/row_materials/add_row_materials/presentation/view/widget/date_picker.dart';
import 'package:tcp/featuer/row_materials/show_row_materials/presentation/view/row_details.dart';

import 'package:tcp/screens/on_boarding_screen.dart';
import 'package:tcp/screens/register_screen.dart';
import 'package:tcp/screens/sign_in_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onBoarding = '/on_boarding_screen';
  static const String register = '/register_screen';
  static const String signIn = '/sign_in_screen';
  static const String addRowMaterials = '/add_row_materials';
  static const String home = '/home_view';
  static const String rowDetails = '/row_details';
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      name: AppRoutes.splash,
      builder: (context, state) => AddRowMaterials(),
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
    GoRoute(
      path: AppRoutes.addRowMaterials,
      name: AppRoutes.addRowMaterials,
      builder: (context, state) => AddRowMaterials(),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: AppRoutes.home,
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: AppRoutes.rowDetails,
      name: AppRoutes.rowDetails,
      builder: (context, state) => RowMaterialsDetailsView(),
    )
  ],
);
