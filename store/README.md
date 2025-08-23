# store

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Project Structure: 
lib/
|
|-- app/
|   |-- config/               # إعدادات التطبيق العامة
|   |   |-- themes/           # ملفات تصميم الألوان والخطوط
|   |   |-- routes/           # ملفات إدارة التنقل بين الصفحات
|   |
|   |-- core/                 # الأجزاء المشتركة والأساسية
|   |   |-- usecases/         # حالات الاستخدام (للمنطق المعقد)
|   |   |-- errors/           # معالجة الأخطاء
|   |   |-- services/         # للتعامل مع الخدمات الخارجية (مثل API, قاعدة بيانات)
|   |
|   |-- data/                 # كل ما يتعلق بالبيانات
|   |   |-- models/           # نماذج البيانات (Data Models)
|   |   |-- repositories/     # مستودعات جلب البيانات
|   |   |-- sources/          # مصادر البيانات (local/remote)
|
|-- features/             # المجلد الأهم: كل ميزة في مجلد خاص
|   |
|   |-- auth/                 # ميزة "المصادقة" (Authentication)
|   |   |-- presentation/     # واجهات المستخدم (UI) والـ State Management
|   |   |   |-- pages/        # الصفحات الكاملة
|   |   |   |   |-- login_page.dart
|   |   |   |   |-- signup_page.dart
|   |   |   |   |-- forgot_password_page.dart
|   |   |   |
|   |   |   |-- widgets/      # الويدجتس الصغيرة المستخدمة في صفحات هذه الميزة فقط
|   |   |   |-- cubit/ or provider/ or bloc/ # مجلد لإدارة الحالة (State Management)
|   |   |
|   |   |-- domain/             # منطق العمل (Business Logic) - اختياري للمشاريع البسيطة
|   |
|   |-- home/                 # مثال لميزة مستقبلية (مثل الصفحة الرئيسية)
|       |-- presentation/
|           |-- pages/
|           |-- widgets/
|
|-- shared/                 # الويدجتس أو الأدوات المشتركة بين كل الميزات
|   |-- widgets/              # مثل زر مخصص، حقل إدخال مخصص، إلخ
|   |-- utils/                # دوال مساعدة
|
|-- main.dart               # نقطة بداية التطبيق
