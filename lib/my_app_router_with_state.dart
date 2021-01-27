import 'package:flutter/material.dart';
import 'package:flutter_web_navigation/screens/book_detail.dart';
import 'package:flutter_web_navigation/screens/gallery_page.dart';
import 'package:flutter_web_navigation/screens/home_page.dart';
import 'package:flutter_web_navigation/screens/list_page.dart';

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  MyRouterDelegate _delegate = MyRouterDelegate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: _delegate,
    );
  }
}

// {
//   '/': (_) => MyHomePage(),
//   '/tab': (_) => MyTabPage(),
// }
enum MyRoute { home, tab, link, more }

class MyConfiguration {
  const MyConfiguration(this.myRoute, this.tab);
  final MyRoute myRoute;
  final int tab;
}

class MyRouteInformationParser extends RouteInformationParser<MyConfiguration> {
  @override
  Future<MyConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final String routeName = routeInformation.location;
    if (routeName == '/')
      return MyConfiguration(MyRoute.home, routeInformation.state);
    else if (routeName == '/tab')
      return MyConfiguration(MyRoute.tab, routeInformation.state);
    else if (routeName == '/link')
      return MyConfiguration(MyRoute.link, routeInformation.state);
    else if (routeName == '/link/more')
      return MyConfiguration(MyRoute.more, routeInformation.state);
    throw 'unknown';
  }

  @override
  RouteInformation restoreRouteInformation(MyConfiguration configuration) {
    switch (configuration.myRoute) {
      case MyRoute.home:
        return RouteInformation(location: '/', state: configuration.tab);
      case MyRoute.tab:
        return RouteInformation(location: '/tab', state: configuration.tab);
      case MyRoute.link:
        return RouteInformation(location: '/link', state: configuration.tab);
      case MyRoute.more:
        return RouteInformation(
            location: '/link/more', state: configuration.tab);
    }
    throw 'unknown';
  }
}

class MyRouterDelegate extends RouterDelegate<MyConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyConfiguration> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyRoute get myRoute => _myRoute;
  MyRoute _myRoute;
  set myRoute(MyRoute value) {
    if (_myRoute == value) return;
    _myRoute = value;
    notifyListeners();
  }

  int get tab => _tab;
  int _tab = 0;
  set tab(int value) {
    if (_tab == value) return;
    _tab = value;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(MyConfiguration configuration) async {
    _myRoute = configuration.myRoute;
    _tab = configuration.tab ?? 0;
  }

  // For web application
  @override
  MyConfiguration get currentConfiguration => MyConfiguration(myRoute, tab);

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    final bool success = route.didPop(result);
    if (success) {
      _myRoute = MyRoute.home;
      notifyListeners();
    }
    return success;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: <Page<void>>[
        MaterialPage(key: ValueKey('home'), child: MyHomePage()),
        if (_myRoute == MyRoute.tab)
          MaterialPage(key: ValueKey('tab'), child: MyTabPage(_tab)),
        if (_myRoute == MyRoute.link)
          MaterialPage(key: ValueKey('link'), child: MyLinkPage()),
        if (_myRoute == MyRoute.more)
          MaterialPage(key: ValueKey('link/more'), child: BookDetail()),
      ],
      onPopPage: _handlePopPage,
    );
  }
}
