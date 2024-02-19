import 'package:flutter/material.dart';
import 'package:trafficflowdev/screens/Home/HomePage.dart';
import 'package:trafficflowdev/screens/Login/SignUpPageDev.dart';
import 'package:trafficflowdev/screens/Login/widgets/TextInputField.dart';
import 'package:trafficflowdev/resources/auth_methods.dart';
import 'package:trafficflowdev/utils/utils.dart';

// NOTES:
// CHeck Line 63 for OverFlow by Pixel Problem
// Convert to StatefulWidget
class LoginPageDev extends StatefulWidget {
  const LoginPageDev({Key? key}) : super(key: key);

  @override
  _LoginPageDevState createState() => _LoginPageDevState();
}

class _LoginPageDevState extends State<LoginPageDev> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  //Debug Purposes only
  String _emailprints = "";
  String _passprints = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateEmailPrints);
    _passwordController.addListener(_updatePasswordPrints);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateEmailPrints() {
    setState(() {
      _emailprints = _emailController.text;
      print(_emailprints);
    });
  }

  void _updatePasswordPrints() {
    setState(() {
      _passprints = _passwordController.text;
      print(_passprints);
    });
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == "success") {
      // Replacing with the HomePage
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage(),)); //replaces the screen so back button doesn't go back to the login screen
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigatetoSignUp() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUpPageDev(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0xff131313),
              Color.fromARGB(255, 12, 12, 12),
            ],
          ),
        ),
        child: ListView(
          //Changed from SingleChildScrollView due to overflow error
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 21),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextInputField(
                      hintText: "E-mail",
                      textInputType: TextInputType.emailAddress,
                      textEditingController: _emailController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextInputField(
                      hintText: "Password",
                      textInputType: TextInputType.visiblePassword,
                      textEditingController: _passwordController,
                      isPass: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Forgot Your password",
                      style: TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: loginUser,
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue,
                        ),
                        child: _isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )
                            : const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: const Text("Don't have an account? "),
                        ),
                        GestureDetector(
                            onTap: navigatetoSignUp,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
