import '../static_constants/static_constants.dart';

class StaticTextTranslations {
  String login = isArabic ? "تسجيل الدخول" : "Login";
   String enterEmail = isArabic ? "أدخل البريد الإلكتروني" : 'Enter email';
  String email = isArabic ? "بريد إلكتروني" : 'Email';
  String password = isArabic ? "كلمة المرور" : 'Passowrd';
  String enterPassword = isArabic ? "أدخل كلمة المرور" : 'Enter password';
  String rememberMe = isArabic ? "تذكرنى" : 'Remember me';
  String forgotPassword = isArabic ? "هل نسيت كلمة السر؟" : 'Forgot password?';
  String signIn = isArabic ? "تسجيل الدخول" : "Sign in";
  String googleSignIn = isArabic ? "الدخول مع جوجل" : 'Sign in with google';
  String dontHaveAccount =
      isArabic ? "ليس لديك حساب؟" : "Don't have an account? ";
  String signUp = isArabic ? "اشتراك" : 'Sign up';
  String enterFullName = isArabic ? "أدخل الاسم الكامل" : "Enter full name";
  String fullName = isArabic ? "الاسم الكامل" : "Full name";
  String mobileNumber = isArabic ? "رقم الهاتف المحمول" : "Mobile number";
  String enterMobile = isArabic ? "أدخل رقم الجوال" : "Enter mobile number";
  String createAccount = isArabic ? "إنشاء حساب" : "Create account";
  String confirmPassword = isArabic ? "تأكيد كلمة المرور" : "Confirm password";
  String enterConfirmPassword =
      isArabic ? "تأكيد كلمة المرور" : "Confirm password";
  String alreadyAccount =
      isArabic ? "هل لديك حساب؟" : "Already have an account?";
  String forgotPasswordScreen =
      isArabic ? "نسيت كلمة المرور" : "Forget password";
  String next = isArabic ? "التالي" : "Next";
  String enterCode = isArabic ? "ادخل الرمز" : "Enter code";
  String enterCodeDes = isArabic
      ? "لقد أرسلنا الرمز على بريدك الإلكتروني"
      : "We have send code on your email";
  String resend = isArabic ? "أعد إرسال الرمز" : "Resend code";
  String submit = isArabic ? "يُقدِّم" : "Submit";
  String resetPassword =
      isArabic ? "إعادة تعيين كلمة المرور" : "Reset password";
  String updatePassword = isArabic ? "تطوير كلمة السر" : "Update password";
  String updated = isArabic ? "محدث" : "Updated";
  String updatePasswordDes = isArabic
      ? "لقد تم تحديث كلمة السر الخاصة بك"
      : "Your password has been updated";
  String emptyFields = isArabic ? "الحقل فارغ" : "Field empty";
  String validEmail = isArabic
      ? "الرجاء إدخال بريد إلكتروني صحيح!"
      : "Please enter valid email!";
  String userExists =
      isArabic ? "البريد الالكتروني موجود مسبقا!" : "Email already exist!";
  String passwordsNotMatch =
      isArabic ? "كلمات المرور غير متطابقة!" : "Passwords don't match!";
  String shortPassword = isArabic
      ? "كلمة المرور يجب أن لا تقل عن 8 أحرف!"
      : "Password must at least 8 characters!";
  String registeredSuccess =
      isArabic ? "مسجل بنجاح!" : "Registered successfully!";
  String loginSuccess =
      isArabic ? "تم تسجيل الدخول بنجاح!" : "Logged in successfully!";
  String invalidCred =
      isArabic ? "بيانات الاعتماد غير صالحة!" : "Invalid credentials!";
  String loggedOutSuccess =
      isArabic ? "تم تسجيل الخروج بنجاح!" : "Logged out successfully!";
  String defaultLangMess = isArabic
      ? "اللغة المحددة بالفعل كلغة افتراضية!"
      : "Language already selected as default!";
  String aboutUs = isArabic ? "معلومات عنا" : "About us";
  String package = isArabic ? "طَرد" : "Package";
  String contactUs = isArabic ? "اتصل بنا" : "Contact Us";
    String quickLinks =  isArabic ? "روابط سريعة" : "Quick Links";

   String home = isArabic ? "بيت" : "Home";
    printCalled(){
      print("IsArabic or Nor" + isArabic.toString());
    }
   String corporateServices = isArabic ? "خدمات للشركات" : "Corporate services";
   String templatePackages = isArabic ? "حزم القالب" : "Template packages";
   String dashboard = isArabic ? "لوحة القيادة" : "Dashboard";
}
