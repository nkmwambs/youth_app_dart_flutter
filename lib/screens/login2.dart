import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youth_development_app/Widget/bezierContainer.dart';
import 'package:youth_development_app/classes/utilities.dart';
import 'package:youth_development_app/screens/sign_up.dart';
import 'package:youth_development_app/web_services/call_api.dart';
import 'package:youth_development_app/web_services/user_service.dart';

//import 'Widget/bezierContainer.dart';

class LoginPage extends StatefulWidget {
  final String title;
  final int id;

  LoginPage({Key key, this.title, this.id}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //Class Variable
  var _formId = GlobalKey<FormState>();
  var _scaffoldState = GlobalKey<ScaffoldState>();
  String _userName = "";
  String _password = "";
  bool isLoading = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: this._scaffoldState,
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formId,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      _title(),
                      SizedBox(
                        height: 50,
                      ),
                      _emailPasswordWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      _loginButton(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password ?',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                      _divider(),
                      _facebookButton(),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _createAccountLabel(),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
              Positioned(
                  top: -MediaQuery.of(context).size.height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer())
            ],
          ),
        )));
  }

  //Class Methods
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _textBoxField(String title, TextEditingController textBoxController,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              autofocus: true,
              controller: textBoxController,
              obscureText: isPassword,
              onSaved: (String inputValue) {
                //Retrieve the values from text boxes
                if (isPassword == false) {
                  this._userName = inputValue;
                } else {
                  this._password = inputValue;
                }
              },
              keyboardType:
                  isPassword == false ? TextInputType.emailAddress : null,
              validator: (String inputValue) {
                if (inputValue.isEmpty) {
                  return isPassword? 'Enter Password':'Enter Username';
                } 
                //Validate email address
                return isPassword==false? Utilities(null).emailValidation(inputValue):null;
                
              },
              style: TextStyle(color: Color(0xfff3f3f4), fontSize: 22),
              decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.yellow, fontSize: 20.0),
                  hintText: title,
                  prefixIcon: isPassword == false
                      ? Icon(Icons.email, color: Colors.white)
                      : Icon(Icons.lock, color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  filled: true))
        ],
      ),
    );
  }

  Widget _loginButton() {
    return InkWell(
      onTap: () {
        if (this._formId.currentState.validate()) {
          this._formId.currentState.save();

          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            _authenticateUser();
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF2196F3), Color(0xFF0D47A1)])),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
  _authenticateUser() async {
    //Password and email inputs for a user
    var data = {
      'email': _emailController.text.trim(),
      'password': _passwordController.text.trim()
    };

    //Call the webservice for data from API
    var response = await CallApi().postData(data, 'users/login');
    Map body = jsonDecode(response.body);
    print(body);
    //Show snackbar if
    if (body['status'] == false) {
      return Utilities(this._scaffoldState).showMessage(body['message'],false);
    }
    //Show snackbar if the user is inactive in API Database
    if(body['data'][0]['status']=='0' ){  
      return Utilities(this._scaffoldState).showMessage('Your account is suspended. Contact Youth Development Specialist',false);    
      
    }

    //Navigate to set_goals screen if login is successful and pass the userId to the next screen
    var _loggedInUserId = body['data'][0]['user_id'];
    Navigator.pushReplacementNamed(context, '/set_goals',arguments: {'logged_in_user': _loggedInUserId});
    
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Log in with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'My',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: ' Pl',
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
            TextSpan(
              text: 'an',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _textBoxField("Email Address", _emailController, isPassword: false),
        _textBoxField("Password", _passwordController, isPassword: true),
      ],
    );
  }
}
