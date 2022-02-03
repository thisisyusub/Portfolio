import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../responsive_x.dart';
import '../main/widgets/avatar.dart';

class Home extends StatelessWidget {
  const Home({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveX(
      builder: (context, deviceInfo) {
        double fontSize = 56.0;

        if (deviceInfo.deviceType == DeviceType.tablet) {
          fontSize = 48.0;
        } else if (deviceInfo.deviceType == DeviceType.mobile) {
          fontSize = 32.0;
        }

        return SizedBox(
          height: deviceInfo.size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Avatar(),
              Text(
                'Mobile Development Engineer\nFlutter Enthusiast',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: fontSize),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: deviceInfo.size.height * 0.02),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'I am Flutter Developer with 2+ years '
                      'experience & Founder of ',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                  children: [
                    TextSpan(
                      text: 'Azerbaijan Flutter Users Community.',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: onTap,
                      icon: Icon(CupertinoIcons.chevron_down_circle),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
