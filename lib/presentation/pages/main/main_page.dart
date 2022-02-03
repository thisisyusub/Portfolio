import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../responsive_x.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveX(
        builder: (_, deviceInfo) {
          return SafeArea(
            child: CupertinoScrollbar(
              controller: _controller,
              child: ListView(
                controller: _controller,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                children: [
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),
                  ListTile(
                    title: Text('Test'),
                  ),

                  // Home(onTap: () {
                  //   _controller.animateTo(
                  //     deviceInfo.size.height,
                  //     duration: Duration(milliseconds: 400),
                  //     curve: Curves.linear,
                  //   );
                  // }),
                  // Divider(height: 0),
                  // AboutMe(),
                  // Divider(height: 0),
                  // Skills(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
