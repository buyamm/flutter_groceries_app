import 'package:auto_hide_keyboard/auto_hide_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/cubit/login_cubit.dart';
import 'package:flutter_groceries_app/states/login_state.dart';

import 'package:flutter_groceries_app/screens/sign_up.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginPage({super.key, required this.onLoginSuccess});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.loginStatus == LoginStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login failed. Please check your credentials.'),
              ),
            );
            context.read<LoginCubit>().resetLoginStatus();
          } else if (state.loginStatus == LoginStatus.success) {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (_) => HomePage()),
            // );
            widget.onLoginSuccess();
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder:
              (context, state) => Container(
                constraints: BoxConstraints.expand(),
                padding: EdgeInsets.only(
                  left: 26,
                  top: 20,
                  right: 26,
                  bottom: 200,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/backgroundImage.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 70.0),
                        child: Center(
                          child: SizedBox(
                            width: 47.84,
                            height: 55.64,
                            child: Image.asset('lib/assets/images/logo.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 45),
                        child: Text(
                          'Enter your email and password',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),

                      // Email text field
                      AutoHideKeyboard(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: TextField(
                            controller: _emailController,
                            onChanged:
                                (value) => context
                                    .read<LoginCubit>()
                                    .onEmailChanged(value),
                            decoration: InputDecoration(
                              labelText: "Email",
                              errorText:
                                  state.emailError.isEmpty
                                      ? null
                                      : state.emailError,
                              labelStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),

                      // Password text field
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextField(
                          controller: _passwordController,
                          onChanged:
                              (value) => context
                                  .read<LoginCubit>()
                                  .onPasswordChanged(value),
                          decoration: InputDecoration(
                            labelText: "Password",
                            errorText:
                                state.passwordError.isEmpty
                                    ? null
                                    : state.passwordError,
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: Icon(
                                !showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          obscureText: !showPassword,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot password",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Login button
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            state.loading
                                ? CircularProgressIndicator()
                                : ElevatedButton(
                                  onPressed:
                                      context.read<LoginCubit>().isEnableButton(
                                            _emailController.text,
                                            _passwordController.text,
                                          )
                                          ? () {
                                            context.read<LoginCubit>().login(
                                              _emailController.text,
                                              _passwordController.text,
                                            );
                                          }
                                          : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        context
                                                .read<LoginCubit>()
                                                .isEnableButton(
                                                  _emailController.text,
                                                  _passwordController.text,
                                                )
                                            ? Color(0xff53B175)
                                            : Colors.grey,
                                    foregroundColor: Color(0xffFFF9FF),
                                    fixedSize: Size(364, 67),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              "SignUp",
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
        ),
      ),
    );
  }
}
