import 'package:flutter/material.dart';

import '../my_app_router_with_state.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.brown[400], title: Text('home')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildButton(
                title: "Open Tab Page",
                onPress: () {
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      .myRoute = MyRoute.tab;
                }),
            buildButton(
                title: "Open Link Page",
                onPress: () {
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      .myRoute = MyRoute.link;
                }),
            // MaterialButton(
            //   child: Text('open tab'),
            //   onPressed: () {
            // (Router.of(context).routerDelegate as MyRouterDelegate).myRoute =
            //     MyRoute.tab;
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildButton({String title, Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            style: BorderStyle.solid,
            color: Colors.grey[400],
            width: 3,
          ),
        ),
        height: 200,
        width: 200,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
