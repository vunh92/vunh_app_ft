import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vunh_app_ft/blocs/auth_bloc.dart';

class RegisterHome extends StatefulWidget{
  @override
  RegisterHomeState createState() => RegisterHomeState();
}

class RegisterHomeState extends State<RegisterHome>{
  AuthBloc authBloc = new AuthBloc();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    authBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "SIGN UP",
          style: TextStyle(fontSize: 20, color: Colors.white, ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10, ),
              Image.asset('nham_hiem_003.PNG',height: 150,),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: StreamBuilder(
                  stream: authBloc.emailController,
                  builder: (context, snapshot) => TextField(
                    controller: _emailController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error : null,
                        labelText: "Email",
                        prefixIcon: Container(
                          width: 50,
                          child: Icon(Icons.email, color: Colors.deepPurpleAccent,),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: StreamBuilder(
                  stream: authBloc.passController,
                  builder: (context, snapshot) => TextField(
                    controller: _passController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    obscureText: true,
                    decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error : null,
                        labelText: "Password",
                        prefixIcon: Container(
                          width: 50,
                          child: Icon(Icons.vpn_key, color: Colors.deepPurpleAccent,),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: StreamBuilder(
                  stream: authBloc.confirmPasswordController,
                  builder: (context, snapshot) => TextField(
                    controller: _confirmPasswordController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    obscureText: true,
                    decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error : null,
                        labelText: "ConfirmPass",
                        prefixIcon: Container(
                          width: 50,
                          child: Icon(Icons.vpn_key, color: Colors.deepPurpleAccent,),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        )
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  onPressed: _onSignUpClicked,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: RichText(text: TextSpan(
                    text: "Already a user? ",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Fluttertoast.showToast(
                              msg: "Login now..",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1
                          );
                        },
                        text: "Login now ",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      )
                    ]
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSignUpClicked(){
    if(!authBloc.isValidSignUp(_emailController.text, _passController.text, _confirmPasswordController.text))
      return;
    if(authBloc.isConfirmPassword(_passController.text, _confirmPasswordController.text)) {
      authBloc.signUpFirebase(_emailController.text, _passController.text, context);
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("ConfirmPassword Fail...", textAlign: TextAlign.center,), duration: Duration(seconds: 4), ));
    }
  }
}