import 'package:flutter/material.dart';

import '../../responsive_x.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveX(
      builder: (_, deviceInfo) {
        return SizedBox(
          height: deviceInfo.size.height,
          child: Column(
            children: [
              Text(
                'About',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: 32),
              ),
            ],
          ),
        );
      },
    );
  }
}
