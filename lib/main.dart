import 'package:flutter/material.dart';
import 'package:photolab/features/feed/presentation/pages/feed_screen.dart';
import 'package:photolab/services/di/get_it.dart' as di;
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          foregroundColor: Colors.deepOrange,
        ),
      ),
      home: const FeedScreen(),
    );
  }
}
