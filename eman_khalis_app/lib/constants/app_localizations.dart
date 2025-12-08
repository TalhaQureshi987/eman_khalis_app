import '../services/language_service.dart';

class AppLocalizations {
  final AppLanguage language;

  AppLocalizations(this.language);

  // App Name
  String get appName {
    switch (language) {
      case AppLanguage.urdu:
        return 'ایمان خالص';
      case AppLanguage.arabic:
        return 'إيمان خالص';
      case AppLanguage.english:
        return 'Eman Khalis';
    }
  }

  // Navigation
  String get home {
    switch (language) {
      case AppLanguage.urdu:
        return 'ہوم';
      case AppLanguage.arabic:
        return 'الرئيسية';
      case AppLanguage.english:
        return 'Home';
    }
  }

  String get quran {
    switch (language) {
      case AppLanguage.urdu:
        return 'قرآن';
      case AppLanguage.arabic:
        return 'القرآن';
      case AppLanguage.english:
        return 'Quran';
    }
  }

  String get hadees {
    switch (language) {
      case AppLanguage.urdu:
        return 'حدیث';
      case AppLanguage.arabic:
        return 'الحديث';
      case AppLanguage.english:
        return 'Hadees';
    }
  }

  String get qa {
    switch (language) {
      case AppLanguage.urdu:
        return 'سوال و جواب';
      case AppLanguage.arabic:
        return 'سؤال وجواب';
      case AppLanguage.english:
        return 'Q & A';
    }
  }

  String get more {
    switch (language) {
      case AppLanguage.urdu:
        return 'مزید';
      case AppLanguage.arabic:
        return 'المزيد';
      case AppLanguage.english:
        return 'More';
    }
  }

  String get settings {
    switch (language) {
      case AppLanguage.urdu:
        return 'ترتیبات';
      case AppLanguage.arabic:
        return 'الإعدادات';
      case AppLanguage.english:
        return 'Settings';
    }
  }

  // Home Screen
  String get quickAccess {
    switch (language) {
      case AppLanguage.urdu:
        return 'فوری رسائی';
      case AppLanguage.arabic:
        return 'الوصول السريع';
      case AppLanguage.english:
        return 'Quick Access';
    }
  }

  String get currentPrayer {
    switch (language) {
      case AppLanguage.urdu:
        return 'موجودہ نماز';
      case AppLanguage.arabic:
        return 'الصلاة الحالية';
      case AppLanguage.english:
        return 'Current Prayer';
    }
  }

  String get features {
    switch (language) {
      case AppLanguage.urdu:
        return 'خصوصیات';
      case AppLanguage.arabic:
        return 'الميزات';
      case AppLanguage.english:
        return 'Features';
    }
  }

  String get ytVideos {
    switch (language) {
      case AppLanguage.urdu:
        return 'یوٹیوب ویڈیوز';
      case AppLanguage.arabic:
        return 'فيديوهات يوتيوب';
      case AppLanguage.english:
        return 'Yt Videos';
    }
  }

  String get tafseer {
    switch (language) {
      case AppLanguage.urdu:
        return 'تفسیر';
      case AppLanguage.arabic:
        return 'التفسير';
      case AppLanguage.english:
        return 'Tafseer';
    }
  }

  String get hablullah {
    switch (language) {
      case AppLanguage.urdu:
        return 'حبل اللہ';
      case AppLanguage.arabic:
        return 'حبل الله';
      case AppLanguage.english:
        return 'Hablullah';
    }
  }

  String get notes {
    switch (language) {
      case AppLanguage.urdu:
        return 'نوٹس';
      case AppLanguage.arabic:
        return 'ملاحظات';
      case AppLanguage.english:
        return 'Notes';
    }
  }

  String get salahTiming {
    switch (language) {
      case AppLanguage.urdu:
        return 'نماز کا وقت';
      case AppLanguage.arabic:
        return 'أوقات الصلاة';
      case AppLanguage.english:
        return 'Salah Timing';
    }
  }

  // Features
  String get alQuran {
    switch (language) {
      case AppLanguage.urdu:
        return 'القرآن';
      case AppLanguage.arabic:
        return 'القرآن';
      case AppLanguage.english:
        return 'Al Qur\'an';
    }
  }

