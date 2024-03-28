import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_personal/home_page.dart';
import 'cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromARGB(255, 235, 202, 54),
            ),
            inputDecorationTheme: const InputDecorationTheme(
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                prefixIconColor: Colors.black
                ),
                textTheme: const TextTheme(
                  titleLarge: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  
                  ),
                  titleMedium: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
      
                  )
                )
                
                
                ),
        home:  const HomePage()
      ),
    );
  }
}
