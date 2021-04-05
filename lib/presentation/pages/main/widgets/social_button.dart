import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatefulWidget {
  SocialButton(this.icon, this.url);

  final IconData icon;
  final String url;

  @override
  _SocialButtonState createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  var _color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _color = Theme.of(context).primaryColor.withOpacity(0.1);
        });
      },
      onExit: (_) {
        setState(() {
          _color = Colors.transparent;
        });
      },
      child: InkWell(
        onTap: () async {
          if (await canLaunch(widget.url)) {
            launch(widget.url);
          }
        },
        borderRadius: BorderRadius.circular(8.0),
        hoverColor: _color,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Icon(
              widget.icon,
              color: _color == Colors.transparent
                  ? Theme.of(context).primaryColor.withOpacity(0.6)
                  : Theme.of(context).focusColor,
            ),
          ),
        ),
      ),
    );
  }
}
