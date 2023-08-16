import 'package:StreamMaster/components/xtheme.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

class ContactUs extends StatelessWidget {
  static const routeName = '/contact';

  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    Color primary = XTheme.of(context).primary;
    List<Icon> icons = [Icon(Icons.phone), Icon(Icons.email), Icon(Icons.home)];
    List<String> details = [
      '+2348104837711',
      'androidx@gmail.com',
      '123 James Street, Surulere, Lagos'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(color: primary),
        ),
        backgroundColor: XTheme.of(context).primaryBackground,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ...List.generate(
                details.length,
                (index) => Card(
                  color: primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        icons[index],
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          details[index],
                          style: XTheme.of(context).bodyText1,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
