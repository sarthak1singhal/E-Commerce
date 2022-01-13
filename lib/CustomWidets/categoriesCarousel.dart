import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fix_feels/DataClasses/Categories.dart';
import 'package:fix_feels/DataClasses/Listings.dart';
import 'package:fix_feels/ViewModel/CategoriesModel.dart';
 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoriesCarousel extends StatefulWidget {
   final String title;
   final int type;

   final List<Categories> items;
  CategoriesCarousel(
      {@required this.title,@required this.items, this.type});
  @override
  CategoriesCarouselState createState() => CategoriesCarouselState();
}

class CategoriesCarouselState extends State<CategoriesCarousel> {

  int _current = 0;

  CarouselController buttonCarouselController = CarouselController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  CategoriesModel categoriesModel = new CategoriesModel();


  double width = 0;
  @override
  Widget build(BuildContext context) {
    int imageCount = (widget.items.length / 3).round();
    width = MediaQuery.of(context).size.width ;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 6),

            child: Text(this.widget.title, style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,

            ),
            ),
          ),


          Container(
            margin: EdgeInsets.only(top: 7),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child:  Stack(
              children: [
                CarouselSlider(
                  carouselController: buttonCarouselController,

                  items: widget.type ==2 ? widget.items.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Row(
                                children: [


                                  getCarouselChild(i.imageUrl),

                                ],
                              ),
                            )
                        );
                      },
                    );
                  }).toList(): getCategories3().map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Row(
                                children: [


                                  getCarouselChild(i.category1.imageUrl),
                                  i.category2!= null ? getCarouselChild(i.category2.imageUrl) : Container(),
                                  i.category3!= null ? getCarouselChild(i.category3.imageUrl) : Container(),

                                ],
                              ),
                            )
                        );
                      },
                    );
                  }).toList(),

                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    disableCenter: true,
                    height: 140,
                    viewportFraction: 1,
                    autoPlay: false,
                    reverse: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                ),

                Positioned.directional(
                    textDirection: Directionality.of(context),
                    end: -5,
                    bottom: 48.0,
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

                Positioned.directional(
                    textDirection: Directionality.of(context),
                    start: -5,
                    bottom: 48.0,
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
            decoration: BoxDecoration(

            ),
          )



        ],
      ),



    );
  }


  List<Categories3> getCategories3() {
    List<Categories3> list = [];
    int i = 0;
    while (i < widget.items.length) {
      Categories shopItem = this.widget.items[i];
      i++;
      Categories shopItem2;
      Categories shopItem3;
      if (i < widget.items.length) {
        shopItem2 = this.widget.items[i];
        i++;
      }
      if (i < widget.items.length) {
        shopItem3 = this.widget.items[i];
        i++;
      }

      list.add(Categories3(shopItem, shopItem2,shopItem3));
    }


    return list;
  }

  List<Categories2> getCategories2() {
    List<Categories2> list = [];
    int i = 0;
    while (i < widget.items.length) {
      Categories shopItem = this.widget.items[i];
      i++;
      Categories shopItem2;
      if (i < widget.items.length) {
        shopItem2 = this.widget.items[i];
        i++;
      }

      list.add(Categories2(shopItem, shopItem2));
    }
    return list;
  }

 getCarouselChild(String data){

     return Expanded(
       child: Container(
         margin: EdgeInsets.symmetric(horizontal: 6,vertical: 4),

         decoration: BoxDecoration(
           image: DecorationImage(image: NetworkImage(data, ),fit: BoxFit.cover,),
         ),
       ),
     );
 }

 
}


