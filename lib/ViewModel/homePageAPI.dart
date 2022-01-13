import 'package:fix_feels/DataClasses/Banners.dart';
import 'package:fix_feels/DataClasses/Categories.dart';
import 'package:fix_feels/DataClasses/HomePage.dart';
import 'package:fix_feels/DataClasses/Listings.dart';
import 'package:fix_feels/Functions/URLs.dart';
import 'package:flutter/material.dart';
import 'Requests.dart';
class HomeData extends ChangeNotifier{

  bool isLoading = false;

  Requests req = Requests();



  List<HomePageData> homePageData  = [];
  dynamic categories = {};

  dynamic data = {};
  HomeData(){

    getData();
  }


  getData() async{
   if(isLoading) return;
    isLoading = true;
    data = await req.getData(baseURL+homeUrl);


    isLoading = false;

    for(int i =0; i< data['block'].length; i++) {

      String name = data['block'][i]['block']['block_type']['name'];
      name = name.trim();
      String title = data['block'][i]['block']['title'] ??  "";

      if(name.compareTo("Long banner") ==0 ) {
        getBanner(data['block'][i]['block']);
        print("Got long banner");

      }else if(name.compareTo("Listing") ==0){
        getListing(data['block'][i]['block'], data['block'][i]['block']['title'], false);
        print("Got listing");

      }else if(name.compareTo('Small banner') ==0 &&  (title.trim() == "Shop by categories")){

            getCategories(data['block'][i]['block'], data['block'][i]['block']['title'], 3);
      }else if(name =="Grid listing"){
        getListing(data['block'][i]['block'], data['block'][i]['block']['title'], true);
        print("Got GRid listing");

      }else if(name.compareTo('Small banner') ==0 ){

        getCategories(data['block'][i]['block'], data['block'][i]['block']['title'], 2);
      }
    }



    notifyListeners();


   }



  getBanner(d){

    List<Banners> bannerList = [];

    for(int i =0; i< d['listing'].length; i++){

      dynamic block =d['listing'][i];
      bannerList.add(Banners(block['title'], block["imageUrl"], block['url']));

    }


    homePageData.add(HomePageData(shortBanners: null, longBanners: bannerList));



  }


  getListing(d, title, isGrid){
    List<Listings> listings = [];


    for(int i =0; i< d['listing'].length; i++){

      dynamic block =d['listing'][i]['product'];
      int mrp =block['mrp'] ;
      int sellingPrice = block['selling_price'] ;
      double discount = (mrp - sellingPrice)/mrp * 100;
      discount = discount.ceilToDouble();
      listings.add(Listings(block['title'], mrp, discount,sellingPrice,block["imageUrl"], block['url'], block['id'].toString()));

    }


    if(!isGrid)
    homePageData.add(HomePageData(shortBanners: null, listings: ListingData(listing: listings, listingName: title)));
    else
    homePageData.add(HomePageData(shortBanners: null, gridListing: ListingData(listing: listings, listingName: title)));


  }

  getCategories(d, title, type){

    List<Categories> categories = [];

    for(int i =0; i< d['listing'].length; i++){

      dynamic block =d['listing'][i];
      categories.add(Categories(block['title'], block['imageUrl'], block['title']));

    }


    homePageData.add(HomePageData(shortBanners: null, categories: CategoriesData(categories: categories, categoriesTitle: title, type: type)));


  }


}