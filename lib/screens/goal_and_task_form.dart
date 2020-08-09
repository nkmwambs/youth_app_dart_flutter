// import 'package:flutter/material.dart';
// import 'package:youth_development_app/classes/goal_and_tasks.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';

// typedef OnDelete();

// class GoalAndTaskForm extends StatefulWidget {
//   final Goals goals;
//   final OnDelete onDelete;
//   final state = _GoalAndTaskFormState();
//   GoalAndTaskForm({this.goals, this.onDelete});

//   @override
//   _GoalAndTaskFormState createState() => state;
//   bool isValid() => state.isFormValid();
// }

// class _GoalAndTaskFormState extends State<GoalAndTaskForm> {
//   final _formKey = GlobalKey<FormState>();
//   var listOfTextFormFieldsForGoals = <Widget>[];
//   List<Goals> goalsAndTasks=[];
//   bool _addGoalBtnEnabled = true;
//   //List<AddFormFieldBox> _addField=[];
//   Map data = {};
//   @override
//   Widget build(BuildContext context) {
//     //Get data from themes form
//     data = ModalRoute.of(context).settings.arguments;
//     //Add Raised btn and textformfields on the list
//     if (listOfTextFormFieldsForGoals.length == 0) {
//       listOfTextFormFieldsForGoals.add(RaisedButton(
//           onPressed: () {
//             if (this._addGoalBtnEnabled) {
//               _addGoalFormField();
//               this._addGoalBtnEnabled = false;
//             } else {
//               _showDialog();
//             }
//           },
//           child: Text(
//             "Click to add a goal ${data['theme_id']}",
//             style: _addButtonStyle(),
//           )));
//     }

//     return Form(
//         key: _formKey,
//         child: Scaffold(
//           //appBar: AppBar(title: Text('Add Goals & Tasks')),
//           body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListView.builder(
//                 itemCount: listOfTextFormFieldsForGoals.length,
//                 itemBuilder: (context, index) {
//                   return listOfTextFormFieldsForGoals[index];
//                 }),
//           ),
//           floatingActionButton: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               RaisedButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Submit Goal',
//                   style: _addButtonStyle(),
//                 ),
//               ),
//               SizedBox(width: 5),
//               RaisedButton(
//                 onPressed: () => _clearGoalFormField(),
//                 child: Text('Clear', style: _addButtonStyle()),
//               ),
//             ],
//           ),
//         ));
//   }
//   // return TextFormField(
//   //           initialValue: widget.goals.goalName,
//   //           onSaved: (inputValue)=>widget.goals.goalName=inputValue,
//   //           validator: (inputValue) =>
//   //               inputValue.isEmpty ? 'Enter a goal' : null,
//   //           style: TextStyle(fontSize: 22.0, color: Colors.black),
//   //           decoration: InputDecoration(
//   //             suffixIcon: IconButton(icon: Icon(Icons.delete),onPressed: () =>widget.onDelete(), color: Colors.indigo,),
//   //             border: OutlineInputBorder(
//   //                 borderRadius: BorderRadius.circular(2.0)),
//   //             fillColor: Colors.white,
//   //             filled: true,
//   //             hintText: 'Enter a goal',
//   //             hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
//   //           ),
//   //         );
//   // }

//   _addButtonStyle() {
//     return TextStyle(fontSize: 22.0);
//   }

//   void _addGoalFormField() {
//     setState(() {
//       listOfTextFormFieldsForGoals.add(
//         Card(
            
//             child: Column(
//           children: <Widget>[
//             TextFormField(
//               initialValue: widget.goals.goalName,
//               validator: (inputValue) =>
//                   inputValue.isEmpty ? 'Enter a goal' : null,
//               style: TextStyle(fontSize: 22.0, color: Colors.black),
//               decoration: InputDecoration(
//               suffixIcon: IconButton(color: Colors.black,icon: Icon(Icons.delete),onPressed: (){
//                 setState(() {
//                   widget.onDelete();
//                 });
//               }),

