import 'package:flutter/material.dart';

import '../app.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 160, vertical: 50),
        child: SingleChildScrollView(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            buildButton(
                title: "Gallery",
                onPress: () {
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      .myRoute = MyRoute.gallery;
                }),
            SizedBox(width: 10),
            buildButton(
                title: "See All",
                onPress: () {
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      .myRoute = MyRoute.seeAll;
                })
          ]),
        ),
      ),
    );
  }

  GestureDetector buildButton({String title, Function onPress}) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          width: 500,
          height: 650,
          child: Card(
              // height: double.infinity,
              child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1574367157590-3454fe866961?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDF8fGdhbGxlcnl8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                fit: BoxFit.fill,
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          )),
        ));
  }
}
