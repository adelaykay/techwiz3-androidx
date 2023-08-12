import 'package:StreamMaster/components/flutter_flow/xtheme.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  static const routeName = '/contact';

  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    Color primary = XTheme.of(context).primary;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(color: primary),
        ),
        centerTitle: true,
        backgroundColor: XTheme.of(context).primaryBackground,
      ),
      body: Container(
        child: Column(
          children: [
            Card(
              color: primary,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Icon(Icons.phone_outlined),
                    Padding(
                      padding: const EdgeInsets.only(left: 130.0),
                      child: Text('+2348104837711'),
                    )
                  ],
                ),
              ),
            ),
            Card(
              color: primary,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Icon(Icons.email_outlined),
                    Padding(
                      padding: const EdgeInsets.only(left: 130.0),
                      child: Text('andriodx@gmail.com'),
                    )
                  ],
                ),
              ),
            ),
            Card(
              color: primary,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Icon(Icons.location_city_outlined),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: Text('123 James str Surulere Lagos'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
