// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:youth_development_app/classes/beneficiary_themes.dart';
// import 'package:youth_development_app/classes/goal_and_tasks.dart';
// import 'package:youth_development_app/screens/set_goals.dart';

// typedef OnDelete();

// class AddGoalsAndTasks extends StatefulWidget {
//   final GoalAndTasks goalAndTask;
//   final state = _AddGoalsAndTasksState();
//   final OnDelete onDelete;

//   AddGoalsAndTasks({this.goalAndTask, this.onDelete});

//   @override
//   _AddGoalsAndTasksState createState() => state;
//   bool isValid()=>state.isFormValid();
// }

// class _AddGoalsAndTasksState extends State<AddGoalsAndTasks> {
//   //Class variables
//   final formKey = GlobalKey<FormState>();
//   Map data = {};
//   int maxmum_goals;

//   @override
//   Widget build(BuildContext context) {
//     data = ModalRoute.of(context).settings.arguments;
//     print(data);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add Goals For ${data['theme_id']}"),
//       ),
//       body: Container(
//         child: Form(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               //Load the default Form field
//               //dynamic_text._textFieldWidget(),
//               Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Column(
//                   children: <Widget>[
//                     Text(
//                       'Click on the button below to add your goals for: ${data['theme_name'].toUpperCase()} ',
//                       style: TextStyle(fontSize: 28),
//                     ),
//                     Text('Maxmum of ${int.parse(data['theme_maxmum_goals'])}'),
//                     Card(
//                       child: Form(
//                         child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               AppBar(
//                                 leading: Icon(Icons.adjust),
//                                 title:Text('Add Goals for ${data['theme_name'].toUpperCase()}'),
//                                 actions: <Widget>[
//                                   IconButton(
//                                     icon: Icon(Icons.delete),

//                                     onPressed: widget.onDelete,
                                    
//                                     ),

//                                 ],
//                                 ),

//                                 TextFormField(
//                                   initialValue: widget.goalAndTask.goalName,
//                                   onSaved: (inputValue)=>widget.goalAndTask.goalName=inputValue,
//                                   validator: (inputValue)=>inputValue.isEmpty?'Enter a goal':null,
//                                   style: TextStyle(fontSize: 22.0, color: Colors.black),
//                                   decoration: InputDecoration(
//                                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.0)),
//                                     fillColor: Colors.white,
//                                     filled: true,
//                                     hintText: 'Enter a goal',
//                                     hintStyle: TextStyle(fontSize: 22.0,color: Colors.black),

//                                   ),
//                                 ),

//                                 TextFormField(
//                                   initialValue: widget.goalAndTask.goalTask,
//                                   onSaved: (inputValue)=>widget.goalAndTask.goalTask=inputValue,
//                                   validator: (inputValue)=>inputValue.isEmpty?'Enter a goal':null,
//                                   style: TextStyle(fontSize: 22.0, color: Colors.black),
//                                   decoration: InputDecoration(
//                                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.0)),
//                                     fillColor: Colors.white,
//                                     filled: true,
//                                     hintText: 'Enter a task', //${widget.goalAndTask.goalName}',
//                                     hintStyle: TextStyle(fontSize: 22.0,color: Colors.black),

//                                   ),
//                                 ),
                                
//                             ]),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       // floatingActionButton: RaisedButton.icon(
//       //     onPressed: () {}, icon: Icon(Icons.add), label: Text('Add Goal')),
//     );
//   }

//   ///Form validate 
//   bool isFormValid(){
//     var isValid=formKey.currentState.validate();
//     if(isValid) formKey.currentState.save();

//     return isValid;
//   }
// }
