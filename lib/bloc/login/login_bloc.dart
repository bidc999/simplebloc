import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
      if (event is Login) {
        emit(LoadingState());
        if (event.username == "admin" && event.password == "admin") {
          emit(
            LoginSuccessState(
              status: 'Login Berhasil! Berhasil login dengan user ' +
                  event.username,
              username: event.username,
              password: event.password,
            ),
          );
        } else {
          emit(
            LoginFailureState(
                status:
                    'Login Gagal! username dan password salah atau tidak terdaftar'),
          );
        }
      }
    });
  }
}
