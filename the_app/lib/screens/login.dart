import 'package:StreamMaster/screens/home.dart';
import 'package:flutter/material.dart';

import '../components/flutter_flow/xtheme.dart';
import '../components/flutter_flow/flutter_flow_widgets.dart';
import '../models/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Login03Model _model;
  static const kTextValidatorEmailRegex =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = Login03Model();
    XTheme.initialize();
    _model.emailAddressFieldController ??= TextEditingController();
    _model.passwordFieldController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }
  @override
  Widget build(BuildContext context) {
    return // Generated code for this Login_03 Widget...
      GestureDetector(
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
                              'assets/images/launch.png',
                              height: 200,
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
                                'Welcome back! Please enter your details.',
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
                                        controller:
                                        _model.emailAddressFieldController,
                                        obscureText: _model.passwordFieldVisibility,
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
                                        keyboardType: TextInputType.emailAddress,
                                        validator: ( String? val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Email is required.';
                                          }

                                          if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
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
                                        controller: _model.passwordFieldController,
                                        obscureText: !_model.passwordFieldVisibility,
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
                                          hintText: '••••••••',
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
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                                  () => _model.passwordFieldVisibility =
                                              !_model.passwordFieldVisibility,
                                            ),
                                            focusNode: FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordFieldVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons.visibility_off_outlined,
                                              color: XTheme.of(context)
                                                  .secondaryText,
                                              size: 16,
                                            ),
                                          ),
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
                                        validator: (String? val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Password is required.';
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                                return;
                              }
                            },
                            text: 'Log in',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFFD0D5DD),
                                  width: 1,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: SelectionArea(
                                            child: Text(
                                              'Sign in with Google',
                                              style: XTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectionArea(
                                  child: Text(
                                    'Don\'t have an account? ',
                                    style: XTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Inter',
                                      color:
                                      XTheme.of(context).secondaryText,
                                    ),
                                  )),
                              SelectionArea(
                                  child: Text(
                                    'Sign up',
                                    style:
                                    XTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Inter',
                                      color: XTheme.of(context).primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: SelectionArea(
                              child: Text(
                                'Forget password?',
                                style: XTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  color: XTheme.of(context).primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    ;
  }
}
