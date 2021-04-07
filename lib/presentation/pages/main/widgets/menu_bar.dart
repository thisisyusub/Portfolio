import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu_button.dart';

class MenuBar extends StatelessWidget {
  MenuBar(this.animateTo);

  final void Function(int index) animateTo;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuButton(
                'Home',
                Icons.home_outlined,
                () => animateTo(0),
              ),
              MenuButton(
                'About',
                Icons.person_outline_rounded,
                () => animateTo(1),
              ),
              MenuButton(
                'Work',
                Icons.work_outline_rounded,
                () => animateTo(2),
              ),
              MenuButton(
                'Contact',
                CupertinoIcons.envelope,
                () => animateTo(3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
