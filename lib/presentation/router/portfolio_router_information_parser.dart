import 'package:flutter/material.dart';

import 'portfolio_path.dart';

class PortfolioRouteInformationParser
    extends RouteInformationParser<PortfolioPath> {
  @override
  Future<PortfolioPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    /// for [Home Page]
    if (uri.pathSegments.length == 0) {
      return PortfolioPath.home();
    }

    /// for [Work Page]
    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments.first.toLowerCase() == 'work')
        return PortfolioPath.work();

      return PortfolioPath.notFound();
    }

    return PortfolioPath.notFound();
  }

  /// it updates browser history for our web app
  @override
  RouteInformation? restoreRouteInformation(PortfolioPath path) {
    switch (path.page) {
      case Pages.home:
        return RouteInformation(location: '/');
      case Pages.work:
        return RouteInformation(location: '/work');
      default:
        return RouteInformation(location: '/404');
    }
  }
}
