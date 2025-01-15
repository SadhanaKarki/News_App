import 'package:flutter/material.dart';
import 'package:practice_provider/viewModel/viewmodel.dart';
import 'package:practice_provider/View/news_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LokSewa Tayari App',
        
        home:  NewsScreen(),
      ),
    );
  }
}

