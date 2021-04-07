import 'package:flutter/material.dart';

class Work extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      color: Theme.of(context).primaryColor.withOpacity(0.4),
      height: 700,
      child: Center(
        child: Text(
          'Work will be here...',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
