import 'package:flutter/material.dart';

import 'pages/main/main_page.dart';
import 'utils/custom_scroll_behaviour.dart';
import 'values/themes.dart';

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.theme,
      home: MainPage(),
      builder: (_, child) {
        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: child!,
        );
      },
    );
  }
}
