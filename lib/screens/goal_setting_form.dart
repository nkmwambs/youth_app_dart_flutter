import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:youth_development_app/classes/goal_and_tasks.dart';
import 'package:youth_development_app/web_services/call_api.dart';

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

    Map data={};

  @override
  Widget build(BuildContext context) {
    //Get data from themes form
    data = ModalRoute.of(context).settings.arguments;
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
  _addGoalsAndTasks() async{

    Map goalData = {
       'goal_name': _goalTxtBox.text.trim(),
       'user_id' : '${data['loggedInUser']}',
       'theme_id':'${data['theme_id']}',
       'created_by': '${data['loggedInUser']}',
    };

    //Call the webservice for data from API
    var response = await CallApi().postData(goalData, 'goalsandtask/insert_goals');

// if (response.statusCode == 200) {
//     print(json.decode(response.body));
//   } else {
//     print(response.statusCode);
//   }
    Map body = json.decode(response.body);
    print(body);


  }
  void _submit() async{
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await _addGoalsAndTasks();
      print('Theme ID: ${data['theme_id']}');
      print('Theme Name: ${data['theme_name']}');
      print('Theme_maxmum_goals: ${data['theme_maxmum_goals']}');
      print('Logged In User ID: ${data['loggedInUser']}');
      print('Goal Name: ${_goalTxtBox.text}');
      print('Task One: ${_taskOne.text}');
      print('Task Two: ${_taskTwo.text}');
      print('Task Three: ${_taskThree.text}');

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
