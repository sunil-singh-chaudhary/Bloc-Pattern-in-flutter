import 'package:blocpattern_loginflutter/LoginScreen/block_login/signinEvent.dart';
import 'package:blocpattern_loginflutter/LoginScreen/block_login/signin_block.dart';
import 'package:blocpattern_loginflutter/LoginScreen/block_login/signina_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController pswd_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in Page'),
      ),
      body: Container(
        color: Colors.green[50],
        padding: const EdgeInsets.all(10),
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  );
                } else {
                  return Container();
                }
              }),
            ),
            BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
              return TextField(
                controller: email_controller,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangeEvent(
                          email_controller.text, pswd_controller.text));
                },
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Email',
                  hintStyle: const TextStyle(color: Colors.black),
                  contentPadding: const EdgeInsets.only(left: 15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            TextField(
                controller: pswd_controller,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangeEvent(
                          email_controller.text, pswd_controller.text));
                },
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Password',
                  hintStyle: const TextStyle(color: Colors.black),
                  contentPadding: const EdgeInsets.only(left: 15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
              //if (state is SignInLoadingState) {
              //   return const Center(child: CircularProgressIndicator());
              //  }
              return ElevatedButton(
                  onPressed: () {
                    if (state is SignInValidateState) {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(
                              email_controller.text, pswd_controller.text));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: (state is SignInValidateState)
                          ? Colors.green
                          : Colors.yellow),
                  child: const Text('SignIn'));
            }),

            //Loading bar below sign in button

            BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
              if (state is SignInLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}


//borderRadius: BorderRadius.all(Radius.circular(20)),