  String get alHadith {
    switch (language) {
      case AppLanguage.urdu:
        return 'الحدیث';
      case AppLanguage.arabic:
        return 'الحديث';
      case AppLanguage.english:
        return 'Al Hadith';
    }
  }

  String get asmaUlHusna {
    switch (language) {
      case AppLanguage.urdu:
        return 'اسماء الحسنیٰ';
      case AppLanguage.arabic:
        return 'الأسماء الحسنى';
      case AppLanguage.english:
        return 'Asma Ul Husna';
    }
  }

  String get qiblaCompass {
    switch (language) {
      case AppLanguage.urdu:
        return 'قبلہ کمپاس';
      case AppLanguage.arabic:
        return 'بوصلة القبلة';
      case AppLanguage.english:
        return 'Qibla Compass';
    }
  }

  String get dua {
    switch (language) {
      case AppLanguage.urdu:
        return 'دعا';
      case AppLanguage.arabic:
        return 'الدعاء';
      case AppLanguage.english:
        return 'Dua';
    }
  }

  String get hajjUmrah {
    switch (language) {
      case AppLanguage.urdu:
        return 'حج و عمرہ';
      case AppLanguage.arabic:
        return 'الحج والعمرة';
      case AppLanguage.english:
        return 'Hajj & Umrah';
    }
  }

  // Language Selection
  String get selectLanguage {
    switch (language) {
      case AppLanguage.urdu:
        return 'زبان منتخب کریں';
      case AppLanguage.arabic:
        return 'اختر اللغة';
      case AppLanguage.english:
        return 'Select Language';
    }
  }

  String get english {
    switch (language) {
      case AppLanguage.urdu:
        return 'انگریزی';
      case AppLanguage.arabic:
        return 'الإنجليزية';
      case AppLanguage.english:
        return 'English';
    }
  }

  String get urdu {
    switch (language) {
      case AppLanguage.urdu:
        return 'اردو';
      case AppLanguage.arabic:
        return 'الأردية';
      case AppLanguage.english:
        return 'Urdu';
    }
  }

  String get arabic {
    switch (language) {
      case AppLanguage.urdu:
        return 'عربی';
      case AppLanguage.arabic:
        return 'العربية';
      case AppLanguage.english:
        return 'Arabic';
    }
  }

  String get languageSettings {
    switch (language) {
      case AppLanguage.urdu:
        return 'زبان کی ترتیبات';
      case AppLanguage.arabic:
        return 'إعدادات اللغة';
      case AppLanguage.english:
        return 'Language Settings';
    }
  }

  String get changeAppLanguage {
    switch (language) {
      case AppLanguage.urdu:
        return 'ایپ کی زبان تبدیل کریں';
      case AppLanguage.arabic:
        return 'تغيير لغة التطبيق';
      case AppLanguage.english:
        return 'Change app language';
    }
  }

  // Additional screen titles
  String get jumpToSurah {
    switch (language) {
      case AppLanguage.urdu:
        return 'سورہ پر جائیں';
      case AppLanguage.arabic:
        return 'انتقل إلى السورة';
      case AppLanguage.english:
        return 'Jump to Surah';
    }
  }

  String get selectSurah {
    switch (language) {
      case AppLanguage.urdu:
        return 'سورہ منتخب کریں';
      case AppLanguage.arabic:
        return 'اختر السورة';
      case AppLanguage.english:
        return 'Select Surah';
    }
  }

  String get collections {
    switch (language) {
      case AppLanguage.urdu:
        return 'مجموعے';
      case AppLanguage.arabic:
        return 'المجموعات';
      case AppLanguage.english:
        return 'Collections';
    }
  }

  String get favorite {
    switch (language) {
      case AppLanguage.urdu:
        return 'پسندیدہ';
      case AppLanguage.arabic:
        return 'المفضلة';
      case AppLanguage.english:
        return 'Favorite';
    }
  }

  String get categories {
    switch (language) {
      case AppLanguage.urdu:
        return 'زمرے';
      case AppLanguage.arabic:
        return 'الفئات';
      case AppLanguage.english:
        return 'Categories';
    }
  }

  // Settings Screen
  String get login {
    switch (language) {
      case AppLanguage.urdu:
        return 'لاگ ان';
      case AppLanguage.arabic:
        return 'تسجيل الدخول';
      case AppLanguage.english:
        return 'Login';
    }
  }

