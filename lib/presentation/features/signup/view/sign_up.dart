import 'package:auto_hide_keyboard/auto_hide_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/presentation/features/signup/cubit/signup_cubit.dart';
import 'package:flutter_groceries_app/presentation/features/login/view/login.dart';
import 'package:flutter_groceries_app/presentation/features/signup/cubit/signup_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Thêm resizeToAvoidBottomInset để tránh resize khi bàn phím xuất hiện
      resizeToAvoidBottomInset: false,
      body: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state.signUpStatus == SignUpStatus.failure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.signUpMessage)));
            context.read<SignupCubit>().resetSignUpStatus();
          } else if (state.signUpStatus == SignUpStatus.success) {
            Navigator.pop(context);
          }
        },
        child: SafeArea(
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/backgroundImage.png'),
                fit: BoxFit.fill,
              ),
            ),
            // Thay Column bằng SingleChildScrollView để có thể scroll
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 20,
                left: 26,
                right: 26,
                bottom: 50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Center(
                      child: SizedBox(
                        width: 47.84,
                        height: 55.64,
                        child: Image.asset('lib/assets/images/logo.png'),
                      ),
                    ),
                  ),

                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 26,
                      height: 1.5,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Enter your credentials to continue',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),

                  // Firstname
                  AutoHideKeyboard(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: BlocBuilder<SignupCubit, SignupState>(
                        builder:
                            (context, state) => TextField(
                              controller: _firstNameController,
                              onChanged:
                                  (value) => context
                                      .read<SignupCubit>()
                                      .onFirstNameChanged(value),
                              style: TextStyle(
                                height: 2,
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                              ),
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                errorText:
                                    state.firstNameError.isEmpty
                                        ? null
                                        : state.firstNameError,
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
                  ),

                  // Lastname
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: BlocBuilder<SignupCubit, SignupState>(
                      builder:
                          (context, state) => TextField(
                            controller: _lastNameController,
                            onChanged:
                                (value) => context
                                    .read<SignupCubit>()
                                    .onLastNameChanged(value),
                            style: TextStyle(
                              height: 2,
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              errorText:
                                  state.lastNameError.isEmpty
                                      ? null
                                      : state.lastNameError,
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

                  // Username text field
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
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
                    padding: EdgeInsets.only(bottom: 10),
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
                    padding: EdgeInsets.only(bottom: 10),
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
                      height: 67,
                      padding: EdgeInsets.only(bottom: 0),
                      child: BlocBuilder<SignupCubit, SignupState>(
                        builder:
                            (context, state) => FloatingActionButton(
                              onPressed:
                                  context.read<SignupCubit>().isEnableButton(
                                        _usernameController.text,
                                        _firstNameController.text,
                                        _lastNameController.text,
                                        _emailController.text,
                                        _passwordController.text,
                                      )
                                      ? () {
                                        context.read<SignupCubit>().signUp(
                                          _usernameController.text,
                                          _firstNameController.text,
                                          _lastNameController.text,
                                          _emailController.text,
                                          _passwordController.text,
                                        );
                                      }
                                      : null,
                              backgroundColor:
                                  context.read<SignupCubit>().isEnableButton(
                                        _usernameController.text,
                                        _firstNameController.text,
                                        _lastNameController.text,
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

                  // Thêm SizedBox để tạo khoảng cách
                  SizedBox(height: 20),

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

                  // Thêm padding bottom để đảm bảo content không bị che khi scroll
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
}
