import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../responsive_x.dart';
import '../main/widgets/avatar.dart';
import '../main/widgets/social_button.dart';

class Home extends StatelessWidget {
  const Home({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveX(
      builder: (context, deviceInfo) {
        return SizedBox(
          height: deviceInfo.size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Avatar(
                Size(
                  deviceInfo.size.width * 0.18,
                  deviceInfo.size.width * 0.18,
                ),
              ),
              SizedBox(height: deviceInfo.size.height * 0.04),
              Text(
                'Mobile Development Engineer',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      fontSize: deviceInfo.size.shortestSide * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: deviceInfo.size.height * 0.02),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'I am Flutter Developer with 2+ years '
                      'experience\nFounder of ',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: deviceInfo.size.shortestSide * 0.035,
                        color: Theme.of(context).primaryColor,
                      ),
                  children: [
                    TextSpan(
                      text: 'Azerbaijan Flutter Users Community.',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: deviceInfo.size.shortestSide * 0.035,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: deviceInfo.size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    FontAwesomeIcons.github,
                    'https://github.com/thisisyusub',
                  ),
                  SocialButton(
                    FontAwesomeIcons.stackOverflow,
                    'https://stackoverflow.com/users/10996870/thisisyusub',
                  ),
                  SocialButton(
                    FontAwesomeIcons.facebook,
                    'https://www.facebook.com/kanan.yusub',
                  ),
                  SocialButton(
                    FontAwesomeIcons.linkedinIn,
                    'https://www.linkedin.com/in/kananyusubov/',
                  ),
                  SocialButton(
                    FontAwesomeIcons.mediumM,
                    'https://thisisyusub.medium.com/',
                  ),
                  SocialButton(
                    FontAwesomeIcons.youtube,
                    'https://www.youtube.com/c/KenanYusubov/',
                  ),
                ],
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
