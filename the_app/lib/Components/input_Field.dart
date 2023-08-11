import 'package:flutter/material.dart';
class InputField extends StatelessWidget {
  const InputField({super.key, required this.placeholder, required this.icon, required this.type,});
final String placeholder;
final IconData icon;
final TextInputType type;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       keyboardType: type,
      decoration: InputDecoration(
        fillColor: Colors.deepOrangeAccent,
          label: Text(placeholder,style: const TextStyle(color: Colors.deepOrangeAccent,)),
          prefixIcon:  Icon(icon,color: Colors.deepOrangeAccent,),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0,color: Colors.deepOrangeAccent)
          ),
          labelStyle: const TextStyle(color: Colors.deepOrangeAccent,)
      ),
      validator: (value){
        if(placeholder == 'Full Name')
        {
          if (value!.isEmpty || !RegExp(r'^[A-za-z]+(?:\s[A-Za-z]+)+$').hasMatch(value)) {
            return "Invalid Name, Only Letters are allowed";
          }
          else {
            return null;
          }
        }
        if(placeholder == 'Email Address')
          {
            if (value!.isEmpty || !RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$').hasMatch(value)) {
              return "Invalid Email Address";
            }
            else {
              return null;
            }
          }
        if(placeholder == 'Contact Number')
        {
          if (value!.isEmpty || !RegExp(r'^(\+234|0)[789]\d{9}$').hasMatch(value)) {
            return "Enter correct phone number ";
          }
          else {
            return null;
          }
        }
        if(placeholder == 'Username')
          {
            if (value!.isEmpty || !RegExp(r'^\+?[0-9]{1,3}[-\s]?\(?[0-9]{1,4}\)?[-\s]?[0-9]{1,4}[-\s]?[0-9]{1,9}$').hasMatch(value)) {
              return "Username can only contain letters,numbers and the length must be between 8 and 20 characters ";
            }
            else {
              return null;
            }
          }
        if(placeholder == 'Password')
        {
          String ? password = value;
          if(placeholder == 'Confirm Password')
            {
              String ? confirmPassword = value;
              if(confirmPassword == password)
                {
                  return 'Passwords match';
                }
              else
              {
                return 'Passwords do not match';
              }
            }
        }

   return null;

      },
    );

  }
}
