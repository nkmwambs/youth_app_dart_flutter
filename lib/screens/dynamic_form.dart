//1st  Way and working........................................
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class DynamicForm extends StatefulWidget {
  @override
  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  var _lstOfFormFieldsForGoals = <Widget>[];
  var _index=0;  

  bool _addGoalBtnEnabled=true;

  final _formKey = GlobalKey<FormState>();

  Map data={};

  @override
  Widget build(BuildContext context) {
    //Get data from themes form
    data = ModalRoute.of(context).settings.arguments;

    //Add Raised btn and textformfields on the list
      if (_lstOfFormFieldsForGoals.length == 0) {

      _lstOfFormFieldsForGoals.add(RaisedButton(
          onPressed: () {
            if(this._addGoalBtnEnabled){
               ++this._index;
              _addGoalFormField(this._index);
              this._addGoalBtnEnabled=false;
            }
            else{
              _showDialog(this._index);

            }
                        
          },
          child: Text(
            "Click to add a goal ${data['theme_id']}",
            style: _addButtonStyle(),
          )));
    }
         

    return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(title: Text('Add Goals & Tasks')),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                
                itemCount: _lstOfFormFieldsForGoals.length,
                itemBuilder: (context, _index) {
                  return _lstOfFormFieldsForGoals[_index];
                }),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text(
                  'Submit Goal',
                  style: _addButtonStyle(),
                ),
              ),
              SizedBox(width: 5),
              RaisedButton(
                onPressed: () => _clearGoalFormField(),
                child: Text('Clear', style: _addButtonStyle()),
              ),
            ],
          ),
        ));
  }

  _addButtonStyle() {
    return TextStyle(fontSize: 22.0,);
  }

  void _addGoalFormField(_index) {
    setState(() {
      _lstOfFormFieldsForGoals.add(
        Card(
          color: Colors.grey[50],
          child:ListTile(
            leading: Text('Goal ${_index}', style: TextStyle(color: Colors.black,fontSize: 22)),
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            //subtitle: ,
            title: TextFormField(
              validator: (inputValue) =>
                  inputValue.isEmpty ? 'Enter a goal' : null,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Enter a goal',
                hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
              ),
            ),
            trailing: Wrap(
              children: <Widget>[
                IconButton(
                   icon: Icon(Icons.add_box), 
                   color: Colors.indigo[900],

                   onPressed: ()=> _addTasksFormField(_index)
                   
                   ),

                IconButton(
                   icon: Icon(Icons.delete), 
                   color: Colors.indigo[900],

                   onPressed: (){}),
              ],
            )
          )
       
        ),
      );
    });
  }
   _showDialog(_index){

    return AwesomeDialog(context: context,
            dismissOnTouchOutside: false,
            dialogType: DialogType.WARNING,
            animType: AnimType.LEFTSLIDE,
            //tittle: 'No Task added',
            //desc: '',
             body: Center(child: Text(
                    'No Task added for "Goal ${_index}". Please click [+] to add at least one task',
                    style: _addButtonStyle(),
                  ),),
            btnOkColor: Colors.indigo[900],
            //btnCancelOnPress: () {},
            btnOkOnPress: () {}).show();

  }
  void _addTasksFormField(index) {
    setState(() {
      this._addGoalBtnEnabled=true;
      _lstOfFormFieldsForGoals.add(  Card(
              child: TextFormField(
                validator: (inputValue) =>
                    inputValue.isEmpty ? 'Enter a task' : null,
                style: TextStyle(fontSize: 22.0, color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  fillColor: Colors.grey,
                  filled: true,
                  hintText: 'Enter a a task',
                  hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
                  suffixIcon:  IconButton(icon: Icon(Icons.delete),onPressed: () {
                   setState(() {
                     //print(_index);

                     _lstOfFormFieldsForGoals.removeAt(index-1);

                //_searchController.clear();
            });},) ,
                ),
              ),
      ),);
    });
  }

  void _clearGoalFormField() {
    setState(() {
      _lstOfFormFieldsForGoals.clear();
      this._addGoalBtnEnabled=true;
      this._index=0;
    });
  }
}



//2rd way using a form.......................
// import 'package:flutter/material.dart';
// import 'package:youth_development_app/classes/goal_and_tasks.dart';
// import 'package:youth_development_app/screens/goal_and_task_form.dart';

// class DynamicForm extends StatefulWidget {
//   @override
//   _DynamicFormState createState() => _DynamicFormState();
// }

// class _DynamicFormState extends State<DynamicForm> {
//   List<GoalAndTasks> goalsAndTasks=[];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add Goals & Tasks')),
//       body: goalsAndTasks.length==0?Center(
//         child: Text('Add Goals by tapping the button [+] below'),
//         ): ListView.builder(
//           itemExtent: 400.0,//RenderIndexedSemantics object was given an infinite size during layout.,
//           itemCount:goalsAndTasks.length,
//           itemBuilder: (_,_index)=> GoalAndTaskForm(goalAndTasks:goalsAndTasks[_index] ,onDelete: ()=>onDelete(_index),)

//           ),
//         floatingActionButton: FloatingActionButton(onPressed:()=> addNewGoalAndTask(), child:Icon(Icons.add)),
//     );
//   }
//   void onDelete(_index){

//     setState(() {
//       goalsAndTasks.removeAt(_index);

//     });
//   }
//   void addNewGoalAndTask(){
//     setState(() {
//       this.goalsAndTasks.add(GoalAndTasks());
//     });
//   }
// }
