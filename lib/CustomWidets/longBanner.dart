import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fix_feels/DataClasses/Banners.dart';
import 'package:fix_feels/DataClasses/Listings.dart';
import 'package:fix_feels/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LongBanner extends StatefulWidget {

  List<Banners> list;

  LongBanner(this.list);

  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<LongBanner> {

  int _current = 0;



  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {

 return Column(
   children: [Stack(
     children: [
       CarouselSlider(
         carouselController: buttonCarouselController,
         items: widget.list.map((i) {

           print(i.toString());
           print(i.image);
           return Builder(
             builder: (BuildContext context) {
               return GestureDetector(
                 onTap: () {},
                 child: Container(child: Image.network(i.image)),
               );
             },
           );
         }).toList(),
         options: CarouselOptions(
             enableInfiniteScroll: widget.list.length==1 ? false : true,
             viewportFraction: 1.0,
             autoPlay: widget.list.length==1 ? false : true,
             aspectRatio:3.5,

             reverse: false,
             onPageChanged: (index, reason) {
               setState(() {
                 _current = index;
               });
             }),
       ),

       widget.list.length==1 ? Container():   Positioned.directional(
           textDirection: Directionality.of(context),
           end: 0,
           bottom: 34.0,
           child: GestureDetector(
               onTap:   () => buttonCarouselController.nextPage(
                   duration: Duration(milliseconds: 300), curve: Curves.linear),
               child: Padding(
                 child: Container(
                   child: Icon(Icons.navigate_next, color: Colors.white, size: 18,),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(50),
                     color: Colors.black45,


                   ),
                   padding: EdgeInsets.all(3),
                 ),
                 padding: EdgeInsets.all(7),
               )
           )
       ),

       widget.list.length==1 ? Container():Positioned.directional(
           textDirection: Directionality.of(context),
           start: 0,
           bottom: 34.0,
           child: GestureDetector(

             onTap:   () => buttonCarouselController.previousPage(
                 duration: Duration(milliseconds: 300), curve: Curves.linear),
             child: Padding(
               child: Container(
                 child: Icon(Icons.navigate_before, color: Colors.white, size: 18,),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(50),
                   color: Colors.black45,


                 ),
                 padding: EdgeInsets.all(3),
               ),
               padding: EdgeInsets.all(7),
             ),
           )
       ),

     ],
   ),

   widget.list.length==1 ? Container():  Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: widget.list.map((i) {
         int index = widget.list.indexOf(i);

         return Container(
           width: 4.0,
           height: 4.0,
           margin: EdgeInsets.symmetric(
               vertical: 4, horizontal: 4.0),
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             color: _current == index
                 ? Color.fromRGBO(0, 0, 0, 0.9)
                 : disabledTextColor.withOpacity(0.5),
           ),
         );
       }).toList(),
     ),
   ],
 )

    ;






   }




}

