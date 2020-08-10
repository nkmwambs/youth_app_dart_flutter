import 'package:flutter/material.dart';
import 'package:youth_development_app/classes/goal_and_tasks.dart';

class GoalSettingForm extends StatefulWidget {
  @override
  _GoalSettingFormState createState() => _GoalSettingFormState();
}

class _GoalSettingFormState extends State<GoalSettingForm> {
  final _formKey = GlobalKey<FormState>();

  final _goalTxtBox = TextEditingController();

  final _taskOne = TextEditingController();

  final _taskTwo = TextEditingController();

  final _taskThree = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Goal Setting')),
        body: SingleChildScrollView(
          //helps avoid widget overflow
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  _drawFormTextBox('Enter Goal', _goalTxtBox), //Goal Field
                  SizedBox(height: 8.0),

                  _drawFormTextBox('Enter Task 1', _taskOne), //Task 1
                  SizedBox(height: 8.0),

                  _drawFormTextBox('Enter Task 2', _taskTwo), //Task 2
                  SizedBox(height: 8.0),

                  _drawFormTextBox('Enter Task 3', _taskThree), //Task 3

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _drawButton('Submit', _submit),
                      SizedBox(width: 8.0),
                      _drawButton('Reset', _reset),
                    ],
                  )
                ])),
          ),
        ));
  }

//Draw Text Boxes for Goals and Tasks
  Widget _drawFormTextBox(
      String txtBoxLabel, TextEditingController txtEditingController) {
    return TextFormField(
      validator: (value) => value.isEmpty ? 'Kindly $txtBoxLabel' : null,
      controller: txtEditingController,
      //onChanged: (text) =>print(text),
      // style: TextStyle(color: Colors.yellow, fontSize: 20.0),
      decoration: InputDecoration(
        labelText: txtBoxLabel,
        labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
        //hintText: 'Enter Goal',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  Widget _drawButton(String btnText, Function() submitOrRestForm) {
    return FlatButton(
      onPressed: () => submitOrRestForm(),
      child: Text(btnText, style: TextStyle(color: Colors.white, fontSize: 18)),
      color: Colors.indigo,
    );
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_goalTxtBox.text);
      print(_taskOne.text);
      print(_taskTwo.text);
      print(_taskThree.text);

      //Call the API to pick values to Goal Table( ID=GoalID, GoalName=Goal1, Student_FK_id,GoalStatus, goalperiodId)
      //Call this to task to Task Table(GoalFKID, taskID, Taskname)
      //Navigate to the 'add another goal

    }
  }

  void _reset() {
    setState(() {
      _goalTxtBox.text = '';
      _goalTxtBox.text = '';
      _taskOne.text = '';
      _taskTwo.text = '';
      _taskThree.text = '';
    });
  }
}
