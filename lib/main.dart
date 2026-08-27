import 'package:flutter/material.dart';
import 'package:portofolio/my_home_page.dart';
import 'package:portofolio/router.dart';
import 'package:portofolio/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: myRouter(),
      themeMode: ThemeMode.system,
    );
  }
}
