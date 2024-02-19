import 'package:flutter/material.dart';
import 'package:trafficflowdev/resources/auth_methods.dart';
import 'package:trafficflowdev/screens/Home/HomePage.dart';
import 'package:trafficflowdev/screens/Login/LoginPageDev.dart';
import 'package:trafficflowdev/screens/Login/widgets/TextInputField.dart';
import 'package:trafficflowdev/utils/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _isLoading = false;
  String _emailprints = "";
  String _passprints = "";
  String _usernameprints = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateEmailPrints);
    _passwordController.addListener(_updatePasswordPrints);
    _usernameController.addListener(_updateUsernamePrints);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
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

  void _updateUsernamePrints() {
    setState(() {
      _usernameprints = _usernameController.text;
      print(_usernameprints);
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().SignUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
    );

    if (res != "success") {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigatetoLogin() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginPageDev(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: statusBarHeight + 30),
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
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Create an Account",
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
                        hintText: "Username",
                        textInputType: TextInputType.text,
                        textEditingController: _usernameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                        height: 25,
                      ),
                      InkWell(
                        onTap: signUpUser,
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue,
                          ),
                          child: _isLoading ? const Center(child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 255, 255, 255),
                          )) : const Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
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
                            child: const Text("Already have an Account? "),
                          ),
                          GestureDetector(
                            onTap: navigatetoLogin,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
