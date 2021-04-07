import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sections/home.dart';
import '../sections/soon.dart';
import 'widgets/menu_bar.dart';
import 'widgets/top_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final scrollController = ScrollController();
  final sizeKey = GlobalKey();

  double getSectionHeight() {
    final renderBox = sizeKey.currentContext?.findRenderObject() as RenderBox;
    final size = renderBox.size;
    return size.height;
  }

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
              Expanded(
                child: CustomScrollView(
                  key: sizeKey,
                  controller: scrollController,
                  slivers: [
                    SliverFillRemaining(
                      child: Home(),
                    ),
                    SliverFillRemaining(
                      child: Soon(),
                    ),
                    SliverFillRemaining(
                      child: Soon(),
                    ),
                    SliverFillRemaining(
                      child: Soon(),
                    ),
                  ],
                ),
              ),
              MenuBar(animateToSection),
            ],
          ),
        ),
      ),
    );
  }

  void animateToSection(int index) {
    final sectionHeight = getSectionHeight();

    scrollController.animateTo(
      index * sectionHeight,
      duration: Duration(milliseconds: 700),
      curve: Curves.ease,
    );
  }
}
