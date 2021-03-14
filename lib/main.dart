import 'package:flutter/material.dart';
//import 'package:location/location.dart';

void main() => runApp(TopLevelWidget());

class TopLevelWidget extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  final pagesRouteFactories = {
    "/": () => MaterialPageRoute(
          builder: (context) => Center(
            child: Text(
              "Home",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
    "chat": () => MaterialPageRoute(
          builder: (context) => Center(
            child: Text(
              "Chat",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
    "trade": () => MaterialPageRoute(
          builder: (context) => Center(
            child: Text(
              "Trade",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
    "events": () => MaterialPageRoute(
          builder: (context) => Center(
            child: Text(
              "Events",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
    "info": () => MaterialPageRoute(
          builder: (context) => Center(
            child: Text(
              "Info",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
    "getHelp": () => MaterialPageRoute(
          builder: (context) => Center(
            child: Text(
              "Get Help",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
  };
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal[900],
          ),
          body: _buildBody(),
          bottomNavigationBar: _buildBottomNavigationBar(context),
        ),
      );

  Widget _buildBody() => MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: (route) => pagesRouteFactories[route.name]!());

  Widget _buildBottomNavigationBar(context) => BottomNavigationBar(
        items: [
          _buildBottomNavigationBarItem("Home", Icons.home),
          _buildBottomNavigationBarItem("Chat", Icons.chat),
          _buildBottomNavigationBarItem("Trade", Icons.people),
          _buildBottomNavigationBarItem("Events", Icons.warning),
          _buildBottomNavigationBarItem("Info", Icons.info),
          _buildBottomNavigationBarItem("Get Help", Icons.help)
        ],
        onTap: (routeIndex) => navigatorKey.currentState!
            .pushNamed(pagesRouteFactories.keys.toList()[routeIndex]),
      );

  _buildBottomNavigationBarItem(name, icon) => BottomNavigationBarItem(
      // ignore: deprecated_member_use
      icon: Icon(icon),
      title: Text(name),
      backgroundColor: Colors.black45);
}
