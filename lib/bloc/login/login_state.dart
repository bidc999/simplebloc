part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String status;
  final String username;
  final String password;

  LoginSuccessState({
    required this.status,
    required this.username,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [status];
}

class LoginFailureState extends LoginState {
  final String status;

  LoginFailureState({required this.status});

  @override
  // TODO: implement props
  List<Object?> get props => [status];
}
