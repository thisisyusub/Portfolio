import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../responsive_x.dart';
import 'avatar.dart';
import 'social_button.dart';

class Social {
  Social({
    required this.title,
    required this.url,
    required this.icon,
  });

  final String title;
  final String url;
  final IconData icon;
}

class TopBar extends StatelessWidget {
  final socials = <Social>[
    Social(
      title: 'Github',
      icon: FontAwesomeIcons.github,
      url: 'https://github.com/yusubx',
    ),
    Social(
      title: 'StackOverflow',
      icon: FontAwesomeIcons.stackOverflow,
      url: 'https://stackoverflow.com/users/10996870/kanan-yusubov',
    ),
    Social(
      title: 'LinkedIn',
      icon: FontAwesomeIcons.linkedin,
      url: 'https://www.linkedin.com/in/kananyusubov/',
    ),
    Social(
      title: 'Medium',
      icon: FontAwesomeIcons.medium,
      url: 'https://medium.com/@kanan-yusubov',
    ),
    Social(
      title: 'Facebook',
      icon: FontAwesomeIcons.facebook,
      url: 'https://www.facebook.com/groups/azfluttercommunity',
    ),
    Social(
      title: 'Youtube',
      icon: FontAwesomeIcons.youtube,
      url: 'https://www.youtube.com/channel/UC9j42eR0UxQTwKHY_j71i4g',
    ),
  ];

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
                    if (deviceInfo.deviceType == DeviceType.desktop)
                      ...socials
                          .map(
                            (social) => SocialButton(social.icon, social.url),
                          )
                          .toList()
                    else
                      PopupMenuButton<int>(
                        itemBuilder: (ctx) {
                          return socials
                              .map(
                                (social) => PopupMenuItem(
                                  child: Text(social.title),
                                  value: 1,
                                ),
                              )
                              .toList();
                        },
                        onSelected: (index) async {
                          final social = socials[index];

                          if (await canLaunch(social.url)) {
                            launch(social.url);
                          }
                        },
                      ),
                    // IconButton(
                    //   icon: Icon(
                    //     Icons.more_vert,
                    //     color:
                    //         Theme.of(context).primaryColor.withOpacity(0.5),
                    //   ),
                    //   onPressed: () {},
                    // ),
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
