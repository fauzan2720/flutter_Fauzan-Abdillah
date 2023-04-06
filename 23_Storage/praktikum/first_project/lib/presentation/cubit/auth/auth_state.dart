part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthModel data;

  const AuthSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class AuthSError extends AuthState {
  final String error;

  const AuthSError(this.error);

  @override
  List<Object> get props => [error];
}
