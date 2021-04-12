import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../pages/main/main_page.dart';
import '../pages/work/work_page.dart';
import 'portfolio_path.dart';

class PortfolioRouteNotifier extends ChangeNotifier {
  bool _show404 = false;
  bool _showWorkPage = false;

  bool get show404 => _show404;

  bool get showWorkPage => _showWorkPage;

  set show404(bool value) {
    if (value != _show404) {
      _show404 = value;
      notifyListeners();
    }
  }

  set showWorkPage(bool value) {
    if (value != _showWorkPage) {
      _showWorkPage = value;
      notifyListeners();
    }
  }

  void goToWorkPage() => showWorkPage = true;
}

class PortfolioRouterDelegate extends RouterDelegate<PortfolioPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PortfolioPath> {
  // bool show404 = false;
  // bool showWorkPage = false;

  final PortfolioRouteNotifier routeNotifier;

  PortfolioRouterDelegate(this.routeNotifier) {
    routeNotifier.addListener(() {
      notifyListeners();
    });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  PortfolioPath? get currentConfiguration {
    print('setting new path: $routeNotifier');

    if (routeNotifier.show404) return PortfolioPath.notFound();

    if (routeNotifier.showWorkPage)
      return PortfolioPath.work();
    else
      return PortfolioPath.home();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: MainPage(),
        ),
        if (routeNotifier.showWorkPage)
          MaterialPage(
            key: ValueKey('WorkPage'),
            child: WorkPage(),
          ),
        if (routeNotifier.show404)
          MaterialPage(
            key: ValueKey('404'),
            child: Container(
              child: Center(
                child: Text('Page Not Found!'),
              ),
            ),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        routeNotifier.show404 = false;
        routeNotifier.showWorkPage = false;

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(PortfolioPath path) async {
    print('setting new path: $path');

    switch (path.page) {
      case Pages.notFound:
        routeNotifier.showWorkPage = false;
        routeNotifier.show404 = true;
        break;
      case Pages.home:
        routeNotifier.showWorkPage = routeNotifier.show404 = false;
        break;
      case Pages.work:
        routeNotifier.showWorkPage = true;
        routeNotifier.show404 = false;
        break;
    }
  }
}
