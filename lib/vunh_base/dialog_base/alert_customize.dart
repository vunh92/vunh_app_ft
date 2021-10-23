import 'package:flutter/material.dart';
import 'package:vunh_app_ft/vunh_base/value_base/colors.dart';
import 'package:vunh_app_ft/vunh_base/value_base/constants.dart';
import 'package:vunh_app_ft/vunh_base/value_base/theme_base.dart';

// ignore: constant_identifier_names
enum ConfirmActionTwoButton { CANCEL, ACCEPT }

// ignore: constant_identifier_names
enum ConfirmActionOneButton { CLOSE }

class MsgDialog {
  static const double consPadding = 5;
  static const double consRadius = 40;

  static void showCustomDialog(BuildContext context, String title, String content){
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) => Dialog(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(8),
        // ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: consPadding, top: consRadius + 10, right: consPadding, bottom: consPadding),
              margin: EdgeInsets.only(top: consRadius),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.black,offset: Offset(0,10),
                        blurRadius: 15
                    ),
                  ]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(title, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  SizedBox(height: 15,),
                  Text(content,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
                  SizedBox(height: 22,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                        onPressed: (){
                          Navigator.of(context).pop(MsgDialog);
                        },
                        child: Text(ConstantStringVn.sys_close,style: TextStyle(fontSize: 16),)),
                  ),
                ],
              ),
            ),
            Positioned(
              left: consPadding,
              right: consPadding,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: consRadius,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(consRadius)),
                    child: Image.asset("assets/hu_hon_002.PNG")
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showOneButtonDialog(BuildContext context, String title, String content){
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) => AlertDialog(
        titleTextStyle: ThemeBase.textWhiteMessDialogTitle,
        contentTextStyle: ThemeBase.textMessDialogContent,
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        buttonPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        // title: Text(title),
        title: Container(
          padding: const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 8.0),
          decoration: BoxDecoration(
            color: colorPrimary,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.info_outline,
                size: ThemeBase.fontSize20,
                color: colorWhite,
              ),
              const SizedBox(width: 5),
              Text(title),
            ],
          ),
        ),
        // content: Text(content),
        content: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10.0, 12.0, 10, 16.0),
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(onPressed: () {
              print("typeBtn");
              Navigator.of(context).pop(MsgDialog);
            },
            child: Text(ConstantStringVn.sys_close)
          )
        ],
      ),
    );
  }

  static Future<ConfirmActionTwoButton> showTwoButtonDialog({Key key,
  @required BuildContext context,
  @required String title,
  @required String content,
  @required String typeBtnNo,
  @required String typeBtnYes,
  String keyDialog = '',
  String keyBtnNo = '',
  String keyBtnYes = '', }) async {
    var _inputTextController = TextEditingController();
    return showDialog<ConfirmActionTwoButton>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) => AlertDialog(
        // key: Key(keyDialog),
        titleTextStyle: ThemeBase.textWhiteMessDialogTitle,
        contentTextStyle: ThemeBase.textMessDialogContent,
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        buttonPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: Container(
          padding: const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 8.0),
          decoration: BoxDecoration(
            color: colorPrimary,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.info_outline,
                size: ThemeBase.fontSize20,
                color: colorWhite,
              ),
              const SizedBox(width: 5),
              Text(title ?? ConstantStringVn.sys_notify),
            ],
          ),
        ),
        // content: Text(content),
        content: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10.0, 12.0, 10, 16.0),
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            // child: Text(typeBtnYes)
            // key: Key(keyBtnYes),
            child: Text(
              typeBtnYes ?? ConstantStringVn.sys_yes,
              style: ThemeBase.textMessDialogButtonColorHint,
            ),
            onPressed: () =>
            // print("typeBtnYes");
            // Navigator.of(context).pop(MsgDialog);
            Navigator.of(context).pop(
                ConfirmActionTwoButton.ACCEPT
            ),
          )
          ,FlatButton(
              // key: Key(keyBtnNo),
              // child: Text(typeBtnNo)
              child: Text(
                typeBtnNo ?? ConstantStringVn.sys_no,
                style: ThemeBase.textMessDialogButtonColorHint,
              ),
              onPressed: () =>
              // print("typeBtnNo");
              // Navigator.of(context).pop(MsgDialog);
              Navigator.of(context).pop(
                  ConfirmActionTwoButton.CANCEL
              ),
          ),
        ],
      ),
    );
  }
}
