import 'package:StreamMaster/components/flutter_flow/xtheme.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key, required this.idx}) : super(key: key);

  final int idx;

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  var _pageOptions = ['/', '/subscription', '/favorites',];

  void _onItemTapped(int index) {
    if (index != widget.idx)
      Navigator.pushReplacementNamed(context, _pageOptions[index]);
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            selectedIndex: widget.idx,
            iconSize: 30,
            tabBorderRadius: 28,
            textStyle: XTheme.of(context).bodyText1,
            backgroundColor: Colors.transparent,
            color: XTheme.of(context).primary,
            activeColor: XTheme.of(context).title1.color,
            tabBackgroundColor: XTheme.of(context).primary,
            gap: 8,
            onTabChange: _onItemTapped,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.credit_card,
                text: 'Subscription',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Likes',
              ),
            ],
          ),
        ),
      );

  }
}
