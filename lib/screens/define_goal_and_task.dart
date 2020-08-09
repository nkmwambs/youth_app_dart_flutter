import 'package:flutter/material.dart';
import 'package:youth_development_app/classes/goal_and_tasks.dart';

class DefineGoalAndTask extends StatefulWidget {
  
  @override
  _DefineGoalAndTaskState createState() => _DefineGoalAndTaskState();
}

class _DefineGoalAndTaskState extends State<DefineGoalAndTask> {
   var goal=Goal();
   var totalTasksForAgoal=5;
   List<TextFormField> _addToList=List<TextFormField>();

   
  final TextEditingController ctrl=TextEditingController();
  List<String> litems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Container(
        child: Card(
          
          color: Colors.grey[100],
               //margin: EdgeInsets.all(8),
               child: SingleChildScrollView(
                      child: Column(
                   
                   children: <Widget>[
                     ListTile(title:_goalTextField()),
                     SizedBox(height:5),
                     
                     _addToList.length>0?ListView.builder(
                       //itemExtent: 300,
                       shrinkWrap: true,
                       itemCount: _addToList.length,
                       itemBuilder: (_,index){
                         
                         return ListTile(title: _addToList[index]);

                       }
                       ):Text('Click on [+] to add tasks', style: TextStyle(fontSize:18, color: Colors.black),),
                       
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           
                            FlatButton(
                             onPressed: (){
                               print(litems);
                             }, 
                             child: Text('Submit', style:TextStyle(color:Colors.white,fontSize:18)),
                             color: Colors.indigo, 
                             ),
                             SizedBox(width:5),
                             FlatButton(
                             onPressed: (){}, 
                             child: Text('Reset', style:TextStyle(color:Colors.white,fontSize:18)),
                             color: Colors.indigo, 
                             ),
                         ],
                       )
                   

                   ],),
               ) ),
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          
          setState(() {
            SizedBox(height:5);
            
            return _test();

          });
          
          

        },
        ),
      
    );
  }

  _goalTextField() {

    return TextFormField(

        onSaved: (value)=>goal.goalName=value,
        validator: (value)=>value.isEmpty?'Enter a goal':null,
        style: TextStyle(fontSize: 22.0, color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Enter a goal',
          hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
        ));
  }

  _textField(){


 setState(() {});
      return TextFormField(

        controller: ctrl ,
       
        

        onSaved: (value)=>goal.task.taskName=value,
          //litems.add(value);

       
        validator: (value)=>value.isEmpty?'Enter a task':null,
        style: TextStyle(fontSize: 22.0, color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Enter a task',
          hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
        ));

  }
  _test(){
     setState(() {
       
        
       _addToList.add(_textField());
     });
    
  }

   _taskTextField() {
     

    return TextFormField(

        onSaved: (value)=>goal.task.taskName=value,
        validator: (value)=>value.isEmpty?'Enter a task':null,
        style: TextStyle(fontSize: 22.0, color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Enter a task',
          hintStyle: TextStyle(fontSize: 22.0, color: Colors.black),
        ));
  }
}