  String get register {
    switch (language) {
      case AppLanguage.urdu:
        return 'رجسٹر';
      case AppLanguage.arabic:
        return 'التسجيل';
      case AppLanguage.english:
        return 'Register';
    }
  }

  String get signInToAccount {
    switch (language) {
      case AppLanguage.urdu:
        return 'اپنے اکاؤنٹ میں سائن ان کریں';
      case AppLanguage.arabic:
        return 'تسجيل الدخول إلى حسابك';
      case AppLanguage.english:
        return 'Sign in to your account';
    }
  }

  String get createNewAccount {
    switch (language) {
      case AppLanguage.urdu:
        return 'نیا اکاؤنٹ بنائیں';
      case AppLanguage.arabic:
        return 'إنشاء حساب جديد';
      case AppLanguage.english:
        return 'Create a new account';
    }
  }

  String get locationSettings {
    switch (language) {
      case AppLanguage.urdu:
        return 'مقام کی ترتیبات';
      case AppLanguage.arabic:
        return 'إعدادات الموقع';
      case AppLanguage.english:
        return 'Location Settings';
    }
  }

  String get manageLocation {
    switch (language) {
      case AppLanguage.urdu:
        return 'درست نماز کے اوقات کے لیے اپنا مقام منظم کریں';
      case AppLanguage.arabic:
        return 'إدارة موقعك لأوقات الصلاة الدقيقة';
      case AppLanguage.english:
        return 'Manage your location for accurate prayer times';
    }
  }

  String get notificationSettings {
    switch (language) {
      case AppLanguage.urdu:
        return 'اطلاعات کی ترتیبات';
      case AppLanguage.arabic:
        return 'إعدادات الإشعارات';
      case AppLanguage.english:
        return 'Notification Settings';
    }
  }

  String get configureNotifications {
    switch (language) {
      case AppLanguage.urdu:
        return 'نماز کے وقت کی اطلاعات ترتیب دیں';
      case AppLanguage.arabic:
        return 'تكوين إشعارات أوقات الصلاة';
      case AppLanguage.english:
        return 'Configure prayer time notifications';
    }
  }

  String get themeSettings {
    switch (language) {
      case AppLanguage.urdu:
        return 'تھیم کی ترتیبات';
      case AppLanguage.arabic:
        return 'إعدادات المظهر';
      case AppLanguage.english:
        return 'Theme Settings';
    }
  }

  String get customizeAppearance {
    switch (language) {
      case AppLanguage.urdu:
        return 'ایپ کی ظاہری شکل کو اپنی مرضی کے مطابق بنائیں';
      case AppLanguage.arabic:
        return 'تخصيص مظهر التطبيق';
      case AppLanguage.english:
        return 'Customize app appearance';
    }
  }

  String get about {
    switch (language) {
      case AppLanguage.urdu:
        return 'کے بارے میں';
      case AppLanguage.arabic:
        return 'حول';
      case AppLanguage.english:
        return 'About';
    }
  }

  String get appVersionInfo {
    switch (language) {
      case AppLanguage.urdu:
        return 'ایپ کی ورژن اور معلومات';
      case AppLanguage.arabic:
        return 'إصدار التطبيق والمعلومات';
      case AppLanguage.english:
        return 'App version and information';
    }
  }

  String get logout {
    switch (language) {
      case AppLanguage.urdu:
        return 'لاگ آؤٹ';
      case AppLanguage.arabic:
        return 'تسجيل الخروج';
      case AppLanguage.english:
        return 'Logout';
    }
  }

  String get areYouSureLogout {
    switch (language) {
      case AppLanguage.urdu:
        return 'کیا آپ واقعی لاگ آؤٹ کرنا چاہتے ہیں؟';
      case AppLanguage.arabic:
        return 'هل أنت متأكد أنك تريد تسجيل الخروج؟';
      case AppLanguage.english:
        return 'Are you sure you want to logout?';
    }
  }

  String get cancel {
    switch (language) {
      case AppLanguage.urdu:
        return 'منسوخ کریں';
      case AppLanguage.arabic:
        return 'إلغاء';
      case AppLanguage.english:
        return 'Cancel';
    }
  }
}

