// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة السر';

  @override
  String get name => 'الاسم';

  @override
  String get phone => 'رقم الهاتف';

  @override
  String get login => 'تسجيل دخول';

  @override
  String get loginWithGoogle => 'تسجيل الدخول بحساب جوجل';

  @override
  String get register => 'انشاء حساب';

  @override
  String get createAccount => '‘نشاء حساب';

  @override
  String get forgetPassword => 'نسيت كلمة السر';
}
