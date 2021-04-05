import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef ResponsiveBuilder = Widget Function(
  BuildContext context,
  DeviceInfo deviceInfo,
);

enum DeviceType { mobile, tablet, desktop }

class DeviceInfo {
  DeviceInfo({
    required this.orientation,
    required this.deviceType,
    required this.size,
  });

  final Orientation orientation;
  final DeviceType deviceType;
  final Size size;
}

class ResponsiveX extends StatelessWidget {
  ResponsiveX({
    required this.builder,
  });

  final ResponsiveBuilder builder;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return builder(
      context,
      DeviceInfo(
        orientation: mediaQuery.orientation,
        deviceType: _deviceType(mediaQuery),
        size: mediaQuery.size,
      ),
    );
  }

  DeviceType _deviceType(MediaQueryData mediaQueryData) {
    final orientation = mediaQueryData.orientation;

    var screenWidth = mediaQueryData.size.width;

    if (orientation == Orientation.landscape) {
      if (!kIsWeb) {
        screenWidth = mediaQueryData.size.height;
      }
    }

    if (screenWidth > 950) {
      return DeviceType.desktop;
    } else if (screenWidth > 600) {
      return DeviceType.tablet;
    } else {
      return DeviceType.mobile;
    }
  }
}
