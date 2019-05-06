import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewSubjectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewSubjectPageState();
  }
}

class NewSubjectPageState extends State<NewSubjectPage> {

  final _formKey = GlobalKey<FormState>();
  Firestore _firestore = Firestore();


  @override
  Widget build(BuildContext context) {
    TextEditingController data = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Subject'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: data,
                  decoration: InputDecoration(
                    labelText: "Subject",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please fill subject';
                    }
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    debugPrint(data.text);
                    print(data.text);
                    if (_formKey.currentState.validate()) {
                      _firestore.collection('todo').add(
                        {'title': data.text, 'done': 0}
                      ).then((r){
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: Text("Save"),
                )
              ],
            )),
      ),
    );
  }
}