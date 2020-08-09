
import 'package:flutter/material.dart';

class Utilities{

  final scaffoldState;

  Utilities(this.scaffoldState);

//Show snackbar message
  showMessage(String message, bool status) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 30),
      backgroundColor:status?Colors.green: Colors.red,
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      action: SnackBarAction(
          textColor: Colors.white, label: 'Close', onPressed: () {}),
    );
    scaffoldState.currentState.showSnackBar(snackBar);
  }

  //Clear text fields
  clearsTextFields(TextEditingController controller){

    controller.clear();

  }
  //validate email
  emailValidation(inputValue,{isEmail=true}){
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    return (!regex.hasMatch(inputValue.trim())) ? 'Invalid Email':null;
  }

}

