import 'package:ecommerce/Screen/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screen/home/homeProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    ),
  );
}
