import 'package:fix_feels/DataClasses/Banners.dart';
import 'package:fix_feels/DataClasses/Categories.dart';
import 'package:fix_feels/DataClasses/HomePage.dart';
import 'package:fix_feels/DataClasses/Listings.dart';
import 'package:fix_feels/Functions/URLs.dart';
import 'package:flutter/material.dart';
import 'Requests.dart';
class ProductData extends ChangeNotifier{

  bool isLoading = false;

  Requests req = Requests();




  dynamic data = {};


  getData(id) async{
    if(isLoading) return;
    isLoading = true;
    data = await req.getData(baseURL+product+ id);



    print(data);
    isLoading = false;




    notifyListeners();


  }





}