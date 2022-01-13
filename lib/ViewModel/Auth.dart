import 'package:flutter/cupertino.dart';
import 'package:fix_feels/Functions/URLs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Requests.dart';

class Auth extends ChangeNotifier{

  //String username, password, confirmPassword, name, phoneNumber;

  Requests req = Requests();

  static String token = "";
  Auth(){

    getToken();
  }



  bool isLoading = false;

 Future signUp(String name, String email, String phone, String password, String confirmPassword) async{
    isLoading = true;
    notifyListeners();


    var data = await req.postData(baseURL+signUpUrl,
        {"email" : email, "name" : name, "phone" : phone, "password" : password, "confirm_password" : confirmPassword} );





    try{


       String name = data["user"]["name"].toString();
      String token = data["token"].toString();
      if(token !=null)
      {
        print("H39----------"+data["user"].toString());
        print("H39----------ttttttttttttttttt"+data["token"].toString());


        saveToken(token, name);
      }
    }catch(e){
      print(e.toString());
      data = "error";
    }
    print(data);
    isLoading = false;
    notifyListeners();

    return data;

  }

  Future signIn(String email, String password) async{

    isLoading = true;
    notifyListeners();


    var data = await req.postData(baseURL+loginUrl,
        {"email" : email,   "password" : password, } );





    try{

      String token = data["access_token"].toString();
      if(token !=null)
      {
        saveToken(token, '');
      }

    }catch(e){

      print(e.toString());
      data = "error";

    }
    print(data);
    isLoading = false;
    notifyListeners();

    return data;
  }


  saveToken(String token, String name) async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString("token", token);
      prefs.setString("name", name);

      print("TOKEN SAVED");
    }catch(e){
      print(e.toString());
    }
  }

  getToken() async{
   if(token.trim()!="")
     {
       return token;
     }
   SharedPreferences prefs = await SharedPreferences.getInstance();

   token = prefs.getString("token");
   if(token == null )
     {
       return "";
     }
   if(token.trim() == "")
     {
       return "";
     }
   return token;
  }

}