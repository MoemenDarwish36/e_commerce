import 'package:e_commerce_app/core/routes_manger/routes.dart';
import 'package:e_commerce_app/core/routes_manger/routes_generator.dart';
import 'package:e_commerce_app/core/widget/shared_preference_utils.dart';
import 'package:e_commerce_app/features/auth_presentation_screen/register/cubit/register_cubit.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_screen_cubit.dart';
import 'package:e_commerce_app/features/main_layout/cubit/home_screen-cubit.dart';
import 'package:e_commerce_app/features/main_layout/home_tab/cubit/home_tab_cubit.dart';
import 'package:e_commerce_app/features/main_layout/profile_tab/cubit/profile_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/my_bloc_observer/my_bloc_observer.dart';
import 'di/di.dart';
import 'features/main_layout/products_screen/cubit/product_screen_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferenceUtils.init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => getIt<HomeTabCubit>()),
    BlocProvider(create: (context) => getIt<ProductScreenCubit>()),
    BlocProvider(create: (context) => getIt<RegisterScreenCubit>()),
    BlocProvider(create: (context) => getIt<CartScreenCubit>()),
    BlocProvider(create: (context) => getIt<ProfileTabScreenCubit>()),
    BlocProvider(create: (context) => HomeScreenCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        initialRoute: Routes.splashScreenRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
