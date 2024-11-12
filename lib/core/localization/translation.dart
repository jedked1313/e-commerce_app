import 'package:get/get.dart';

class MyTranslation extends Translations {
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
          // ---------- onBoarding ---------- //

          // ---------- Change Language ---------- //
          "choose_lang": "-----------   اختر اللغة   -----------",
          // ---------- Change Language ---------- //

          // ---------- Auth ---------- //
          "rememer_me": "تذكرني",
          "login": "تسجيل الدخول",
          "sign_up": "اشتراك",
          "back_to_login": "رجوع الى تسجيل الدخول",
          "didnt_receive": "لم تتلقى الرمز ؟ ",
          "send_again": " ارسال الرمز مجددا",
          "submit": "إرسال",
          "we_sent": "لقد ارسلنا رمزا الى email@gmail.com, يرجى إدخال الرمز",
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
          "verify_email": "تأكيد البريد الإلكتروني",
          "please_enter_digits":
              "الرجاء إدخال الرمز المكون من 6 ارقام المرسل الى email@gmail.com",
          "cant_be_empty": "هذا الحقل لا يمكن ان يكون فارغا",
          "invalid_username": "إسم مستخدم غير صالح",
          "invalid_email": "بريد إلكروني غير صالح",
          "cant_be_less": "لايمكن ان يكون اقل من ",
          "cant_be_larger": "لايمكن ان يكون اكثر من",
          "characters": "احرف",
          "language": "اللغة",
          "success_account": "تم إنشاء حسابك بنجاح.",
          "success_reset_password": "تم اعادة تعيين كلمة المرور الخاصة بك بنجاح",
          // ---------- Auth ---------- //
        },
        "en": {
          // ---------- onBoarding ---------- //
          "continue": "Continue",
          "onboarding_heading": "eCommerce Shop",
          "onboarding_subtitle": "Professional App for your eCommerce business",
          "lorem":
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
          "purchase": "Purchase Online !!",
          "track": "Track order !!",
          "get_order": "Get your order !!",
          // ---------- onBoarding ---------- //

          // ---------- Change Language ---------- //
          "choose_lang": "------   Choose Language   ------",
          // ---------- Change Language ---------- //

          // ---------- Auth ---------- //
          "rememer_me": "Remember Me",
          "login": "Log in",
          "sign_up": "Sign Up",
          "back_to_login": "Back to log in",
          "didnt_receive": "Didn't receive the code ? ",
          "send_again": " Send it again",
          "submit": "Submit",
          "we_sent":
              "We sent a code to email@gmail.com, Please enter the digit code.",
          "check_email": "Check Your Email",
          "success": "Success",
          "the_operation": "The operation was completed successfully",
          "already_have": "Already have an account ?  ",
          "or": "OR",
          "password": "Password",
          "confirm_password": "Confirm Password",
          "confirm_your_password": "Confirm Your Password",
          "enter_password": "Enter Your Password",
          "username": "Username",
          "enter_username": "Enter Your Username",
          "email": "Email",
          "enter_email": "Enter Your Email",
          "signup_and_we": "Sign up and we will continue",
          "let_get_start": "Let's Get Started",
          "new_password": "New Password",
          "at_least": "At least 8 digits",
          "must_be": "Must be at least 8 characters",
          "set_new_password": "Set New Password",
          "dont_have": "Don't have an accunt ? ",
          "forget_password": "Forget Your Password ?",
          "welcome": "Welcome!",
          "please_enter": "Please enter your data to continue",
          "forget": "Forgot password ?",
          "no_worries": "No worries, we'll send you reset instructions",
          "verify_email": "Verify Your Email",
          "please_enter_digits":
              "Please enter the 6 digits code sent to email@gmail.com",
          "cant_be_empty": "This field can't be empty",
          "invalid_username": "Invalid Username",
          "invalid_email": "Invalid Email Address",
          "cant_be_less": "Can't be less then ",
          "cant_be_larger": "Can't be larger then",
          "characters": "characters",
          "language": "Language",
          "success_account": "Your account has been created successfully.",
          "success_reset_password": "Your Password has been reseted successfully.",
          // ---------- Auth ---------- //
        }
      };
}
