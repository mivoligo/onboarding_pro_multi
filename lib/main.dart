import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/colors.dart';
import 'package:onboarding_pro_multi/onboarding_page.dart';
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
        useMaterial3: true,
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Color(textButtonColor)),
          ),
        ),
        filledButtonTheme: const FilledButtonThemeData(
          style: ButtonStyle(
            foregroundColor:
                WidgetStatePropertyAll(Color(filledButtonForegroundColor)),
            backgroundColor:
                WidgetStatePropertyAll(Color(filledButtonBackgroundColor)),
            side: WidgetStatePropertyAll(
              BorderSide(color: Color(filledButtonForegroundColor)),
            ),
          ),
        ),
      ),
      home: const OnboardingPage(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            FancyText(text: creativeTime),
            FancyText(text: events),
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
