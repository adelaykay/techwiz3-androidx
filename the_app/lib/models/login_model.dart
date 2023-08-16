import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login03Model {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final kTextValidatorEmailRegex =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

  final kTextValidatorNameRegex = r"^[A-Za-z-]+(?: [A-Za-z-]+)+\s$";

  final kTextValidatorPhoneRegex = r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,7}$";

  final kTextValidatorUsernameRegex = r"^[A-Za-z0-9_-]{3,15}$";
  // State field(s) for NameField widget
  TextEditingController? nameFieldController;
  TextEditingController? usernameFieldController;



  // State field(s) for EmailAddressField widget.
  TextEditingController? emailAddressFieldController;
  String? Function(String?)? emailAddressFieldControllerValidator;


  String? _emailAddressFieldControllerValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for PasswordField widget.
  TextEditingController? phoneFieldController;



  // State field(s) for PasswordField widget.
  TextEditingController? passwordFieldController;
  bool passwordFieldVisibility = true;
  String? Function(BuildContext, String?)? passwordFieldControllerValidator;
  String? _passwordFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailAddressFieldControllerValidator =
        _emailAddressFieldControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldControllerValidator = _passwordFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    emailAddressFieldController?.dispose();
    usernameFieldController?.dispose();
    nameFieldController?.dispose();
    phoneFieldController?.dispose();
    passwordFieldController?.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
