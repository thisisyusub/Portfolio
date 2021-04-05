import 'package:flutter/material.dart';

import '../../responsive_x.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ResponsiveX(
        builder: (context, deviceInfo) {
          double fontSize = 56.0;

          if (deviceInfo.deviceType == DeviceType.tablet) {
            fontSize = 48.0;
          } else if (deviceInfo.deviceType == DeviceType.mobile) {
            fontSize = 32.0;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: deviceInfo.size.height * 0.20),
              Text(
                'Junior Flutter Developer\nfrom Azerbaijan',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: fontSize),
              ),
              const SizedBox(height: 30),
              Text(
                'I am Flutter Developer with experience more than a year & '
                'Founder of Azerbaijan Flutter Users Community.',
              ),
            ],
          );
        },
      ),
    );
  }
}
