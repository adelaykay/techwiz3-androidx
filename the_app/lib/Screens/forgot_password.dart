import 'package:StreamMaster/components/xtheme.dart';
import 'package:StreamMaster/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      backgroundColor: XTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: XTheme.of(context).secondaryBackground,
        title: Text("Forgot Password"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                SizedBox(height: 100),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 50,
                    ),
                  ),
                ),
                SelectionArea(
                    child: Text(
                  'Log in to your account',
                  style: XTheme.of(context).headlineSmall.override(
                        fontFamily: 'Inter',
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        lineHeight: 1.2,
                      ),
                )),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: SelectionArea(
                      child: Text(
                    'Please enter your email and we will send you a link to return to your account.',
                    style: XTheme.of(context).bodySmall.override(
                          fontFamily: 'Inter',
                          lineHeight: 1.5,
                        ),
                  )),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFD0D5DD),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextFormField(
                                controller: _model.emailAddressFieldController,
                                decoration: InputDecoration(
                                  labelStyle: XTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: XTheme.of(context).primaryText,
                                        fontSize: 16,
                                        lineHeight: 1.5,
                                      ),
                                  hintText: 'Enter your email',
                                  hintStyle: XTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: XTheme.of(context).secondaryText,
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
                                style: XTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Inter',
                                      color: XTheme.of(context).primaryText,
                                      fontSize: 16,
                                      lineHeight: 1.5,
                                    ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (String? val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Email is required.';
                                  }

                                  if (!RegExp(_model.kTextValidatorEmailRegex)
                                      .hasMatch(val)) {
                                    return 'Has to be a valid email address.';
                                  }
                                  return null;
                                },
                              ),
                              Container(
                                width: double.infinity,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD0D5DD),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      resetPassword();
                    },
                    text: 'Send Link',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 44,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: XTheme.of(context).primary,
                      textStyle: XTheme.of(context).titleSmall.override(
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
        ),
      ),
    );
  }

  Future<void> resetPassword() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: SpinKitFadingCircle(
                color: XTheme.of(context).primary,
              ),
            ));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _model.emailAddressFieldController!.text.trim());
      SnackBar snack = SnackBar(content: Center(child: Icon(Icons.check)));
      ScaffoldMessenger.of(context).showSnackBar(snack);
      Navigator.pushNamedAndRemoveUntil(context, SigninScreen.routeName, (route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      SnackBar snack = SnackBar(content: Text('${e.message}'));
      ScaffoldMessenger.of(context).showSnackBar(snack);
      Navigator.pop(context);
    }
  }
}
