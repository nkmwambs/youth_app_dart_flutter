import 'package:flutter/cupertino.dart';

class User{
  final int userId;
  final String name;
  final String email;
  final String password;
  final int userType;
  final int createdBy;

  User({
    @required this.userId, 
    @required this.name, 
    @required this.email, 
    @required this.password,
    @required this.userType,
    @required this.createdBy});

}