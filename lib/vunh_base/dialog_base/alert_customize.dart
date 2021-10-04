import 'package:flutter/material.dart';
import 'package:vunh_app_ft/vunh_base/value_base/colors.dart';
import 'package:vunh_app_ft/vunh_base/value_base/constants.dart';
import 'package:vunh_app_ft/vunh_base/value_base/theme_base.dart';

// ignore: constant_identifier_names
enum ConfirmActionTwoButton { CANCEL, ACCEPT }

// ignore: constant_identifier_names
enum ConfirmActionOneButton { CLOSE }

class MsgDialog {

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
        // title: Text(title),
        title: Container(
          padding: const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 8.0),
          decoration: BoxDecoration(
            color: colorPrimary,
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
      // barrierDismissible: false, // user must tap button!
      builder: (context) => AlertDialog(
        // key: Key(keyDialog),
        titleTextStyle: ThemeBase.textWhiteMessDialogTitle,
        contentTextStyle: ThemeBase.textMessDialogContent,
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        buttonPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        // title: Text(title),
        title: Container(
          padding: const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 8.0),
          decoration: BoxDecoration(
            color: colorPrimary,
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
          FlatButton(
              // key: Key(keyBtnNo),
              // child: Text(typeBtnNo)
              child: Text(
                typeBtnNo ?? 'No',
                style: ThemeBase.textMessDialogButtonColorHint,
              ),
              onPressed: () =>
              // print("typeBtnNo");
              // Navigator.of(context).pop(MsgDialog);
              Navigator.of(context).pop(
                  ConfirmActionTwoButton.CANCEL
              ),
          ),
          FlatButton(
              // child: Text(typeBtnYes)
            // key: Key(keyBtnYes),
            child: Text(
                typeBtnYes ?? 'Yes',
                style: ThemeBase.textMessDialogButtonColorHint,
              ),
              onPressed: () =>
                // print("typeBtnYes");
                // Navigator.of(context).pop(MsgDialog);
                Navigator.of(context).pop(
                    ConfirmActionTwoButton.ACCEPT
                ),
          )
        ],
      ),
    );
  }

  //show msg y/n
  /*static void showTwoButtonDialog(BuildContext context, String title, String content, String typeBtnNo, String typeBtnYes){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              print("typeBtnNo");
              Navigator.of(context).pop(MsgDialog);
            },
            child: Text(typeBtnNo)
          ),
          FlatButton(
              onPressed: () {
                print("typeBtnYes");
                Navigator.of(context).pop(MsgDialog);
              },
              child: Text(typeBtnYes)
          )
        ],
      ),
    );
  }*/
}
