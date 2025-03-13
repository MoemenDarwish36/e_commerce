import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/constant_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/routes_manger/routes.dart';
import 'package:e_commerce_app/features/auth_presentation_screen/register/register_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth_presentation_screen/login/login_screen.dart';
import '../../features/cart/screens/cart_screen.dart';
import '../../features/main_layout/main_layout.dart';
import '../../features/main_layout/products_screen/presentation/screens/products_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../resources/style_manager.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case Routes.productScreenRoute:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.signupRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                backgroundColor: ColorManager.primary,
                title: Text(AppConstants.unDefinedRoute,
                    style: getBoldStyle(
                        color: ColorManager.white, fontSize: FontSize.s20)),
              ),
              body: Center(
                child: Text(AppConstants.unDefinedRoute,
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s20)),
              ),
            ));
  }
}
