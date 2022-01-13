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
import 'package:fix_feels/ViewModel/homePageAPI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({
    Key key,
  }) : super(key: key);

  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<SignUpPage> {
   final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String number = '', password = "";


  @override
  void initState() {
    super.initState();

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

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  EditTextUtils textUtils = EditTextUtils();

  GlobalKey<ScaffoldState> _key = GlobalKey();
   Auth auth = new Auth();

  signUp() async{

    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    print("sending data : " + nameController.value.text);

    var resp = await auth.signUp(nameController.value.text, emailController.value.text, phoneController.value.text,
        passwordController.value.text, passwordController.value.text);


    if(resp == "error")

      {
        SmallWidgets.getToast("Some error occured");

      }
    else{
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    }

    print(resp);

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SmallWidgets.closeButton(context),
      ),
      body: ChangeNotifierProvider<Auth>(
          create:(BuildContext context) => auth,
          child : Consumer<Auth>(builder: (context, viewModel, _) {


            return   _body(viewModel.isLoading );

          })



      )   ,
    );
  }

  Widget _body(bool isLoading) {
    return GestureDetector(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(left: 26, right: 26, top: 35),
              child: Container(
                 height: MediaQuery.of(context).size.height < 500
                    ? 500
                    : MediaQuery.of(context).size.height - 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Sign Up",
                      style:
                      TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Get access to your Orders, Wishlists and Recommendations",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),
                    ),

                    Spacer(),
                    textUtils.getCustomEditTextArea(
                        labelValue: "Name",
                        controller: nameController ,
                        enabled: !isLoading,
                        validation: (s) {
                          if (s.isEmpty) {
                            return "Enter your name";
                          }
                          if (s.trim().length ==0) {
                            return "Enter correct name";
                          }

                          return null;
                        }),
                    Spacer(),
                    textUtils.getCustomEditTextArea(
                        labelValue: "Email",
                        controller: emailController ,
                        enabled: !isLoading,
                        validation: (s) {
                          if (s.isEmpty) {
                            return "Enter your email";
                          }
                          if (s.trim().length <2) {
                            return "Enter correct email";
                          }

                          return null;
                        }),
                    Spacer(),
                    textUtils.getCustomEditTextArea(
                        labelValue: "Phone Number",
                        controller: phoneController ,
                        enabled: !isLoading,
                        validation: (s) {
                          if (s.isEmpty) {
                            return "Enter your phone number";
                          }
                          if (s.trim().length <8) {
                            return "Enter correct phone number";
                          }

                          return null;
                        }),
                    Spacer(),

                    textUtils.getCustomEditTextArea(
                        labelValue: "Password",
                        controller: passwordController ,
                        enabled: !isLoading,
                        validation: (s) {
                          if (s.isEmpty) {
                            return "Enter password";
                          }
                          if (s.trim().length < 6) {
                            return "Password length too short";
                          }

                          return null;
                        }),
                    Spacer(),

                    Container(
                      height: 14,
                    ),
                    //  Container(height: 50,),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //Spacer(),
                        Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [mainColor,mainColor],
                                    stops: [0, 0.7],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.2),
                                        blurRadius: 3.0,
                                        offset: Offset(-1, 1.75))
                                  ],
                                  borderRadius: BorderRadius.circular(50)),
                              height: 65,
                              width: 65,
                            ),
                            isLoading
                                ? Positioned(
                              top: 20,
                              left: 20.2,
                              child: Container(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor:
                                  new AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                                height: 25,
                                width: 25,
                              ),
                            )
                                : Positioned(
                              top: 7,
                              left: 8,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  signUp();

                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),


                     Spacer(
                      flex: 6,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Login.',
                                    style: TextStyle(
                                      color: mainColor,
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                          ),
                          padding: EdgeInsets.only(left: 5, right: 8),
                          onPressed: () async {
                            Navigator.pushNamed(context, '/login');

                          },
                        ),
                      ],
                    )
                  ],
                ),
               ),
            ),
          ),
        ],
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
    );
  }
}
