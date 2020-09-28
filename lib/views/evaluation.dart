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
  Orientation orientation;
  _EvaluationScreenState(this.subCat);

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: subCat.parent.bgColor,
        appBar: AppBar(
          backgroundColor: subCat.parent.iconColor,
          title: Text(subCat.name),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: GridView.extent(
              maxCrossAxisExtent: 300,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: [
                InputCard(subCat, "Evaluation"),
                InputCard(subCat, "Manegement"),
                InputCard(subCat, "Medication"),
                InputCard(subCat, "Symptoms"),
                InputCard(subCat, "References"),
                SizedBox(height: 10),
                SizedBox(
                    height: 50,
                    child: RaisedButton.icon(
                      icon: Icon(Icons.check, color: Colors.white),
                      color: subCat.parent.iconColor,
                      label: Text(
                        "Submit",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
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
    return Card(
        elevation: 5,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            SizedBox(
                width: EdgeInsetsGeometry.infinity.horizontal,
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
        )));
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
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: TextFormField(
            maxLines: 5,
            decoration: InputDecoration(labelText: "Enter text here..."),
            validator: _validateText,
          ),
        ));
  }
}
