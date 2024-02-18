import 'package:flutter/material.dart';
import 'package:traffic_management/screens/Login/widgets/TextInputField.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0xff131313),
              Color.fromARGB(255, 12, 12, 12),
            ],
          ),
        ),
        child: ListView( //Changed from SingleChildScrollView due to overflow error
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
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
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
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
                    SizedBox(
                      height: 10,
                    ),
                    TextInputField(
                      hintText: "Password",
                      textInputType: TextInputType.visiblePassword,
                      textEditingController: _passwordController,
                      isPass: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Forgot Your password",
                      style: TextStyle(color: Colors.blue),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                          ),
                        )
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
