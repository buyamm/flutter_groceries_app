import 'package:flutter/material.dart';
import 'package:flutter_groceries_app/screens/product_detail.dart';
import 'package:flutter_groceries_app/screens/sign_up.dart';
import 'package:flutter_groceries_app/widgets/elevated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  var _emailInvalid = false;
  var _passwordInvalid = false;
  var _errorEmail = "Please, enter correct email format";
  var _errorPassword =
      "Please, enter a password that is at least 6 characters long, contains at least 1 uppercase letter, 1 lowercase letter and 1 number";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.only(left: 26, top: 20, right: 26, bottom: 200),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/backgroundImage.png'),
            fit: BoxFit.fill,
          ),
        ),
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
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: Text(
                'Enter your email and password',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  errorText: _emailInvalid ? _errorEmail : null,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  errorText: _passwordInvalid ? _errorPassword : null,
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
                      !showPassword ? Icons.visibility : Icons.visibility_off,
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
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyElevatedButton(
                    name: "Log In",
                    bgColor: 0xff53B175,
                    foreColor: 0xffFFF9FF,
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
                      MaterialPageRoute(builder: (context) => SignUpPage()),
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
    );
  }

  void loginEvent() {
    setState(() {
      _emailInvalid = false;
      _passwordInvalid = false;
    });
    final email = _emailController.text;
    final regexEmail = RegExp(r'^[\w\.-]{2,}@gmail\.com$');

    if (email.isNotEmpty && regexEmail.hasMatch(email)) {
      setState(() {
        _emailInvalid = false;
      });
    } else {
      setState(() {
        _emailInvalid = true;
      });
    }

    final password = _passwordController.text;
    final regexPassword = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');

    if (regexPassword.hasMatch(password)) {
      setState(() {
        _passwordInvalid = false;
      });
    } else {
      setState(() {
        _passwordInvalid = true;
      });
    }

    if (!_emailInvalid && !_passwordInvalid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductDetail()),
      );
    }
  }
}
