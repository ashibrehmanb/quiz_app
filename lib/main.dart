import 'package:flutter/material.dart';

import 'pages/screen_start.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const StartScreen(),
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.green,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Product-Sans',
                fontSize: 25),
            // Modify the appropriate style according to your needs
            bodyMedium: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Product-Sans',
                fontSize: 18),
            // Modify the appropriate style according to your needs
            // Add more text styles as needed
          ),
        ),
      );
}
