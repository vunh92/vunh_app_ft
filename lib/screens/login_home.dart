import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vunh_app_ft/blocs/auth_bloc.dart';
import 'package:vunh_app_ft/dialog/loading_dialog.dart';
import 'package:vunh_app_ft/dialog/msg_dialog.dart';
import 'package:vunh_app_ft/screens/photo_home.dart';
import 'package:vunh_app_ft/screens/register_home.dart';

class LoginHome extends StatefulWidget {
  @override
  LoginHomeState createState() => LoginHomeState();
}

class LoginHomeState extends State<LoginHome> {
  AuthBloc authBloc = new AuthBloc();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 40, ),
              Image.asset('hu_hon_001.PNG',height: 150,),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  "Welcom to Vunh Car",
                  style: TextStyle(fontSize: 22, color: Colors.deepPurpleAccent),
                ),
              ),
              Text(
                "Login to continue",
                style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                        suffixIcon: IconButton(
                          onPressed: () => _emailController.clear(),
                          icon: Icon(Icons.clear),
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                        suffixIcon: IconButton(
                          onPressed: () => _passController.clear(),
                          icon: Icon(Icons.clear),
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
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Fluttertoast.showToast(
                                msg: "Forgot Password..",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1
                            );
                          },
                        text: "Forgot Password?",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  onPressed: _onLoginClicked,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                ),
              ),
              StreamBuilder(
                stream: authBloc.loginController,
                builder: (context, snapshot) => snapshot.data.toString().length > 0 ? Text(
                  snapshot.data ==null ? '': snapshot.data.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ): new Container(),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: RichText(text: TextSpan(
                    text: "Other Functions? ",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                       /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtherFunctions(),));*/
                        Fluttertoast.showToast(
                            msg: "OtherFunctions()..",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1
                        );
                      },
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // builder: (context) => PageRegister(),));
                                  builder: (context) => RegisterHome(),));
                          },
                        text: "Sign up ",
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
  void _onLoginClicked(){
    if (!authBloc.isValidLogin(_emailController.text, _passController.text)) return;
    authBloc.isValidLoginFirebase(_emailController.text, _passController.text, context);
    /*if(isValid){
      //Login
      //Run time sau 5 giây thực hiện lệnh khác
      LoadingDialog.showLoadingDialog(context, "Loading...");
      Timer(Duration(seconds: 5), (){
        LoadingDialog.hideLoadingDialog(context);
        if(authBloc.signIn(_emailController.text, _passController.text)) {
          Fluttertoast.showToast(
              msg: "Login success..",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1
          );
          // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
          Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoHome(),));
        }else{
          MsgDialog.showMsgDialog(context, "Thông Báo", "Sai mật khẩu");
        }
      });
    }*/
  }

}