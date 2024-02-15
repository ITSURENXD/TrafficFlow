import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  )
);

class LoginPage extends StatelessWidget{
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
            const Color.fromARGB(255, 122, 72, 54),
            Color.fromARGB(255, 112, 84, 75),
            Color.fromARGB(255, 145, 101, 87),
         
        

           ]
            )
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(padding: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              Text("Login", style:TextStyle(color:Colors.white ,fontSize:40),),
              SizedBox(height: 10,),
              Text("Welcome Back", style:TextStyle(color:Colors.white ,fontSize:21),)
            ]
            ),)
,            SizedBox(height: 20,),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),

                          )),
                          child:Padding(
                            padding: const EdgeInsets.all(24),
                          
                           child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              
                              filled: true,
                              fillColor: Colors.grey[250],
                              hintText: "E-mail",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              prefixIcon: Icon(
                                Icons.email,
                                color:Color.fromARGB(255, 134, 117, 111),
                              )
                            ),
                          ),
                          SizedBox(height: 20,),

                          TextField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[250],
                              hintText: "Password",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              prefixIcon: Icon(
                                Icons.lock,
                                color:Color.fromARGB(255, 134, 117, 111),
                              ),
                            ),
                          ),
                           SizedBox(height: 40,),
                           Text("Forgot Your password", style: TextStyle(color: Colors.blue),) ,
                           SizedBox(height: 50,),
                           Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(50),
                            color: Colors.blue,
                            ),
                            child: Center(
                              child: Text("Login",style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),) ,
                              ),
                            ),
                           SizedBox(height: 80,),
                           Row(
                            children: <Widget>[
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black
                                ),
                              )
                            ],
                           )
                        ]
                           ),
                          ),
                      ),
                     
                            
              )],
            ),
          ));
  }
}
