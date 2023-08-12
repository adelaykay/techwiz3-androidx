import 'package:StreamMaster/screens/contactus.dart';
import 'package:StreamMaster/screens/feedback.dart';
import 'package:StreamMaster/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/signin.dart';
import '../screens/update_profile.dart';
import 'drawer_header.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list  of menu  drawer
        children: <Widget>[
          menuItem(1, "DashBoard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Contact Us", Icons.people_alt_outlined,
              currentPage == DrawerSections.contact ? true : false),
          menuItem(3, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          Divider(),
          menuItem(4, "About", Icons.info_outline,
              currentPage == DrawerSections.privacy ? true : false),
          menuItem(5, "Feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.feedback ? true : false),
          Divider(),
          menuItem(6, "LogOut", Icons.logout_outlined,
              currentPage == DrawerSections.feedback ? true : false),
          //logout function

          // GestureDetector(
          //   onTap: (){

          //   }
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
              Navigator.pushNamedAndRemoveUntil(
                  context, Home.routeName, (route) => route.isFirst);
            } else if (id == 2) {
              currentPage = DrawerSections.contact;
              Navigator.pushNamed(context, ContactUs.routeName);
            } else if (id == 3) {
              currentPage = DrawerSections.settings;
              showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: Text('Settings'),
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                                context, UpdateProfileScreen.routeName);
                          },
                          leading: Icon(Icons.person),
                          title: Text('Update Profile'),
                        )
                      ],
                    );
                  });
            } else if (id == 4) {
              currentPage = DrawerSections.about;
            } else if (id == 5) {
              currentPage = DrawerSections.feedback;
              Navigator.pushNamed(context, FeedBackForm.routeName);
            } else if (id == 6) {
              currentPage = DrawerSections.logout;
              showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: Text('Log out of your account?'),
                      children: [
                        TextButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                SigninScreen.routeName,
                                (route) => route.isFirst);
                          },
                          child: Text(
                            'Logout',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                          ),
                        ),
                      ],
                    );
                  });
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contact,
  settings,
  privacy,
  about,
  feedback,
  logout,
}
