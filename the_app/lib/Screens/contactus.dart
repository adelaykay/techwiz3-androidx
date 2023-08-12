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
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Icon(Icons.phone),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}
