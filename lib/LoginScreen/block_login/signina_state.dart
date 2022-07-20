abstract class SignInState {}

class SignInIntialState extends SignInState {}

class SignInValidateState extends SignInState {}

class SignIninValidateState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState(this.errorMessage);
}

class SignInLoadingState extends SignInState {}
