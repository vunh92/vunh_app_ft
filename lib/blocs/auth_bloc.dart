import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vunh_app_ft/dialog/loading_dialog.dart';
import 'package:vunh_app_ft/dialog/msg_dialog.dart';
import 'package:vunh_app_ft/screens/photo_home.dart';
import 'package:vunh_app_ft/view/home_screen.dart';

class AuthBloc {
  FirebaseAuth _auth = FirebaseAuth.instance;

  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();
  StreamController _confirmPasswordController = new StreamController();
  StreamController _loginController = new StreamController();

  Stream get emailController => _emailController.stream;
  Stream get passController => _passController.stream;
  Stream get confirmPasswordController => _confirmPasswordController.stream;
  Stream get loginController => _loginController.stream;

  bool isValidSignUp(String email, String pass, String confirmPass ){
    bool required = true;
    if(email == null || email.length == 0){
      _emailController.sink.addError("Nhập email");
      required = false;
    }else _emailController.sink.add("");
    if(pass == null || pass.length < 6){
      _passController.sink.addError("Mật khẩu ít nhất 6 ký tự");
      required = false;
    }else _passController.sink.add("");
    if(confirmPass == null || confirmPass.length < 6){
      _confirmPasswordController.sink.addError("Xác thực Mật khẩu ít nhất 6 ký tự");
      required = false;
    }else _confirmPasswordController.sink.add("");
    return required;
  }

  bool isConfirmPassword(String pass, String confirmPass ){
    return pass == confirmPass;
  }

  bool isValidLogin(String email, String pass){
    bool required = true;
    if(email == null || email.length == 0){
      _emailController.sink.addError("Nhập email");
      required = false;
    }else _emailController.sink.add("");
    if(pass == null || pass.length < 6){
      _passController.sink.addError("Mật khẩu ít nhất 6 ký tự");
      required = false;
    }else _passController.sink.add("");
    return required;
  }

  void isValidLoginFirebase(String email, String password, BuildContext context) async {
    try {
      LoadingDialog.showLoadingDialog(context, 'Đang kiểm tra Login');
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (_authResult.user != null) {
        LoadingDialog.hideLoadingDialog(context);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoHome(),));
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login Success!", textAlign: TextAlign.center,), duration: Duration(seconds: 1), ));
      }else {
        LoadingDialog.hideLoadingDialog(context);
      }
    }catch (e){
      print(e);
      LoadingDialog.hideLoadingDialog(context);
      MsgDialog.showMsgDialog(context, "Thông Báo", "Sai mật khẩu hoặc tài khoản!!!");
    }
  }

  void signUpFirebase(String email, String password, BuildContext context) async {
    try {
      LoadingDialog.showLoadingDialog(context, 'Đang tạo email');
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (_authResult.user != null) {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Sign up Success!", textAlign: TextAlign.center,), duration: Duration(seconds: 4), ));
      }else {
        LoadingDialog.hideLoadingDialog(context);
      }
    }catch (e){
      print(e);
      LoadingDialog.hideLoadingDialog(context);
    }
  }

  bool signIn(String email, String password){
    bool required = false;
    _loginController.sink.add("");
    if(email.trim().compareTo("vunh") == 0 && password.compareTo("123456") == 0){
      _loginController.sink.add("");
      required = true;
    }else
      _loginController.sink.add("sai MK hoặc TK");
    return required;
  }

  void dispose(){
    _emailController.close();
    _passController.close();
    _confirmPasswordController.close();
    _loginController.close();
  }
}