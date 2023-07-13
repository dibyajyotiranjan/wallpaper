import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wall_paper/services/provider/exception.dart';
class ApiHelper{
var base_url ="https://api.pexels.com/v1/";
Future<dynamic> getApi(String urll, {Map<String, String>? header})async{
    late var jsonResponse;
    try{
      var response = await http.get(Uri.parse("${base_url+urll}"),headers: header);
     // print(response);
      jsonResponse = checkREsponse(response);
    } on SocketException{
     // print("No Internet");
      throw FetchDataException("No internet");
    }
    return jsonResponse;

  }

  dynamic checkREsponse(http.Response response){
  print(response.statusCode);
    if(response.statusCode==200){
      var data = jsonDecode(response.body.toString());
      return data;
    }else if(response.statusCode ==400){
      return BadRequestException(response.body.toString());
    }else{
      return FetchDataException("Error Occured while communicate the server with status code: ${response.statusCode}");
    }
  }
}