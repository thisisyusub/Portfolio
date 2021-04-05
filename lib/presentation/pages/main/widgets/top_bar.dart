import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../responsive_x.dart';
import 'avatar.dart';
import 'social_button.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Avatar(),
            const SizedBox(width: 10),
            ResponsiveX(
              builder: (context, deviceInfo) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (deviceInfo.deviceType == DeviceType.desktop) ...[
                      SocialButton(FontAwesomeIcons.github),
                      SocialButton(FontAwesomeIcons.stackOverflow),
                      SocialButton(FontAwesomeIcons.linkedin),
                      SocialButton(FontAwesomeIcons.medium),
                      SocialButton(FontAwesomeIcons.facebook),
                      SocialButton(FontAwesomeIcons.youtube),
                    ] else
                      Icon(
                        Icons.more_vert,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Divider(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          thickness: 0.2,
        ),
      ],
    );
  }
}
