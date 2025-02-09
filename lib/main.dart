import 'package:e_commerce_app/core/routes_manger/routes.dart';
import 'package:e_commerce_app/core/routes_manger/routes_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/my_bloc_observer/my_bloc_observer.dart';
import 'di/di.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();

  runApp(const MyApp());
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
