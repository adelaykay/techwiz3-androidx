import 'package:StreamMaster/components/flutter_flow/xtheme.dart';
import 'package:flutter/material.dart';

class FeedBackForm extends StatefulWidget {
  static const routeName = '/feedback';

  const FeedBackForm({super.key});

  @override
  State<FeedBackForm> createState() => _FeedBackFormState();
}

class _FeedBackFormState extends State<FeedBackForm> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
  Color primary = XTheme.of(context).primary;
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(
            title: Text(
              'Submit Feedback',
              style: TextStyle(color: primary),
            ),
            centerTitle: true,
            backgroundColor: XTheme.of(context).secondaryBackground),
        body: Column(
          children: [
            SizedBox(
              height: 25.0,
            ),
            Text(
              'Were you satisfied with the app?',
              style: TextStyle(color: primary),
            ),
            AlertDialog(
              content: Form(
                child: TextFormField(
                  cursorColor: Colors.orange,
                  controller: controller,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Tell us how we can help',
                    hintStyle: TextStyle(color: primary),
                    fillColor: Colors.grey,
                  ),
                  maxLines: 4,
                  maxLength: 4096,
                  textInputAction: TextInputAction.done,
                  validator: (String? text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: primary),
                    )),
                TextButton(
                    onPressed: () async {
                      //code to send the feedback
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(color: primary),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
