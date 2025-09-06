import 'package:shared_preferences/shared_preferences.dart';

Future<void>saveOnboardingStatus()async{
final prefs= await SharedPreferences.getInstance();
await prefs.setBool("onboarding_seen", true);
}