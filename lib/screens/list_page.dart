import 'package:flutter/material.dart';

import '../my_app_router_with_state.dart';

class MyLinkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text(
          'See All',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildItem(context,
                  imgSrc:
                      "https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzV8fGFydHxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=800&q=60",
                  title: "Renaissance",
                  rating: "4.5"),
              buildItem(context,
                  imgSrc:
                      "https://images.unsplash.com/photo-1578926288207-a90a5366759d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzd8fGFydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                  title: "Motherly Love",
                  rating: "4.5"),
              buildItem(context,
                  imgSrc:
                      "https://images.unsplash.com/photo-1579541814924-49fef17c5be5?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8NzN8fGFydHxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=800&q=60",
                  title: "Serenity",
                  rating: "4.0"),
              buildItem(context,
                  imgSrc:
                      "https://images.unsplash.com/photo-1511108690759-009324a90311?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJvb2slMjBjb3ZlcnxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=800&q=60",
                  title: "Your Soul is a River",
                  rating: "4.0"),
              buildItem(context,
                  imgSrc:
                      "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjR8fGJvb2slMjBjb3ZlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                  title: "Milk and Honey",
                  rating: "4.5"),
              buildItem(context,
                  imgSrc:
                      "https://images.unsplash.com/photo-1603289847962-9da9640785e3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzl8fGJvb2slMjBjb3ZlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                  title: "Russian Novel",
                  rating: "3.5")
            ],
          ),
        ),
      ),
    );
  }

  Container buildItem(BuildContext context,
      {String imgSrc, String title, String rating}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.grey[400]),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 300,
            child: Image.network(imgSrc),
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    (Router.of(context).routerDelegate as MyRouterDelegate)
                        .myRoute = MyRoute.more;
                  },
                  child: Container(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                    softWrap: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20, height: 1.5),
                  ),
                ),
                SizedBox(height: 55),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 10),
                    Text(rating)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
