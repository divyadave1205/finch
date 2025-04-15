abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  RegisterEvent(this.email, this.password, this.name);
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}
