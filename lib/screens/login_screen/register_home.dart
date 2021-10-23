import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vunh_app_ft/blocs/auth_bloc.dart';
import 'package:vunh_app_ft/vunh_base/value_base/colors.dart';
import 'package:vunh_app_ft/vunh_base/value_base/constants.dart';

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
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/backgrounds/bg_05.jpg'),
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
            fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // resizeToAvoidBottomInset: false,  //tránh bàn phím hiện lên đẩy size container
        extendBodyBehindAppBar: true, //cho phép nằm dưới nền appbar
        appBar: AppBar(
          // backgroundColor: Colors.green,
          // elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          // brightness: Brightness.dark,
          // title: Text("SIGN UP", style: TextStyle(fontSize: 20, color: Colors.blue, ),),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 50, ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.brown[400],
                      borderRadius: BorderRadius.all(new Radius.circular(100)),
                      border: Border.all(color: Colors.yellow[900], width: 5)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('nham_hiem_003.PNG', height: 150, width: 150, fit: BoxFit.fill,),
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorFillWhite,
                    borderRadius: BorderRadius.all(new Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: StreamBuilder(
                            stream: authBloc.emailController,
                            builder: (context, snapshot) => TextField(
                              controller: _emailController,
                              style: TextStyle(fontSize: 16, color: colorTextBlack),
                              cursorColor: colorPrimary,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                                errorText: snapshot.hasError ? snapshot.error : null,
                                labelText: "Email",
                                labelStyle: TextStyle(color: colorPrimary, fontStyle: FontStyle.italic),
                                prefixIcon: Container(
                                  width: 30,
                                  child: Icon(Icons.email, color: colorPrimary,),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: colorPrimary),
                                    borderRadius: BorderRadius.all(Radius.circular(6))
                                ),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorPrimary, width: 2)),
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
                              style: TextStyle(fontSize: 16, color: colorTextBlack),
                              obscureText: true,
                              cursorColor: colorPrimary,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                                errorText: snapshot.hasError ? snapshot.error : null,
                                labelText: "Password",
                                labelStyle: TextStyle(color: colorPrimary, fontStyle: FontStyle.italic),
                                prefixIcon: Container(
                                  width: 30,
                                  child: Icon(Icons.vpn_key, color: colorPrimary,),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: colorPrimary),
                                    borderRadius: BorderRadius.all(Radius.circular(6))
                                ),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorPrimary, width: 2)),
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
                              style: TextStyle(fontSize: 16, color: colorTextBlack),
                              obscureText: true,
                              cursorColor: colorPrimary,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                                errorText: snapshot.hasError ? snapshot.error : null,
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(color: colorPrimary, fontStyle: FontStyle.italic),
                                prefixIcon: Container(
                                  width: 30,
                                  child: Icon(Icons.vpn_key, color: colorPrimary,),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: colorPrimary),
                                    borderRadius: BorderRadius.all(Radius.circular(6))
                                ),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorPrimary, width: 2)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: _onSignUpClicked,
                              child: Text(
                                ConstantStringVn.sys_register,
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),
                              ),
                              color: colorPrimary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6))
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(text: TextSpan(
                                  text: "Already a user? ",
                                  style: TextStyle(color: colorText2, fontSize: 16, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                                  recognizer: TapGestureRecognizer()..onTap = (){
                                    Fluttertoast.showToast(
                                        msg: "Already a user..",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIos: 1
                                    );
                                  },
                              )),
                              RichText(text: TextSpan(
                                  text: "Login now ",
                                  style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                                  recognizer: TapGestureRecognizer()..onTap = (){
                                    Fluttertoast.showToast(
                                        msg: "Login now..",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIos: 1
                                    );
                                  },
                              )),
                            ],
                          ),
                        )
                      ],
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