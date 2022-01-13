import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fix_feels/CustomWidets/FormField.dart';
import 'package:fix_feels/CustomWidets/Loader.dart';
import 'package:fix_feels/CustomWidets/SmallWidgets.dart';
import 'package:fix_feels/CustomWidets/categoriesCarousel.dart';
import 'package:fix_feels/CustomWidets/footer.dart';
import 'package:fix_feels/CustomWidets/itemsCarousel.dart';
import 'package:fix_feels/CustomWidets/longBanner.dart';
import 'package:fix_feels/DataClasses/HomePage.dart';
import 'package:fix_feels/DataClasses/Listings.dart';
import 'package:fix_feels/Theme/colors.dart';
import 'package:fix_feels/ViewModel/Auth.dart';
import 'package:fix_feels/ViewModel/ProductsAPI.dart';
import 'package:fix_feels/ViewModel/homePageAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
  Product({Key key, this.id}) : super(key: key);

  String id;

  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<Product> {

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  ProductData productData = ProductData();
  @override
  void initState() {
    super.initState();

    productData.getData(widget.id);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
    ));
  }

  @override
  dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      statusBarIconBrightness: Brightness.light, //top bar icons
    ));
    super.dispose();
  }

  EditTextUtils textUtils = EditTextUtils();
  GlobalKey<ScaffoldState> _key = GlobalKey();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: SmallWidgets.closeButton(context)
      ),
      body:  ChangeNotifierProvider<ProductData>(
          create:(BuildContext context) => productData ,
          child : Consumer<ProductData>(builder: (context, viewModel, _) {


            return   Container();

          })

      ),
    );
  }


}
