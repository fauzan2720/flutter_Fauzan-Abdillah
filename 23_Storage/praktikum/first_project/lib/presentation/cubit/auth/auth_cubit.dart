import 'package:first_project/core/services/session_login.dart';
import 'package:first_project/model/auth_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SessionLogin _sessionLogin = SessionLogin();

  AuthCubit() : super(AuthInitial());

  Future<void> login(AuthModel query) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 2000));
      await _sessionLogin.save(query);
      emit(AuthSuccess(query));
    } catch (e) {
      emit(AuthSError(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 2000));
      await _sessionLogin.clear();
      emit(AuthSuccess(AuthModel(username: '', password: '')));
    } catch (e) {
      emit(AuthSError(e.toString()));
    }
  }

  String? inputValidation({
    required String value,
    required String label,
  }) {
    if (value.isEmpty) {
      return '$label harus diisi';
    }
    if (value.length < 6) {
      return '$label harus terdiri dari minimal 6 huruf/karakter';
    }
    return null;
  }
}
