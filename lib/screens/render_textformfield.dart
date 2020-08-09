import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:youth_development_app/classes/goal_and_tasks.dart';
import 'package:youth_development_app/screens/create_textFormFields.dart';

class RenderTextFormField extends StatefulWidget {
  @override
  _RenderTextFormFieldState createState() => _RenderTextFormFieldState();
}

class _RenderTextFormFieldState extends State<RenderTextFormField> {
 // Goal goal=Goal();
  List<Goal> goals=[];
  List<GenerateGoalTextField> _goalAndTaskForm=[];

  bool _flag=true;
  Map data={};
  

  @override
  Widget build(BuildContext context) {
    

    //Get data from set_goals screen
    data=ModalRoute.of(context).settings.arguments;
    var loggedInUserId=data['loggedInUser'];
    var themeMaxGoals=data['theme_maxmum_goals'];
    var themeId=data['theme_id'] ;
    var themeName=data['theme_name'] ;
    
   //Loop the goals as dyanmical add Goal fields to used in Listview.builder down
    _goalAndTaskForm.clear();
    for(int index=0; index < goals.length; index++)
    {
      
      this._goalAndTaskForm.add(GenerateGoalTextField(
          key:GlobalKey(),//for identifying each form
          goal:goals[index],
          onDeleteGoal: ()=>_onDelete(index),
          onAddTask: ()=>null,//_addTaskFormField(index),
                
      ));
    }
   //Return scaffold
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.adjust),
        title: Text('Goals userId: $loggedInUserId for maxg:$themeMaxGoals'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: ()=>_postGoalsAndTasks(), 
            child: Text('Submit',style: TextStyle(fontSize:18),),
            color: Colors.redAccent
            )
        ],
        ),
      
      body: goals.length==0?Center(
        child: Text('Tap button [+] below to add a goal for: $themeName id:$themeId', style: TextStyle(fontSize: 28)),)
      :ListView.builder(
        itemCount: goals.length,
        itemBuilder: (_, i)=>_goalAndTaskForm[i]
      //   GenerateGoalTextField(
      //     goal:goals[index],
      //     onDeleteGoal: ()=>_onDelete(index),
      //     onAddTask: ()=>null,
      
      // ),
        
        ),
        
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(goals.length<int.parse(themeMaxGoals) )
            {
              return _addGoalTextFormField();
            }
            else{
                
              _showDialog('Theme "$themeName" allows maximum of "$themeMaxGoals goals"');
            }
          },
          child:Icon(Icons.add),
          ),
          
    );
  }
   _addButtonStyle() {
    return TextStyle(fontSize: 22.0,);
  }
     _showDialog(String msg){

    return AwesomeDialog(context: context,
            dismissOnTouchOutside: false,
            dialogType: DialogType.WARNING,
            animType: AnimType.LEFTSLIDE,
            //tittle: 'No Task added',
            //desc: '',
             body: Center(child: Text(
                    msg,
                    
                    style: _addButtonStyle(),
                  ),),
            btnOkColor: Colors.indigo[900],
            //btnCancelOnPress: () {},
            btnOkOnPress: () {}).show();

  }
  void _postGoalsAndTasks(){
    _goalAndTaskForm.forEach((inputForm){
      
      return inputForm.isValid();
      
      }
      // var data={
        
      // }
    );


     
      
  }
  void _onDelete(int index){
    setState(() {
      if(goals.length>1){
       goals.removeAt(index);
      }
      else{
       _showDialog('Aleast you should add a goal');
      }
      
      this._flag=true;
      print(index);
    });
  }

  void _addGoalTextFormField(){
    setState(() {
      goals.add(Goal());
    });
  }
  // void _addTaskFormField(index){
  //   setState(() {
  //     this._flag=true;
  //     print(index);
  //   });
  // }

  // void addItemToList(index){
  //   setState(() {
  //     this._flag=true;
  //   });
  // }
}