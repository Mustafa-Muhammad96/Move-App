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
  String get confirmPassword => 'تأكيد كلمة السر';

  @override
  String get name => 'الاسم';

  @override
  String get phone => 'رقم الهاتف';

  @override
  String get login => 'تسجيل دخول';

  @override
  String get loginWithGoogle => 'تسجيل الدخول بحساب جوجل';

  @override
  String get register => 'إنشاء حساب';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get forgetPassword => 'نسيت كلمة السر ؟';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل ؟';

  @override
  String get avatar => 'صورة شخصية';

  @override
  String get passwordMustBeAtLeast8Characters =>
      'يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل';

  @override
  String get invalidEmail => 'بريد إلكتروني غير صالح';

  @override
  String get notHaveAccount => 'ليس لديك حساب؟';
}
