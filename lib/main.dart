//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:youth_development_app/screens/define_goal_and_task.dart';
import 'package:youth_development_app/screens/dynamic_form.dart';
import 'package:youth_development_app/screens/goal_setting_form.dart';
import 'package:youth_development_app/screens/login2.dart';
import 'package:youth_development_app/screens/render_textformfield.dart';
import 'package:youth_development_app/screens/welcome.dart';
import 'package:youth_development_app/screens/set_goals.dart';
import 'package:youth_development_app/web_services/call_api.dart';
import 'package:youth_development_app/web_services/user_service.dart';

//Service locator package, it locates the service by creating an instance
void setUpServiceLocator(){
  GetIt.instance.registerLazySingleton(() => CallApi());
  GetIt.instance<CallApi>();

  // GetIt.instance.registerLazySingleton(() => UserService());
  // GetIt.instance<UserService>();

}
void main() {
  setUpServiceLocator();
  return runApp(MaterialApp(
  debugShowCheckedModeBanner: false,

  //initialRoute: '/dynamic_form',
  initialRoute: '/welcome',
  routes:{
    '/welcome' :(context)=> WelcomePage(),
    '/login':(context)=>LoginPage(),
    '/set_goals': (context)=>SetGoals(),
    '/dynamic_form':(context)=>DynamicForm(),
    '/goal_setting_form' :(context)=>GoalSettingForm()
    //'/render_textformfield':(context)=>RenderTextFormField(),
    //'/define_goal_and_task':(context)=>DefineGoalAndTask(),
    
  },
  // home: Scaffold(
  //   body:GoalAndTaskForm(),
  // ),
  theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.indigo,
    accentColor: Colors.indigoAccent,
    buttonColor: Colors.indigoAccent,
    cardColor: Colors.indigoAccent,
    fontFamily: 'Handlee',
    
  ),
));

}