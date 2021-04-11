import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vunh_app_ft/models/note_title_model.dart';

class NoteHome extends StatefulWidget {
  @override
  NoteHomeState createState() {
    return NoteHomeState();
  }
}

class NoteHomeState extends State<NoteHome> {
  var _titleController = TextEditingController();
  var _noteController = TextEditingController();
  List<NoteTitle> noteTitleList;

  @override
  void initState() {
    super.initState();
    noteTitleList = [];
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: TextField(
                controller: _titleController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    // errorText: snapshot.hasError ? snapshot.error : null,
                    labelText: "Title",
                    prefixIcon: Container(
                      width: 50,
                      child: Icon(Icons.adb, color: Colors.deepPurpleAccent,),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => _titleController.clear(),
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: TextField(
                controller: _noteController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  // errorText: snapshot.hasError ? snapshot.error : null,
                    labelText: "Note",
                    prefixIcon: Container(
                      width: 50,
                      child: Icon(Icons.subject, color: Colors.deepPurpleAccent,),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => _noteController.clear(),
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                onPressed: _insertNoteClicked,
                child: Text(
                  "Insert Note",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                color: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))
                ),
              ),
            ),
            //item Note
            itemNoteView(),
          ],
        ),
      ),
    );
  }

  void _insertNoteClicked() {
    noteTitleList.add(new NoteTitle(_titleController.text, _noteController.text));
    _titleController.clear();
    _noteController.clear();
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
    });
  }

  Widget itemNoteView() {
    return noteTitleList.length <= 0 ? Container() : Expanded(
      child: ListView.builder(
        itemCount: noteTitleList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text('Title: ' + noteTitleList[index].title),
                Text('Note: ' + noteTitleList[index].note),
              ],
            ),
          );
        },),
    );
  }
}