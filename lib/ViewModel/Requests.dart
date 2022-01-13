import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class Requests{


  Future getData(String url) async {

    dynamic responseJson;
    try {
      print("RESPONSE");

      final response = await get(Uri.parse(url));
      print (response);
      responseJson = jsonDecode(response.body);
    }  catch(e)
    {
      print("ERRROROROR"+e);
    }
    return responseJson;


  }

  Future postData(String url, dynamic params) async {

    dynamic responseJson;
    try {
      print("RESPONSE" + url);
      var res = await post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
       /*   'refresh-token': Variables.refreshToken,
          'token': Variables.token,*/
        },
        body: jsonEncode(params),
      );
       responseJson = jsonDecode(res.body);
    }  catch(e)
    {
      print("ERRROROROR"+e.toString());
    }
    print(responseJson.toString()+"0000000000000000");

    return responseJson;


  }






}


