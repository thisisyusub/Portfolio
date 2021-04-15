import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../responsive_x.dart';

class HoveredWorkItem extends StatefulWidget {
  final String title;
  final String imagePath;
  final String externalUrl;
  final String? sourceCodeUrl;

  HoveredWorkItem({
    required this.title,
    required this.imagePath,
    required this.externalUrl,
    this.sourceCodeUrl,
  });

  @override
  _HoveredWorkItemState createState() => _HoveredWorkItemState();
}

class _HoveredWorkItemState extends State<HoveredWorkItem> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveX(builder: (ctx, deviceInfo) {
      final isMobile = deviceInfo.deviceType == DeviceType.mobile;

      return MouseRegion(
        onHover: (_) {
          setState(() {
            focused = true;
          });
        },
        onExit: (_) {
          setState(() {
            focused = false;
          });
        },
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(
                      0.1,
                    ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Center(
                child: Image.asset(
                  widget.imagePath,
                  height: deviceInfo.size.height / 2,
                ),
              ),
            ),
            if (focused)
              Container(
                height: deviceInfo.size.height / 2 + 32,
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.only(bottom: 8.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      widget.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.white),
                    ),
                    Spacer(),
                    _button('Go To App', 'sad'),
                    const SizedBox(height: 10),
                    _button('Source Code', 'sad', Colors.green),
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget _button(String title, String url, [Color? color]) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.hovered)) {
              return color?.withOpacity(0.8) ??
                  Theme.of(context).focusColor.withOpacity(0.7);
            }

            return color ?? Theme.of(context).focusColor;
          }),
        ),
        onPressed: () async {
          if (await canLaunch(url)) {
            launch(url);
          }
        },
        child: Text(title),
      ),
    );
  }
}
