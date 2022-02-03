import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../responsive_x.dart';
import '../../utils/smooth_scroll.dart';
import '../sections/about.dart';
import '../sections/contact.dart';
import '../sections/home.dart';
import 'widgets/top_bar.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: TopBar(),
            ),
            Expanded(
              child: CupertinoScrollbar(
                controller: _controller,
                child: ListView(
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 16.0,
                  ),
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    Home(),
                    About(),
                    Contact(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
