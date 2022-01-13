import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fix_feels/DataClasses/Listings.dart';
import 'package:fix_feels/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatefulWidget {

  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<Loader> {





  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: CircularProgressIndicator(), height: 30,width: 30,),);
  }




}

