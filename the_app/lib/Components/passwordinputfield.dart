import 'package:flutter/material.dart';
class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.placeholder, required this.icon, required this.type, required this.hintText});
  final String placeholder;
  final IconData icon;
  final TextInputType type;
  final String hintText;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHidden,
      keyboardType: widget.type,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.deepOrangeAccent),
          fillColor: Colors.deepOrangeAccent,
          label: Text(widget.placeholder,style: const TextStyle(color: Colors.deepOrangeAccent,)),
          prefixIcon:  Icon(widget.icon,color: Colors.deepOrangeAccent,),

          suffixIcon: IconButton(
            onPressed:() {
                   setState(() {
                     isHidden =! isHidden;
                   });
            },  icon: isHidden ? const Icon(Icons.visibility,color: Colors.deepOrangeAccent,):const Icon(Icons.visibility_off,color: Colors.deepOrangeAccent,)
          ),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0,color: Colors.deepOrangeAccent)
          ),
          labelStyle: const TextStyle(color: Colors.deepOrangeAccent,)
      ),
      validator: (value){

        if(widget.placeholder == 'Password')
        {
          if (value!.isEmpty || !RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$').hasMatch(value)) {
            return "Password must be at least 8 characters long";
          }
          String ? password = value;
          if(widget.placeholder == 'Confirm Password')
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
