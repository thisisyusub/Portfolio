import 'package:flutter/material.dart';

import '../../../responsive_x.dart';

class MenuButton extends StatefulWidget {
  MenuButton(this.title, this.icon, this.onTap);

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },
      child: InkWell(
        onTap: widget.onTap,
        child: ResponsiveX(
          builder: (context, deviceInfo) {
            final screenWidth = deviceInfo.size.width;
            var width = deviceInfo.size.width / 4 - screenWidth * 0.1;
            var height = 56.0;
            late var child;

            final backgroundColor = isHover
                ? Theme.of(context).primaryColor.withOpacity(0.4)
                : Theme.of(context).primaryColor.withOpacity(0.2);

            final selectionColor = isHover
                ? Theme.of(context).focusColor
                : Color(0xFF150F25).withOpacity(0.8);

            final icon = Icon(widget.icon, color: selectionColor);
            final title = Text(widget.title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: selectionColor));

            if (deviceInfo.deviceType == DeviceType.desktop) {
              child = Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon,
                  const SizedBox(width: 10),
                  title,
                ],
              );
            } else if (deviceInfo.deviceType == DeviceType.tablet) {
              width = 130.0;
              child = Column(
                mainAxisSize: MainAxisSize.min,
                children: [icon, title],
              );
            } else {
              child = icon;
            }

            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}
