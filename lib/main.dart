import 'package:flutter/material.dart';
import 'package:practice_provider/providers/news_provider.dart';
import 'package:practice_provider/screens/news_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LokSewa Tayari App',
        
        home:  NewsScreen(),
      ),
    );
  }
}

