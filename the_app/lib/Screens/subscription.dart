import 'package:StreamMaster/components/drawer.dart';
import 'package:StreamMaster/components/bottom_nav.dart';
import 'package:flutter/material.dart';

class MySubs extends StatelessWidget {
  static const routeName = '/subscription';

  const MySubs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Subscriptions'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: NavBar(
        idx: 1,
      ),
    );
  }
}
