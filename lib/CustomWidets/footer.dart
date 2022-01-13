import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fix_feels/DataClasses/Listings.dart';
import 'package:fix_feels/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {

   @override
   FooterState createState() => FooterState();
}

class FooterState extends State<Footer> {


  TextStyle heading  = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500
  );

  TextStyle label = TextStyle(
    color: Colors.white54

  );

  Widget headingGap =               Container(height: 18,);

  Widget labelGap =               Container(height: 13,);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 15),
      color: footerColor ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("POLICY INFO", style: heading,),
              headingGap,
              Text("Privacy Policy", style: label,),
              labelGap,
              Text("Terms of Sale", style: label,),
              labelGap,
              Text("Terms of Use", style: label,),
              labelGap,
              Text("Report Abuse", style: label,),
              labelGap,
            ],
          )),



          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("COMPANY", style: heading,),
              headingGap,
              Text("About Us", style: label,),
              labelGap,
              Text("Core values", style: label,),
              labelGap,
              Text("Careers", style: label,),
              labelGap,
              Text("Blogs", style: label,),
              labelGap,


            ],
          ))

        ],
      ),


    );
  }




}

