import 'package:flutter/material.dart';
import 'package:StreamMaster/Components/input_Field.dart';
final formKey = GlobalKey<FormState>();//key for form
class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Create Account'),
            centerTitle: true,
            backgroundColor: Colors.deepOrangeAccent,
          ),
          backgroundColor: Colors. black38,
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child:  Center(
            child: Form(
              // key: formKey,
              child:  Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: InputField(placeholder: 'Full Name', icon: Icons.person_outline_rounded, type: TextInputType.name,),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: InputField(placeholder: 'Email Address', icon: Icons.email_outlined, type: TextInputType.emailAddress,),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: InputField(placeholder: 'Contact Number', icon: Icons.phone_outlined, type: TextInputType.phone,),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: InputField(placeholder: 'Username', icon: Icons.person_pin, type: TextInputType.name,),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: InputField(placeholder: 'Password', icon: Icons.password_outlined, type: TextInputType.text,),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: InputField(placeholder: 'Confirm Password', icon: Icons.password_outlined, type: TextInputType.text,),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )),
                      onPressed: () {
                    if(formKey.currentState!.validate())
                      {

                        // Navigator.push(context,
                        //     MaterialPageRoute(builder:(context) =>

                      }
                  },
                      child: const Text('Create Account',style: TextStyle(color: Colors.black),)
                  )
                ],
              ),
            ),
          ),
        )

        ),
      ),
    );
  }
}
