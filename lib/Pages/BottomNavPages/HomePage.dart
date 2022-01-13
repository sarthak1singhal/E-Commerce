import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fix_feels/CustomWidets/Loader.dart';
import 'package:fix_feels/CustomWidets/categoriesCarousel.dart';
import 'package:fix_feels/CustomWidets/footer.dart';
import 'package:fix_feels/CustomWidets/itemsCarousel.dart';
import 'package:fix_feels/CustomWidets/longBanner.dart';
import 'package:fix_feels/DataClasses/HomePage.dart';
import 'package:fix_feels/DataClasses/Listings.dart';
import 'package:fix_feels/Theme/colors.dart';
import 'package:fix_feels/ViewModel/homePageAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<HomePage> {


  HomeData homeData  = new HomeData();


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  SearchBar searchBar;
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        actions: [searchBar.getSearchAction(context),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
          TextButton(onPressed: (){


            Navigator.pushNamed(context, '/login');



          }, child: Text("Login/Register", style: TextStyle(color: Colors.white),))

        ]


    );
  }
  void onSubmitted(String value) {
    setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  }

  FooterState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("closed");
        });
  }


  @override
  void initState() {

    homeData.getData();
    super.initState();
  }




  GlobalKey<ScaffoldState> _key = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,

        appBar: searchBar.build(context),

        /*AppBar(
        title:  SvgPicture.asset(
          'assets/logo.svg',
          height: 33,
        ),        titleSpacing: 0,

        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
          TextButton(onPressed: (){


            Navigator.pushNamed(context, '/login');



          }, child: Text("Login/Register", style: TextStyle(color: Colors.white),))
        ],
        *//*bottom: PreferredSize(
          preferredSize: Size.fromHeight(72.0),
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 18),
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white
            ),
            child: TextField(
              readOnly: true,
              onTap: () => {},
              decoration: InputDecoration(
                  hintText: "Search",
                  contentPadding: EdgeInsets.fromLTRB(8, 14, 0, 1.0),
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search, color: mainColor)
              ),
            ),
          ),
        ),*//*
      ),
*/
      drawer: Drawer(

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.only(top: 40),
          children: [

            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...

                setState(() {
//                  _key.currentState?.openDrawer();

                });
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),


      body: ChangeNotifierProvider<HomeData>(
        create:(BuildContext context) => homeData,
        child : Consumer<HomeData>(builder: (context, viewModel, _) {


          return  viewModel.isLoading ? Loader():ListView(
            physics: BouncingScrollPhysics(),
            children: getWidgets(viewModel.homePageData),
          );

        })



      )    );
  }



bool isLoading = false;
 List<Widget> getWidgets(List<HomePageData> data){

   if(isLoading) return [];

   isLoading = true;
    List<Widget> returnList = [];
    for(int i=0;i<data.length; i++)
      {
        if(data[i].longBanners!=null)
          {
            returnList.add(LongBanner(data[i].longBanners));
            returnList.add(              Container(height: 14,));
          }
        else if(data[i].listings!=null)
          {
            returnList.add(              ItemsCarousel(items: data[i].listings.listing, title: data[i].listings.listingName));
            returnList.add(              Container(height: 20,));

          }
        else if(data[i].categories!=null)
        {
          returnList.add(                      CategoriesCarousel(title: data[i].categories.categoriesTitle, items : data[i].categories.categories, type: data[i].categories.type,));
          returnList.add(              Container(height: 20,));

        }    else if(data[i].gridListing!=null)
        {
          returnList.add(              ItemsCarousel(items: data[i].gridListing.listing, title: data[i].gridListing.listingName));
          returnList.add(              Container(height: 20,));

        }

      }

    returnList.add(Footer());

    isLoading = false;
    return returnList;



  }

}

