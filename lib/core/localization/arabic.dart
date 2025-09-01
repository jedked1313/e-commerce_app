import 'package:get/get.dart';

class Arabic extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          // ---------- onBoarding ---------- //
          "continue": "تابع",
          "onboarding_heading": "متجر إلكتروني",
          "onboarding_subtitle": "تطبيق احترافي لأعمالك التجارية الإلكترونية",
          "lorem":
              "إنها سلسلة من الكلمات اللاتينية التي ، عند وضعها في موضعها ، لا تشكل جملًا بمعنى كامل ، ولكنها تعطي الحياة لنص اختبار مفيد لملء الفراغات.",
          "purchase": "شراء عبر الانترنت !!",
          "track": "تتبع طلباتك !!",
          "get_order": "إحصل على طلباتك !!",

          // ---------- Language ---------- //
          "choose_lang": "------   اختر اللغة   ------",

          // ---------- Auth ---------- //
          "rememer_me": "تذكرني",
          "login": "تسجيل الدخول",
          "sign_up": "اشتراك",
          "back_to_login": "رجوع الى تسجيل الدخول",
          "didnt_receive": "لم تتلقى الرمز ؟ ",
          "send_again": " ارسال الرمز مجددا",
          "submit": "إرسال",
          "we_sent": "لقد ارسلنا رمزا الى ",
          "we_sent_2": ", يرجى إدخال الرمز.",
          "check_email": "تحقق من بريدك الإلكتروني",
          "success": "تم بنجاح",
          "the_operation": "تم الإنتهاء من العملية بنجاح",
          "already_have": "لديك حساب بالفعل ؟   ",
          "or": "أو",
          "password": "كلمة المرور",
          "confirm_password": "تأكيد كلمة المرور",
          "confirm_your_password": "أدخل تأكيد كلمة المرور",
          "enter_password": "أدخل كلمة المرور",
          "username": "إسم المستخدم",
          "enter_username": "أدخل إسم المستخدم",
          "email": "البريد الإلكتروني",
          "enter_email": "أدخل بريدك الإلكتروني",
          "signup_and_we": "إشترك ثم سوف نواصل",
          "let_get_start": "هيا لبدأ",
          "new_password": "كلمة المرور الجديدة",
          "at_least": "على الاقل 8 احرف",
          "must_be": "يجب ان يحتوي على 8 احرف على الاقل",
          "set_new_password": "تعيين كلمة مرور جديدة",
          "dont_have": "ليس لديك حساب ؟ ",
          "forget_password": "نسيت كلمة السر ؟",
          "welcome": "مرحبا بك !",
          "please_enter": "الرجاء ادخال البيانات للمتابعة",
          "forget": "نسيت كلمة السر ؟",
          "no_worries": "لا تقلق, سوف نرسل لك تعليمات إعادة تعيين كلمة المرور",
          "confirm_email": "تأكيد البريد الإلكتروني",
          "please_enter_digits":
              "الرجاء إدخال الرمز المكون من 5 ارقام المرسل الى",
          "cant_be_empty": "هذا الحقل لا يمكن ان يكون فارغا",
          "invalid_username": "إسم مستخدم غير صالح",
          "invalid_email": "بريد إلكروني غير صالح",
          "cant_be_less": "لايمكن ان يكون اقل من ",
          "cant_be_larger": "لايمكن ان يكون اكثر من",
          "characters": "احرف",
          "success_account": "تم إنشاء حسابك بنجاح.",
          "success_reset_password":
              "تم اعادة تعيين كلمة المرور الخاصة بك بنجاح",
          "password_not_match": "",

          // ---------- Home ---------- //
          "search": "البحث عن منتج",
          "categories": "الفئات",
          "hot": "اخر العروض",
          "delivery": "عنوان التوصيل",
          "address": "السعودية, الرياض",
          "seeall": "عرض الجميع",
          "hot_sales": "أخر العروض",

          // ---------- Item Details ---------- //
          "add_cart": "اضف الى السلة",
          "read_more": " اقرأ المزيد \n",

          // ---------- Widgets ---------- //
          // Bottom Navigation Bar
          "home": "الرئيسية",
          "settings": "الإعدادات",
          "notifications": "الاشعارات",
          "profile": "الملف الشخصي",

          // Buttons
          "try_again": "      حاول مرة اخرى      ",

          // Dialog Messages
          "server_failure": "فشل في الخادم",
          "we're_sorry":
              "للاسف, لقد واجه الخادم خطأ ولم يتمكن من تلبية طلبك, يرجى التواصل مسؤول التطبيق.",
          "ok": "حسنا",
          "check_intenet": "تحقق من اتصالك بالإنترنت وحاول مرة اخرى",
          "no_internet": "لا يوجد انترنت !",
          "no_data": "لا يوجد بيانات !",
          "warning": "تحذير",
          "wrong_code": "رقم التأكيد غير صحيح !!",
          "email_exists":
              "هذا البريد موجود بالفعل !                              \n",
          "account_created":
              "تم إنشاء حسابك بنجاح, الرجاء تأكيد البريد الإلكتروني الخاص بك.",
          "failure": "خطأ",
          "incorrect_email": "كلمة السر او البريد الإلكتروني غير صحيح !",
          "please_confirm":
              "رجاء قم بتأكيد بريدك الإلكتروني \n بعدها يمكنك المتابعه",
          "email_doesn't": "هذا البريد غير موجود !",

          // Screen Titles
          "cart": "السلة",
          "favorites": "المفضلة",
          "search_results": "نتائج البحث",

          // Settings Screen
          "language": "اللغة",
          "dark_mode": "الوضع الليلي",
          "contact": "تواصل معنا",
          "rate_app": "قيم التطبيق",
          "share_app": "مشاركة التطبيق",
          "privacy_policy": "سياسة الخصوصية",
          "terms_conditions": "الشروط والأحكام",
          "about": "عن التطبيق",
          "logout": "تسجيل الخروج",
        }
      };
}
