import 'package:flutter/material.dart';

import '../../../values/colors.dart';

class Avatar extends StatelessWidget {
  const Avatar(this.size);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            border: Border.all(
              width: 4.0,
              color: Colors.white,
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.0, 2.0),
                blurRadius: 4.0,
                color: AppColors.primaryColor,
              ),
            ],
          ),
          child: Image.asset(
            'lib/assets/avatar.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: size.height * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Kanan Yusubov',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ],
    );
  }
}