//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0)),
//                 fillColor: Colors.white,
//                 filled: true,
//                 hintText: 'Enter a goal',
//                 hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
//               ),
//             ),
//             SizedBox(width: 5),
//             RaisedButton(
//               onPressed: () {}, //=> _addTasksFormField(),
//               child: Text('Add Tasks', style: _addButtonStyle()),
//             ),
//           ],
//         )),
//       );
//     });
//   }

//   _showDialog() {
//     return AwesomeDialog(
//             context: context,
//             dismissOnTouchOutside: false,
//             dialogType: DialogType.WARNING,
//             animType: AnimType.LEFTSLIDE,
//             //tittle: 'No Task added',
//             //desc: '',
//             body: Center(
//               child: Text(
//                 'No Task added.Please add tasks to goal first then click "Add a goal btn to add another goal"',
//                 style: _addButtonStyle(),
//               ),
//             ),
//             btnOkColor: Colors.indigo,
//             //btnCancelOnPress: () {},
//             btnOkOnPress: () {})
//         .show();
//   }

//   ///Form validate
//   bool isFormValid() {
//     var isValid = _formKey.currentState.validate();
//     if (isValid) _formKey.currentState.save();

//     return isValid;
//   }

//   void _clearGoalFormField() {
//     setState(() {
//       listOfTextFormFieldsForGoals.clear();
//       this._addGoalBtnEnabled = true;
//     });
//   }
//   // void addField(){

//   //   setState(() {
//   //       //this._addField.add(AddFormFieldBox());
//   //   });
//   // }
//   // Widget addFieldDynamically(){
//   //   setState(() {

//   //   });
//   //   return TextFormField(
//   //     style: TextStyle(fontSize: 22.0, color: Colors.black),
//   //     decoration: InputDecoration(

//   //        border: OutlineInputBorder(
//   //                   borderRadius: BorderRadius.circular(2.0)),
//   //               fillColor: Colors.white,
//   //               filled: true,
//   //               hintText: 'Enter a task',
//   //               hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
//   //     ),
//   //     );
//   // }
// }
// // class AddFormFieldBox extends StatelessWidget {
// //   AddFormFieldBox();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //           body: TextFormField(
// //             style: TextStyle(fontSize: 22.0, color: Colors.black),
// //         decoration: InputDecoration(

// //            border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(2.0)),
// //                   fillColor: Colors.white,
// //                   filled: true,
// //                   hintText: 'Enter a task ',
// //                   hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
// //         ),
// //         ),
// //     );
// //   }
// // }

// // class AddFormField{
// //   int count;
// //   AddFormField({this.count=0});

// //    Widget addFieldDynamically(){
// //     return TextFormField(
// //       decoration: InputDecoration(

// //          border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(2.0)),
// //                 fillColor: Colors.white,
// //                 filled: true,
// //                 hintText: 'Enter a task ${this.count}',
// //                 hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
// //       ),
// //       );
// //   }

// // }

// // import 'package:flutter/material.dart';
// // import 'package:youth_development_app/classes/goal_and_tasks.dart';

// // typedef OnDelete();

// // class GoalAndTaskForm extends StatefulWidget {
// //   final GoalAndTasks goalAndTasks;
// //   final OnDelete onDelete;
// //   final state = _GoalAndTaskFormState();
// //   GoalAndTaskForm({this.goalAndTasks, this.onDelete});

// //   @override
// //   _GoalAndTaskFormState createState() => state;
// //    bool isValid()=>state.isFormValid();

// // }

// // class _GoalAndTaskFormState extends State<GoalAndTaskForm> {
// //   final formKey = GlobalKey<FormState>();
// //   List<AddFormFieldBox> _addField=[];
// //   int _count=0;
// //   bool _check=false;
// //   Map data = {};
// //   @override
// //   Widget build(BuildContext context) {
// //     data = ModalRoute.of(context).settings.arguments;
// //     return Scaffold(
// //       //resizeToAvoidBottomInset: false,
// //       body: Padding(
// //         padding: EdgeInsets.all(8),
// //         child: Card(
// //             child: Form(
// //           key: formKey,
// //           child: Column(
// //             children: <Widget>[
// //             AppBar(
// //               title: Text("Add Goals For ${data['theme_id']}"),
// //               actions: <Widget>[
// //                 IconButton(
// //                   onPressed: (){
// //                    print(this._count++);
// //                    addField();
// //                    //this.check=true;

