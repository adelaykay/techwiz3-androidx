import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            foregroundImage: Image.network('${user?.photoURL}').image,
            backgroundImage: NetworkImage('https://loremflickr.com/g/150/150/profile'),
            maxRadius: 54,
            ),
          Text(
            "${user?.displayName}",
            style: TextStyle(
                color: Colors.white,
              fontSize: 20
            ),
          ),
          Text(
            "${user?.email}",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          ),
        ],
      ),
    );
  }
}
