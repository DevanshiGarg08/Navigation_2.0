import 'package:flutter/material.dart';

import '../app.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage(this.tab) : super();
  final int tab;
  @override
  GalleryPageState createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();

    /// Will manage the state required by TabBar and TabBarView
    _tabController =
        TabController(initialIndex: widget.tab, length: 2, vsync: this)
          ..addListener(_onTabIndexChange);
  }

  @override
  void didUpdateWidget(GalleryPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index = widget.tab;
  }

  void _onTabIndexChange() {
    if (_tabController.indexIsChanging) return;
    final MyRouterDelegate state =
        Router.of(context).routerDelegate as MyRouterDelegate;
    if (state.tab == _tabController.index) return;
    Router.navigate(context, () {
      state.tab = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.brush)),
            Tab(icon: Icon(Icons.book)),
          ],
        ),
        title: Text(
          'Gallery',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Icon(Icons.backpack),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                // width: 400,
                height: 500,
                child: Image.network(
                    "https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzV8fGFydHxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=800&q=60"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                // width: 300,
                height: 500,
                child: Image.network(
                    "https://images.unsplash.com/photo-1578926288207-a90a5366759d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzd8fGFydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                // width: 300,
                height: 500,
                child: Image.network(
                    "https://images.unsplash.com/photo-1579541814924-49fef17c5be5?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8NzN8fGFydHxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=800&q=60"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                // width: 400,
                height: 500,
                child: Image.network(
                    "https://images.unsplash.com/photo-1511108690759-009324a90311?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJvb2slMjBjb3ZlcnxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=800&q=60"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                // width: 400,
                height: 500,
                child: Image.network(
                    "https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjR8fGJvb2slMjBjb3ZlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                // width: 300,
                height: 500,
                child: Image.network(
                    "https://images.unsplash.com/photo-1603289847962-9da9640785e3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzl8fGJvb2slMjBjb3ZlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
              ),
            ],
          ),
          // Icon(Icons.directions_transit),
        ],
      ),
    );
  }
}
