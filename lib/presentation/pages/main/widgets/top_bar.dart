import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../responsive_x.dart';
import 'avatar.dart';
import 'social_button.dart';

class Social {
  Social({
    required this.index,
    required this.title,
    required this.url,
    required this.icon,
  });

  final int index;
  final String title;
  final String url;
  final IconData icon;
}

class TopBar extends StatelessWidget {
  final socials = <Social>[
    Social(
      index: 0,
      title: 'Github',
      icon: FontAwesomeIcons.github,
      url: 'https://github.com/yusubx',
    ),
    Social(
      index: 1,
      title: 'StackOverflow',
      icon: FontAwesomeIcons.stackOverflow,
      url: 'https://stackoverflow.com/users/10996870/kanan-yusubov',
    ),
    Social(
      index: 2,
      title: 'LinkedIn',
      icon: FontAwesomeIcons.linkedin,
      url: 'https://www.linkedin.com/in/kananyusubov/',
    ),
    Social(
      index: 3,
      title: 'Medium',
      icon: FontAwesomeIcons.medium,
      url: 'https://medium.com/@kanan-yusubov',
    ),
    Social(
      index: 4,
      title: 'Facebook',
      icon: FontAwesomeIcons.facebook,
      url: 'https://www.facebook.com/groups/azfluttercommunity',
    ),
    Social(
      index: 5,
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
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.more_vert_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        itemBuilder: (ctx) {
                          return socials
                              .map(
                                (social) => PopupMenuItem(
                                  child: Text(social.title),
                                  value: social.index,
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
