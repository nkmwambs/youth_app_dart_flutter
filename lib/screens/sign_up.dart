import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youth_development_app/Widget/bezierContainer.dart';
import 'package:youth_development_app/classes/utilities.dart';
import 'package:youth_development_app/screens/login2.dart';
import 'package:youth_development_app/web_services/call_api.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //variables
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _firstNameController=TextEditingController();
  TextEditingController _lastNameController=TextEditingController();
  var _scaffoldState = GlobalKey<ScaffoldState>();
  final _formKey =GlobalKey<FormState>();
  
  //Build METHOD
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: this._scaffoldState,
      body: SingleChildScrollView(
        child:Container(
          height: MediaQuery.of(context).size.height,
          child:Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
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
                      _submitButton(),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _loginAccountLabel(),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
              Positioned(
                  top: -MediaQuery.of(context).size.height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer())
            ],
          ),
        )
      )
    );
  }

  //METHODS
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

  Widget _entryField(String hintTextString, TextEditingController textController, {bool isPassword = false, bool isEmail=false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          TextFormField(
              controller: textController,
              obscureText: isPassword,
              validator:(val){
                //Validate  email
                if(isEmail){

                  return val.isEmpty?'Must not be empty':Utilities(null).emailValidation(val.trim());
                }
                else if(val.isEmpty){
                  return 'Must not be empty';
                }
                return null;
              },
              style: TextStyle(fontSize: 18.0,color:Colors.black),
              decoration: InputDecoration(
                  prefixIcon: hintTextString.contains('Name')? Icon(Icons.people,color:Colors.black):hintTextString.contains("Email")?Icon(Icons.email, color:Colors.black):Icon(Icons.vpn_key,color:Colors.black),
                  hintText: hintTextString,
                  hintStyle: TextStyle(color:Colors.black, fontSize:18),
                  errorStyle: TextStyle(fontSize:18, color:Colors.orange),
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }
  _userRegistration() async{

    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
    //prepare data to post
    var data={
      'first_name':_firstNameController.text.trim(),
      'last_name':_lastNameController.text.trim(),
      'email':_emailController.text.trim(),
      'password':_passwordController.text.trim(),
      'user_type':1
    };
    //Call Api and post data, then show snackback on success or failure
    var response=await CallApi().postData(data, 'users/user_registration');
    Map body=jsonDecode(response.body);

    if(body['status']==true){
      //Clear fields and then call the snackbar
      Utilities(null).clearsTextFields(_firstNameController);
      Utilities(null).clearsTextFields(_lastNameController);
      Utilities(null).clearsTextFields(_emailController);
      Utilities(null).clearsTextFields(_passwordController);
      //Snackbar message
      return Utilities(this._scaffoldState).showMessage(body['message'],true);
    }
    return Utilities(this._scaffoldState).showMessage(body['message'],false);


    }
    
   
  }

  Widget _submitButton() {
    return InkWell(
          onTap: (){
            _userRegistration();
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
          'Sign Up',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              'Login',
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
          text: 'Get.',
          style: GoogleFonts.portLligatSans(
            //textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.blue,
          ),
          children: [
            TextSpan(
              text: 'Ready2',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'Plan',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("First Name",_firstNameController),
        _entryField("Last Name",_lastNameController),
        _entryField("Email Adress",_emailController,isEmail: true),
        _entryField("Password",_passwordController, isPassword: true),
         
      ],
    );
  }
}
