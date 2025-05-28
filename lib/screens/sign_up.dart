import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/cubit/signup_cubit.dart';
import 'package:flutter_groceries_app/screens/login.dart';
import 'package:flutter_groceries_app/states/signup_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var _emailInvalid = false;
  var _passwordInvalid = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(),
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.only(left: 26, right: 26, bottom: 50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/backgroundImage.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Center(
                  child: SizedBox(
                    width: 47.84,
                    height: 55.64,
                    child: Image.asset('lib/assets/images/logo.png'),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 26,
                    height: 1.5,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Enter your credentials to continue',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),

              // Username text field
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: BlocBuilder<SignupCubit, SignupState>(
                  builder:
                      (context, state) => TextField(
                        controller: _usernameController,
                        onChanged:
                            (value) => context
                                .read<SignupCubit>()
                                .onUsernameChanged(value),
                        style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w100,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          errorText:
                              state.usernameError.isEmpty
                                  ? null
                                  : state.usernameError,
                          labelStyle: TextStyle(
                            height: 2,
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                ),
              ),

              // Email text field
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: BlocBuilder<SignupCubit, SignupState>(
                  builder:
                      (context, state) => TextField(
                        controller: _emailController,
                        onChanged:
                            (value) => context
                                .read<SignupCubit>()
                                .onEmailChanged(value),
                        style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w100,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          errorText:
                              state.emailError.isEmpty
                                  ? null
                                  : state.emailError,
                          labelStyle: TextStyle(
                            height: 2,
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                ),
              ),

              // Password text field
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: BlocBuilder<SignupCubit, SignupState>(
                  builder:
                      (context, state) => TextField(
                        controller: _passwordController,
                        onChanged:
                            (value) => context
                                .read<SignupCubit>()
                                .onPasswordChanged(value),
                        style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        obscureText: state.isShowPassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.isShowPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              context.read<SignupCubit>().showPassword(
                                !state.isShowPassword,
                              );
                            },
                          ),
                          errorText:
                              state.passwordError.isEmpty
                                  ? null
                                  : state.passwordError,
                          labelStyle: TextStyle(
                            height: 2,
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'By continuing you agree to our Terms of Service and Privacy Policy',
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),

              // Sign Up button
              Center(
                child: Container(
                  width: 364,
                  height: 87,
                  padding: EdgeInsets.only(bottom: 20),
                  child: BlocBuilder<SignupCubit, SignupState>(
                    builder:
                        (context, state) => FloatingActionButton(
                          onPressed: () {},
                          backgroundColor:
                              context.read<SignupCubit>().isEnableButton(
                                    _usernameController.text,
                                    _emailController.text,
                                    _passwordController.text,
                                  )
                                  ? Color(0xff53B175)
                                  : Colors.grey,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(height: 1.5, fontSize: 18),
                          ),
                        ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () => signInButtonPressed(),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF53B175),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUpButtonPressed() {
    setState(() {
      _emailInvalid = false;
      _passwordInvalid = false;
    });
    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      setState(() {
        _emailInvalid = true;
      });
    }
    if (_passwordController.text.isEmpty ||
        _passwordController.text.length < 6) {
      setState(() {
        _passwordInvalid = true;
      });
    }
    if (!_emailInvalid && !_passwordInvalid) {
      // Perform SignUp action
      print('SignUp button pressed');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    } else {
      // Show error message
      print('Invalid email or password');
    }
  }

  void signInButtonPressed() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => LoginPage(onLoginSuccess: _handleLoginSuccess),
    //   ),
    // );

    Navigator.pop(context);
  }

  void _handleLoginSuccess() {
    Navigator.pop(context);
  }
}
