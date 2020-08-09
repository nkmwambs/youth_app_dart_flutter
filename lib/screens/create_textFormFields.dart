import 'package:flutter/material.dart';
import 'package:youth_development_app/classes/goal_and_tasks.dart';

typedef OnDeleteGoal();
typedef OnAddTask();

class GenerateGoalTextField extends StatefulWidget {
  final Goal goal;
  final state = _GenerateGoalTextFieldState();
  final OnDeleteGoal onDeleteGoal;
  final OnAddTask onAddTask;
  
  // final TextEditingController task;
  // final TextEditingController gl;
  GenerateGoalTextField({Key key,this.goal, this.onDeleteGoal, this.onAddTask}):super(key:key);

  @override
  _GenerateGoalTextFieldState createState() => state;

  bool isValid()=>state.validate();
  
}

class _GenerateGoalTextFieldState extends State<GenerateGoalTextField> {

  var _form = GlobalKey<FormState>();
  
  bool flag=true;

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  Card(
              color: Colors.grey[50],
              child: Form(
                  key: _form,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        // leading: Text(
                        //   'Goal 1',
                        //   style: TextStyle(fontSize: 22, color: Colors.black),
                        // ),
                        title: _createTextFormField(),
                        trailing: Wrap(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.add_box, color: Colors.black),
                                onPressed: ()=>widget.onAddTask()),
                            IconButton(
                                icon: Icon(Icons.delete, color: Colors.black),
                                onPressed: ()=>widget.onDeleteGoal()),
                          ],
                        ),
                        //subtitle: ListTile(title:_createTextFormField()),
                      ),
                     this.flag? _createTasks():Container(),
                    ],
                  )
                  
                  )

                  );
                  
                  
    
  }

  _createTextFormField() {
    
  TextEditingController goalController =TextEditingController();

    return TextFormField(
        //initialValue: widget.goal.goalName,
        controller: goalController,
        onSaved: (value)=>widget.goal.goalName=value,
        validator: (value)=>value.isEmpty?'Enter a goal':null,
        style: TextStyle(fontSize: 22.0, color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Enter a goal',
          hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
        ));
  }
  bool validate(){
    var isValid=_form.currentState.validate();
    if(isValid) _form.currentState.save();

    return isValid;
  }

_createTasks(){
  
  TextEditingController taskController =TextEditingController();
  return TextFormField(
        //initialValue: widget.goal.task.taskName,
        controller: taskController,
        onSaved: (val)=>widget.goal.task=Task(taskName: val),
        validator: (value)=>value.isEmpty?'Enter a task':null,
        style: TextStyle(fontSize: 22.0, color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Task',
          hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
        ));
}
  
}



// import 'package:flutter/material.dart';
// import 'package:youth_development_app/classes/goal_and_tasks.dart';

// typedef OnDeleteGoal();
// typedef OnAddTask();

// class GenerateGoalTextField extends StatefulWidget {
//   final Goal goal;
//   final state = _GenerateGoalTextFieldState();
//   final OnDeleteGoal onDeleteGoal;
//   final OnAddTask onAddTask;
//   // final TextEditingController task;
//   // final TextEditingController gl;
//   GenerateGoalTextField({Key key,this.goal, this.onDeleteGoal, this.onAddTask}):super(key:key);

//   @override
//   _GenerateGoalTextFieldState createState() => state;

//   bool isValid()=>state.validate();
  
// }

// class _GenerateGoalTextFieldState extends State<GenerateGoalTextField> {
//   var _form = GlobalKey<FormState>();
  
//   bool flag=true;

//   @override
//   Widget build(BuildContext context) {
//     return  Card(
//               color: Colors.grey[50],
//               child: Form(
//                   key: _form,
//                   child: Column(
//                     children: <Widget>[
//                       ListTile(
//                         // leading: Text(
//                         //   'Goal 1',
//                         //   style: TextStyle(fontSize: 22, color: Colors.black),
//                         // ),
//                         title: _createTextFormField(),
//                         trailing: Wrap(
//                           children: <Widget>[
//                             IconButton(
//                                 icon: Icon(Icons.add_box, color: Colors.black),
//                                 onPressed: ()=>widget.onAddTask()),
//                             IconButton(
//                                 icon: Icon(Icons.delete, color: Colors.black),
//                                 onPressed: ()=>widget.onDeleteGoal()),
//                           ],
//                         ),
//                         //subtitle: ListTile(title:_createTextFormField()),
//                       ),
//                      this.flag? _createTasks():Container(),
//                     ],
//                   )
                  
//                   )

//                   );
                  
                  
    
//   }

//   _createTextFormField() {
    
//   TextEditingController goalController =TextEditingController();

//     return TextFormField(
//         //initialValue: widget.goal.goalName,
//         controller: goalController,
//         onSaved: (value)=>widget.goal.goalName=value,
//         validator: (value)=>value.isEmpty?'Enter a goal':null,
//         style: TextStyle(fontSize: 22.0, color: Colors.black),
//         decoration: InputDecoration(
//           fillColor: Colors.white,
//           filled: true,
//           hintText: 'Enter a goal',
//           hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
//         ));
//   }
//   bool validate(){
//     var isValid=_form.currentState.validate();
//     if(isValid) _form.currentState.save();

//     return isValid;
//   }

// _createTasks(){
  
//   TextEditingController taskController =TextEditingController();
//   return TextFormField(
//         //initialValue: widget.goal.task.taskName,
//         controller: taskController,
//         onSaved: (val)=>widget.goal.task=Task(taskName: val),
//         validator: (value)=>value.isEmpty?'Enter a task':null,
//         style: TextStyle(fontSize: 22.0, color: Colors.black),
//         decoration: InputDecoration(
//           fillColor: Colors.white,
//           filled: true,
//           hintText: 'Task',
//           hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
//         ));
// }
  
// }
