import 'package:fix_feels/CustomWidets/footer.dart';
import 'package:fix_feels/CustomWidets/itemsCarousel.dart';
import 'package:fix_feels/DataClasses/Listings.dart';
import 'package:fix_feels/Pages/SignUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'CustomWidets/categoriesCarousel.dart';
import 'Pages/BottomNavPages/BottomNavBar.dart';
import 'Pages/BottomNavPages/HomePage.dart';
import 'Pages/LoginPage.dart';
import 'Pages/Product.dart';
import 'Theme/colors.dart';
import 'Theme/style.dart';
void main() {


  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
     statusBarIconBrightness: Brightness.light, //top bar icons

  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
         '/': (context) =>  BottomNavState() ,//HomePage(title: 'FixFeels'),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/product': (context) => SignUpPage()

        },
      title: 'FixFeels',
      theme: appTheme,
     );
  }
}



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => BottomNavState());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpPage());

      case '/product':
      // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => Product(id : args),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

