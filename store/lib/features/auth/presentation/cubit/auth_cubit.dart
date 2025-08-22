import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // دالة لتسجيل الدخول
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      // محاكاة استدعاء API
      await Future.delayed(const Duration(seconds: 2));
      // في تطبيق حقيقي، هنا يتم استدعاء الـ repository
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure('فشل تسجيل الدخول. الرجاء المحاولة مرة أخرى.'));
    }
  }

  // يمكن إضافة دوال لإنشاء الحساب واستعادة كلمة المرور هنا
}