part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class Login extends LoginEvent {
  final String username;
  final String password;

  Login(this.username, this.password);

  @override
  // TODO: implement props
  List<Object> get props => [
        username,
        password,
      ];
}
