import 'package:StreamMaster/components/xtheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../components/flutter_flow/flutter_flow_widgets.dart';
import '../models/login_model.dart';


class UpdateProfileScreen extends StatefulWidget {
  static const routeName = '/update_profile';
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Login03Model _model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = Login03Model();
    _model.emailAddressFieldController ??= TextEditingController();
    _model.passwordFieldController ??= TextEditingController();
    _model.nameFieldController ??= TextEditingController();
    _model.phoneFieldController ??= TextEditingController();
    _model.usernameFieldController ??= TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: XTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: 360,
              decoration: BoxDecoration(),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                            height: 100,
                          ),
                        ),
                      ),
                      SelectionArea(
                          child: Text(
                            'Update your profile',
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
                              'Please enter your details.',
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
                                      controller: _model.nameFieldController,
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
                                        hintText: 'Enter your name',
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
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            14, 10, 14, 10),
                                      ),
                                      style: XTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        color:
                                        XTheme.of(context).primaryText,
                                        fontSize: 16,
                                        lineHeight: 1.5,
                                      ),
                                      keyboardType: TextInputType.name,
                                      validator: (String? val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Name is required.';
                                        }

                                        if (!RegExp(
                                            _model.kTextValidatorNameRegex)
                                            .hasMatch(val)) {
                                          return 'Has to be a valid name.';
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
                                    TextFormField(
                                      controller:
                                      _model.emailAddressFieldController,
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
                                        hintText: 'Enter your email address',
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
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            14, 10, 14, 10),
                                      ),
                                      style: XTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        color:
                                        XTheme.of(context).primaryText,
                                        fontSize: 16,
                                        lineHeight: 1.5,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (String? val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Email is required.';
                                        }

                                        if (!RegExp(
                                            _model.kTextValidatorEmailRegex)
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
                                    TextFormField(
                                      controller: _model.phoneFieldController,
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
                                        hintText: 'Enter your phone number',
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
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            14, 10, 14, 10),
                                      ),
                                      style: XTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        color:
                                        XTheme.of(context).primaryText,
                                        fontSize: 16,
                                        lineHeight: 1.5,
                                      ),
                                      keyboardType: TextInputType.phone,
                                      validator: (String? val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Phone number is required.';
                                        }

                                        if (!RegExp(
                                            _model.kTextValidatorPhoneRegex)
                                            .hasMatch(val)) {
                                          return 'Has to be a valid phone number.';
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
                                    TextFormField(
                                      controller:
                                      _model.usernameFieldController,
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
                                        hintText: 'Enter your username',
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
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            14, 10, 14, 10),
                                      ),
                                      style: XTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Inter',
                                        color:
                                        XTheme.of(context).primaryText,
                                        fontSize: 16,
                                        lineHeight: 1.5,
                                      ),
                                      keyboardType: TextInputType.name,
                                      validator: (String? val) {
                                        if (val == null || val.isEmpty) {
                                          return 'username is required.';
                                        }

                                        if (!RegExp(_model
                                            .kTextValidatorUsernameRegex)
                                            .hasMatch(val)) {
                                          return 'Has to be a valid username.';
                                        }
                                        return null;
                                      },
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
                            updateProfile();
                          },
                          text: 'Update Profile',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 44,
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
          ),
        ),
      ),
    );
  }

  void updateProfile() async {
    showDialog(
          context: context,
          builder: (context) => Center(
            child: SpinKitFadingCircle(color: XTheme.of(context).primary,),
          ));
    try {
      String newDisplayName = '${_model.nameFieldController?.text.trim()}';
      String newEmail = '${_model.emailAddressFieldController?.text.trim()}';
      final user = FirebaseAuth.instance.currentUser;
      // ToDo: Implement update user phone number
      // PhoneAuthCredential phoneAuthCred = ;
      // await user?.updatePhoneNumber(PhoneAuthCredential phoneAuthCred);
      await user?.updateDisplayName(newDisplayName);
      await user?.updateEmail(newEmail);
      SnackBar snack = SnackBar(content: Center(child: Icon(Icons.check),));
      ScaffoldMessenger.of(context).showSnackBar(snack);
      Navigator.pop(context);
    } on FirebaseAuthException catch(e){
      print(e);
      SnackBar snack = SnackBar(content: Text('${e.message}'));
      ScaffoldMessenger.of(context).showSnackBar(snack);
      Navigator.pop(context);
    }
  }
}
