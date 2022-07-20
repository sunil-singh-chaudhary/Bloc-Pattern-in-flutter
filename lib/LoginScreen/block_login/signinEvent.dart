abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent {
  final String emailvalue;
  final String passwrdvalue;
  SignInTextChangeEvent(this.emailvalue, this.passwrdvalue);
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String passwrd;
  SignInSubmittedEvent(this.email, this.passwrd);
}
