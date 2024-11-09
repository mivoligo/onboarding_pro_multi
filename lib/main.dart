import 'package:flutter/material.dart';
import 'package:onboarding_pro_multi/colors.dart';
import 'package:onboarding_pro_multi/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Pro Multi',
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
