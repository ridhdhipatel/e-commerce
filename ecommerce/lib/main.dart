import 'package:ecommerce/Constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/providers.dart';
import 'Routes/app_route.dart';
import 'Screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: SliderProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ProductListProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CatalogProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CategoriesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'NunitoSans',
          scaffoldBackgroundColor: AppColors.defaultColor,
        ),
        home: const SplashScreen(),
        onGenerateRoute: (settings) => AppRoutes.onGeneratedRoutes(settings),
      ),
    );
  }
}
