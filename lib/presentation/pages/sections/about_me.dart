import 'package:flutter/material.dart';

import '../../responsive_x.dart';
import '../../values/colors.dart';

final content = 'Hello! I\'m Kanan, I am passionate about Dart/Flutter. '
    'Now, I am trying to learn Node.JS and improve my Software Development Skills.';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveX(
      builder: (context, deviceInfo) {
        return Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Me',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: deviceInfo.size.shortestSide * 0.035,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildTitle(context, 'Education'),
                  _buildEducationItem(
                    deviceInfo,
                    '- Baku Engineering University (2020 - current)',
                    'Computer Engineering (Master Degree)',
                  ),
                  _buildEducationItem(
                    deviceInfo,
                    '- Azerbaijan State Oil And Industry University (2016 - 2020)',
                    'Computer Engineering - 93 GPA (Bachelor Degree)',
                  ),
                  const SizedBox(height: 15),
                  _buildTitle(context, 'Personal Info'),
                  _buildAboutItem(deviceInfo, 'Age', '23'),
                  const SizedBox(height: 5),
                  _buildAboutItem(
                    deviceInfo,
                    'Email',
                    'kanan.yusub@gmail.com',
                  ),
                  const SizedBox(height: 5),
                  _buildAboutItem(
                    deviceInfo,
                    'Phone',
                    '+994 50 804 04 58',
                  ),
                  const SizedBox(height: 5),
                  _buildAboutItem(
                    deviceInfo,
                    'Address',
                    'Absheron District, Gobu settlement',
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Text _buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.actionColor,
          ),
    );
  }

  Column _buildEducationItem(
    DeviceInfo deviceInfo,
    String title,
    String subtitle,
  ) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: deviceInfo.size.shortestSide * 0.035,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: deviceInfo.size.shortestSide * 0.035,
          ),
        ),
      ],
    );
  }

  Row _buildAboutItem(
    DeviceInfo deviceInfo,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: deviceInfo.size.shortestSide * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: deviceInfo.size.shortestSide * 0.035,
            ),
          ),
        ),
      ],
    );
  }
}
