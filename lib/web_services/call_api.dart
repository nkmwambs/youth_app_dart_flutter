import 'dart:convert';

import 'package:http/http.dart' as http;
class CallApi{
  static const EndPoint = 'http://192.168.100.4/youthapp_api/index.php/api/';

  //static const EndPoint = 'http://192.168.43.48/youthapp_api/index.php/api/';

  //Post Data Method
  postData(data, apiUrl) async{
    var fulUrl=EndPoint+apiUrl;

    return http.post(
      Uri.encodeFull(fulUrl),
      body: jsonEncode(data),
      headers: _setHeaders()
      
      );

  }

  //Get Data Method

  getData(apiUrl) async{
    var fulUrl=EndPoint+apiUrl;

    return http.get(
      Uri.encodeFull(fulUrl),
      headers: _setHeaders()
      
      );

  }
//Headers
  _setHeaders()=>{
    'content-type': 'application/json',
    'accept-type': 'application/json'
  };

  _getToken() async{
    //SharedPreferences localStorage=await SharedPreferences.instance;

  }
}