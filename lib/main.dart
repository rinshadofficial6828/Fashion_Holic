import 'package:fashion_app/Features/Authentication/ViewModel/register_view_model.dart';
import 'package:fashion_app/Features/Cart/Viewmodel/cart_view_model.dart';
import 'package:fashion_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:fashion_app/Features/SearchProducts/Viewmodel/search_view_model.dart';
import 'package:fashion_app/Features/wishList/viewmodel/wishlist_view_model.dart';
import 'package:fashion_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:no_internet_check/internet_connectivity/navigation_Service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => CartViewmodel()),
        ChangeNotifierProvider(create: (context) => WishListViewmodel()),
        ChangeNotifierProvider(create: (context) => Searchviewmodel()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,),
        navigatorKey: NavigationService.navigationKey,
      home: SplashPage(),

    );
  }
}


