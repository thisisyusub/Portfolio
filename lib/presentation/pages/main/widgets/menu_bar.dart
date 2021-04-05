import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../responsive_x.dart';
import 'menu_button.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Divider(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            thickness: 0.2,
          ),
          ResponsiveX(builder: (context, deviceInfo) {
            return Row(
              mainAxisAlignment: deviceInfo.deviceType == DeviceType.mobile
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.spaceBetween,
              children: [
                MenuButton('Home', Icons.home_outlined),
                MenuButton('About', Icons.person_outline_rounded),
                MenuButton('Work', Icons.work_outline_rounded),
                MenuButton('Contact', CupertinoIcons.envelope),
              ],
            );
          }),
        ],
      ),
    );
  }
}
