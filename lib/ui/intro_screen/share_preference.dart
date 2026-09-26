import 'package:shared_preferences/shared_preferences.dart';

class SharePreference {
  static const String _seenIntroKey =
      'seenIntro'; //مفتاح ثابت (Key) بنستخدمه عشان نحفظ ونقرا بيه الحالة عشان ما نغلطش في كتابته
  static Future<void> setIntroSeen() async {
    // دالة مسؤولة عن حفظ أن المستخدم شاف شاشة الترحيب
    final prefs =
        await SharedPreferences.getInstance(); // فتح نسخة من SharedPreferences
    await prefs.setBool(
      _seenIntroKey,
      true,
    ); //عملناها ترو علشان ان كدا هو شافاها
  }

  static Future<bool> hasSeenIntro() async {
    //داله اتاكد هو شافاها ولا لا
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_seenIntroKey) ??
        false; //يعني يشوف هل انا دب اول مره بفتح ولا فتحت وفي حاجه متخزنه
    //??عناها Null Coalescing Operator يعني لو القيمه اللي علي اليمين طلعت null ساعتها اعمل اللي علي الشمال علشان اخزن
  }
}
