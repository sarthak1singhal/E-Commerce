import 'package:fix_feels/DataClasses/Banners.dart';
import 'package:fix_feels/DataClasses/Categories.dart';
import 'package:fix_feels/DataClasses/Listings.dart';
import 'package:flutter/cupertino.dart';

class HomePageData{



  CategoriesData categories;
  List<Banners> longBanners;
  List<Banners> shortBanners;
  ListingData listings;
  ListingData gridListing;

  HomePageData({this.categories, this.longBanners, this.shortBanners,
    this.listings, this.gridListing});


}

class ListingData{
  String listingName;
  List<Listings> listing;

  ListingData({this.listing, this.listingName});
}

class CategoriesData{
  String categoriesTitle;
  List<Categories> categories;
  int type;
  CategoriesData({this.categoriesTitle, this.categories, @required this.type});

}