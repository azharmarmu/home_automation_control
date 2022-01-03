part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthenticatedState extends AuthState {}

class UnauthenticatedState extends AuthState {
  final String? message;

  const UnauthenticatedState({this.message});
}
