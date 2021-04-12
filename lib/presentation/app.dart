import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'router/portfolio_router_delegate.dart';
import 'router/portfolio_router_information_parser.dart';
import 'utils/custom_scroll_behaviour.dart';
import 'values/themes.dart';

class PortfolioApp extends StatelessWidget {
  final _routeNotifier = PortfolioRouteNotifier();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _routeNotifier,
      child: MaterialApp.router(
        routerDelegate: PortfolioRouterDelegate(_routeNotifier),
        routeInformationParser: PortfolioRouteInformationParser(),
        title: 'Portfolio',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.theme,
        // home: MainPage(),
        builder: (_, child) {
          return ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: child!,
          );
        },
      ),
    );
  }
}
