import 'package:flutter/material.dart';

import '../sections/home.dart';
import 'widgets/menu_bar.dart';
import 'widgets/top_bar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(),
              Home(),
              MenuBar(),
            ],
          ),
        ),
      ),
    );
  }
}
