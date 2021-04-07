import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../sections/about.dart';
import '../sections/contact.dart';
import '../sections/home.dart';
import '../sections/work.dart';
import 'widgets/menu_bar.dart';
import 'widgets/top_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = AutoScrollController();

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
                child: ListView(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  children: [
                    AutoScrollTag(
                      key: ValueKey(0),
                      controller: controller,
                      index: 0,
                      child: Home(),
                    ),
                    AutoScrollTag(
                      key: ValueKey(1),
                      controller: controller,
                      index: 1,
                      child: About(),
                    ),
                    AutoScrollTag(
                      key: ValueKey(2),
                      controller: controller,
                      index: 2,
                      child: Work(),
                    ),
                    AutoScrollTag(
                      key: ValueKey(3),
                      controller: controller,
                      index: 3,
                      child: Contact(),
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
    controller.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
      duration: Duration(milliseconds: 800),
    );
  }
}
