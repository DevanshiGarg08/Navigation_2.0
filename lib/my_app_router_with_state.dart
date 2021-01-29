import 'package:flutter/material.dart';
import 'package:flutter_web_navigation/screens/content_detail.dart';
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
      title: 'Flutter Navigation Demo',
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: _delegate,
    );
  }
}

// {
//   '/': (_) => MyHomePage(),
//   '/tab': (_) => MyTabPage(),
// }
enum MyRoute { home, gallery, seeAll, more }

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
    else if (routeName == '/gallery')
      return MyConfiguration(MyRoute.gallery, routeInformation.state);
    else if (routeName == '/seeAll')
      return MyConfiguration(MyRoute.seeAll, routeInformation.state);
    else if (routeName == '/seeAll/more')
      return MyConfiguration(MyRoute.more, routeInformation.state);
    throw 'unknown';
  }

  @override
  RouteInformation restoreRouteInformation(MyConfiguration configuration) {
    switch (configuration.myRoute) {
      case MyRoute.home:
        return RouteInformation(location: '/', state: configuration.tab);
      case MyRoute.gallery:
        return RouteInformation(location: '/gallery', state: configuration.tab);
      case MyRoute.seeAll:
        return RouteInformation(location: '/seeAll', state: configuration.tab);
      case MyRoute.more:
        return RouteInformation(
            location: '/seeAll/more', state: configuration.tab);
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
        if (_myRoute == MyRoute.gallery)
          MaterialPage(key: ValueKey('gallery'), child: GalleryPage(_tab)),
        if (_myRoute == MyRoute.seeAll)
          MaterialPage(key: ValueKey('seeAll'), child: SeeAllPage()),
        if (_myRoute == MyRoute.more)
          MaterialPage(key: ValueKey('seeAll/more'), child: ContentDetail()),
      ],
      onPopPage: _handlePopPage,
    );
  }
}
