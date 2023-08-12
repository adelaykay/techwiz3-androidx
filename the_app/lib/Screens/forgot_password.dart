import 'package:StreamMaster/Screens/signin.dart';
import 'package:StreamMaster/components/flutter_flow/xtheme.dart';
import 'package:flutter/material.dart';

import '../components/flutter_flow/flutter_flow_widgets.dart';
import '../models/login_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = '/forgot_password';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
    final _formKey = GlobalKey<FormState>();
    late Login03Model _model;

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _model = Login03Model();
      _model.emailAddressFieldController ??= TextEditingController();
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: XTheme.of(context).bodyText2.fontSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please enter your email and we will send \nyou a link to return to your account",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                    TextFormField(
                    controller:
                    _model.nameFieldController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: XTheme.of(context)
                          .bodyMedium
                          .override(
                        fontFamily: 'Inter',
                        color: XTheme.of(context)
                            .primaryText,
                        fontSize: 16,
                        lineHeight: 1.5,
                      ),
                      hintText: 'Enter your email',
                      hintStyle: XTheme.of(context)
                          .bodyMedium
                          .override(
                        fontFamily: 'Inter',
                        color: XTheme.of(context)
                            .secondaryText,
                        fontSize: 16,
                        lineHeight: 1.5,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00D0D5DD),
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding:
                      EdgeInsetsDirectional.fromSTEB(
                          14, 10, 14, 10),
                    ),
                    style: XTheme.of(context)
                        .bodyMedium
                        .override(
                      fontFamily: 'Inter',
                      color: XTheme.of(context)
                          .primaryText,
                      fontSize: 16,
                      lineHeight: 1.5,
                    ),
                    keyboardType: TextInputType.name,
                    validator: ( String? val) {
                      if (val == null || val.isEmpty) {
                        return 'Name is required.';
                      }

                      if (!RegExp(_model.kTextValidatorNameRegex).hasMatch(val)) {
                        return 'Has to be a valid name.';
                      }
                      return null;
                    },
                  ),

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                              return;
                            }
                          },
                          text: 'Submit',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 44,
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: XTheme.of(context).primary,
                            textStyle:
                            XTheme.of(context).titleSmall.override(
                              fontFamily: 'Inter',
                              color: Colors.white,
                            ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
