// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get name => 'Name';

  @override
  String get phone => 'Phone Number';

  @override
  String get login => 'Login';

  @override
  String get loginWithGoogle => 'Login With Google';

  @override
  String get register => 'Register';

  @override
  String get createAccount => 'Create Account';

  @override
  String get forgetPassword => 'Forget Password ?';

  @override
  String get alreadyHaveAccount => 'Already Have Account ?';

  @override
  String get avatar => 'Avatar';

  @override
  String get passwordMustBeAtLeast8Characters =>
      'Password must be at least 8 characters';

  @override
  String get invalidEmail => 'Invalid Email';

  @override
  String get notHaveAccount => 'Do Not Have Account?';
}
