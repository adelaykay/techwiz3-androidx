import 'package:flutter/material.dart';
class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            title: Text('Contact Us',style: TextStyle(color: Colors.deepOrangeAccent),),
          centerTitle: true,
          backgroundColor: Colors.black,
          ),
          body:Container(
            child: Column(
              children: [
                Card(
                  color:  Colors.deepOrangeAccent,
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
                  color:  Colors.deepOrangeAccent,
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
                  color:  Colors.deepOrangeAccent,
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
                )
              ],
            ),
          ),
        )
      )
    );
  }
}
