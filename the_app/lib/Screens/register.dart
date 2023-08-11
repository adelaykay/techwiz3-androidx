import 'package:flutter/material.dart';
import 'package:StreamMaster/Components/input_Field.dart';

import '../Components/passwordinputfield.dart';


final formKey = GlobalKey<FormState>();//key for form
class Register extends StatefulWidget {


  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();//key for form

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Create Account',style: TextStyle(color: Colors.deepOrangeAccent),),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child:  Center(
            child: Form(
              key: formKey,
              child:  Column(
                children: [
                   Padding(
                    padding: EdgeInsets.all(5.0),
                    child: InputField( placeholder: 'Full Name', icon: Icons.person_outline_rounded, type: TextInputType.name, hintText: 'Enter your full name'),
                   ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: InputField(placeholder: 'Email Address', icon: Icons.email_outlined, type: TextInputType.emailAddress, hintText: 'Enter your email Address eg.ty@gmail.com',),
                  ),
                   Padding(
                    padding: EdgeInsets.all(5.0),
                    child: InputField(placeholder: 'Phone Number', icon: Icons.phone_outlined, type: TextInputType.phone, hintText: 'Enter your Phone number ',),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: InputField(placeholder: 'Username', icon: Icons.person_pin, type: TextInputType.name, hintText: 'Enter Username',),
                  ),
                   Padding(
                    padding: EdgeInsets.all(5.0),
                    child:PasswordField(placeholder: 'Password', icon: Icons.password_outlined, type: TextInputType.text, hintText: 'Enter your Password')
                  ),
                   Padding(
                    padding: EdgeInsets.all(5.0),
                    child: PasswordField(placeholder: 'Confirm Password', icon: Icons.password_outlined, type: TextInputType.text, hintText: 'Confirm your Password')
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
                        formKey.currentState!.save();
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
