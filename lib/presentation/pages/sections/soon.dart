import 'package:flutter/material.dart';

class Soon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      color: Theme.of(context).primaryColor.withOpacity(0.4),
      child: Center(
        child: Text(
          'Soon...',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
