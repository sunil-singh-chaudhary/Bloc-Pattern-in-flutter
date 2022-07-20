import 'package:blocpattern_loginflutter/LoginScreen/block_login/signinEvent.dart';
import 'package:blocpattern_loginflutter/LoginScreen/block_login/signina_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInIntialState()) {
    on<SignInTextChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailvalue) == false) {
        emit(SignInErrorState('Email is not valid'));
      } else if (event.passwrdvalue.length <= 7) {
        emit(SignInErrorState('Pswd Length must be 8 char or above'));
      } else {
        emit(SignInValidateState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
