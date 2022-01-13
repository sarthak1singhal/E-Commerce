import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fix_feels/DataClasses/Listings.dart';
import 'package:flutter/material.dart';

class ItemsCarousel extends StatefulWidget {
  final List<Listings> items;
  final String title;

  ItemsCarousel({
    @required this.items,
    @required this.title,
  });

  @override
  ItemsCarouselState createState() => ItemsCarouselState();
}

class ItemsCarouselState extends State<ItemsCarousel> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    int imageCount = (widget.items.length / 2).round();



    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6),
            child: Text(
              this.widget.title,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 7),
            height: 258,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child:  ListView.builder(

              physics: BouncingScrollPhysics(),
              itemCount: widget.items.length,
              shrinkWrap: true,
              itemBuilder: (context, i){

                 return             GestureDetector(

                   onTap: (){

                     Navigator.of(context).pushNamed(
                       '/product',
                       arguments: widget.items[i].id,
                     );
                   },

              /*     onTap: (){


                      setState(() {
                       tapDown = false;
                     });
                   },
                   onTapDown: (d){

                     setState(() {
                       tapDown  = true;
                     });
                   },
                   onTapCancel: (){
                     setState(() {
                       tapDown = false;
                     });


                   },
*/


                  child:      AnimatedOpacity(
                    opacity:  1,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: Container(

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 152,
                              width: 156,

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(6), topLeft: Radius.circular(6)),
                                  image: DecorationImage(image: NetworkImage( widget.items[i].image), fit: BoxFit.fill)

                              ),

                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 11),

                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  SizedBox(
                                    child: Text(

                                      widget.items[i].title,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,

                                    ),
                                    width: 134,

                                  ),
                                  Container(
                                    height: 4,
                                  ),
                                  Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "₹ ${widget.items[i].price.toString()}",
                                        style: TextStyle(
                                            decoration:
                                            TextDecoration.lineThrough,
                                            color: Colors.black54,
                                            fontSize: 13

                                        ),

                                      ),
                                      Container(
                                        width: 6,
                                      ),
                                      Text(
                                          "₹ ${widget.items[i].finalPrice.toString()}",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight:
                                              FontWeight.w500))
                                    ],
                                  ),
                                  Container(
                                    height: 6,
                                  ),
                                  Text(
                                    "${widget.items[i].discount.toStringAsFixed(0)}% OFF",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                                color: Colors.black12,
                                blurRadius:4.0,
                                spreadRadius: .5

                            ),],
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                      ),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,

            ),
            decoration: BoxDecoration(
             ),
          )
        ],
      ),
    );
























     /*return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6),
            child: Text(
              this.widget.title,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 7),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Stack(
              children: [
                CarouselSlider(
                  carouselController: buttonCarouselController,


                  items: getList().map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                         return GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Row(
                                children: [


                                  getCarouselChild(i.item1),
                                  i.item2!=null ? getCarouselChild(i.item2):Container()
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
                      height: 248,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                      autoPlay: false,
                      reverse: false,
                    ),
                ),
                Positioned.directional(
                    textDirection: Directionality.of(context),
                    end: -4,
                    bottom: 110.0,
                    child: GestureDetector(
                        onTap: () => buttonCarouselController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear),
                        child: Padding(
                          child: Container(
                            child: Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                              size: 18,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black45,
                            ),
                            padding: EdgeInsets.all(3),
                          ),
                          padding: EdgeInsets.all(7),
                        ))),
                Positioned.directional(
                    textDirection: Directionality.of(context),
                    start: -4,
                    bottom: 110.0,
                    child: GestureDetector(
                      onTap: () => buttonCarouselController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear),
                      child: Padding(
                        child: Container(
                          child: Icon(
                            Icons.navigate_before,
                            color: Colors.white,
                            size: 18,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black45,
                          ),
                          padding: EdgeInsets.all(3),
                        ),
                        padding: EdgeInsets.all(7),
                      ),
                    )),
              ],
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(2))),
          )
        ],
      ),
    );*/
  }



  getCarouselChild(idx){
    if(idx.image == null ) return Container();
    return GestureDetector(
      onTap: (){

      },
      child:  Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 4, vertical: 5),
            child: Column(
              children: [
                Container(
                  height: 140,
                  child: Image.network(
                    idx.image,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  height: 9,
                ),
                SizedBox(
                  child: Text(

                    idx.title,
                    style: TextStyle(
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  width: 120,

                ),
                Container(
                  height: 8,
                ),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ ${idx.price.toString()}",
                      style: TextStyle(
                        decoration:
                        TextDecoration.lineThrough,
                      ),

                    ),
                    Container(
                      width: 16,
                    ),
                    Text(
                        "₹ ${idx.finalPrice.toString()}",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight:
                            FontWeight.w500))
                  ],
                ),
                Container(
                  height: 8,
                ),
                Text(
                  "${idx.discount.toStringAsFixed(0)}% OFF",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                )
              ],
              crossAxisAlignment:
              CrossAxisAlignment.start,
            ),
          ),
        ),
      ),
    );
  }
  List<DoubleList> getList() {
    List<DoubleList> list = [];
    int i = 0;
    while (i < widget.items.length) {
      Listings shopItem = this.widget.items[i];
      i++;
      Listings shopItem2;
      if (i < widget.items.length) {
        shopItem2 = this.widget.items[i];
        i++;
      }

      list.add(DoubleList(shopItem, shopItem2));
    }
    return list;
  }
}

class DoubleList {
  Listings item1;
  Listings item2;

  DoubleList(this.item1, this.item2);
}
