import 'package:ecommerce/Screen/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screen/home/homeProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
      ],
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          return MaterialApp(
            theme: provider.isTheme ? LightTheme : DarkTheme,
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => HomeScreen(),
            },
          );
        },
      ),
    ),
  );
}

ThemeData LightTheme = ThemeData(
  appBarTheme: AppBarTheme(color: Colors.green.shade900),
  brightness: Brightness.light,
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.black),
  ),
);

ThemeData DarkTheme = ThemeData(
  appBarTheme: AppBarTheme(color: Colors.green),
  brightness: Brightness.dark,
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.black),
  ),
);