// //                   setState(() {
// //                    // addFieldDynamically();
// //                     //print(formKey);
// //                   });

// //                   },
// //                   icon: Icon(Icons.add_circle_outline, color: Colors.white),
// //                 ),
// //                 IconButton(
// //                   onPressed:(){
// //                     widget.onDelete();

// //                   } ,
// //                   icon: Icon(Icons.delete, color: Colors.black),
// //                 ),

// //               ],
// //             ),

// //             TextFormField(
// //               initialValue: widget.goalAndTasks.goalName,
// //               onSaved: (inputValue)=>widget.goalAndTasks.goalName=inputValue,
// //               validator: (inputValue) =>
// //                   inputValue.isEmpty ? 'Enter a goal' : null,
// //               style: TextStyle(fontSize: 22.0, color: Colors.black),
// //               decoration: InputDecoration(
// //                 border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(2.0)),
// //                 fillColor: Colors.white,
// //                 filled: true,
// //                 hintText: 'Enter a goal',
// //                 hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
// //               ),
// //             ),

// //             TextFormField(
// //               initialValue: widget.goalAndTasks.goalTask,
// //               onSaved: (inputValue)=>widget.goalAndTasks.goalTask=inputValue,
// //               validator: (inputValue) =>
// //                   inputValue.isEmpty ? 'Enter a task' : null,
// //               style: TextStyle(fontSize: 22.0, color: Colors.black),
// //               decoration: InputDecoration(
// //                 border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(2.0)),
// //                 fillColor: Colors.white,
// //                 filled: true,
// //                 hintText: 'Enter a task',
// //                 hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
// //               ),
// //             ),
// //              //this._check?Container(height: 100,child:addFieldDynamically()):Container(),
// //              Container(
// //                 height: 100,
// //                 child: this._addField.length==0?null:
// //                          ListView.builder(
// //                            itemExtent: 300,
// //                            itemCount:this._addField.length,
// //                            itemBuilder: (_,index)=>this._addField[index]
// //                            )
// //                 ),

// //             // Expanded(
// //             //               child: Container(
// //             //     child: this._addField.length==0?null:
// //             //              ListView.builder(
// //             //                itemExtent: 300,
// //             //                itemCount:this._addField.length,
// //             //                itemBuilder: (_,index)=>this._addField[index]
// //             //                )
// //             //     ),

// //             // ),
// //           ]),
// //         )),
// //       ),
// //     );
// //   }

// //   ///Form validate
// //   bool isFormValid(){
// //     var isValid=formKey.currentState.validate();
// //     if(isValid) formKey.currentState.save();

// //     return isValid;
// //   }
// //   void addField(){

// //     setState(() {
// //         this._addField.add(AddFormFieldBox());
// //     });
// //   }
// //   Widget addFieldDynamically(){
// //     setState(() {

// //     });
// //     this._check=true;
// //     return TextFormField(
// //       style: TextStyle(fontSize: 22.0, color: Colors.black),
// //       decoration: InputDecoration(

// //          border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(2.0)),
// //                 fillColor: Colors.white,
// //                 filled: true,
// //                 hintText: 'Enter a task',
// //                 hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
// //       ),
// //       );
// //   }
// // }
// // class AddFormFieldBox extends StatelessWidget {
// //   AddFormFieldBox();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //           body: TextFormField(
// //             style: TextStyle(fontSize: 22.0, color: Colors.black),
// //         decoration: InputDecoration(

// //            border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(2.0)),
// //                   fillColor: Colors.white,
// //                   filled: true,
// //                   hintText: 'Enter a task ',
// //                   hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
// //         ),
// //         ),
// //     );
// //   }
// // }

// // class AddFormField{
// //   int count;
// //   AddFormField({this.count=0});

// //    Widget addFieldDynamically(){
// //     return TextFormField(
// //       decoration: InputDecoration(

// //          border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(2.0)),
// //                 fillColor: Colors.white,
// //                 filled: true,
// //                 hintText: 'Enter a task ${this.count}',
// //                 hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
// //       ),
// //       );
// //   }

// // }
