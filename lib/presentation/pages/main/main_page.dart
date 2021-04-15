import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../responsive_x.dart';
import '../../utils/smooth_scroll.dart';
import '../sections/about.dart';
import '../sections/contact.dart';
import '../sections/home.dart';
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
            ResponsiveX(
              builder: (_, deviceInfo) {
                final isMobile = deviceInfo.deviceType == DeviceType.mobile;

                final child = CupertinoScrollbar(
                  controller: controller,
                  child: ListView(
                    controller: controller,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 16.0,
                    ),
                    physics: isMobile
                        ? AlwaysScrollableScrollPhysics()
                        : NeverScrollableScrollPhysics(),
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
                        child: Contact(),
                      ),
                    ],
                  ),
                );

                return Expanded(
                  child: isMobile
                      ? child
                      : SmoothScroll(
                          controller: controller,
                          child: child,
                        ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: MenuBar(animateToSection),
            ),
          ],
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
