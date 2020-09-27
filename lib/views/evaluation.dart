import 'package:app/data/category.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EvaluationScreen extends StatefulWidget {
  SubCategory subCategory;
  EvaluationScreen(this.subCategory);
  _EvaluationScreenState createState() => _EvaluationScreenState(subCategory);
}

class _EvaluationScreenState extends State<EvaluationScreen> {
  SubCategory subCat;
  _EvaluationScreenState(this.subCat);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: subCat.parent.iconColor,
          title: Text(subCat.name),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(children: [
            SizedBox(height: 10),
            InputCard(subCat, "Evaluation"),
            SizedBox(height: 10),
            InputCard(subCat, "Manegement"),
            SizedBox(height: 10),
            InputCard(subCat, "Medication"),
            SizedBox(height: 10),
            InputCard(subCat, "Symptoms"),
            SizedBox(height: 10),
            InputCard(subCat, "References"),
            SizedBox(height: 10),
            SizedBox(
                height: 50,
                child: RaisedButton.icon(
                  icon: Icon(Icons.check, color: Colors.white),
                  color: subCat.parent.iconColor,
                  label: Text("Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onPressed: () {/*Handle submit */},
                )),
          ]),
        ));
  }
}

// ignore: must_be_immutable
class InputCard extends StatelessWidget {
  SubCategory subCat;
  String cardTitle;
  InputCard(this.subCat, this.cardTitle);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Card(
            color: subCat.parent.bgColor,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                SizedBox(
                    width: 150,
                    child: Text(
                      cardTitle,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: subCat.parent.iconColor),
                      textAlign: TextAlign.center,
                    )),
                TextFields()
              ],
            ))));
  }
}

class TextFields extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  _TextFieldsState createState() => _TextFieldsState(_formKey);
}

class _TextFieldsState extends State<TextFields> {
  final _formKey;

  _TextFieldsState(this._formKey);

  String _validateText(String text) {
    if (text.isEmpty) {
      return 'Please enter some text';
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: TextFormField(
            decoration: InputDecoration(labelText: "Enter text here..."),
            validator: _validateText,
          ),
        ));
  }
}
