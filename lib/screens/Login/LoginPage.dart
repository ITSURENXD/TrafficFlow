import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color textColor = Colors.blue; // Initial color of the text

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(height: 5), // Add some vertical spacing between the texts
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 21),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: MediaQuery.of(context).size.height - 230, // Adjust this height as needed
                child: Expanded(
                  child: Container(
                    width: double.infinity,
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
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.white), // White border
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.white), // White border
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.brown), // Brown border when focused
                              ),
                              filled: true,
                              fillColor: Colors.grey[600],
                              hintText: "E-mail",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.white), // White border
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.white), // White border
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.brown), // Brown border when focused
                              ),
                              filled: true,
                              fillColor: Colors.grey[600],
                              hintText: "Password",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          GestureDetector(
                            onTap: () {
                              // Change text color to indicate tap
                              setState(() {
                                textColor = Colors.grey; // Change color to red
                              });

                              // Add your logic for "Forgot Your Password" action here
                            
                            },
                            child: Text("Forgot Your password", style: TextStyle(color: Colors.black)), // Use textColor variable
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xff131313),
                            ),
                            child: Center(
                              child: Text("Login", style: TextStyle(color: Colors.white,fontSize: 23)),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromARGB(255, 51, 51, 51), // Change color according to your preference
                            ),
                            child: Center(
                              child: Text("Sign Up", style: TextStyle(color: Colors.white,fontSize: 20)),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 50,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
