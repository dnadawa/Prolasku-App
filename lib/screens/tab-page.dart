import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:prolasku/screens/coupons.dart';
import 'package:prolasku/screens/more.dart';
import 'package:prolasku/screens/products.dart';
import 'package:prolasku/screens/receipts.dart';
import 'home.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin{


  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this,initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        snakeShape: SnakeShape.indicator,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black.withOpacity(0.3),
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _controller.index,
        onTap: (index){
          setState(() {
            _controller.animateTo(index);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.house_fill), label: tr('home')),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.rectangle_grid_2x2_fill), label: tr('products')),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.ticket_fill), label: tr('coupons')),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.doc_text_fill), label: tr('receipts')),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.ellipsis), label: tr('more')),
        ],
      ),
      body: TabBarView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
            Home(controller: _controller,),
            Products(),
            Coupons(),
            Receipts(),
            More(),
        ],
      ),
    );
  }
}
