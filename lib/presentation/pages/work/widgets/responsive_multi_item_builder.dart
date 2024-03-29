import 'package:flutter/cupertino.dart';

import '../../../responsive_x.dart';

class ResponsiveMultiChildBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? mobileItemBuilder;
  final int itemCount;

  ResponsiveMultiChildBuilder({
    required this.itemBuilder,
    this.mobileItemBuilder,
    required this.itemCount,
  });

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveX(builder: (_, deviceInfo) {
      final deviceType = deviceInfo.deviceType;

      Widget multiElementBuilder;

      final isMobile = deviceType == DeviceType.mobile;

      if (isMobile) {
        multiElementBuilder = ListView.builder(
          controller: _controller,
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 30.0,
          ),
          itemBuilder: (ctx, i) => ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: deviceInfo.size.height / 2,
            ),
            child: mobileItemBuilder != null
                ? mobileItemBuilder?.call(ctx, i)
                : itemBuilder(ctx, i),
          ),
          itemCount: itemCount,
        );
      } else {
        final isDesktop = deviceType == DeviceType.desktop;
        final crossAxisCount = isDesktop ? 3 : 2;
        final mainAxisExtent = deviceInfo.size.height / 2;

        multiElementBuilder = GridView.builder(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 30.0,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: mainAxisExtent,
          ),
          itemBuilder: itemBuilder,
          itemCount: itemCount,
        );
      }

      return CupertinoScrollbar(
        controller: _controller,
        child: multiElementBuilder,
      );
    });
  }
}
