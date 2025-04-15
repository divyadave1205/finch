import 'package:finch/src/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await repository.signUp(
          email: event.email,
          password: event.password,
          name: event.name,
        );
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await repository.login(
          email: event.email,
          password: event.password,
        );
        emit(AuthLoggedIn());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
