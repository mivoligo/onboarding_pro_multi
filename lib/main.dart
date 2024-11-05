import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/strings.dart';
import 'package:onboarding_pro_multi/widgets/fancy_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FancyText(text: creativeTime),
            FancyText(text: joinEvents),
            FancyText(text: newPlaces),
            FancyText(text: reminders),
            FancyText(text: upToDate),
            FancyText(text: rhythm),
          ],
        ),
      ),
    );
  }
}
